CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered boolean,
    weight_kg DECIMAL,
);
ALTER TABLE animals ADD species varchar(255);