select * from flights
where distance > 4900;

select  distinct(flight),origin,  distance from flights
order by distance
desc
limit 5;

select max(distance) from flights.flights;

SELECT
LTRIM('   hello') as 'answer';

SELECT left(now(),4);

select round(pi(), 1);

SELECT power(pi(), 2);
SELECT POWER(5, 2);
SELECT POWER(25, .5);

select * from planes;

select distinct(origin) from flights;

# 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
# Show the SQL query(s) that support your conclusion.
# Based on the distance, it looks like JFK to HNL airport is the furthest away by distance
# in this query, I am using distinct to only give me unique flights and sort from highest to lowest by distance

select  distinct(flight),origin, dest, distance from flights
order by distance
desc
limit 1;

# 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
#the most number of seats? Show the SQL statement(s) that support your result.
select distinct(engine) from planes; # this gives the different rows
select count(distinct(engine)) from planes; # gives the count of those different rows

# This picks the model within each engine with the most seats
select distinct(engine), model, max(seats) from planes
group by engine
order by seats desc;



# 3. Show the total number of flights.

select count(flight) as total_flights from flights;


# 4. Show the total number of flights by airline (carrier).

select carrier, count(*) as 'total flights' from flights
group by carrier;

#5 Show all of the airlines, ordered by number of flights in descending order.

select carrier, count(flight) as 'number of flights' from flights
group by carrier
order by 'number of flights'
desc;

# 6 Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

select carrier, count(flight) as 'number of flights' from flights
group by carrier
order by 'number of flights'
desc
limit 5;

# 7 Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
# flights in descending order.
select carrier, count(flight)  as 'number of flights >= 1000 miles' from flights
where distance >= 1000
group by carrier
order by 'number of flights'
desc
limit 5;

# Q8 custom query: Show the total number of models over 300 by manufacturer
select manufacturer, count(model) as 'Total Models by Manufacturer' from planes
group by manufacturer
having count(model) >= 300
order by count(model)
desc
;

# Custom Question: Avg Number of seats by engine type

# This picks the model within each engine with the most seats
select distinct(engine), model, round(avg(seats),2) from planes
group by engine
order by seats desc;






