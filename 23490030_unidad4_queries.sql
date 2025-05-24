--Mostrar todos los nombres y los apellidos de los estudiantes
SELECT nombre_e, apellido_e
FROM estudiantes;

--Cursos que tienen 3 crditos
SELECT * FROM cursos
WHERE creditos = 3;

 -- Lista que del estudiante y el curso en el que está inscrito
SELECT e.nombre_e, e.apellido_e, c.nombre_curso
FROM estudiantes e
INNER JOIN inscripciones i 
ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos c 
ON i.id_curso = c.id_curso;

--Mostrar todos los estudiantes esten o no esten inscritos a un curso
SELECT e.nombre_e, e.apellido_e, c.nombre_curso
FROM estudiantes e
LEFT JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante
LEFT JOIN cursos c 
ON i.id_curso = c.id_curso;

--Mostrar todos los cursos haya o no haya estudiantes inscritos
SELECT c.nombre_curso, e.nombre_e, e.apellido_e
FROM estudiantes e
RIGHT JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante
RIGHT JOIN cursos c 
ON i.id_curso = c.id_curso;

--MOSTRAR CURSOS Y CANTIDAD DE ESTUDIANTES INSCRITOS
SELECT c.nombre_curso, COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN inscripciones i
ON c.id_curso = i.id_curso
GROUP BY c.nombre_curso;

--estudiantes que nacieron entre el 1 de enero de 1995 y el 31 de diciembre de 1999
SELECT nombre_e, apellido_e, fecha_nacimiento
FROM estudiantes
WHERE fecha_nacimiento BETWEEN '1995-01-01' AND '1998-12-31';

--AGRUPAR CURSOS DE MANERA ALFABETICAMENTE
SELECT nombre_curso
FROM cursos
ORDER BY nombre_curso ASC;

--crea una tabla temporal con número de inscripciones 
--por estudiante y luego muestra los 3 con más inscripciones
WITH conteo_inscripciones AS (
  SELECT e.id_estudiante, e.nombre_e, COUNT(i.id_inscripcion) AS total_inscripciones
  FROM estudiantes e
  LEFT JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
  GROUP BY e.id_estudiante, e.nombre_e
)
SELECT nombre_e, total_inscripciones
FROM conteo_inscripciones
ORDER BY total_inscripciones DESC
LIMIT 3;

--or cada departamento, muestra el curso con mas estudiantes inscritos
WITH conteo AS (
  SELECT 
    d.id_departamento,
    d.nombre_departamento,
    c.id_curso,
    c.nombre_curso,
    COUNT(i.id_estudiante) AS total_estudiantes
  FROM departamentos d
  JOIN cursos c ON d.id_departamento = c.id_departamento
  JOIN inscripciones i ON c.id_curso = i.id_curso
  GROUP BY d.id_departamento, d.nombre_departamento, c.id_curso, c.nombre_curso
),

maximos AS (
  SELECT 
    id_departamento,
    MAX(total_estudiantes) AS max_estudiantes
  FROM conteo
  GROUP BY id_departamento
)

SELECT 
  c.nombre_departamento,
  c.nombre_curso,
  c.total_estudiantes
FROM conteo c
JOIN maximos m ON c.id_departamento = m.id_departamento AND c.total_estudiantes = m.max_estudiantes;

-- muestra profesores que imparten más de dos cursos
SELECT p.nombre_p, p.apellido_p, COUNT(cp.id_curso) AS total_cursos
FROM profesores p
JOIN cursos_profesores cp 
ON p.id_profesor = cp.id_profesor
GROUP BY p.id_profesor, p.nombre_p, p.apellido_p
HAVING COUNT(cp.id_curso) > 2;

-- CTE para calcular el promedio de calificaciones por curso y programa
WITH promedios AS (
SELECT 
p.id_programa, p.nombre_programa, c.id_curso, c.nombre_curso, AVG(i.calificacion) AS promedio_calificacion
FROM programasestudio p
JOIN programas_cursos pc 
ON p.id_programa = pc.id_programa
JOIN cursos c ON pc.id_curso = c.id_curso
JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY p.id_programa, p.nombre_programa, c.id_curso, c.nombre_curso
),
--  CTE para encontrar el máximo promedio por programa
maximos AS (
SELECT id_programa, MAX(promedio_calificacion) AS max_prom
FROM promedios
GROUP BY id_programa
)
-- Seleccionar solo los cursos con el promedio más alto por programa
SELECT 
pr.nombre_programa,
pr.nombre_curso,
pr.promedio_calificacion
FROM promedios pr
JOIN maximos m 
ON pr.id_programa = m.id_programa 
AND pr.promedio_calificacion = m.max_prom;


