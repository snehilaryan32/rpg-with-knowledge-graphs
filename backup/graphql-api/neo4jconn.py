import os
from dotenv import load_dotenv  
from langchain.graphs import Neo4jGraph

load_dotenv()
url = os.getenv("NEO4J_URL")
username = os.getenv("NEO4J_USERNAME")
password = os.getenv("NEO4J_PASSWORD")

def get_neo4j_graph():
    return Neo4jGraph(
        url=url,
        username=username,
        password=password
    )
