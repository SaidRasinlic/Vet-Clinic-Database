/* PART I - Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, weight_kg, escape_attempts)
VALUES (1, 'Agumon', '2020-11-03', 10.23, 0)
INSERT INTO animals (name, date_of_birth, weight_kg,escape_attempts, neutered)
VALUES ('Gabumon', '2018-02-03', 8, 2, true)
INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts)
VALUES ('Pikachu', '2021-01-07', 15.04, 1)
INSERT INTO animals (name, date_of_birth, weight_kg, escape_attempts, neutered)
VALUES ('Devimon', '2017-05-12', 11, 5, true)

/* PART II */

INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Charmander', '2020-08-02', 11, 0, 'true' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Plantmon', '2021-11-15', 10.7, 2, 'true' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Squirtle', '1993-04-02', 12.13, 3, 'false' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Angemon', '2005-06-07', 20.4, 4, 'true' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Boarmon', '2005-06-07', 20.4, 7, 'true' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Blossom', '1998-10-13', 17, 3, 'true' )
INSERT INTO animals (name, date_of_birth, weight_kg,
					 escape_attempts, neutered)
VALUES ('Ditto', '2022-05-14', 22, 4, 'true' )

/* PART III */
INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith','34'),
('Jennifer Orwell','19'),
('Bob','45'),
('Melody Pond','77'),
('Dean Winchester','14'),
('Jodie Whittaker','38');

UPDATE animals SET species_id = '2' WHERE name LIKE '%mon';
UPDATE animals SET species_id = '1' WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = '1' WHERE name IN ('Agumon');
UPDATE animals SET owner_id = '2' WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = '3' WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = '4' WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = '5' WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) VALUES
('Vet William Tatcher', 45, '2000-04-23'),
('Vet Mais Smith', 26, '2019-01-17'),
('Vet Stephanie Mendez', 64, '1981-05-04'),
('Vet Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id,species_id)
VALUES (1,1), (3,2), (3,1), (4,2);

INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES 
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
