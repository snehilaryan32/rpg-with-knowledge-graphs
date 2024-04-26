python3 -m venv myenv
source myenv/bin/activate
pip3 install -r req.txt
!pip install langchain neo4j openai wikipedia tiktoken langchain_openai


query {
  get_cosine_similarity(player_input: { text: "I want a melee weapon" }) {
    matched
    idx
    cosine_sim
  }
}