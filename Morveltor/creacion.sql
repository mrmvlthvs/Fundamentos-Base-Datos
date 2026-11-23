CREATE database morveltor;
USE morveltor;

-- TABLA DE USUARIOS
CREATE TABLE IF NOT EXISTS users(
ID_user INT PRIMARY KEY NOT NULL,
username VARCHAR(20) NOT NULL,
displayname VARCHAR(50),
subscription_date DATE,
genre char(1),
CONSTRAINT chk_user_genre
        CHECK (genre IN ('f', 'm', 'x'))
);

-- TABLA DE FLOTAS 
CREATE TABLE IF NOT EXISTS flotas(
ID_flota INT PRIMARY KEY NOT NULL,
business_name VARCHAR (20) NOT NULL,
description_bussiness VARCHAR(50),
rfc VARCHAR(13) NOT NULL,
type_vehicles VARCHAR(10) NOT NULL,
subscription_date DATE NOT NULL,
total_vehicles INT NOT NULL,
active_vehicles INT NOT NULL,
CONSTRAINT chk_type_vehicles
		CHECK (type_vehicles IN ('caja seca cerrada', 'caja refrigerada', 'volteo', 'carga abierta')),
CONSTRAINT chk_total_vehicles
		CHECK (total_vehicles >= 0),
CONSTRAINT chk_active_vehicles
		CHECK (active_vehicles <= total_vehicles)
);

-- TABLA DE VEHICULOS
CREATE TABLE IF NOT EXISTS vehicle(
ID_vehicle INT PRIMARY KEY NOT NULL,

);
