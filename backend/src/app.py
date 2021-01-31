import json
from pprint import pprint

import mongoengine as mongo
from flask_rest_glue import FlaskRestGlue

mongo.connect("pyglue", host="mongodb://mongo:27017")

api = FlaskRestGlue(url="http://127.0.0.1", path="/api")


# Example from https://docs.mongoengine.org/tutorial.html


@api.rest_model()
class Todo(mongo.Document):
    # id = mongo.StringField(primary_key=True)
    title = mongo.StringField()
    description = mongo.StringField()


# @api.rest_model()
# class User(mongo.Document):
#     # id = mongo.StringField(primary_key=True)
#     email = mongo.StringField(primary_key=True)
#     password = mongo.StringField()
#     first_name = mongo.StringField()
#     last_name = mongo.StringField()
#
#     def custom_json(self) -> dict:
#         toRet = json.loads(self.to_json())
#
#         del toRet['password']
#
#         toRet["full_name"] = f"{toRet['first_name']} {toRet['last_name']}"
#
#         return toRet


# @api.rest_model()
# class Post(mongo.Document):
#     title = mongo.StringField()
#     text = mongo.StringField()
#     tags = mongo.ListField(mongo.StringField())
#     comments = mongo.ListField(mongo.StringField())
#
#     @staticmethod
#     def before_any(req):
#         pprint(vars(req))
#
#
#     # @staticmethod
#     # def before_get(req):
#     #     pprint(vars(req))
#     #     raise Exception()


flask_api = api.build()

flask_api.run(host="0.0.0.0")