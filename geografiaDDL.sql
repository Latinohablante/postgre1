CREATE DATABASE geografia;

--\c geografia;

-- Crear tabla 'pais'
CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear tabla 'departamento'
CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE CASCADE
);

-- Crear tabla 'municipio'
CREATE TABLE municipio (
    id_municipio SERIAL PRIMARY KEY,
    numOrig INT,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON DELETE CASCADE
);

-- Crear tabla 'localidades'
CREATE TABLE localidades (
    idDep INT NOT NULL,
    nomDep VARCHAR(100),
    idMun INT NOT NULL,
    nomMun VARCHAR(100)
);