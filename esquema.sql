--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: alquiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alquiler (
    alquiler_id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    monto_base numeric,
    vendedor_id character varying(30),
    empresa_id integer,
    razon_social integer
);


ALTER TABLE public.alquiler OWNER TO postgres;

--
-- Name: alquiler_alquiler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alquiler_alquiler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alquiler_alquiler_id_seq OWNER TO postgres;

--
-- Name: alquiler_alquiler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alquiler_alquiler_id_seq OWNED BY public.alquiler.alquiler_id;


--
-- Name: cobro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cobro (
    nro_operacion_id integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.cobro OWNER TO postgres;

--
-- Name: cobro_nro_operacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cobro_nro_operacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cobro_nro_operacion_id_seq OWNER TO postgres;

--
-- Name: cobro_nro_operacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cobro_nro_operacion_id_seq OWNED BY public.cobro.nro_operacion_id;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    empresa_id integer NOT NULL,
    razon_social character varying(30),
    direccion character varying(30),
    contacto character varying(20),
    cuit character varying(20)
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- Name: empresa_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_empresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_empresa_id_seq OWNER TO postgres;

--
-- Name: empresa_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_empresa_id_seq OWNED BY public.empresa.empresa_id;


--
-- Name: mantenimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mantenimientos (
    id integer NOT NULL,
    fecha date NOT NULL,
    alquiler character varying(255) NOT NULL,
    tipomantenimiento character varying(255),
    planta character varying(255) NOT NULL,
    usuario character varying(255) NOT NULL
);


ALTER TABLE public.mantenimientos OWNER TO postgres;

--
-- Name: mantenimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mantenimientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mantenimientos_id_seq OWNER TO postgres;

--
-- Name: mantenimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mantenimientos_id_seq OWNED BY public.mantenimientos.id;


--
-- Name: pertenece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pertenece (
    pertenece_id integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    alquiler_id integer,
    planta_id integer
);


ALTER TABLE public.pertenece OWNER TO postgres;

--
-- Name: pertenece_pertenece_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pertenece_pertenece_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pertenece_pertenece_id_seq OWNER TO postgres;

--
-- Name: pertenece_pertenece_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pertenece_pertenece_id_seq OWNED BY public.pertenece.pertenece_id;


--
-- Name: planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planta (
    planta_id integer NOT NULL,
    capacidad integer,
    disponibilidad boolean
);


ALTER TABLE public.planta OWNER TO postgres;

--
-- Name: planta_planta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planta_planta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planta_planta_id_seq OWNER TO postgres;

--
-- Name: planta_planta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planta_planta_id_seq OWNED BY public.planta.planta_id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name text NOT NULL,
    priority integer NOT NULL,
    description text,
    delivery date NOT NULL,
    CONSTRAINT projects_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: remito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remito (
    remito_id integer NOT NULL,
    monto numeric,
    conformidad boolean,
    detalle character varying(300),
    fecha date,
    alquiler_id integer,
    cobro_id integer,
    empresa_id integer
);


ALTER TABLE public.remito OWNER TO postgres;

--
-- Name: remito_remito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remito_remito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remito_remito_id_seq OWNER TO postgres;

--
-- Name: remito_remito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remito_remito_id_seq OWNED BY public.remito.remito_id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    name text NOT NULL,
    done boolean,
    projectid integer
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    legajo_id character varying(12) NOT NULL,
    dni character varying(8),
    nombre character varying(50),
    telefono character varying(15),
    email character varying(50)
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- Name: yacimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yacimiento (
    nombre_id text NOT NULL,
    cant_operadores integer,
    cant_banios_quimicos integer,
    telefono_contacto text,
    empresa_id integer
);


ALTER TABLE public.yacimiento OWNER TO postgres;

--
-- Name: alquiler alquiler_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler ALTER COLUMN alquiler_id SET DEFAULT nextval('public.alquiler_alquiler_id_seq'::regclass);


--
-- Name: cobro nro_operacion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro ALTER COLUMN nro_operacion_id SET DEFAULT nextval('public.cobro_nro_operacion_id_seq'::regclass);


--
-- Name: empresa empresa_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN empresa_id SET DEFAULT nextval('public.empresa_empresa_id_seq'::regclass);


--
-- Name: mantenimientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos ALTER COLUMN id SET DEFAULT nextval('public.mantenimientos_id_seq'::regclass);


--
-- Name: pertenece pertenece_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertenece ALTER COLUMN pertenece_id SET DEFAULT nextval('public.pertenece_pertenece_id_seq'::regclass);


--
-- Name: planta planta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta ALTER COLUMN planta_id SET DEFAULT nextval('public.planta_planta_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: remito remito_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remito ALTER COLUMN remito_id SET DEFAULT nextval('public.remito_remito_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: alquiler alquiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (alquiler_id);


--
-- Name: cobro cobro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro
    ADD CONSTRAINT cobro_pkey PRIMARY KEY (nro_operacion_id);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (empresa_id);


--
-- Name: mantenimientos mantenimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mantenimientos
    ADD CONSTRAINT mantenimientos_pkey PRIMARY KEY (id);


--
-- Name: pertenece pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT pertenece_pkey PRIMARY KEY (pertenece_id);


--
-- Name: planta planta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT planta_pkey PRIMARY KEY (planta_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: remito remito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remito
    ADD CONSTRAINT remito_pkey PRIMARY KEY (remito_id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: vendedor vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (legajo_id);


--
-- Name: yacimiento yacimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacimiento
    ADD CONSTRAINT yacimiento_pkey PRIMARY KEY (nombre_id);


--
-- Name: alquiler alquiler_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresa(empresa_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: alquiler alquiler_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.vendedor(legajo_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece pertenece_alquiler_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT pertenece_alquiler_id_fkey FOREIGN KEY (alquiler_id) REFERENCES public.alquiler(alquiler_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pertenece pertenece_planta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT pertenece_planta_id_fkey FOREIGN KEY (planta_id) REFERENCES public.planta(planta_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: remito remito_alquiler_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remito
    ADD CONSTRAINT remito_alquiler_id_fkey FOREIGN KEY (alquiler_id) REFERENCES public.alquiler(alquiler_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: remito remito_cobro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remito
    ADD CONSTRAINT remito_cobro_id_fkey FOREIGN KEY (cobro_id) REFERENCES public.cobro(nro_operacion_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tasks tasks_projectid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(id);


--
-- Name: yacimiento yacimiento_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yacimiento
    ADD CONSTRAINT yacimiento_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresa(empresa_id);


--
-- PostgreSQL database dump complete
--

