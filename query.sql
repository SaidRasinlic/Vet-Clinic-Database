/* PART I - Queries that provide answers to the questions from all projects. */

SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = 'true' AND  escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.40 AND 17.3;

/* PART II */
BEGIN;
UPDATE animals SET species='unspecified' WHERE neutered='true';
SELECT * FROM animals -- comment line to back to the state before transaction
ROLLBACK;
SELECT * FROM animals

BEGIN;
UPDATE animals SET species = 'digimon'  WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon'  WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
SAVEPOINT undo_delete;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TO undo_delete;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2020-01-01';
SELECT * FROM animals;
SAVEPOINT after_birth_sp;
UPDATE animals SET weight_kg = weight_kg * 1;
UPDATE animals SET weight_kg = weight_kg * 1 WHERE weight_kg < 0;
SELECT * FROM animals;
ROLLBACK TO after_birth_sp;
SELECT * FROM animals;

/* PART III */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'

SELECT animals.name FROM animals JOIN species
ON species.id = animals.species_id WHERE species.name = 'Pokemon';

SELECT full_name, name FROM owners JOIN animals
ON animals.owner_id = owners.id;

SELECT species.name, COUNT(species_id) FROM species JOIN animals
ON species.id = animals.species_id GROUP BY species.name

SELECT full_name, name FROM animals a JOIN owners o on o.id = a.owner_id 
WHERE o.full_name = 'Jennifer Orwell' AND a.species_id=2;

SELECT name, escape_attempts FROM animals a JOIN owners o ON
o.id = a.owner_id WHERE 
o.full_name='Dean Winchester' AND a.escape_attempts = 0;

SELECT full_name, COUNT(owner_id) FROM owners o JOIN animals a ON 
a.owner_id = o.id GROUP BY full_name
ORDER BY count DESC LIMIT 1; 

/* PART IV */

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, visits.date_of_visit FROM vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name LIKE  '%William%'
ORDER BY visits.date_of_visit DESC LIMIT 1;

--How many different animals did Stephanie Mendez see?
SELECT COUNT(animals_id) FROM visits 
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name LIKE '%Mendez%';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.id, vets.name, species.name AS specialty FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Vet Stephanie Mendez' AND
visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-01';

-- What animal has the most visits to vets?
  SELECT name, COUNT(*) FROM animals 
  JOIN visits ON animals.id=visits.animals_id
  GROUP BY name ORDER BY COUNT DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
  SELECT animals.name as animals_name, vets.name as vets_name, visits.date_of_visit
  FROM visits JOIN animals ON visits.animals_id=animals.id
  JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Vet Maisy Smith'
  ORDER BY visits.date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
  SELECT animals.id, animals.name as animals_name, animals.date_of_birth, 
  vets.id, vets.name as vets_name, vets.age, date_of_visit
  FROM visits JOIN animals ON animals.id = visits.animals_id
  JOIN vets ON vets.id = visits.vets_id
  ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
  SELECT vets.name, COUNT(*) FROM visits JOIN vets 
  ON vets.id = visits.vets_id LEFT JOIN specializations 
  ON specializations.vet_id = visits.vets_id
  WHERE specializations.vet_id IS NULL GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
  SELECT vets.name as vets_name, species.name as speciality,
  COUNT(species.name) FROM visits 
  JOIN animals ON visits.animals_id=animals.id
  JOIN vets ON visits.vets_id=vets.id
  JOIN species ON species.id = animals.species_id 
  WHERE vets.name = 'Vet Maisy Smith'
  GROUP BY vets.name, species.name
  ORDER BY COUNT DESC LIMIT 1;

  /* Part V */

  EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;

  EXPLAIN ANALYZE  SELECT * FROM visits where vets_id = 2;
   
  EXPLAIN ANALYZE  SELECT * FROM owners where email = 'owner_18327@mail.com';
