\COPY localidades (idDep, nomDep, idMun, nomMun)
FROM '/home/camper/Documentos/postgre1/localidades.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';
-- Insertar país
INSERT INTO pais (nombre) VALUES ('Colombia');

-- Insertar departamentos (evitar duplicados)
INSERT INTO departamento (id_departamento, nombre, id_pais)
SELECT DISTINCT idDep, nomDep, (SELECT id_pais FROM pais WHERE nombre='Colombia') FROM localidades;

-- Insertar municipios (evitar duplicados)
INSERT INTO municipio (numOrig, nombre, id_departamento)
SELECT DISTINCT idMun, nomMun, idDep FROM localidades;
