-- Creacion de la base de datos SMA_Control
CREATE DATABASE SMA_Control;
USE SMA_Control;
SHOW DATABASES;

-- Creacion de las tablas
CREATE TABLE IF NOT EXISTS ciclo_escolar (
    id_ciclo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_ciclo VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS docente (
    id_docente INT PRIMARY KEY AUTO_INCREMENT,
    num_empleado VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS materia (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    grado INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS alumno (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    id_ciclo INT,
    curp VARCHAR(18) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_nacimiento DATE NOT NULL,
    genero ENUM('Masculino', 'Femenino', 'No binario', 'Otro') NOT NULL,
    domicilio VARCHAR(255),
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email_institucional VARCHAR(100),
    FOREIGN KEY (id_ciclo) REFERENCES ciclo_escolar(id_ciclo)
);

CREATE TABLE IF NOT EXISTS tutor (
    id_tutor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    domicilio VARCHAR(255),
    telefono VARCHAR(15),
    telefono_emergencia VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS grupo (
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    id_ciclo INT,
    id_docente_titular INT,
    grado INT NOT NULL,
    letra CHAR(1) NOT NULL,
    turno ENUM('Matutino', 'Vespertino') NOT NULL,
    nombre_grupo VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_ciclo) REFERENCES ciclo_escolar(id_ciclo),
    FOREIGN KEY (id_docente_titular) REFERENCES docente(id_docente)
);

CREATE TABLE IF NOT EXISTS alumno (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_ciclo INT,
    FOREIGN KEY (id_ciclo) REFERENCES ciclo_escolar(id_ciclo)
);

CREATE TABLE IF NOT EXISTS inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_grupo INT,
    fecha_inscripcion DATE NOT NULL,
    estatus ENUM('Activo', 'Inactivo') NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE IF NOT EXISTS tutela (
    id_tutela INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_tutor INT,
    parentesco VARCHAR(50) NOT NULL,
    contacto_emergencia VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor)
);

CREATE TABLE IF NOT EXISTS telefono_tutor (
    id_telefono_tutor INT PRIMARY KEY AUTO_INCREMENT,
    id_tutor INT,
    telefono VARCHAR(15) NOT NULL,
    tipo_telefono ENUM('Casa', 'Celular', 'Trabajo') NOT NULL,
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor)
);

CREATE TABLE IF NOT EXISTS criterio