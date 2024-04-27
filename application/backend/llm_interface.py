from langchain_core.pydantic_v1 import BaseModel, Field
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate

class QuestGenerator:
    def __init__(self):

        self.temperature = 0.0
        self.model = "gpt-3.5-turbo-0125"
        self.llm = ChatOpenAI(
            model=self.model, 
            temperature=self.temperature, 
            response_format={ "type": "json_object" }
        )

        self.prompt_context_content = '''
        You are a rpg game quest generator system. Given some information and the type of quest which has been 
        extracted from a knowledge graph you are supposed to generate the quest for the player. 
        With the quest you are also expected to generate an acompynying dialouge that will be spoken 
        by an NPC that will give the quest to the player. Also generate a reward as well as an exact 
        objective for the quest. Respond in JSON with `title`, `npc_dialogue`, `objective` and `reward` keys
        '''
    
        # self.template_rewards = ChatPromptTemplate.from_messages([
        #     ("system", self.prompt_context_rewards),
        #     ("human", "The player input is {player_prompt}, the quest type is {quest_type_ip}. The knowledge graph output is {kg_op}")
        # ])

        self.template_quest_content = ChatPromptTemplate.from_messages([
            ("system", self.prompt_context_content),
            ("human", "The player input is {player_prompt}, the quest type is {quest_type_ip}. The knowledge graph output is {kg_op}")
        ])

        # self.chain_rewards = self.template_rewards | self.llm
        self.chain = self.template_quest_content | self.llm

    def generate_quest(self, player_input, kg_output, quest_type):
        return self.chain.invoke(
            {
                "kg_op": kg_output,
                "player_prompt": player_input,
                "quest_type_ip": quest_type
            }
        )

        # self.prompt_context_rewards = '''
    # You are a rpg video game quest reward generator system. Given some information you are supposed to generate  
    # The respond in json with `xp` and `cash` keys
    # '''
    
    # def generate_rewards(self, player_input, kg_output, quest_type):
    #     return self.chain_rewards.invoke(
    #         {
    #             "kg_op": kg_output,
    #             "player_prompt": player_input,
    #             "quest_type_ip": quest_type
    #         }
    #     )










































##############################################################################################################################################################
######################################################Without Langchain###########################################################################
##############################################################################################################################################################

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

