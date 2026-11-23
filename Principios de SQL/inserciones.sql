USE escuela; -- REGISTROS E INSERCIONES

INSERT INTO alumno 
(matricula, nombre, fecha_nacimiento)
VALUES 
(101, 'Ana', '2004-05-12');

INSERT INTO alumno 
(Matricula, Nombre, FechaNacimiento)
VALUES 
(101, 'Ana', '2004-05-12');

INSERT INTO alumno
(Matricula, Nombre, FechaNacimiento)
VALUES
(102, 'Luis', '2003-08-20'),
(103, 'Pedro', '2004-02-15'),
(104, 'Mariana', '2005-11-10');

INSERT INTO PROFESOR
(ID_Profesor, Nombre_Profesor, Departamento)
VALUES
(1, 'Lopez', 'Sistemas'),
(2, 'Perez', 'Informatica'),
(3, 'Martinez', 'Redes');

INSERT INTO MATERIA
(ID_Materia, Nombre_materia, ID_Profesor)
VALUES
(10, 'Bases de Datos', 1),
(20, 'Programacion', 2),
(30, 'Redes', 3);

INSERT INTO INSCRIPCION
(Matricula, ID_Materia, Calificacion)
VALUES
(101, 10, 95),
(101, 20, 90),
(102, 10, 85),
(102, 30, 88),
(103, 20, 92),
(104, 30, 96);

INSERT INTO alumno
(Matricula, Nombre, FechaNacimiento)
VALUES
(105, 'Ana Laura', '2003-08-20'),
(106, 'anarillo', '2004-02-15'),
(107, 'andres', '2005-11-10');