# QuestFusion

## Introduction

This project showcases how large language models (LLMs) along with Knowledge Graphs can be 
used to improve player experience by providing more dynamic content in video games. Unlike 
traditional RPG quest systems, which offer limited quest variety, this system empowers players 
to co-create their adventures by providing personalized prompts. This project is inspired by a 
research paper titled - “Personalized Quest and Dialogue Generation in Role-Playing Games: A 
Knowledge Graph- and Language Model-based Approach”. Central to this implementation is the 
use of a knowledge graph, that represents the interconnected elements of the video game 
world. This knowledge graph, along with a large-scale language model (GPT), grounds 
generated quests in the in-game context while ensuring fluent dialogue and a unique journey 
for the player. 

The system uses Python, Neo4j for storing the knowledge graph, and GraphQL as an interface 
between the knowledge graph and the client, which can be a game engine. The aim is to build a 
framework that can be utilized by various game engines through APIs, facilitating the 
development of diverse video games, including those with RPG mechanics like The Elder Scrolls 
V: Skyrim and The Witcher 3: Wild Hunt. 

To demonstrate the capabilities of the quest and dialogue generation system, Streamlit is used 
along with DALL-E API. The Streamlit UI provides an intuitive interface for players to interact 
with the system, allowing them to explore the knowledge graph enriched with data from the 
popular RPG game Cyberpunk 2077.

This project represents a significant step towards creating dynamic, co-creative narrative 
frameworks in RPGs, where players can collaborate to generate unique and user-specific 
playable experiences using a combination of Knowledge graphs and Large language models.



## Architecture Diagram:

![Architecture Diagram](https://github.com/snehilaryan32/rpg-with-knowledge-graphs/blob/main/arch_diagram_big.drawio.png)

## Local Deployment Steps 
1. To deploy the api and ui clone the repository and install the dependencies first 
```shell
pip install requirements.txt
```

Go to application/backend directory and host the GraphQL API
```shell
uvicorn app_graphql:app --reload --port 8080
```

Go to application/frontend to deploy the frontend
```shell
streamlit run frontend.py
```

## QuestFusion GraphQL API Documentation

### Queries

#### getCosineSimilarity

Returns the cosine similarity between the player input and the game world knowledge graph.

##### Input

```graphql
{
  player_input: String!
}
```

#### Output
{
  matched: String
  idx: Int
}

#### Example 
query {
  getCosineSimilarity(player_input: "Retrieve the sword of legend") {
    matched
    idx
  }
}


### generateGameContent

Generates game content (quest) based on the player input and the knowledge graph.

#### Input

```graphql
{
  player_input: String!
}
```

#### Output

{
  CosineSimilarityResult: {
    matched: String
    idx: Int
  }
  matchedRelationships: [String]
  quest: {
    title: String
    npcDialogue: String
    objective: String
    reward: String
  }
}

#### Example
query {
  generateGameContent(playerInput: { text: "I want a quest that can help me gain a tier-5 weapon" }) {
    CosineSimilarityResult {
      matched
      idx
    }
    matchedRelationships
    quest{
          title
    			npcDialogue
    			objective
    			reward
    }
  }
}

#### Output 
![Sample Output For the given Query](https://github.com/snehilaryan32/rpg-with-knowledge-graphs/blob/main/SampleOutputGraphQL.png)


