from openai import OpenAI

client = OpenAI()
prompt_context = '''
You are a rpg game quest generator system. Given some information and the type of quest which has been 
extracted from a knowledge graph you are supposed to generate the quest for the player. 
With the quest you are also expected to generate an acompynying dialouge that will be spoken 
by an NPC that will give the quest to the player. Also generate a reward as well as an exact 
objective for the quest.
'''
def generate_quest(player_input, output, quest_type):
    return client.chat.completions.create(
        model="gpt-3.5-turbo",
        response_format={ "type": "json_object" },
        messages=[
            {"role": "system", "content": "You are a helpful assistant designed to output JSON."},
            {"role": "user", "content": f"{prompt_context}The knowledge graph output is {output} and the player input is {player_input.text} and the quest type is {quest_type}"}
        ]
    )

