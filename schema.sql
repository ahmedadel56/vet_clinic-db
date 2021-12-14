CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED  ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg DECIMAL
);
ALTER TABLE animals ADD species varchar(255);

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED  ALWAYS AS IDENTITY ,
    full_name TEXT,
    age INT
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED  ALWAYS AS IDENTITY,
    name TEXT
);


ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
    ADD species_id INT,
    ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
    ADD owner_id INT,
    ADD CONSTRAINT owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED  ALWAYS AS IDENTITY ,
    name TEXT,
    age INT,
    date_of_graduation DATE
);

-- There is a many-to-many relationship between the tables species and vets

CREATE TABLE specializations ();

ALTER TABLE specializations
    ADD species_id INT,
    ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE specializations
    ADD vet_id INT,
    ADD CONSTRAINT vet_id FOREIGN KEY(vet_id) REFERENCES vets(id);


-- There is a many-to-many relationship between the tables animals and vets

CREATE TABLE visits ();

ALTER TABLE visits
    ADD vet_id INT,
    ADD CONSTRAINT vet_id FOREIGN KEY(vet_id) REFERENCES vets(id);

ALTER TABLE visits
    ADD animal_id INT,
    ADD CONSTRAINT animal_id FOREIGN KEY(animal_id) REFERENCES animals(id);

-- it should also keep track of the date of the visit
ALTER TABLE visits ADD visit_date DATE

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id ON visits(animals_id);
CREATE INDEX visits_id ON visits(vets_id);
CREATE INDEX owners_mail ON owners(email ASC);