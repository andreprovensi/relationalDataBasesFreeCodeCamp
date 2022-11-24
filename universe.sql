--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    age integer NOT NULL,
    description text,
    n_planets integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: joinedtable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.joinedtable (
    name character varying(40),
    radius_km numeric,
    n_moons integer NOT NULL,
    planet_galaxy_id integer,
    life boolean NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    moon_name character varying(40),
    mass_e24_kg numeric,
    moon_galaxy_id integer,
    joinedtable_id integer NOT NULL
);


ALTER TABLE public.joinedtable OWNER TO freecodecamp;

--
-- Name: joinedtable_joinedtable_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.joinedtable_joinedtable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joinedtable_joinedtable_id_seq OWNER TO freecodecamp;

--
-- Name: joinedtable_joinedtable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.joinedtable_joinedtable_id_seq OWNED BY public.joinedtable.joinedtable_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer,
    mass_e24_kg numeric NOT NULL,
    galaxy_id integer,
    life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    radius_km numeric NOT NULL,
    n_moons integer NOT NULL,
    life boolean,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    alive boolean NOT NULL,
    spheric boolean NOT NULL,
    orbit character varying(40),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: joinedtable joinedtable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joinedtable ALTER COLUMN joinedtable_id SET DEFAULT nextval('public.joinedtable_joinedtable_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', 1, 'Our Galaxy', 7);
INSERT INTO public.galaxy VALUES (2, 'parsec1', 2, 'Anakin Galaxy', 25);
INSERT INTO public.galaxy VALUES (3, 'parsec2', 4, 'Obi-Wan Galaxy', 50);
INSERT INTO public.galaxy VALUES (4, 'parsec3', 2, 'Yoda Galaxy', 10);
INSERT INTO public.galaxy VALUES (5, 'outerrim', 3, 'Grievous Galaxy', 20);
INSERT INTO public.galaxy VALUES (6, 'innerrim', 3, 'Qui-Gon Galaxy', 30);


--
-- Data for Name: joinedtable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.joinedtable VALUES ('mars', 7000.52, 1, 1, false, 2, 2, 1, 'Yavin-4', 2000, 1, 1);
INSERT INTO public.joinedtable VALUES ('earth', 6378.1, 1, 1, true, 1, 1, 2, 'M1', 10252, 1, 2);
INSERT INTO public.joinedtable VALUES ('jupyter', 15015.24, 2, 1, false, 3, 3, 3, 'earth_moon', 5970, 4, 3);
INSERT INTO public.joinedtable VALUES ('earth', 6378.1, 1, 1, true, 1, 1, 4, 'B3', 6854, 6, 4);
INSERT INTO public.joinedtable VALUES ('naboo', 35000.42, 7, 1, true, 6, 8, 5, 'Y1', 7854, 2, 5);
INSERT INTO public.joinedtable VALUES ('coruscant', 25000, 2, 4, true, 5, 6, 6, 'A2', 15896, 6, 6);
INSERT INTO public.joinedtable VALUES ('jupyter', 15015.24, 2, 1, false, 3, 3, 7, 'B3', 2580, 1, 7);
INSERT INTO public.joinedtable VALUES ('mustafar', 5412.52, 3, 6, false, 6, 7, 8, 'T1', 1400, 1, 8);
INSERT INTO public.joinedtable VALUES ('naboo', 35000.42, 7, 1, true, 6, 8, 9, 'Q2', 3200, 4, 9);
INSERT INTO public.joinedtable VALUES ('exogol', 6358.12, 4, 5, false, 2, 9, 10, 'Y7', 2589, 3, 10);
INSERT INTO public.joinedtable VALUES ('earth', 6378.1, 1, 1, true, 1, 1, 11, 'O9', 1489, 2, 11);
INSERT INTO public.joinedtable VALUES ('jupyter', 15015.24, 2, 1, false, 3, 3, 12, 'K5', 58635, 4, 12);
INSERT INTO public.joinedtable VALUES ('saturn', 41000, 1, 1, false, 2, 11, 13, 'N2', 1489, 1, 13);
INSERT INTO public.joinedtable VALUES ('jupyter', 15015.24, 2, 1, false, 3, 3, 14, 'M5', 365, 3, 14);
INSERT INTO public.joinedtable VALUES ('mustafar', 5412.52, 3, 6, false, 6, 7, 15, 'G4', 87458, 4, 15);
INSERT INTO public.joinedtable VALUES ('exogol', 6358.12, 4, 5, false, 2, 9, 16, 'X2', 201893, 3, 16);
INSERT INTO public.joinedtable VALUES ('hoth', 8585.4, 6, 2, true, 5, 5, 17, 'A55', 5286, 2, 17);
INSERT INTO public.joinedtable VALUES ('jupyter', 15015.24, 2, 1, false, 3, 3, 19, 'K34', 58555.54, 5, 18);
INSERT INTO public.joinedtable VALUES ('tatooine', 30854.45, 3, 3, true, 4, 4, 20, 'O142', 85.45, 6, 19);
INSERT INTO public.joinedtable VALUES ('coruscant', 25000, 2, 4, true, 5, 6, 21, 'A82', 852.44, 4, 20);
INSERT INTO public.joinedtable VALUES ('tatooine', 30854.45, 3, 3, true, 4, 4, 22, 'GG34', 8547.86, 4, 21);
INSERT INTO public.joinedtable VALUES ('earth', 6378.1, 1, 1, true, 1, 1, 23, 'T54', 855.441, 3, 22);
INSERT INTO public.joinedtable VALUES ('tatooine', 30854.45, 3, 3, true, 4, 4, 24, 'GF45', 452.44, 3, 23);
INSERT INTO public.joinedtable VALUES ('exogol', 6358.12, 4, 5, false, 2, 9, 25, 'B444', 5225.44, 3, 24);
INSERT INTO public.joinedtable VALUES ('tatooine', 30854.45, 3, 3, true, 4, 4, 26, 'HK33', 125.55, 5, 25);
INSERT INTO public.joinedtable VALUES ('venus', 8500, 1, 1, true, 1, 12, 27, 'YU44', 385.44, 6, 26);
INSERT INTO public.joinedtable VALUES ('jakku', 32000, 2, 5, true, 1, 10, 18, 'N66', 25.485, 2, 27);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Yavin-4', 2, 2000, 1, true);
INSERT INTO public.moon VALUES (2, 'M1', 1, 10252, 1, false);
INSERT INTO public.moon VALUES (3, 'earth_moon', 3, 5970, 4, true);
INSERT INTO public.moon VALUES (4, 'B33', 1, 6854, 6, false);
INSERT INTO public.moon VALUES (5, 'Y1', 8, 7854, 2, false);
INSERT INTO public.moon VALUES (6, 'A2', 6, 15896, 6, true);
INSERT INTO public.moon VALUES (7, 'B3', 3, 2580, 1, true);
INSERT INTO public.moon VALUES (8, 'T1', 7, 1400, 1, true);
INSERT INTO public.moon VALUES (9, 'Q2', 8, 3200, 4, true);
INSERT INTO public.moon VALUES (10, 'Y7', 9, 2589, 3, true);
INSERT INTO public.moon VALUES (11, 'O9', 1, 1489, 2, false);
INSERT INTO public.moon VALUES (12, 'K5', 3, 58635, 4, false);
INSERT INTO public.moon VALUES (13, 'N2', 11, 1489, 1, false);
INSERT INTO public.moon VALUES (14, 'M5', 3, 365, 3, true);
INSERT INTO public.moon VALUES (15, 'G4', 7, 87458, 4, true);
INSERT INTO public.moon VALUES (16, 'X2', 9, 201893, 3, true);
INSERT INTO public.moon VALUES (17, 'A55', 5, 5286, 2, true);
INSERT INTO public.moon VALUES (18, 'N66', 10, 25.485, 2, false);
INSERT INTO public.moon VALUES (19, 'K34', 3, 58555.54, 5, false);
INSERT INTO public.moon VALUES (20, 'O142', 4, 85.45, 6, false);
INSERT INTO public.moon VALUES (21, 'A82', 6, 852.44, 4, true);
INSERT INTO public.moon VALUES (22, 'GG34', 4, 8547.86, 4, true);
INSERT INTO public.moon VALUES (23, 'T54', 1, 855.441, 3, true);
INSERT INTO public.moon VALUES (24, 'GF45', 4, 452.44, 3, true);
INSERT INTO public.moon VALUES (25, 'B444', 9, 5225.44, 3, false);
INSERT INTO public.moon VALUES (26, 'HK33', 4, 125.55, 5, false);
INSERT INTO public.moon VALUES (27, 'YU44', 12, 385.44, 6, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 6378.1, 1, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'mars', 7000.52, 1, false, 1, 2);
INSERT INTO public.planet VALUES (3, 'jupyter', 15015.24, 2, false, 1, 3);
INSERT INTO public.planet VALUES (4, 'tatooine', 30854.45, 3, true, 3, 4);
INSERT INTO public.planet VALUES (5, 'hoth', 8585.4, 6, true, 2, 5);
INSERT INTO public.planet VALUES (6, 'coruscant', 25000, 2, true, 4, 5);
INSERT INTO public.planet VALUES (7, 'mustafar', 5412.52, 3, false, 6, 6);
INSERT INTO public.planet VALUES (9, 'exogol', 6358.12, 4, false, 5, 2);
INSERT INTO public.planet VALUES (10, 'jakku', 32000, 2, true, 5, 1);
INSERT INTO public.planet VALUES (11, 'saturn', 41000, 1, false, 1, 2);
INSERT INTO public.planet VALUES (12, 'venus', 8500, 1, true, 1, 1);
INSERT INTO public.planet VALUES (8, 'naboo', 35000.42, 7, true, 1, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'S1', true, true, 'true', 1);
INSERT INTO public.star VALUES (2, 'S2', true, true, 'true', 2);
INSERT INTO public.star VALUES (3, 'S3', false, false, 'true', 3);
INSERT INTO public.star VALUES (4, 'S4', false, false, 'true', 4);
INSERT INTO public.star VALUES (5, 'S5', false, false, 'true', 5);
INSERT INTO public.star VALUES (6, 'S6', true, false, 'false', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: joinedtable_joinedtable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.joinedtable_joinedtable_id_seq', 27, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: joinedtable joinedtable_joinedtable_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joinedtable
    ADD CONSTRAINT joinedtable_joinedtable_id_key UNIQUE (joinedtable_id);


--
-- Name: joinedtable joinedtable_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joinedtable
    ADD CONSTRAINT joinedtable_moon_id_key UNIQUE (moon_id);


--
-- Name: joinedtable joinedtable_name_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joinedtable
    ADD CONSTRAINT joinedtable_name_moon_id_key UNIQUE (name, moon_id);


--
-- Name: joinedtable joinedtable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joinedtable
    ADD CONSTRAINT joinedtable_pkey PRIMARY KEY (joinedtable_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

