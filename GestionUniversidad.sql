--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id_campus integer NOT NULL,
    nombre_campus character varying(50) NOT NULL,
    direccion_campus character varying(100) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_campus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_id_campus_seq OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_id_campus_seq OWNED BY public.campus.id_campus;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    id_carrera integer NOT NULL,
    nombre_carrera character varying(50) NOT NULL,
    titulo_otorgado character varying(100) NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_id_carrera_seq OWNER TO postgres;

--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_id_carrera_seq OWNED BY public.carreras.id_carrera;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    id_departamento integer NOT NULL,
    nombre_curso character varying(50) NOT NULL,
    descripcion_c text,
    creditos integer NOT NULL,
    semestre integer NOT NULL,
    id_campus integer
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_curso_seq OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;


--
-- Name: cursos_profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_profesores (
    id_curso_profesor integer NOT NULL,
    id_curso integer,
    id_profesor integer
);


ALTER TABLE public.cursos_profesores OWNER TO postgres;

--
-- Name: cursos_profesores_id_curso_profesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_profesores_id_curso_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_profesores_id_curso_profesor_seq OWNER TO postgres;

--
-- Name: cursos_profesores_id_curso_profesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_profesores_id_curso_profesor_seq OWNED BY public.cursos_profesores.id_curso_profesor;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id_departamento integer NOT NULL,
    nombre_departamento character varying(50) NOT NULL,
    edificio character varying(50) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_departamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_departamento_seq OWNER TO postgres;

--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_departamento_seq OWNED BY public.departamentos.id_departamento;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombre_e character varying(50) NOT NULL,
    apellido_e character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion character varying(50),
    email character varying(50) NOT NULL,
    id_carrera integer
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes_carreras (
    id_estudiante integer NOT NULL,
    id_carrera integer NOT NULL
);


ALTER TABLE public.estudiantes_carreras OWNER TO postgres;

--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNER TO postgres;

--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;


--
-- Name: horarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios (
    id_horario integer NOT NULL,
    id_curso integer NOT NULL,
    id_aula integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.horarios OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_id_horario_seq OWNER TO postgres;

--
-- Name: horarios_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_id_horario_seq OWNED BY public.horarios.id_horario;


--
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    id_estudiante integer NOT NULL,
    id_curso integer NOT NULL,
    fecha_inscripcion date NOT NULL,
    calificacion integer,
    CONSTRAINT inscripciones_calificacion_check CHECK (((calificacion >= 0) AND (calificacion <= 100)))
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    nombre_p character varying(50) NOT NULL,
    apellido_p character varying(50) NOT NULL,
    titulo_profesor character varying(50),
    id_departamento integer NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesores_id_profesor_seq OWNER TO postgres;

--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;


--
-- Name: programas_cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas_cursos (
    id_programa_curso integer NOT NULL,
    id_programa integer,
    id_curso integer
);


ALTER TABLE public.programas_cursos OWNER TO postgres;

--
-- Name: programas_cursos_id_programa_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programas_cursos_id_programa_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programas_cursos_id_programa_curso_seq OWNER TO postgres;

--
-- Name: programas_cursos_id_programa_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programas_cursos_id_programa_curso_seq OWNED BY public.programas_cursos.id_programa_curso;


--
-- Name: programasestudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programasestudio (
    id_programa integer NOT NULL,
    nombre_programa character varying(50) NOT NULL,
    descripcion_p text
);


ALTER TABLE public.programasestudio OWNER TO postgres;

--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programasestudio_id_programa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programasestudio_id_programa_seq OWNER TO postgres;

--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programasestudio_id_programa_seq OWNED BY public.programasestudio.id_programa;


--
-- Name: campus id_campus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN id_campus SET DEFAULT nextval('public.campus_id_campus_seq'::regclass);


--
-- Name: carreras id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id_carrera SET DEFAULT nextval('public.carreras_id_carrera_seq'::regclass);


--
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- Name: cursos_profesores id_curso_profesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores ALTER COLUMN id_curso_profesor SET DEFAULT nextval('public.cursos_profesores_id_curso_profesor_seq'::regclass);


--
-- Name: departamentos id_departamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id_departamento SET DEFAULT nextval('public.departamentos_id_departamento_seq'::regclass);


--
-- Name: estudiantes id_estudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);


--
-- Name: horarios id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios ALTER COLUMN id_horario SET DEFAULT nextval('public.horarios_id_horario_seq'::regclass);


--
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- Name: profesores id_profesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);


--
-- Name: programas_cursos id_programa_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos ALTER COLUMN id_programa_curso SET DEFAULT nextval('public.programas_cursos_id_programa_curso_seq'::regclass);


--
-- Name: programasestudio id_programa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio ALTER COLUMN id_programa SET DEFAULT nextval('public.programasestudio_id_programa_seq'::regclass);


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id_campus, nombre_campus, direccion_campus) FROM stdin;
1	TecNM Campus Mexicali	Av. Tecnol├│gico s/n, Mexicali, BC
2	TecNM Campus Tijuana	Calz. del Tecnologico 12950, Tijuana, BC
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (id_carrera, nombre_carrera, titulo_otorgado) FROM stdin;
1	Ingenier├¡a en Sistemas Computacionales	Ingeniero en Sistemas Computacionales
2	Ingenieria Electrica	Ingeniero Electrico
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id_curso, id_departamento, nombre_curso, descripcion_c, creditos, semestre, id_campus) FROM stdin;
1	1	Programaci├│n I	Introducci├│n a la programaci├│n	5	1	1
2	2	Circuitos Electricos I	Comportamiento de los Circuitos Electricos	5	4	2
\.


--
-- Data for Name: cursos_profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos_profesores (id_curso_profesor, id_curso, id_profesor) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id_departamento, nombre_departamento, edificio) FROM stdin;
1	Ingenier├¡a de Sistemas	Edificio F
2	Ingeneria Electrica	Edificio X
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id_estudiante, nombre_e, apellido_e, fecha_nacimiento, direccion, email, id_carrera) FROM stdin;
1	Carlos	G├│mez	2000-05-12	Calle Falsa 123	a2549085@itmexicali.edu.mx	1
2	Ana	L├│pez	1999-08-23	Av. Siempre Viva 742	a2249065@itmexicali.edu.mx	2
3	Jos├⌐	S├ínchez	2002-07-18	Av. Principal 321	a2249076@itmexicali.edu.mx	2
\.


--
-- Data for Name: estudiantes_carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes_carreras (id_estudiante, id_carrera) FROM stdin;
1	1
2	2
3	2
\.


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (id_horario, id_curso, id_aula, fecha_inicio, fecha_fin, hora_inicio, hora_fin) FROM stdin;
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, id_estudiante, id_curso, fecha_inscripcion, calificacion) FROM stdin;
6	3	2	2025-02-01	75
4	1	1	2025-01-15	95
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (id_profesor, nombre_p, apellido_p, titulo_profesor, id_departamento, email) FROM stdin;
1	Luis	Martinez	Maestria en Ingenieria del Software	1	lmartinez@itmexicali.edu.mx
2	Mario	Fernandez	Doctorado en Ingenieria Electrica	2	mfernandez@itmexicali.edu.mx
\.


--
-- Data for Name: programas_cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programas_cursos (id_programa_curso, id_programa, id_curso) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (id_programa, nombre_programa, descripcion_p) FROM stdin;
1	Programa de Desarrollo de Software	Formacion para desarrolladores de hadware y software
2	Ingenieria Electrica	Programa de formacion en Ingenieria Electrica
\.


--
-- Name: campus_id_campus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_campus_seq', 2, true);


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_carrera_seq', 2, true);


--
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 2, true);


--
-- Name: cursos_profesores_id_curso_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_profesores_id_curso_profesor_seq', 2, true);


--
-- Name: departamentos_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_departamento_seq', 2, true);


--
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 3, true);


--
-- Name: horarios_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_horario_seq', 1, false);


--
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 9, true);


--
-- Name: profesores_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 2, true);


--
-- Name: programas_cursos_id_programa_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programas_cursos_id_programa_curso_seq', 2, true);


--
-- Name: programasestudio_id_programa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_id_programa_seq', 2, true);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id_campus);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id_carrera);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- Name: cursos_profesores cursos_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_pkey PRIMARY KEY (id_curso_profesor);


--
-- Name: departamentos departamentos_nombre_departamento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_nombre_departamento_key UNIQUE (nombre_departamento);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- Name: estudiantes_carreras estudiantes_carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_pkey PRIMARY KEY (id_estudiante, id_carrera);


--
-- Name: estudiantes estudiantes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_email_key UNIQUE (email);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


--
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- Name: profesores profesores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_email_key UNIQUE (email);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);


--
-- Name: programas_cursos programas_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_pkey PRIMARY KEY (id_programa_curso);


--
-- Name: programasestudio programasestudio_nombre_programa_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio
    ADD CONSTRAINT programasestudio_nombre_programa_key UNIQUE (nombre_programa);


--
-- Name: programasestudio programasestudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio
    ADD CONSTRAINT programasestudio_pkey PRIMARY KEY (id_programa);


--
-- Name: cursos cursos_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- Name: cursos_profesores cursos_profesores_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: cursos_profesores cursos_profesores_id_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_profesores
    ADD CONSTRAINT cursos_profesores_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesores(id_profesor);


--
-- Name: estudiantes_carreras estudiantes_carreras_id_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_id_carrera_fkey FOREIGN KEY (id_carrera) REFERENCES public.carreras(id_carrera);


--
-- Name: estudiantes_carreras estudiantes_carreras_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes_carreras
    ADD CONSTRAINT estudiantes_carreras_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- Name: cursos fk_cursos_campus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fk_cursos_campus FOREIGN KEY (id_campus) REFERENCES public.campus(id_campus);


--
-- Name: estudiantes fk_estudiantes_carrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fk_estudiantes_carrera FOREIGN KEY (id_carrera) REFERENCES public.carreras(id_carrera);


--
-- Name: inscripciones inscripciones_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: inscripciones inscripciones_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- Name: profesores profesores_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- Name: programas_cursos programas_cursos_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso);


--
-- Name: programas_cursos programas_cursos_id_programa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas_cursos
    ADD CONSTRAINT programas_cursos_id_programa_fkey FOREIGN KEY (id_programa) REFERENCES public.programasestudio(id_programa);


--
-- PostgreSQL database dump complete
--

