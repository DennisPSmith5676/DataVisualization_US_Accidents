import pandas as pd
import sqlalchemy
import json
from config import awspassword

# Use flask_sqlalchemy to set up postgresql connection
# DB Connection configuration
username = "postgres"
password = awspassword
endpoint = "us-accident.cnnhjjyro1tm.us-east-1.rds.amazonaws.com"  # something like amazonaws.com:5432
dbname   = "US_Accident"

# Connect to Db
engine = sqlalchemy.create_engine("postgresql://%s:%s@%s/%s" % (username, password, endpoint, dbname))

# Load database into a dataframe 
accident_df = pd.read_sql("SELECT * FROM clean_accident_data;", engine)

# Called when a GET request is made to the URL defined in swagger.yml
def read(year, severity):
    drop_list = [
    'Start_Time', 'End_Time', 'Distance(mi)', 'Street', 'Side', 'City', 'County',
    'State', 'Zipcode', 'Timezone','Visibility(mi)', 'Wind_Direction',
    'Wind_Speed(mph)', 'Precipitation(in)', 'Weather_Condition', 'Amenity',
    'Bump', 'Crossing', 'Give_Way', 'Junction', 'No_Exit', 'Railway',
    'Roundabout', 'Station', 'Stop', 'Traffic_Calming', 'Traffic_Signal',
    'Turning_Loop', 'Sunrise_Sunset', 'Month', 'Day', 'Hour',
    'Weekday', 'time_duration'
    ]

    # Drops the drop_list columns, removes the rows which do not match the year and severity
    cleaned_df = accident_df.drop(drop_list, axis=1).loc[(accident_df["Year"] == year) & (accident_df["Severity"] == severity)]

    # Formats and returns a valid accidents.json
    return json.loads(cleaned_df.to_json(orient='records'))
