from dotenv import load_dotenv
from graph_interface import Neo4jDAO
from fastapi import FastAPI
from pydantic import BaseModel
from openai import OpenAI
import json
import quest_engine
import os

app = FastAPI()
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

client = OpenAI()
prompt = '''
you are a  rpg game quest generator system. Given some information and the type of quest which has been 
extracted from a knowledge graph you are supposed to generate the quest for the player. With the quest you are 
also expected to generate an acompynying dialouge that will be spoken 
by an NPC that will give the quest to the player. Also generate a reward as well as an exact objective for the quest
'''
quest_type = "Combat"

class PlayerInput(BaseModel):
    text: str

@app.post("/get_quest")
async def get_cosine_similarity(player_input: PlayerInput):
    matched, idx, cosine_sim = quest_engine.cosine_similarity(player_input.text, fact_strings)
    x = quest_engine.find_connections(dao, facts[idx])
    output = ""
    for relationship in x:
        node1, relation, node2 = relationship
        output += f"Node 1 properties: {node1.get_properties()}\n"
        output += f"Relation: {relation}\n"
        output += f"Node 2 properties: {node2.get_properties()}\n"
        output += "---\n"

    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        response_format={ "type": "json_object" },
        messages=[
            {"role": "system", "content": "You are a helpful assistant designed to output JSON."},
            {"role": "user", "content": f"{prompt} the knowledge graph output is {output} and the player input is {player_input.text} and the quest type is {quest_type}"}
        ]
    )

    return json.loads(response.choices[0].message.content)

class DialogueInput(BaseModel):
    text: str

@app.post("/get_illustration")
async def get_illustration(dialouge_input: DialogueInput):
    response = client.images.generate(
        model="dall-e-2",
        prompt=f"I want you to create an image that illustrates this quest that is for a rpg game set in Cyberpunk city. Dont Have any text in the image. This is the combat quest - {dialouge_input.text}",
        size="1024x1024",
        quality="standard",
        n=1,
    )

    image_url = response.data[0].url
    return image_url




