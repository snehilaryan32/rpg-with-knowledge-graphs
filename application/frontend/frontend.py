import streamlit as st 
import requests
from openai import OpenAI
client = OpenAI()

api_host = 'http://localhost:8080/graphql'

st.title('Cyberpunk 2077')
st.subheader('Powered by QuestFusion')
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
    # response = client.images.edit((
    # model="dall-e-2",
    # prompt=f"Create a concept art for the quest {quest['title']} set in a cyberpunk city",
    # n=1,
    # size="1024x1024"
    # ))

    response = client.images.generate(
        model="dall-e-2",
        prompt=f"Create a concept art for the quest {quest['title']} set in a cyberpunk city",
        size="1024x1024",
        quality="standard",
        n=1,
    )

    image_url = response.data[0].url
    st.image(image_url, caption='Concept Art', use_column_width=True)