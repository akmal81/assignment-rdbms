CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);


CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status CHAR(10)
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INTEGER REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP WITHOUT TIME ZONE,
    location VARCHAR(20),
    notes TEXT
);

INSERT INTO rangers(name, region)
VALUES ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range');

SELECT * from rangers;
  INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
  ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
  ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
  ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
  ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
SELECT * from species;
  INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
  (1, 1, 'Peak Ridge',        '2024-05-10 07:45:00+00', 'Camera trap image captured'),
  (2, 2, 'Bankwood Area',     '2024-05-12 16:20:00+00', 'Juvenile seen'),
  (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00+00', 'Feeding observed'),
  (1, 2, 'Snowfall Pass',     '2024-05-18 18:30:00+00', NULL);

select * from  sightings;
DROP Table sightings;


-- 1  Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers(name, region )
VALUES ( 'Derek Fox', 'Coastal Plains');


-- 2  Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count  FROM sightings;


--3 Find all sightings where the location includes "Pass".

SELECT * FROM sightings 
WHERE "location" LIKE '%Pass%';


--4 List each ranger's name and their total number of sightings.   ------------------------

SELECT name, count(species_id ) FROM rangers JOIN sightings GROUP BY ranger_id;

SELECT count( s.species_id) from rangers r JOIN sightings s 
ON r.ranger_id = s.ranger_id GROUP BY s.ranger_id;


-- 5 List species that have never been sighted.

SELECT common_name FROM species 
WHERE species_id NOT IN (SELECT species_id  from sightings );
