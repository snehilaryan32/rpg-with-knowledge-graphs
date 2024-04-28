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




