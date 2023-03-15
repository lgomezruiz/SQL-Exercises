# Laura Gómez Ruiz - BD03 Tarea 3

# EJERCICIO 1
/* Eliminamos la base de datos si existe */
DROP DATABASE IF EXISTS cursos_bd03;

/* Creamos la base de datos */
CREATE DATABASE cursos_bd03;

/* Usamos la base de datos */
USE cursos_bd03;

/* Creación de la tabla CURSO */
CREATE TABLE curso (
	codCurso CHAR(4) PRIMARY KEY,
    tituloCurso VARCHAR(20) UNIQUE,
    descripcion VARCHAR(40),
    numHorasCurso INT
);

/* Creación de la tabla UNIDAD */
CREATE TABLE unidad (
	codCurso CHAR(4),
    numUnidad INT,
    tituloUnidad VARCHAR(20) NOT NULL,
    numHorasUnidad INT DEFAULT 0,
    PRIMARY KEY (codCurso, numUnidad),
    CONSTRAINT unidad_curso_FK
		FOREIGN KEY (codCurso) REFERENCES curso (codCurso) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Creación de la tabla VIDEOCONFERENCIA */
CREATE TABLE videoconferencia (
	fecha DATE PRIMARY KEY CHECK (fecha >= '2020-01-01'),
    contenido VARCHAR(40) NOT NULL,
    codCurso CHAR(4),
    numUnidad INT,
    CONSTRAINT videoconfer_unidad_FK
		FOREIGN KEY (codCurso, numUnidad) REFERENCES unidad (codCurso, numUnidad) ON UPDATE CASCADE	
);

# EJERCICIO 2

/* Cambiar el nombre de la tabla UNIDAD por SESION */
RENAME TABLE unidad TO sesion;

/* Añadimos la columna tipo a la tabla sesion */
ALTER TABLE sesion ADD (
	tipo ENUM ('Videoconferencia', 'Sesión Presencial', 'Cuestionario')
);

/* Creamos la nueva tabla PROFESOR */
CREATE TABLE profesor (
	codProfesor INT NOT NULL PRIMARY KEY,
    dni VARCHAR(7) NOT NULL,
    nombre VARCHAR(10),
    apellidos VARCHAR (20),
    fechaNac DATE,
    telefono INT,
    email VARCHAR(20)
);

/* Modificación de la tabla CURSO */
ALTER TABLE curso ADD (
	fechaInicio DATE,
    fechaFin DATE,
    codProfesor INT NOT NULL,
    CONSTRAINT curso_profesor_FK
		FOREIGN KEY (codProfesor) REFERENCES profesor (codProfesor)
);

/* Creación de un índice para el nombre y el apellido de profesor */
CREATE INDEX index_prof_nomb_apell ON profesor (nombre, apellidos);