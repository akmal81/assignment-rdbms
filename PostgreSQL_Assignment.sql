
-- 1  Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers(name, region )
VALUES ( 'Derek Fox', 'Coastal Plains');


-- 2  Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count  FROM sightings;


--3 Find all sightings where the location includes "Pass".

SELECT * FROM sightings 
WHERE "location" LIKE '%Pass%';


--4 List each ranger's name and their total number of sightings.   ------------------------

SELECT r.name, count(s.sighting_id) FROM rangers r JOIN sightings s ON r.ranger_id = s.ranger_id GROUP BY r.name;

-- 5 List species that have never been sighted.

SELECT common_name FROM species 
WHERE species_id NOT IN (SELECT species_id  from sightings );

-- 6 Show the most recent 2 sightings.

SELECT sp.common_name, s.sighting_time, r.name  FROM sightings s 
JOIN species sp ON s.species_id =sp.species_id  
JOIN rangers r ON r.ranger_id = s.ranger_id
ORDER BY sighting_time DESC LIMIT 2;


-- 7  Update all species discovered before year 1800 to have status 'Historic'.

UPDATE species
set conservation_status = 'Historic' 
WHERE EXTRACT (YEAR FROM discovery_date)< 1800;


-- 8 Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id, 
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time)<12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN EXTRACT(HOUR FROM sighting_time)>17 THEN 'Evening'
END as time_of_day 
FROM sightings;

-- 9 Delete rangers who have never sighted any species

DELETE FROM rangers WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings );

-- end