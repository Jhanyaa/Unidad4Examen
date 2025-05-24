-- Insertar campus
INSERT INTO campus (nombre_campus, direccion_campus)
VALUES 
('TecNM Campus Mexicali', 'Av. Tecnológico s/n, Mexicali, BC'),
('TecNM Campus Tijuana', 'Calz. del Tecnologico 12950, Tijuana, BC');

-- INSERTAR DEPARTAMENTOS
INSERT INTO departamentos (nombre_departamento, edificio) VALUES
('Ingeniería de Sistemas', 'Edificio F'),
('Ingeneria Electrica', 'Edificio X');

-- INSERTAR CARRERAS
INSERT INTO carreras (nombre_carrera, titulo_otorgado) VALUES
('Ingeniería en Sistemas Computacionales', 'Ingeniero en Sistemas Computacionales'),
('Ingenieria Electrica', 'Ingeniero Electrico');

-- INSERTAR PROGRAMAS DE ESTUDIO
INSERT INTO programasestudio (nombre_programa, descripcion_p) VALUES
('Programa de Desarrollo de Software', 'Formacion para desarrolladores de hadware y software'),
('Ingenieria Electrica', 'Programa de formacion en Ingenieria Electrica');

--Inserccion de estudiantes
INSERT INTO estudiantes (nombre_e, apellido_e, fecha_nacimiento, direccion, email, id_carrera) VALUES
('Carlos', 'Gómez', '2000-05-12', 'Calle Falsa 123', 'a2549085@itmexicali.edu.mx', 1),
('Ana', 'López', '1999-08-23', 'Av. Siempre Viva 742', 'a2249065@itmexicali.edu.mx', 2),
('José', 'Sánchez', '2002-07-18', 'Av. Principal 321', 'a9988776@itmexicali.edu.mx', 2);

-- INSERCCION DE PROFESORES se incluyo el email
INSERT INTO profesores (nombre_p, apellido_p, titulo_profesor, id_departamento, email) VALUES
('Luis', 'Martinez', 'Maestria en Ingenieria del Software', 1, 'lmartinez@itmexicali.edu.mx'),
('Mario', 'Fernandez', 'Doctorado en Ingenieria Electrica', 2, 'mfernandez@itmexicali.edu.mx');

-- inserccion CURSOS incluyendo id_campus
INSERT INTO cursos (id_departamento, nombre_curso, descripcion_c, creditos, semestre, id_campus) VALUES
(1, 'Programación I', 'Introducción a la programación', 5, 1, 1),
(2, 'Circuitos Electricos I', 'Comportamiento de los Circuitos Electricos', 5, 4, 2);

-- Insertar INSCRIPCIONES
INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion, calificacion) VALUES
(1, 1, '2025-01-15', 85),
(2, 2, '2025-01-16', 90),
(3, 2, '2025-02-01', 75);

-- INSERTAR EN TABLA INTERMEDIA CURSOS_PROFESORES
INSERT INTO cursos_profesores (id_curso, id_profesor) VALUES
(1, 1),
(2, 2);

-- INSERTAR EN TABLA INTERMEDIA PROGRAMAS_CURSOS
INSERT INTO programas_cursos (id_programa, id_curso) VALUES
(1, 1),
(2, 2);

-- INSERTAR EN TABLA INTERMEDIA ESTUDIANTES_CARRERAS
INSERT INTO estudiantes_carreras (id_estudiante, id_carrera) VALUES
(1, 1),
(2, 2),
(3, 2);

--ACTUALIZACIONES DE DATOS
--CAMBIAR LA CALIFICACION DE UN ESTUDIANTE
UPDATE inscripciones
SET calificacion = 95
WHERE id_estudiante = 1 AND id_curso = 1;

SELECT *
FROM inscripciones
WHERE id_estudiante = 1 AND id_curso = 1;

--CORRECCION DEL CORREO DE UN ESTUDIANTE
UPDATE estudiantes
SET email = 'a2249076@itmexicali.edu.mx'
WHERE id_estudiante = 3;

SELECT id_estudiante, nombre_e, apellido_e, email
FROM estudiantes
WHERE id_estudiante = 3;

--ELIMINANDO DATOS
--ELIMINAR UNA INSCRIPCION DE UN ESTUDIANTE
DELETE FROM inscripciones
WHERE id_estudiante = 2;
SELECT * FROM inscripciones;
