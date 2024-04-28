# QuestFusion


## Architecture Diagram:

![Architecture Diagram](https://github.com/snehilaryan32/rpg-with-knowledge-graphs/blob/main/arch_diagram_big.drawio.png)

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
  generateGameContent(player_input: "Retrieve the sword of legend") {
    CosineSimilarityResult {
      matched
      idx
    }
    matchedRelationships
    quest {
      title
      npcDialogue
      objective
      reward
    }
  }
}


