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