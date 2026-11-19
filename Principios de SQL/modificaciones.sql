USE escuela; -- MODIFICACIONES Y ALTERACIONES 
-- [NO CORRER ESTE SCRIPT]

ALTER TABLE alumno
ADD telefono VARCHAR(15); -- agrega una nueva columna llamada telefono

ALTER TABLE alumno
modify Nombre VARCHAR(100); -- modifica el tamano del campo nombre 

ALTER TABLE alumno
DROP COLUMN telefono; -- elimina la columna telefono de la tabla

DROP TABLE alumno; 
-- elimina la tabla alumno, no se recomienda si existen dependencias 

ALTER TABLE alumno RENAME COLUMN FechaNacimiento TO Fecha_Nacimiento;
-- renombra la columna de la tabla
