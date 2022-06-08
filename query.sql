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