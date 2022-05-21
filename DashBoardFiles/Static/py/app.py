from flask import Flask, render_template, request
from flask_cors import CORS
import connexion
import sqlalchemy
import pandas as pd

# Sets up flask app with connexion framework
app = connexion.App(__name__, specification_dir="./")
app.add_api("swagger.yml")

# Allows cross origin requests to only the /api/* URLs
# Lets us use the API from another site -
CORS(app.app, resources={r"/api/*"})

# Default route
@app.route("/")
def home():
   return "Use /api/accidents?year=YYYY&severity=X"

if __name__ == "__main__":
   app.run()