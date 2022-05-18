-- Number of accidents by severity by year
select count(severity),severity, year
from acci_location
group by (year,severity);

-- Average  accidents per year 
select count(severity), year 
from acci_location
group by (year);

-- Number of accidents by HOUR 
select count(severity), hour
from acci_location 
group by (hour)
order by hour;


-- Number of accidents by STATE 
select count(severity), state
from acci_location 
group by (state)
order by state; 


-- Number of accidents by CITY in desending order
select count(id), city , state
from acci_location 
group by (city,state)
order by (count(id),state) desc ;



-- Number of accidents by STREET in desending order
select count(severity), street
from acci_location 
group by (street)
order by count(severity) DESC
LIMIT 10;


-- Number of accidents by severity & state
select count(severity), severity, state 
from acci_location
group by (state, severity);

------------------------------JOINING TWO OR MORE TABLES---------------------------------

---------------------------- Traffic condition data---------------- 
select count(l.severity), l.city, g.stop, w.sunrise_sunset
from acci_location as l
join acci_geography as g
on l.id=g.id
join acci_weather as w
on g.id=w.id
where (g.stop='true')
group by(l.city, g.stop,w.sunrise_sunset)
order by count desc limit 10;

------------------------------Weather Feature Data--------------------
select count(l.severity), l.city,l.state, w.temperature, 
			w.wind_chill,w.visibility,w.sunrise_sunset
from acci_location as l
join acci_weather as w
on l.id=w.id
where (temperature < 33 and sunrise_sunset ='Night')
group by (l.city,l.state, w.temperature, w.wind_chill,w.visibility,
		 w.sunrise_sunset)
order by count(l.severity) desc limit 10;		 





