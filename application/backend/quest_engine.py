import random
import os
import nltk
from dotenv import load_dotenv
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from graph_interface import Neo_Node
nltk.download('punkt')
nltk.download('stopwords')

load_dotenv()
url      = os.getenv("NEO4J_URI")
username = os.getenv("NEO4J_USERNAME")
password = os.getenv("NEO4J_PASSWORD")
database = os.getenv("NEO4J_DATABASE")

def extract_tuples(record):
    tup_vals = []
    for i, val in enumerate(record):
        if i == 1:
            relationship_type = val.type
            relationship_type = relationship_type.replace('_', " ")
            tup_vals.append(relationship_type)
        else:
            node_name = None
            for name in val.labels:
                node_name = name
            node_properties = dict(val.items())
            node = Neo_Node(node_name, node_properties)
            tup_vals.append(node)

    return tuple(val for val in tup_vals)

def extract_facts(res):
    all_facts = []
    for record in res:
        new_tup = extract_tuples(record)
        all_facts.append(new_tup)

    return all_facts

# def verbalize_tuple_2(tuple_in):
#     string = tuple_in[0].get_properties()['name'] + " " + tuple_in[1] + " " + tuple_in[2].get_properties()['name']
#     return string

def verbalize_tuple_2(tuple_in):
    node1_props = ", ".join([f"{key}: {value}" for key, value in tuple_in[0].get_properties().items()])
    node2_props = ", ".join([f"{key}: {value}" for key, value in tuple_in[2].get_properties().items()])
    string = f"{node1_props} {tuple_in[1]} {node2_props}"
    return string

def facts_to_strings(facts):
    fact_str = []
    for fact in facts:
        fact_str.append(verbalize_tuple_2(fact))
    return fact_str

def cosine_similarity(user_string, facts_list):  
        cosine_scores = []
        X = user_string.lower()
        for fact in facts_list:
            Y = fact.lower()
            X_list = word_tokenize(X)
            Y_list = word_tokenize(Y)
            sw = stopwords.words('english')
            l1 = []; l2 = []
            X_set = {w for w in X_list if not w in sw}
            Y_set = {w for w in Y_list if not w in sw}
            rvector = X_set.union(Y_set)
            for w in rvector:
                if w in X_set: 
                    l1.append(1) # create a vector
                else: 
                    l1.append(0)
                if w in Y_set: 
                    l2.append(1)
                else: 
                    l2.append(0)
            c = 0
            # cosine formula 
            for i in range(len(rvector)):
                c+= l1[i]*l2[i]
            cosine = c / float((sum(l1)*sum(l2))**0.5)
            cosine_scores.append(cosine)
        if max(cosine_scores) == 0:
            rand_idx = random.randrange(len(cosine_scores))
            return facts_list[rand_idx], rand_idx, cosine_scores
        return facts_list[cosine_scores.index(max(cosine_scores))], cosine_scores.index(max(cosine_scores)), cosine_scores

def find_connections(dao, match_tuple):
        # node_name = match_tuple[2].get_properties()['name']
        # query_str = f"MATCH (n)-[r]->(m) WHERE n.name = '{node_name}' RETURN n, r, m"
        query_str = "match (n)-[r]->(m) return n,r,m"
        res = dao.query(query_str)
        # Get turn neo4j result into fact tuples in a list
        all_tuples = extract_facts(res)
        # Save and return all relevant information in string
        all_relevant_information = []
        all_relevant_information.append(verbalize_tuple_2(match_tuple))
        possible_tuples = []
        for tup in all_tuples:
            verbalize_tuple_2(tup)
            # iterate over each node
            for node in tup:
                # Skip relationship strings
                if type(node) == str:
                    continue
                # Find all outgoing connections from main quest node.
                if match_tuple[2].get_properties()['name'] == node.get_properties()['name']:
                    possible_tuples.append(tup)
        '''
        print("\nAll possible matches")
        for tup in possible_tuples:
            print(self.verbalize_tuple_2(tup))
        '''
        return possible_tuples

#Function to store all the relevent information as a list of dictionaries
def matched_coneections_all_details(possible_tuples):
    details_matched_relationships = []
    for relationship in possible_tuples:
        node1, relation, node2 = relationship
        details_matched_relationships.append({
            "node1": {
                "type": node1.get_type(),
                "properties": node1.get_properties()
            },
            "relation": relation,
            "node2": {
                "type": node2.get_type(),
                "properties": node2.get_properties()
            }
        })
    return details_matched_relationships