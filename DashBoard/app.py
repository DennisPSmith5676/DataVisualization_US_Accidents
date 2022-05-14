from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
import os
import pandas as pd
import psycopg2
import sqlalchemy
import connexion

app = connexion.App(__name__, specification_dir="./")

app.add_api("swagger.yml")

# Use flask_sqlalchemy to set up postgresql connection
# DB Connection configuration
username = "postgres"
password = "usaccident"
endpoint = "us-accident.cnnhjjyro1tm.us-east-1.rds.amazonaws.com"  # something like amazonaws.com:5432
dbname   = "US_Accident"

## Connect to Db
engine = sqlalchemy.create_engine("postgresql://%s:%s@%s/%s" % (username, password, endpoint, dbname))

accident_df = pd.read_sql("SELECT * FROM clean_accident_data;", engine)
print(accident_df.columns)

@app.route("/")
def home():
   return render_template("home.html")

if __name__ == "__main__":
   app.run()