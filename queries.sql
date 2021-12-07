SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1'  AND '2019-1-1';
SELECT name FROM animals WHERE escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.5  AND 17.2 ;

-- First required transaction


-- Inside a transaction update the animals table by setting the species column to unspecified.
SQL> BEGIN;
SQL> UPDATE  animals
SET species = 'unspecified';
-- Verify that change was made.
SQL> SELECT * FROM animals;
-- Then roll back the change and verify that species columns went back to the state before tranasction.
SQL> ROLLBACK;


-- Second required transaction


-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
SQL> BEGIN;
SQL> UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon'; 
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
SQL> UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
-- Commit the transaction.
SQL> COMMIT;
-- Verify that change was made and persists after commit.
SQL> SELECT * FROM animals;


-- Third required transaction


-- Inside a transaction delete all records in the animals table
SQL> BEGIN;
SQL> DELETE FROM animals;
--then roll back the transaction.
SQL> ROLLBACK
-- After the roll back verify if all records in the animals table still exist.
SQL> SELECT * FROM animals;


-- Fourth required transaction


-- Delete all animals born after Jan 1st, 2022.
SQL> BEGIN;
SQL> DELETE FROM animals 
WHERE date_of_birth > '2022-01-01';
-- Create a savepoint for the transaction.
SQL> SAVEPOINT SP1;
-- Update all animals' weight to be their weight multiplied by -1.
SQL> UPDATE animals
SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
SQL> ROLLBACK TO SP1;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
SQL> UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0
-- Commit transaction
SQL> COMMIT;



-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) FROM animals
GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM  animals
GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;