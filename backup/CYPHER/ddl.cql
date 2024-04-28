// Create Character nodes with traits
CREATE (michael:Character { name: 'Michael', special_ability: 'shooting' })
CREATE (trevor:Character { name: 'Trevor', special_ability: 'flying' })
CREATE (franklin:Character { name: 'Franklin', special_ability: 'driving' })

// Create Location nodes
CREATE (losSantos:Location { name: 'Los Santos' })
CREATE (blaineCounty:Location { name: 'Blaine County' })
CREATE (zancudoRiver:Location { name: 'Zancudo River' })
CREATE (paletoBay:Location { name: 'Paleto Bay' })
CREATE (lsia:Location { name: 'Los Santos International Airport' })

// Create LIVES_IN relationships
CREATE (michael)-[:LIVES_IN]->(losSantos)
CREATE (trevor)-[:LIVES_IN]->(blaineCounty)
CREATE (franklin)-[:LIVES_IN]->(losSantos)

// Create KNOWS relationships
CREATE (michael)-[:KNOWS]->(trevor), (trevor)-[:KNOWS]->(michael)
CREATE (michael)-[:KNOWS]->(franklin), (franklin)-[:KNOWS]->(michael)
CREATE (trevor)-[:KNOWS]->(franklin), (franklin)-[:KNOWS]->(trevor)

// Create LOCATED_IN relationships
CREATE (zancudoRiver)-[:LOCATED_IN]->(blaineCounty)
CREATE (paletoBay)-[:LOCATED_IN]->(blaineCounty)
CREATE (lsia)-[:LOCATED_IN]->(losSantos)