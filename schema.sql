/* PART I Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic

CREATE TABLE animals (
  id integer, name varchar(40), date_of_birth 
  date, escape_attepmts integer,
  neutered boolean, weight_kg decimal,
  PRIMARY KEY (id)
  )

  /* PART II */
ALTER TABLE animals ADD species_id integer,
ADD CONSTRAINT FK_species
FOREIGN KEY (species_id) 
REFERENCES species (id)
ON DELETE CASCADE

ALTER TABLE animals ADD owner_id integer,
ADD CONSTRAINT FK_owner
FOREIGN KEY (owner_id) 
REFERENCES owners (id)
ON DELETE CASCADE

/* PART III */

CREATE TABLE  species (
id SERIAL PRIMARY KEY, 
name VARCHAR(40) NOT NULL
);

/* PART IV */

CREATE TABLE vets (id SERIAL PRIMARY KEY, name varchar(40),
age integer, date_of_graduation date)

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INT,
  vet_id INT,
  CONSTRAINT fk_species FOREIGN KEY (species_id)
  REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY (vet_id)
  REFERENCES vets(id)
  )

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animals_id INT, vets_id INT, date_of_visit DATE,
  CONSTRAINT fk_animals FOREIGN KEY (animals_id)
  REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY (vets_id)
  REFERENCES vets(id)
 )

ALTER SEQUENCE
specializations_id_seq RESTART WITH 1

/* Part V */

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);