--Tabla de estudiantes
CREATE TABLE estudiantes (
id_estudiante SERIAL PRIMARY KEY,
nombre_e VARCHAR (50) NOT NULL, 
apellido_e VARCHAR (50) NOT NULL,
fecha_nacimiento DATE NOT NULL,
direccion VARCHAR (50),
ciudad VARCHAR (50) NOT NULL,
email VARCHAR (50) UNIQUE NOT NULL
);

--Tabla de departamentos
CREATE TABLE departamentos(
id_departamento SERIAL PRIMARY KEY,
nombre_departamento VARCHAR(50) UNIQUE NOT NULL,
edificio VARCHAR (50) NOT NULL
);

--Tabla de cursos
CREATE TABLE cursos (
id_curso SERIAL PRIMARY KEY,
id_departamento INT NOT NULL,
nombre_curso VARCHAR(50) NOT NULL,
descripcion_c TEXT,
creditos INT NOT NULL, 
semestre INT NOT NULL, 
FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

--Tabla inscripciones
CREATE TABLE inscripciones 
(
id_inscripcion SERIAL PRIMARY KEY, 
id_estudiante INT NOT NULL,
id_curso INT NOT NULL,
fecha_inscripcion DATE NOT NULL, 
calificacion INT CHECK(calificacion BETWEEN 0 AND 100),
FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

--Tabla profesores
CREATE TABLE profesores(
id_profesor SERIAL PRIMARY KEY, 
nombre_p VARCHAR(50) NOT NULL,
apellido_p VARCHAR(50) NOT NULL,
titulo_profesor VARCHAR(50),
id_departamento INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

 --Tabla Aulas
CREATE TABLE aulas(
id_aula SERIAL PRIMARY KEY,
nombre_aula VARCHAR(50) NOT NULL UNIQUE,
capacidad int NOT NULL, 
ubicacion VARCHAR(50) NOT NULL
);

--Tabla horarios
CREATE TABLE horarios (
id_horario SERIAL PRIMARY KEY,
id_curso INT NOT NULL,
id_aula INT NOT NULL,
fecha_inicio DATE NOT NULL, 
fecha_fin DATE NOT NULL,
hora_inicio time NOT NULL,
hora_fin time NOT NULL
);

--Tabla intermedia CursosProfesores
CREATE TABLE cursos_profesores(
id_curso_profesor SERIAL PRIMARY KEY,
id_curso INT,
id_profesor INT,
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

--Tabla ProgramasEstudio
CREATE TABLE programasestudio(
id_programa SERIAL PRIMARY KEY, 
nombre_programa VARCHAR(50) UNIQUE NOT NULL,
descripcion_p TEXT
);

--Tabla intermedia ProgramasCursos
CREATE TABLE programas_cursos(
id_programa_curso SERIAL PRIMARY KEY, 
id_programa INT, 
id_curso INT, 
FOREIGN KEY (id_programa) REFERENCES programasestudio(id_programa),
FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

--Creacion tabla Campus
CREATE TABLE campus (
id_campus SERIAL PRIMARY KEY,
nombre_campus VARCHAR(50) NOT NULL,
direccion_campus VARCHAR(100) NOT NULL
);

--Creacion tabla Carreras
CREATE TABLE carreras (
id_carrera SERIAL PRIMARY KEY,
nombre_carrera VARCHAR(50) NOT NULL,
titulo_otorgado VARCHAR(100) NOT NULL
);

--Tabla intermedia estudiantes_carreras;
CREATE TABLE estudiantes_carreras (
id_estudiante INT NOT NULL,
id_carrera INT NOT NULL,
PRIMARY KEY (id_estudiante, id_carrera),
FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera)
);

--Agregar clave foranea id_carrera
ALTER TABLE estudiantes
ADD COLUMN id_carrera INT,
ADD CONSTRAINT fk_estudiantes_carrera
FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera);

--Agregar columna id_campus
ALTER TABLE cursos
ADD COLUMN id_campus INT,
ADD CONSTRAINT fk_cursos_campus,
FOREIGN KEY (id_campus) REFERENCES campus(id_campus);

--MODIFICA LA TABLA PROFESORES 

ALTER table profesores 
ADD column email VARCHAR(50) UNIQUE NOT NULL;
SELECT * FROM profesores;

--Eliminar la columna Ciudad de la tabla estudiantes
ALTER TABLE estudiantes
DROP COLUMN ciudad;

--Eliminar tabla Aulas
DROP TABLE aulas;



