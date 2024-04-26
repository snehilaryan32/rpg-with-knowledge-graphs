from neo4j import GraphDatabase
import re

class Neo4jDAO():
    def __init__(self, uri, user, pwd):
        super().__init__()
        self.__uri = uri
        self.__user = user
        self.__pwd = pwd
        self.__driver = None
        try:
            self.__driver = GraphDatabase.driver(self.__uri, auth=(self.__user, self.__pwd))
        except Exception as e:
            print("Failed to create the driver:", e)

    def close(self):
        if self.__driver is not None:
            self.__driver.close()

    def query(self, query, db=None):
        assert self.__driver is not None, "Driver not initialized!"
        session = None
        response = None
        try:
            session = self.__driver.session(database=db) if db is not None else self.__driver.session()
            response = list(session.run(query))
        except Exception as e:
            print("Query failed:", e)
        finally:
            if session is not None:
                session.close()
        return response

    def createNode(self, objType, dictArgs):
        # figure out a good way to replace the strings in the dictionary
        the_str = f"merge (x:{objType} {dictArgs})"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

    def createEdge(self, objTypeN1, argsN1, objTypeN2, argsN2, relType):
        the_str = f"match (x:{objTypeN1} {argsN1}) match (y:{objTypeN2} {argsN2}) merge (x)-[:{relType}]->(y)"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

    def deleteNode(self, objType, dictArgs):
        the_str = f"match (x:{objType} {dictArgs}) detach delete x"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

    def deleteEdge(self, objTypeN1, argsN1, objTypeN2, argsN2, relType):
        the_str = f"match (x:{objTypeN1} {argsN1})-[r:{relType}]-(y:{objTypeN2} {argsN2}) delete r"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

    def updateNode(self, objType, dictArgs, update_name, update_data):
        the_str = f"match (x:{objType} {dictArgs}) set x.{update_name} = {update_data} return x"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

    def updateEdge(self, objTypeN1, argsN1, objTypeN2, argsN2, relType, update_name, update_data):
        the_str = f"match (x:{objTypeN1} {argsN1})-[r:{relType}]-(y:{objTypeN2} {argsN2}) set r.{update_name} = {update_data} return r"
        the_str = re.sub("'(\w+)':", r"\1:", the_str)
        return self.query(the_str)

class Neo_Node:
    def __init__(self, name, properties):
        self.name = name
        self.properties = properties
        self.type = None

    def set_name(self, name):
        self.name = name

    def set_type(self, type):
        self.type = type

    def set_properties(self, properties):
        self.properties = properties

    def get_name(self):
        return self.name
        
    def get_properties(self):
        return self.properties
    
    def get_type(self):
        return self.type