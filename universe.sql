--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    length_in_km numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth integer,
    num_of_stars integer
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
    description text,
    planet_id integer,
    distance_from_earth integer,
    radius numeric
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
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_type character varying(20),
    star_id integer,
    distance_from_earth integer
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
    description text,
    galaxy_id integer,
    distance_from_earth integer,
    luminosity numeric
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'A famous short-period comet visible from Earth every 75-76 years.', 1, 24000);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the most widely observed comets, visible to the naked eye for 18 months.', 1, 50000);
INSERT INTO public.comet VALUES (3, 'Comet Encke', 'Known for having the shortest orbital period of any known comet, around 3.3 years.', 2, 1800);
INSERT INTO public.comet VALUES (4, 'Comet Hyakutake', 'A comet that made a close approach to Earth in 1996, stunning skywatchers.', 2, 56000);
INSERT INTO public.comet VALUES (5, 'Comet Tempel 1', 'Famously impacted by NASA''s Deep Impact spacecraft in 2005.', 1, 2800);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System, featuring billions of stars and a supermassive black hole at its center.', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest spiral galaxy to the Milky Way, on a collision course with it in about 4.5 billion years.', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy located about 3 million light-years away from Earth, part of the Local Group of galaxies.', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A classic spiral galaxy located about 23 million light-years away, known for its distinct spiral structure.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A bright spiral galaxy with a prominent dust lane, located approximately 28 million light-years from Earth.', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'A unique ring galaxy formed by a collision between two galaxies, located around 500 million light-years away.', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite, known for its phases and influence on tides.', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer moon of Mars, with a heavily cratered surface.', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller moon of Mars, known for its irregular shape and low density.', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 'A moon of Jupiter, believed to have a subsurface ocean that may harbor life.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the Solar System, also a moon of Jupiter.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 'A volcanically active moon of Jupiter, known for its colorful surface.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter, known for its ancient surface.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn’s largest moon, known for its dense atmosphere and liquid methane lakes.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 'A moon of Saturn, known for its icy surface and ring system.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A moon of Saturn, notable for its two-tone coloration.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'A small moon of Saturn, known for its geysers and subsurface ocean.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Triton', 'Neptune’s largest moon, known for its retrograde orbit and geysers.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 'A moon of Uranus, notable for its varied terrain and dramatic cliffs.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Charon', 'The largest moon of Pluto, which is comparable in size to its parent planet.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ariel', 'One of Uranus’s largest moons, known for its bright surface and canyons.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'A darker moon of Uranus, with fewer craters than other moons.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 'The outermost large moon of Uranus, known for its heavily cratered surface.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Dione', 'A moon of Saturn, characterized by its icy surface and bright wispy features.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Tethys', 'A moon of Saturn, known for its large impact crater and bright surface.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Mimas', 'A small moon of Saturn, known for its resemblance to the Death Star.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Phoebe', 'An irregularly shaped moon of Saturn, known for its dark surface and retrograde orbit.', 4, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, known for its red color and potential for past life.', false, true, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System, known for its Great Red Spot.', false, true, 'Gas Giant', 1, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Famous for its beautiful rings and being the second-largest planet.', false, true, 'Gas Giant', 1, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', 'The second planet from the Sun, known for its thick atmosphere and high temperatures.', false, true, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (6, 'Mercury', 'The closest planet to the Sun, known for its extreme temperature variations.', false, true, 'Terrestrial', 1, NULL);
INSERT INTO public.planet VALUES (7, 'Proxima b', 'An exoplanet orbiting Proxima Centauri, potentially habitable.', true, true, 'Terrestrial', 3, NULL);
INSERT INTO public.planet VALUES (8, 'Betelgeuse b', 'Hypothetical planets orbiting Betelgeuse, not confirmed but theorized.', false, true, 'Gas Giant', 2, NULL);
INSERT INTO public.planet VALUES (9, 'Vega Prime', 'A hypothetical planet in the Vega system, known for its potential habitability.', true, true, 'Terrestrial', 4, NULL);
INSERT INTO public.planet VALUES (10, 'Altair VII', 'A fictional planet in the Altair system, known for its harsh conditions.', false, true, 'Gas Giant', 5, NULL);
INSERT INTO public.planet VALUES (11, 'Rigel VII', 'A fictional planet in the Rigel system, theorized to support some forms of life.', true, true, 'Terrestrial', 6, NULL);
INSERT INTO public.planet VALUES (12, 'Zeta Reticuli b', 'An exoplanet in the Zeta Reticuli system, theorized to have conditions for life.', true, true, 'Gas Giant', 6, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun, known for supporting life.', true, true, 'Terrestrial', 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky, located in the constellation Canis Major.', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant star in the constellation Orion, one of the largest stars visible to the naked eye.', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'The closest known star to the Sun, part of the Alpha Centauri star system.', 3, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Vega', 'A bright star in the constellation Lyra, it is the fifth-brightest star in the night sky.', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Altair', 'A bright star in the constellation Aquila, known for its rapid rotation.', 5, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star in the constellation Orion, one of the most luminous stars in our galaxy.', 6, NULL, NULL);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
