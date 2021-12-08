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