// To Display the Full Graph
MATCH (n)-[r]->(m) RETURN n, r, m

// DELETE ALL NODES AND RELATIONSHIPS
MATCH (n)
DETACH DELETE n