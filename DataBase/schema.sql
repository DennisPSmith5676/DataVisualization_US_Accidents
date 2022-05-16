-- Create a new table
CREATE TABLE location(
id INT PRIMARY KEY,
severity INT,
start_Time DATE,
year INT,
start_Lat FLOAT,
start_Lng FLOAT,
distance FLOAT,
street VARCHAR(60) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) NOT NULL,
zipcode VARCHAR(30) NOT NULL
);

CREATE TABLE weather(
id INT PRIMARY KEY,
temperature FLOAT,
wind_chill FLOAT,
humidity FLOAT,
pressure FLOAT,
visibility FLOAT,
wind_direction VARCHAR(30),
wind_speed FLOAT,
precipitation FLOAT,
weather_condition  VARCHAR(60),
sunrise_sunset VARCHAR(30)
);

CREATE TABLE geography(
id VARCHAR(30) PRIMARY KEY,
amenity Boolean,
bump Boolean,
crossing Boolean,
give_way Boolean,
junction Boolean,
no_exit Boolean,
railway Boolean,
roundabout Boolean,
station Boolean,
stop Boolean,
traffic_calming Boolean,
traffic_signal Boolean,
turning_loop Boolean);
