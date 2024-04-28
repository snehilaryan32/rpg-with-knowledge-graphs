// Locations
CREATE (:Location {name: 'Forest'})
CREATE (:Location {name: 'Cave'})
CREATE (:Location {name: 'Castle'})
CREATE (:Location {name: 'Town'})
CREATE (:Location {name: 'The Ore Fields'})
CREATE (:Location {name: 'Razorbloom'})

// Enemies
CREATE (:Enemy {name: 'Goblin'})
CREATE (:Enemy {name: 'Dragon'})
CREATE (:Enemy {name: 'Bandit'})
CREATE (:Enemy {name: 'Sand Golem'})

// Items
CREATE (:Item {name: 'Treasure'})
CREATE (:Item {name: 'Key'})
CREATE (:Item {name: 'Iron Ore'})

// Persons
CREATE (:Person {name: 'Wizard'})
CREATE (:Person {name: 'Merchant'})
CREATE (:Person {name: 'Torg Earkeeper'})
CREATE (:Person {name: 'Meka the Face Chewer'})
CREATE (:Person {name: 'Chag the Noseless'})

// Location Relationships
MATCH (l:Location {name: 'Forest'}), (e:Enemy {name: 'Goblin'}), (i:Item {name: 'Treasure'})
CREATE (l)-[:PROTECTED_BY]->(e), (e)-[:DROPS]->(i)

MATCH (l:Location {name: 'Cave'}), (p:Person {name: 'Wizard'}), (i:Item {name: 'Key'})
CREATE (l)-[:HAS]->(p), (l)-[:CONTAINS]->(i)

MATCH (l:Location {name: 'Castle'}), (e:Enemy {name: 'Dragon'}), (i:Item {name: 'Treasure'})
CREATE (l)-[:PROTECTED_BY]->(e), (e)-[:DROPS]->(i)

MATCH (l:Location {name: 'Town'}), (p:Person {name: 'Merchant'}), (i:Item {name: 'Key'})
CREATE (l)-[:HAS]->(p), (p)-[:SELLS]->(i)

MATCH (l1:Location {name: 'The Ore Fields'}), (l2:Location {name: 'Razorbloom'})
CREATE (l1)-[:LOCATED_IN]->(l2)

MATCH (l:Location {name: 'The Ore Fields'}), (e:Enemy {name: 'Sand Golem'}), (i:Item {name: 'Iron Ore'})
CREATE (l)-[:PROTECTED_BY]->(e), (e)-[:DROPS]->(i)

MATCH (l:Location {name: 'Razorbloom'}), (p1:Person {name: 'Torg Earkeeper'}), (p2:Person {name: 'Meka the Face Chewer'}), (p3:Person {name: 'Chag the Noseless'})
CREATE (l)-[:HAS]->(p1), (l)-[:HAS]->(p2), (l)-[:HAS]->(p3)

// WANTS KILLED RELATIONS
MATCH (p:Person {name: 'Merchant'}), (e:Enemy {name: 'Dragon'})
CREATE (p)-[:WANTS_KILLED]->(e)

MATCH (p:Person {name: 'Wizard'}), (e:Enemy {name: 'Goblin'})
CREATE (p)-[:WANTS_KILLED]->(e)

MATCH (p1:Person {name: 'Meka the Face Chewer'}), (p2:Person {name: 'Wizard'})
CREATE (p1)-[:WANTS_KILLED]->(p2)
