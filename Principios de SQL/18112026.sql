USE escuela;

CREATE TABLE inscripcion (
    matricula INT,
    ID_materia INT,
    calificacion DECIMAL(5,2),
    CONSTRAINT pk_inscripcion PRIMARY KEY (matricula, ID_materia),
    CONSTRAINT fk_inscripcion_alumno FOREIGN KEY (matricula)
        REFERENCES alumno(matricula),
    CONSTRAINT fk_inscripcion_materia FOREIGN KEY (ID_materia)
        REFERENCES materia(ID_materia),
    CONSTRAINT chk_calificacion CHECK (calificacion BETWEEN 0 AND 100)
);