// Districts
CREATE (d1:District {name: 'Dogtown'})
CREATE (d2:District {name: 'City Center'})
CREATE (d3:District {name: 'Watson'})
CREATE (d4:District {name: 'Westbrook'})
CREATE (d5:District {name: 'Outskirts'})
CREATE (d6:District {name: 'Heywood'})
CREATE (d7:District {name: 'Pacifica'})
CREATE (d8:District {name: 'Santo Domingo'})

// Add relationships between districts
CREATE (d2)-[:BORDERS]->(d1)
CREATE (d2)-[:BORDERS]->(d3)
CREATE (d2)-[:BORDERS]->(d4)
CREATE (d2)-[:BORDERS]->(d5)
CREATE (d2)-[:BORDERS]->(d6)
CREATE (d2)-[:BORDERS]->(d7)
CREATE (d2)-[:BORDERS]->(d8)


// Add locations in Dogtown (d1)
CREATE (d1_l1:Location {name: 'Longshore Stacks'})
CREATE (d1_l2:Location {name: 'The Moth'})
CREATE (d1_l3:Location {name: 'Black Sapphire'})
CREATE (d1_l4:Location {name: 'Heavy Hearts'})
CREATE (d1_l5:Location {name: 'Heavy Clinic'})
CREATE (d1_l6:Location {name: 'The Scraper'})
CREATE (d1_l1)-[:LOCATED_IN]->(d1)
CREATE (d1_l2)-[:LOCATED_IN]->(d1)
CREATE (d1_l3)-[:LOCATED_IN]->(d1)
CREATE (d1_l4)-[:LOCATED_IN]->(d1)
CREATE (d1_l5)-[:LOCATED_IN]->(d1)
CREATE (d1_l6)-[:LOCATED_IN]->(d1)

// Add locations in City Center (d2)
CREATE (d2_l1:Location {name: 'Corpo Plaza'})
CREATE (d2_l2:Location {name: 'Berkeley & Bruce Skiv'})
CREATE (d2_l3:Location {name: 'Metro: Republic Way'})
CREATE (d2_l4:Location {name: 'Skyline & Republic'})
CREATE (d2_l5:Location {name: 'Downtown Central'})
CREATE (d2_l6:Location {name: 'Gold Beach Marina'})
CREATE (d2_l7:Location {name: 'Corporation ST'})
CREATE (d2_l8:Location {name: 'Ring Road'})
CREATE (d2_l9:Location {name: 'Petrel ST'})
CREATE (d2_l1)-[:LOCATED_IN]->(d2)
CREATE (d2_l2)-[:LOCATED_IN]->(d2)
CREATE (d2_l3)-[:LOCATED_IN]->(d2)
CREATE (d2_l4)-[:LOCATED_IN]->(d2)
CREATE (d2_l5)-[:LOCATED_IN]->(d2)
CREATE (d2_l6)-[:LOCATED_IN]->(d2)
CREATE (d2_l7)-[:LOCATED_IN]->(d2)
CREATE (d2_l8)-[:LOCATED_IN]->(d2)
CREATE (d2_l9)-[:LOCATED_IN]->(d2)

// Add locations in Watson (d3)
CREATE (d3_l1:Location {name: 'Arasaka Waterfront'})
CREATE (d3_l2:Location {name: 'Akasaka Tower'})
CREATE (d3_l3:Location {name: 'Debug'})
CREATE (d3_l4:Location {name: 'Kabuki'})
CREATE (d3_l5:Location {name: 'Little China'})
CREATE (d3_l6:Location {name: 'Northside Industrial District'})
CREATE (d3_l7:Location {name: 'Kabuki Market'})
CREATE (d3_l8:Location {name: 'Konpeki Plaza'})
CREATE (d3_l9:Location {name: 'Afterlife'})
CREATE (d3_l10:Location {name: 'All Foods Warehouse'})
CREATE (d3_l11:Location {name: 'Kabuki Slums'})
CREATE (d3_l12:Location {name: "Lizzie's Bar"})
CREATE (d3_l13:Location {name: "Misty's Esoterica"})
CREATE (d3_l1)-[:LOCATED_IN]->(d3)
CREATE (d3_l2)-[:LOCATED_IN]->(d3)
CREATE (d3_l3)-[:LOCATED_IN]->(d3)
CREATE (d3_l4)-[:LOCATED_IN]->(d3)
CREATE (d3_l5)-[:LOCATED_IN]->(d3)
CREATE (d3_l6)-[:LOCATED_IN]->(d3)
CREATE (d3_l7)-[:LOCATED_IN]->(d3)
CREATE (d3_l8)-[:LOCATED_IN]->(d3)
CREATE (d3_l9)-[:LOCATED_IN]->(d3)
CREATE (d3_l10)-[:LOCATED_IN]->(d3)
CREATE (d3_l11)-[:LOCATED_IN]->(d3)
CREATE (d3_l12)-[:LOCATED_IN]->(d3)
CREATE (d3_l13)-[:LOCATED_IN]->(d3)

// Add locations in Charter Hill (d4)
CREATE (d4_l1:Location {name: 'Charter Hill'})
CREATE (d4_l2:Location {name: 'Japantown'})
CREATE (d4_l3:Location {name: 'North Oaks'})
CREATE (d4_l4:Location {name: 'Jig-Jig Street'})
CREATE (d4_l1)-[:LOCATED_IN]->(d4)
CREATE (d4_l2)-[:LOCATED_IN]->(d4)
CREATE (d4_l3)-[:LOCATED_IN]->(d4)
CREATE (d4_l4)-[:LOCATED_IN]->(d4)

// Add locations in Outskirts (d5)
CREATE (d5_l1:Location {name: 'Rocky Ridge'})
CREATE (d5_l2:Location {name: 'Blotechnica Farms'})
CREATE (d5_l3:Location {name: 'Adelcado Camp'})
CREATE (d5_l4:Location {name: 'Junkyard'})
CREATE (d5_l5:Location {name: 'Militech Compound'})
CREATE (d5_l1)-[:LOCATED_IN]->(d5)
CREATE (d5_l2)-[:LOCATED_IN]->(d5)
CREATE (d5_l3)-[:LOCATED_IN]->(d5)
CREATE (d5_l4)-[:LOCATED_IN]->(d5)
CREATE (d5_l5)-[:LOCATED_IN]->(d5)

// Add locations in Heywood (d6)
CREATE (d6_l1:Location {name: 'The Glen'})
CREATE (d6_l2:Location {name: 'Vistal del Rey'})
CREATE (d6_l3:Location {name: 'Wellsprings'})
CREATE (d6_l1)-[:LOCATED_IN]->(d6)
CREATE (d6_l2)-[:LOCATED_IN]->(d6)
CREATE (d6_l3)-[:LOCATED_IN]->(d6)

// Add locations in Pacifica (d7)
CREATE (d7_l1:Location {name: 'Coast View'})
CREATE (d7_l2:Location {name: 'West Wind Estate'})
CREATE (d7_l3:Location {name: 'Grand Imperial Mall'})
CREATE (d7_l1)-[:LOCATED_IN]->(d7)
CREATE (d7_l2)-[:LOCATED_IN]->(d7)
CREATE (d7_l3)-[:LOCATED_IN]->(d7)

// Add locations in Santo Domingo (d8)
CREATE (d8_l1:Location {name: 'Arroyo'})
CREATE (d8_l2:Location {name: 'Rancho Coronado'})
CREATE (d8_l1)-[:LOCATED_IN]->(d8)
CREATE (d8_l2)-[:LOCATED_IN]->(d8)

// ##############################################################Non Player Characters############################################################
// Dogtown NPCs
CREATE (N1:NPC {name: 'Songbird'})
CREATE (N2:NPC {name: 'Aaron Waines'})
CREATE (N3:NPC {name: 'Anthony Anderson'})
CREATE (N4:NPC {name: 'Odell Blanco'})
CREATE (N1)-[:LOCATED_IN]->(d1_l2)
CREATE (N2)-[:LOCATED_IN]->(d1_l4)
CREATE (N3)-[:LOCATED_IN]->(d1_l6)
CREATE (N4)-[:LOCATED_IN]->(d1_l3)

// City Center NPCs
CREATE (N5:NPC {name: 'Ripperdoc Downtown'})
CREATE (N6:NPC {name: 'Dino Dinovic'})
CREATE (N5)-[:LOCATED_IN]->(d2_l9)
CREATE (N6)-[:LOCATED_IN]->(d2_l8)

// Watson NPCs
// Add NPCs in Watson
CREATE (N7:NPC {name: "Buck's Clinic"})
CREATE (N8:NPC {name: 'Dr. Chrome / Robert Rainwater'})
CREATE (N9:NPC {name: 'Instant Implants'})
CREATE (N10:NPC {name: 'Regina Jones'})
CREATE (N11:NPC {name: 'Coach Fred'})
CREATE (N12:NPC {name: 'Dexter Deshawn'})
CREATE (N13:NPC {name: 'Claire'})
CREATE (N14:NPC {name: 'Misty'})
CREATE (N15:NPC {name: 'Adam Smasher'})
CREATE (N7)-[:LOCATED_IN]->(d3_l10)
CREATE (N8)-[:LOCATED_IN]->(d3_l11)
CREATE (N9)-[:LOCATED_IN]->(d3_l13)
CREATE (N10)-[:LOCATED_IN]->(d3_l4)
CREATE (N11)-[:LOCATED_IN]->(d3_l5)
CREATE (N12)-[:LOCATED_IN]->(d3_l6)
CREATE (N13)-[:LOCATED_IN]->(d3_l7)
CREATE (N14)-[:LOCATED_IN]->(d3_l8)
CREATE (N15)-[:LOCATED_IN]->(d3_l9)

// Add NPCs in Westbrook
CREATE (N16:NPC {name: "Finger's M.D. / Finn Gersttat"})
CREATE (N17:NPC {name: "Kraviz's Clinic"})
CREATE (N18:NPC {name: 'Ripperdoc Japantown'})
CREATE (N19:NPC {name: 'Wakako Okada'})
CREATE (N20:NPC {name: 'Jackie Welles'})
CREATE (N21:NPC {name: 'Sandra Dorsett'})
CREATE (N22:NPC {name: 'T-Bug'})
CREATE (N23:NPC {name: 'Kerry Eurodyne'})
CREATE (N16)-[:LOCATED_IN]->(d4_l1)
CREATE (N17)-[:LOCATED_IN]->(d4_l2)
CREATE (N18)-[:LOCATED_IN]->(d4_l3)
CREATE (N19)-[:LOCATED_IN]->(d4_l4)
CREATE (N20)-[:LOCATED_IN]->(d4_l1)
CREATE (N21)-[:LOCATED_IN]->(d4_l2)
CREATE (N22)-[:LOCATED_IN]->(d4_l3)
CREATE (N23)-[:LOCATED_IN]->(d4_l4)

// Add NPCs in Outskirts

CREATE (N24:NPC {name: "Ripperdoc Badlands"})
CREATE (N25:NPC {name: 'Dakota Smith'})
CREATE (N26:NPC {name: 'Saul'})
CREATE (N27:NPC {name: 'Mitch'})
CREATE (N24)-[:LOCATED_IN]->(d5_l1)
CREATE (N25)-[:LOCATED_IN]->(d5_l2)
CREATE (N26)-[:LOCATED_IN]->(d5_l3)
CREATE (N27)-[:LOCATED_IN]->(d5_l4)

// Add NPCs in Heywood

CREATE (N28:NPC {name: "Ripperdoc Wellsprings"})
CREATE (N29:NPC {name: 'Sebastian "Padre" Ibarra'})
CREATE (N30:NPC {name: 'Evelyn Parker'})
CREATE (N28)-[:LOCATED_IN]->(d6_l1)
CREATE (N29)-[:LOCATED_IN]->(d6_l2)
CREATE (N30)-[:LOCATED_IN]->(d6_l3)


// Add NPC in Pacifica
CREATE (N31:NPC {name: "Ripperdoc West Wind Estate"})
CREATE (N31)-[:LOCATED_IN]->(d7_l1)

// Add NPC in Santo Domingo
CREATE (N32:NPC {name: "Octavio's Clinic"})
CREATE (N33:NPC {name: 'Muamar "El Capitan" Reyes'})
CREATE (N32)-[:LOCATED_IN]->(d8_l1)
CREATE (N33)-[:LOCATED_IN]->(d8_l2)

// ############################################################Items and their locations############################################################
// Dogtown Items
// Add weapon nodes with bonuses
CREATE (blackUnicorn:Weapon {
    name: 'Black Unicorn',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+20% Bleeding Chance'],
    weight: '4.5'
})
CREATE (blackUnicorn)-[:LOCATED_IN]->(d1_l2)

CREATE (blueFang:Weapon {
    name: 'Blue Fang',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+150% Headshot Damage Multiplier', '+20% Bleeding Chance', '+50% Poison Chance'],
    weight: '2.3'
})
CREATE (blueFang)-[:LOCATED_IN]->(d1_l4)

CREATE (butchersCleaver:Weapon {
    name: 'Butcher\'s Cleaver',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+40% Bleeding Chance'],
    weight: '4'
})
CREATE (butchersCleaver)-[:LOCATED_IN]->(d1_l6)

CREATE (byakko:Weapon {
    name: 'Byakko',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+30% Bleeding Chance'],
    weight: '4.5'
})
CREATE (byakko)-[:LOCATED_IN]->(d3_l3)

CREATE (cocktailStick:Weapon {
    name: 'Cocktail Stick',
    tier: 'Tier 4',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+25% Bleeding Chance'],
    weight: '4.5'
})
CREATE (cocktailStick)-[:LOCATED_IN]->(d3_l2)

CREATE (errata:Weapon {
    name: 'Errata',
    tier: 'Tier 2',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+17% Burn Chance'],
    weight: '4.5'
})
CREATE (errata)-[:LOCATED_IN]->(d3_l4)

CREATE (headhunter:Weapon {
    name: 'Headhunter',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+150% Headshot Damage Multiplier', '+20% Bleeding Chance'],
    weight: '2.3'
})
CREATE (headhunter)-[:LOCATED_IN]->(d1_l6)  

CREATE (jinchuMaru:Weapon {
    name: 'Jinchu-Maru',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+20% Bleeding Chance'],
    weight: '4.5'
})
CREATE  (jinchuMaru)-[:LOCATED_IN]->(d1_l3)

CREATE (nehan:Weapon {
    name: 'Nehan',
    tier: 'Tier 2',
    class: 'Melee',
    bonuses: ['+150% Headshot Damage Multiplier', '+17% Bleeding Chance'],
    weight: '2.3'
})
CREATE (nehan)-[:LOCATED_IN]->(d2_l2)

CREATE (satori:Weapon {
    name: 'Satori',
    tier: 'Tier 2',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+17% Bleeding Chance'],
    weight: '4.5'
})
CREATE (satori)-[:LOCATED_IN]->(d1_l4)

CREATE (scalpel:Weapon {
    name: 'Scalpel',
    tier: 'Tier 5',
    class: 'Melee',
    bonuses: ['+25% Armor Penetration', '+30% Shock Chance'],
    weight: 'unknown'
})
CREATE (scalpel)-[:LOCATED_IN]->(d3_l6)

//#############################################################Add other weapons#####################################################################
CREATE (ambition:Weapon {
    name: 'AMBITION',
    tier: 'Tier 4',
    type: 'Pistol',
    bonuses: ['+150% Headshot Damage Multiplier', '+25% Armor Penetration', '0.5sec Charge Time'],
    weight: '4.3'
})
CREATE (ambition)-[:LOCATED_IN]->(d2_l3)

CREATE (apparition:Weapon {
    name: 'APPARITION',
    tier: 'Tier 2',
    type: 'Pistol',
    bonuses: ['+150% Headshot Damage Multiplier', '+50% Armor Penetration', '0.75 Charge Time'],
    weight: '4.3'
})
CREATE (apparition)-[:LOCATED_IN]->(d3_l2)

CREATE (breakthrough:Weapon {
    name: 'BREAKTHROUGH',
    tier: 'Tier 5',
    type: 'Sniper Rifle',
    bonuses: ['+300% Headshot Damage Multiplier', '+100% Armor Penetration', '1.25sec Charge Time'],
    weight: '11.7'
})
CREATE (breakthrough)-[:LOCATED_IN]->(d5_l4)

CREATE (chaos:Weapon {
    name: 'CHAOS',
    tier: 'Tier 5',
    type: 'Pistol',
    bonuses: ['+150% Headshot Damage Multiplier', '+50% Armor Penetration', '0.5sec Charge Time', '+10% Bleeding Chance'],
    weight: '4.3'
})
CREATE (chaos)-[:LOCATED_IN]->(d1_l6)

CREATE (comradesHammer:Weapon {
    name: 'COMRADE\'S HAMMER',
    tier: 'Tier 5',
    type: 'Revolver',
    bonuses: ['+75% Armor Penetration', '1sec Charge Time', '+50% Crit Damage', '+40% Burn Chance'],
    weight: 'unknown'
})
CREATE (comradesHammer)-[:LOCATED_IN]->(d1_l3)



