#DROP DATABASE taxis;

CREATE DATABASE taxis;

USE taxis;

CREATE TABLE Propietarios(
	id_propietario INT AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    tlf VARCHAR(15) NOT NULL,
    PRIMARY KEY(id_propietario)
);

INSERT INTO Propietarios VALUES(NULL, 'Rigoberto López de Cabrada', 687554321);
INSERT INTO Propietarios VALUES(NULL, 'Miranda del Barrio Riofrio', 677665211);
INSERT INTO Propietarios VALUES(NULL, 'Eustaquio Miraflores del Cano', 691783324);
INSERT INTO Propietarios VALUES(NULL, 'Eduardo Mendez Garcia', 688775566);

CREATE TABLE taxis(
	id_taxi INT AUTO_INCREMENT,
    placa VARCHAR(30) UNIQUE NOT NULL, 
    marca VARCHAR(30),
    modelo VARCHAR(30),
    fk_if_propietario INT,
    PRIMARY KEY(id_taxi),
    FOREIGN KEY(fk_if_propietario) REFERENCES propietarios(id_propietario) ON DELETE SET NULL
);

INSERT INTO taxis VALUES(NULL, '4356LFK', 'Renault', 'Traffic', 1);
INSERT INTO taxis VALUES(NULL, '4366KTJ', 'Mercedes', 'Clase A Compacto', 2);
INSERT INTO taxis VALUES(NULL, '0018JTK', 'Mercedes', 'CLA Shooting Brake', 3);
INSERT INTO taxis VALUES(NULL, '1019JKK', 'Mercedes', 'CLA Shooting Brake', 4);

CREATE TABLE Conductores(
	id_conductor INT AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    tlf VARCHAR(15) NOT NULL,
    fk_id_taxi INT,
    PRIMARY KEY(id_conductor),
    FOREIGN KEY(fk_id_taxi) REFERENCES taxis(id_taxi) ON UPDATE CASCADE
);

INSERT INTO conductores VALUES(NULL, 'Catalina Regoces de la Olla', 654375642, 2);
INSERT INTO conductores VALUES(NULL, 'Alfredo Gustoso Sabron', 689993346, 1);
INSERT INTO conductores VALUES(NULL, 'Francisco Hurtado Cabopinto', 699546178, 3);

#actualizar tlf propietario Miranda
UPDATE propietarios SET tlf = 611435266 WHERE id_propietario = 2;
SELECT * FROM propietarios;

#Comprobamos que el SET NULL del foreign key de taxis funciona correctamente:
DELETE FROM propietarios WHERE id_propietario = 4;
SELECT * FROM taxis;

#Comprobamos que el ON UPDATE CASCADE del foreign key de conductores funciona correctamente:
UPDATE taxis SET id_taxi = 5 WHERE id_taxi = 1;
SELECT * FROM conductores;