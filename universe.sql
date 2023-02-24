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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    constellation_id integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    diameter_in_km integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    orbital_period_in_years numeric(7,2) NOT NULL,
    rotation_period_in_days numeric(5,2),
    has_moon boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    distance_in_years numeric(5,2) NOT NULL,
    brightness_of_star numeric(3,2) NOT NULL,
    approval_date date,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (2, 'Aquaries', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (3, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (4, 'Bootes', NULL, 'herdsman', 3);
INSERT INTO public.constellation VALUES (5, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (6, 'Centauras', NULL, 'Centaur', 5);
INSERT INTO public.constellation VALUES (7, 'Cetus', NULL, 'Sea Monster', 9);
INSERT INTO public.constellation VALUES (8, 'Coma Bernecices', 1536, 'Berenince hair', 6);
INSERT INTO public.constellation VALUES (9, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (10, 'Ophicushs', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (11, 'Pegasus', NULL, 'Mytical Horse', 10);
INSERT INTO public.constellation VALUES (1, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (12, 'Sagittarius', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (13, 'Virgo', NULL, 'Virgin', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction to what is should according to its shape', false, 5);
INSERT INTO public.galaxy VALUES (2, 'Centauraus', 'Named because it''s located in the Centaurus constellation
', true, 5);
INSERT INTO public.galaxy VALUES (3, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', false, 7);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'It looks like an eye with a dark stripe underneth
', false, 7);
INSERT INTO public.galaxy VALUES (5, 'Mice Galaxies', 'Two galaxies with long tails that look like a mouse', false, 7);
INSERT INTO public.galaxy VALUES (6, 'Malin 1', 'Named after its discoverer, David Malin
', false, 7);
INSERT INTO public.galaxy VALUES (7, 'Butterfly Galaxies', 'Binary Galaxies, It looks like a pair of Butterfly wings', false, 13);
INSERT INTO public.galaxy VALUES (8, 'Needle Galaxy', 'Named because of its thin appearence
', false, 7);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galalxy', 'Looks like a Sombrero', false, 13);
INSERT INTO public.galaxy VALUES (10, 'Little Sombrero Galaxy', 'It looks like a Sombrero,but its smaller than Sombrero Galaxy', false, 10);
INSERT INTO public.galaxy VALUES (11, 'Wolf-Lundwark-Melotte', 'Named after the astromers that co-discovered', false, 6);
INSERT INTO public.galaxy VALUES (12, 'Milky Way', 'Our own glaaxy, It is said to look like a band of light', true, 11);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3476, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 23, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 13, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 13, 4);
INSERT INTO public.moon VALUES (5, 'Europe', 1610, 1338, 5);
INSERT INTO public.moon VALUES (6, 'Ganymade', 1610, 4838, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 4800, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 1810, 200, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 1904, 170, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 1904, 90, 5);
INSERT INTO public.moon VALUES (11, 'Mimas', 1704, 390, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 1784, 590, 6);
INSERT INTO public.moon VALUES (13, 'Theys', 1684, 1090, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1684, 1190, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 3584, 1590, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 1655, 5590, 6);
INSERT INTO public.moon VALUES (17, 'Hypersion', 1855, 290, 6);
INSERT INTO public.moon VALUES (18, 'Ipetus', 1655, 1290, 6);
INSERT INTO public.moon VALUES (19, 'Phobe', 1899, 220, 6);
INSERT INTO public.moon VALUES (20, 'Jannus', 1966, 190, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, false, 13);
INSERT INTO public.planet VALUES (2, 'Venus', 0.62, 243.02, false, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.00, true, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 1.88, 1.03, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.86, 0.41, true, 9);
INSERT INTO public.planet VALUES (6, 'Saturn', 29.49, 0.44, true, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 84.02, 0.72, true, 2);
INSERT INTO public.planet VALUES (9, 'Neptune', 164.79, 0.67, true, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 4.60, 0.38, false, 7);
INSERT INTO public.planet VALUES (11, 'Orcus', 34.60, 0.48, true, 11);
INSERT INTO public.planet VALUES (12, 'Pluto', 134.60, 6.48, true, 11);
INSERT INTO public.planet VALUES (13, 'Haumea', 234.60, 0.48, true, 3);
INSERT INTO public.planet VALUES (15, 'Qoaoar', 334.34, 3.38, true, 12);
INSERT INTO public.planet VALUES (16, 'Makemake', 324.34, 0.38, true, 6);
INSERT INTO public.planet VALUES (17, 'GongGong', 124.34, 0.28, true, 1);
INSERT INTO public.planet VALUES (18, 'Sedna', 1324.34, 0.48, false, 8);
INSERT INTO public.planet VALUES (19, 'Eris', 554.34, 14.46, true, 9);
INSERT INTO public.planet VALUES (20, 'Salacia', 273.34, 0.25, true, 10);
INSERT INTO public.planet VALUES (21, 'Varda', 313.12, 0.23, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sadalss', 524.00, 2.80, '2016-08-21', 11);
INSERT INTO public.star VALUES (3, 'Hamal', 66.00, 2.01, '2016-07-20', 11);
INSERT INTO public.star VALUES (4, 'Anish Pateli', 68.00, 0.05, '2016-08-30', 11);
INSERT INTO public.star VALUES (5, 'Danish Albela', 48.00, 2.81, '2017-02-01', 11);
INSERT INTO public.star VALUES (6, 'Rangoli Basdasi', 8.48, 0.01, '2016-11-16', 11);
INSERT INTO public.star VALUES (7, 'Beta Chora', 98.00, 4.26, NULL, 11);
INSERT INTO public.star VALUES (8, 'Rengulnus', 60.00, 1.87, '2018-09-11', 11);
INSERT INTO public.star VALUES (9, 'Abdulla Bwjara', 65.23, 0.26, '2021-06-30', 11);
INSERT INTO public.star VALUES (10, 'Diphodias', 40.00, 2.47, '2010-07-11', 11);
INSERT INTO public.star VALUES (1, 'Endosina', 65.27, 0.74, '2011-06-30', 11);
INSERT INTO public.star VALUES (12, 'Spica', 280.63, 1.02, '2022-04-30', 11);
INSERT INTO public.star VALUES (13, 'Rosuleudds', 48.36, 2.05, '2015-02-14', 11);
INSERT INTO public.star VALUES (11, 'Mia Khalifa', 143.22, 5.60, '2009-09-20', 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 18, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

