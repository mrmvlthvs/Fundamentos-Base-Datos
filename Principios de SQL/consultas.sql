USE escuela;
-- SELECCIONAR TODA LA TABLA ALUMNO
SELECT * FROM alumno;

-- SELECCIONAR TODA LA TABLA PROFESOR
SELECT * FROM profesor;

SELECT Nombre_Profesor, Departamento FROM profesor
ORDER BY Departamento;

SELECT Nombre, FechaNacimiento FROM alumno
ORDER BY FechaNacimiento;

SELECT * FROM alumno
WHERE Matricula = 101;

SELECT * FROM inscripcion
WHERE calificacion >= 90;


SELECT * FROM alumno
WHERE Nombre LIKE 'an%';
