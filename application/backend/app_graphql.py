import os
import strawberry
import json
from llm_interface import QuestGenerator
from fastapi import FastAPI
from strawberry.fastapi import GraphQLRouter
from typing import Any, Dict, List

import quest_engine
from graph_interface import Neo4jDAO

url      = os.getenv("NEO4J_URI")
username = os.getenv("NEO4J_USERNAME")
password = os.getenv("NEO4J_PASSWORD")
database = os.getenv("NEO4J_DATABASE")
dao = Neo4jDAO(url, username, password)

#Load the graph
query_str = "match (n)-[r]->(m) return n,r,m"
res = dao.query(query_str)
facts = quest_engine.extract_facts(res)
fact_strings = quest_engine.facts_to_strings(facts)

@strawberry.input
class PlayerInput:
    text: str

@strawberry.type
class CosineSimilarityResult:
    matched: str
    idx: int

@strawberry.type
class Reward:
    xp: str
    cash: int

@strawberry.type
class Quest:
    title: str
    npcDialogue: str
    objective: str
    reward: str

@strawberry.type
class generateGameContentResult:
    CosineSimilarityResult: CosineSimilarityResult
    matchedRelationships: List[str]
    quest: Quest



@strawberry.type
class Query:
    @strawberry.field
    def getCosineSimilarity(self, player_input: PlayerInput) -> CosineSimilarityResult:
        matched, idx, cosine_sim = quest_engine.cosine_similarity(player_input.text, fact_strings)
        print(matched, idx, cosine_sim)
        return CosineSimilarityResult(matched=matched, idx=idx)
    
    @strawberry.field
    def generateGameContent(self, player_input: PlayerInput) -> generateGameContentResult:
        matched, idx, cosine_sim = quest_engine.cosine_similarity(player_input.text, fact_strings)
        matched_relationships = quest_engine.find_connections(dao, facts[idx])
        matched_relationships_list = quest_engine.matched_coneections_all_details(matched_relationships)
        matched_relationships_list = [json.dumps(d) for d in matched_relationships_list]
        quest__content_generator = QuestGenerator()
        quest_content = quest__content_generator.generate_quest(player_input.text, kg_output = str(matched_relationships_list), quest_type = "combat")
        quest_content = json.loads(quest_content.content)
        return generateGameContentResult(
            CosineSimilarityResult=CosineSimilarityResult(matched=matched, idx=idx), 
            matchedRelationships=matched_relationships_list,
            quest = Quest(
                title=quest_content.get("title"), 
                npcDialogue=quest_content.get("npc_dialogue"), 
                objective=quest_content.get("objective"), 
                reward=quest_content.get("reward")
            )
        )

    @strawberry.field
    def greet(self, name: str) -> str:
        return f"Hello {name}"


schema = strawberry.Schema(Query) 
graphql_app = GraphQLRouter(schema) 
app = FastAPI()
app.include_router(graphql_app, prefix="/graphql")