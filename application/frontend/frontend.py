import streamlit as st 
import requests

api_host = 'http://localhost:8000'

st.title('Cyberpunk 2077')
st.subheader('Custom Quest Generation')

# Get the user input
user_input = st.text_area('Welcome to Night City! What would you like to do?')


if st.button("Generate Quest"):
    response = requests.post(f'{api_host}/get_quest', json={'text': user_input})
    response = response.json()
    st.write(response)

    dialogue = response["quest"]["title"]
    response_image = requests.post(f'{api_host}/get_illustration', json={'text': dialogue})
    print(response_image.json())
    st.image(response_image.json(), use_column_width=True)