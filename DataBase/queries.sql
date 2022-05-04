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
--into severity_by_state
from acci_location
group by (state, severity);

-- Number of Accident by Month
SELECT id, start_time 
from acci_location;
	
create table acci_month(
id int primary key,
acci_date date
)	


-- accident by month
select  extract(month from m.acci_date) , count(severity) 
from month as m
join acci_location as l
on m.id=l.id
group by (date_part)

