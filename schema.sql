/* PART I Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic

CREATE TABLE animals (
  id integer, name varchar(40), date_of_birth 
  date, escape_attepmts integer,
  neutered boolean, weight_kg decimal,
  PRIMARY KEY (id)
  )
  