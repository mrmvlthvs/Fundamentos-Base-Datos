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

CREATE TABLE IF NOT EXISTS criterio (
    id_criterio INT PRIMARY KEY AUTO_INCREMENT,
    id_materia INT,
    nombre VARCHAR(100) NOT NULL,
    ponderacion DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_materia) REFERENCES materia(id_materia)
);

CREATE TABLE IF NOT EXISTS trimestre (
    id_trimestre INT PRIMARY KEY AUTO_INCREMENT,
    id_ciclo INT,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (id_ciclo) REFERENCES ciclo_escolar(id_ciclo)
)

CREATE TABLE IF NOT EXISTS calificacion (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT,
    id_criterio INT,
    id_trimestre INT,
    id_docente INT,
    id_alumno INT,
    calificacion DECIMAL(5,2) NOT NULL,
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripcion(id_inscripcion),
    FOREIGN KEY (id_criterio) REFERENCES criterio(id_criterio),
    FOREIGN KEY (id_trimestre) REFERENCES trimestre(id_trimestre),
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno)
);

CREATE TABLE IF NOT EXISTS cuenta_alumno (
    id_cuenta INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_tutor INT,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor)
);

CREATE TABLE IF NOT EXISTS cuenta_docente (
    id_cuenta INT PRIMARY KEY AUTO_INCREMENT,
    id_docente INT,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL,
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente)
);