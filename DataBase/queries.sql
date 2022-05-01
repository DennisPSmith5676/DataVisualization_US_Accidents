-- Accident by State
select count(severity), state 
from location
group by(state);

-- Accident by Year
select count(severity), year 
from location
group by(year);

-- Accident by Severity
select l.severity, w.weather_condition
from location as l


