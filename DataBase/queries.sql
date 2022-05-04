-- Number of accidents by severity by year
select count(severity),severity, year
into severity_year
from acci_location
group by (year,severity);

-- Average  accidents per year 
select count(severity), year 
into accident_by_year
from acci_location
group by (year);


-- Number of accidents by STATE in desending order
select count(severity), state
into accident_by_state
from acci_location 
group by (state)
order by count(severity) DESC


-- Number of accidents by CITY in desending order
select count(severity), city , state,  start_lng, start_lat
--into accident_by_city
from acci_location 
group by (city,state, start_lng, start_lat)
order by count(severity) desc


-- Number of accidents by STREET in desending order
select count(l.severity), l.street,l.city , l.state,l.start_lat, l.start_lng,w.weather_condition
into accident_by_street
from acci_location as l
join acci_weather as w
on l.id = w.id
group by (l.street,l.city,l.state,l.start_lat, l.start_lng,w.weather_condition)
order by count(l.severity) DESC;


-- Number of accidents by severity & state
select count(severity), severity, state 
into severity_by_state
from acci_location
group by (state, severity);

------------------------------------------------------------------------------------------------
-- Traffic condition data 
select id, severity, start_time, time_duration, distance
into traffic_jam
from acci_location

__ 

-- Weather Feature Data
select l.id, l.severity, w.temperature, w.wind_chill,w.humidity,w.pressure,w.visibility,
		w.wind_direction, w.wind_speed, w.precipitation, w.sunrise_sunset
into weather_feature
from acci_location as l
join acci_weather as w
on l.id=w.id


	

