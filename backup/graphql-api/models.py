import graphene

class Query(graphene.ObjectType):
    hello = graphene.String(description='A typical hello world', name=graphene.String(default_value="stranger"))

    def resolve_hello(self, info, name):
        return 'Hello ' + name

schema = graphene.Schema(query=Query)