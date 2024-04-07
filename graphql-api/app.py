import graphene
from flask import Flask, request, jsonify
from tqdm import tqdm
import pdf_processor
import graph_builder

app = Flask(__name__)

class Query(graphene.ObjectType):
    hello = graphene.String(name=graphene.String(default_value="stranger"))
    build_graph = graphene.String(path=graphene.String(required=True))

    def resolve_hello(self, info, name):
        return f"Hello, {name}!"
    
    def resolve_build_graph(self, info, path):
        documents_pdf = pdf_processor.pdf_split(path, chunk_size=100, chunk_overlap=24)
        for i, d in enumerate(documents_pdf):
            print(i, d)
            graph_builder.extract_and_store_graph(d)
        return path

schema = graphene.Schema(query=Query)

@app.route("/graphql", methods=["POST"])
def graphql():
    data = request.get_json()
    result = schema.execute(data["query"])
    return jsonify(result.data)

if __name__ == "__main__":
    app.run()