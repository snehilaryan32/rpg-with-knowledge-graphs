// Locations


// Characters (NPCs)
CREATE (:NPC {name: "Michael"})
CREATE (:NPC {name: "Franklin"})
CREATE (:NPC {name: "Trevor"})
CREATE (:NPC {name: "Lamar Davis"})
CREATE (:NPC {name: "Lester Crest"})
CREATE (:NPC {name: "Amanda De Santa"})

// Items
CREATE (:Item {name: "Weapon"})
CREATE (:Item {name: "Money"})
CREATE (:Item {name: "Clothing"})
CREATE (:Item {name: "Car"})

// Relationships
MATCH (m:NPC {name: "Michael"}), (ls:Location {name: "Los Santos"})
CREATE (m)-[:Located_at]->(ls)

MATCH (f:NPC {name: "Franklin"}), (ls:Location {name: "Los Santos"})
CREATE (f)-[:Located_at]->(ls)

MATCH (t:NPC {name: "Trevor"}), (ss:Location {name: "Sandy Shores"})
CREATE (t)-[:Located_at]->(ss)

MATCH (lamar:NPC {name: "Lamar Davis"}), (straw:Location {name: "Strawberry"})
CREATE (lamar)-[:Located_at]->(straw)

MATCH (lamar:NPC {name: "Lamar Davis"}), (f:NPC {name: "Franklin"})
CREATE (lamar)-[:Associated_with]->(f)

MATCH (weapon:Item {name: "Weapon"}), (m:NPC {name: "Michael"})
CREATE (weapon)-[:Possessed_by]->(m)

MATCH (money:Item {name: "Money"}), (t:NPC {name: "Trevor"})
CREATE (money)-[:Possessed_by]->(t)

MATCH (car:Item {name: "Car"}), (f:NPC {name: "Franklin"})
CREATE (car)-[:Possessed_by]->(f)

// Add more relationships as needed

RETURN *
