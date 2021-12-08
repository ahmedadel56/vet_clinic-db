INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Agumon','2020-02-03',10.23,false,0 );
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Gabumon','2018-11-15',8,true,2 );
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Pikachu','2021-01-07',15.04,false,1 );
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Devimon','2017-05-12',11,true,5 );
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Charmander','2020-02-08',11,false,0 );
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Plantmon','2022-11-15',5.7,true,2);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Squirtle','1993-04-02',12.13,false,3);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Angemon','2005-06-12',45,true,1);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Boarmon','2005-06-07',20.4,true,7);
INSERT INTO animals (name,date_of_birth,weight_kg,neutered,escape_attempts) VALUES ('Blossom','1998-10-13',17,true,3);

-- Insert the following data into the owners table:

INSERT INTO owners (full_name, age) VALUES
        ('Sam Smith',34),
        ('Jennifer Orwell',19),
        ('Bob',45),
        ('Melody Pond',77),
        ('Dean Winchester',14),
        ('Jodie Whittaker',38);

-- Insert the following data into the species table:

INSERT INTO species (name) VALUES  ('Pokemon'),('Digimon');


-- Modify your inserted animals so it includes the species_id value:


-- If the name ends in "mon" it will be Digimon
BEGIN;
UPDATE animals
SET species_id = 1 WHERE name LIKE '%mon';
COMMIT;
-- All other animals are Pokemon
BEGIN;
UPDATE animals
SET species_id = 2 WHERE name NOT LIKE '%mon';
COMMIT;


-- Modify your inserted animals to include owner information (owner_id):


-- Sam Smith owns Agumon.
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')  WHERE name='Agumon';
COMMIT;
-- Jennifer Orwell owns Gabumon and Pikachu.
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');
COMMIT;
-- Bob owns Devimon and Plantmon.
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');
COMMIT;
-- Melody Pond owns Charmander, Squirtle, and Blossom.
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
COMMIT;
-- Dean Winchester owns Angemon and Boarmon.
BEGIN;
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');
COMMIT;