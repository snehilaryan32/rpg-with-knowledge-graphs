import streamlit as st 
import requests

api_host = 'http://localhost:8080/graphql'

st.title('Cyberpunk 2077')
st.subheader('Custom Quest Generation')
# Get the user input
user_input = st.text_area('Welcome to Night City! What would you like to do?')
if st.button("Generate Quest"):
    query = """
    query GenerateGameContent($playerInput: String!) {
    generateGameContent(playerInput: { text: $playerInput }) {
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
    """
    variables = {
        "playerInput": user_input
    }
    response = requests.post(api_host, json={'query': query, 'variables': variables})
    data = response.json()
    print(data)
    quest = data['data']['generateGameContent']['quest']

    markdown_text = f"""
    # {quest['title']}

    **NPC Dialogue:** {quest['npcDialogue']}

    **Objective:** {quest['objective']}

    **Reward:** {quest['reward']}
    """

    st.markdown(markdown_text)