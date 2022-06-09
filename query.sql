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
