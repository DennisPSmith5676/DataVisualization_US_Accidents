import os
from textwrap import indent
import pandas as pd
import psycopg2
import sqlalchemy
import json

# Use flask_sqlalchemy to set up postgresql connection
# DB Connection configuration
username = "postgres"
password = "usaccident"
endpoint = "us-accident.cnnhjjyro1tm.us-east-1.rds.amazonaws.com"  # something like amazonaws.com:5432
dbname   = "US_Accident"

## Connect to Db
engine = sqlalchemy.create_engine("postgresql://%s:%s@%s/%s" % (username, password, endpoint, dbname))

accident_df = pd.read_sql("SELECT * FROM clean_accident_data;", engine)

def read(year, severity):

    drop_list = [
        'index', 'ID', 'Start_Time', 'End_Time', 'Start_Lat',
        'Start_Lng', 'Distance(mi)', 'Street', 'Side', 'City', 'County',
        'State', 'Zipcode', 'Timezone', 'Temperature(F)', 'Wind_Chill(F)',
        'Humidity(%)', 'Pressure(in)', 'Visibility(mi)', 'Wind_Direction',
        'Wind_Speed(mph)', 'Precipitation(in)', 'Weather_Condition', 'Amenity',
        'Bump', 'Crossing', 'Give_Way', 'Junction', 'No_Exit', 'Railway',
        'Roundabout', 'Station', 'Stop', 'Traffic_Calming', 'Traffic_Signal',
        'Turning_Loop', 'Sunrise_Sunset', 'Month', 'Day', 'Hour',
        'Weekday', 'time_duration'
    ]

    cleaned_df = accident_df.drop(drop_list, axis=1)
    
    filtered_df = cleaned_df.loc[(cleaned_df["Year"] == year) & (cleaned_df["Severity"] == severity)]

    return filtered_df.to_json(orient='records', indent=None)