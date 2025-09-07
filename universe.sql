--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    has_life boolean NOT NULL,
    galaxy_types character varying(50),
    distance_from_earth numeric(6,3),
    description text,
    age_in_millions_of_years integer,
    name character varying(30),
    record text
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
    has_life boolean NOT NULL,
    planet_types character varying(50),
    distance_from_earth numeric(6,3),
    description text,
    age_in_millions_of_years integer,
    planet_id integer,
    name character varying(30),
    record text
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
    has_life boolean NOT NULL,
    plant_types character varying(50),
    distance_from_earth numeric(6,3),
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer,
    name character varying(30),
    record text
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
    has_life boolean NOT NULL,
    star_types character varying(50),
    distance_from_earth numeric(6,3),
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer,
    name character varying(30),
    record text
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    galaxy_id integer,
    planet_id integer,
    star_id integer,
    moon_id integer,
    name character varying(50),
    description text,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, true, 'Spiral', 0.000, 'Our home galaxy, containing the Solar System and billions of stars.', 13600, 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (2, false, 'Sprial', 35.330, 'The nearest major galaxy to the Milky Way; expected to collide with it in the distant future.', 10000, 'Andromaeda', NULL);
INSERT INTO public.galaxy VALUES (3, false, 'Sprial', 235.000, 'A smaller member of the Local Group; contains hundreds of billions of stars.', 12000, 'Triangulum', NULL);
INSERT INTO public.galaxy VALUES (4, false, 'Elliptical', 530.000, 'A massive elliptical galaxy in the Virgo Cluster; home to a supermassive black hole.', 13000, 'Messier 87', NULL);
INSERT INTO public.galaxy VALUES (5, false, 'Irregular', 163.000, 'A nearby irregular galaxy orbiting the Milky Way; visible from the Southern Hemisphere.', 13000, 'Large Magellanic Cloud', NULL);
INSERT INTO public.galaxy VALUES (6, false, 'Spiral', 160.000, 'Famous for its well-defined spiral arms; also known as M51.', 12000, 'Whirlpool Galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (12, false, 'Terrestrial', 0.000, 'The Earth’s only natural satellite; influences tides.', 4500, 1, 'Moon', NULL);
INSERT INTO public.moon VALUES (13, false, 'Rocky', 12.000, 'One of Mars’ two moons; irregularly shaped.', 4600, 2, 'Phobos', NULL);
INSERT INTO public.moon VALUES (14, false, 'Rocky', 25.220, 'Smaller, outer moon of Mars.', 4699, 2, 'Denimos', NULL);
INSERT INTO public.moon VALUES (15, false, 'Ice', 0.000, 'Moon of Jupiter; potential subsurface ocean may harbor life.', 4700, 4, 'Europa', NULL);
INSERT INTO public.moon VALUES (16, false, 'Ice Rock', 0.000, 'Largest moon in the Solar System; Jupiter’s moon.', 4700, 4, 'Callisto', NULL);
INSERT INTO public.moon VALUES (17, false, 'Volcanic', 0.000, 'Most volcanically active body in the Solar System; Jupiter’s moon.', 4500, 4, 'Io', NULL);
INSERT INTO public.moon VALUES (18, false, 'Gas-Ice', 0.000, 'Saturn’s largest moon; has dense atmosphere and lakes of methane.', 4600, 5, 'Titan', NULL);
INSERT INTO public.moon VALUES (19, false, 'Ice', 353.000, 'Saturn’s moon; water geysers suggest subsurface ocean.', 4500, 5, 'Enceladus', NULL);
INSERT INTO public.moon VALUES (20, false, 'Ice-rock', 55.000, 'Small moon of Saturn; looks like the Death Star.', 4500, 5, 'Mimas', NULL);
INSERT INTO public.moon VALUES (21, false, 'Ice-Rock', 0.340, 'Largest moon of Uranus; cratered surface.', 4600, 11, 'Titania', NULL);
INSERT INTO public.moon VALUES (22, false, 'Ice-Rock', 0.333, 'Second-largest moon of Uranus; heavily', 4600, 11, 'Oberon', NULL);
INSERT INTO public.moon VALUES (23, false, 'Ice-Rock', 0.335, 'Moon of Uranus; has canyons and ridged', 45666, 11, 'Ariel', NULL);
INSERT INTO public.moon VALUES (24, false, 'ice', 0.000, 'Retrograde orbit; Neptune’s largest moon; icy surface.', 4600, 12, 'Neptune’s Moon Triton', NULL);
INSERT INTO public.moon VALUES (25, false, 'ice-rock', 0.000, 'Irregular moon of Neptune; very eccentric orbit.', 45666, 12, 'Nereid', NULL);
INSERT INTO public.moon VALUES (26, false, 'ice-rock', 0.000, 'Largest moon of Pluto; gravitationally locked with Pluto.', 3000, 6, 'Pluto’s Moon Charon', NULL);
INSERT INTO public.moon VALUES (27, false, 'Ice-Rock', 567.888, 'Small moon of Pluto; discovered in 2012.', 27890987, 6, 'Pluto’s Moon Styx', NULL);
INSERT INTO public.moon VALUES (28, false, 'Ice-Rock', 764.890, 'Medium-sized moon of Pluto; discovered in 2005.', 1000000, 6, 'Pluto’s Moon Nix', NULL);
INSERT INTO public.moon VALUES (29, false, 'Ice-Rock', 876.900, 'Small moon of Pluto; discovered in 2011.', 689, 6, 'Pluto’s Moon Kerberos', NULL);
INSERT INTO public.moon VALUES (30, false, 'Ice-Rock', 433.870, 'Largest of Pluto’s small moons; discovered in 2005.', 4500, 6, 'Pluto’s Moon Hydra', NULL);
INSERT INTO public.moon VALUES (32, false, 'Ice', 0.000, 'The Earth’s only natural satellite; influences tides.', 4500, 1, 'Gaymede', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'Terrestrial', 0.000, 'The only known planet to support life.', true, 4500, 1, 'Earth', NULL);
INSERT INTO public.planet VALUES (2, false, 'Terrestrial', 12.000, 'The Red Planet; has evidence of past water.', true, 4500, 1, 'Mars', NULL);
INSERT INTO public.planet VALUES (3, false, 'Terrestrual', 33.000, 'Extremely hot atmosphere; surface pressure is very high.', true, 4500, 1, 'Venus', NULL);
INSERT INTO public.planet VALUES (4, false, 'Terrestrial', 222.000, 'Largest planet in the Solar System; mostly hydrogen and helium.', true, 4600, 1, 'Jupiter', NULL);
INSERT INTO public.planet VALUES (5, false, 'Gas Giant', 3.000, 'Famous for its extensive ring system.', true, 5000, 1, 'Saturn', NULL);
INSERT INTO public.planet VALUES (6, true, 'Super_Earth', 600.000, 'First confirmed planet in the habitable zone of a Sun-like star.', true, 4000, 2, 'Kepler-22b', NULL);
INSERT INTO public.planet VALUES (7, true, 'Super-Earth', 293.000, 'Exoplanet in the Gliese 581 system; potentially habitable.', true, 5000, 3, 'Gliese 581g', NULL);
INSERT INTO public.planet VALUES (8, false, 'Hot Juitper', 33.550, 'First exoplanet observed transiting its star.', true, 5000, 4, 'HD 209458 b', NULL);
INSERT INTO public.planet VALUES (9, true, 'Terrestrial', 4.240, 'Orbits Proxima Centauri in the habitable zone.', true, 4500, 2, 'Proxima b', NULL);
INSERT INTO public.planet VALUES (10, false, 'Terrestrial', 40.000, 'One of seven Earth-sized planets orbiting TRAPPIST-1.', true, 5000, 5, 'TRAPPIST-1D', NULL);
INSERT INTO public.planet VALUES (11, true, 'Ice Giant', 0.000, 'Blue-green gas giant with a tilted rotation axis.', true, 4700, 1, 'Uranus', NULL);
INSERT INTO public.planet VALUES (12, false, 'Ice Giant', 0.000, 'Farthest known planet in our Solar System; strong winds and storms.', true, 4600, 1, 'Neptune', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, true, 'G-type Main-Sequence', 0.000, 'The star at the center of our Solar System; supports life on Earth.', 46000, 1, 'Sun', NULL);
INSERT INTO public.star VALUES (2, false, 'Red Dwarf', 4.246, 'The closest star to the Sun; part of the Alpha Centauri system.', 4500, 4, 'Proxima Centauri', NULL);
INSERT INTO public.star VALUES (3, false, 'A-type Main-Sequence', 8.600, 'Brightest star in the night sky, also called the Dog Star.', 460, 6, 'Sirius', NULL);
INSERT INTO public.star VALUES (4, false, 'Blue Supergiant', 860.000, 'A massive blue star in the Orion constellation.', 8, 2, 'Rigel', NULL);
INSERT INTO public.star VALUES (5, true, 'Red Supergiant', 642.500, 'A very large, luminous star nearing the end of its life.', 10, 5, 'Betelgeuse', NULL);
INSERT INTO public.star VALUES (6, true, 'Alpha Centauri A
', 25.040, 'Part of the closest star system to the Sun.', 455, 3, 'Vega', NULL);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (9, 1, 1, 1, 12, 'Andromeda Prime', 'A vast universe centered in the Andromeda galaxy, hosting habitable planets.', 10000, true);
INSERT INTO public.universe VALUES (10, 2, 3, 2, 15, 'Milky Haven', 'A universe extension from the Milky Way, with thriving star systems and moons.', 8500, true);
INSERT INTO public.universe VALUES (11, 3, 5, 3, 18, 'Triangulum Realm', 'Universe associated with Triangulum galaxy, dominated by blue giant stars.', 9200, false);
INSERT INTO public.universe VALUES (12, 4, 7, 4, 21, 'Centaurus Infinity', 'Expansive universe near Centaurus A, with massive black hole influence.', 12000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 12, true);


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
-- Name: galaxy galaxy_record_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_record_key UNIQUE (record);


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
-- Name: moon moon_record_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_record_key UNIQUE (record);


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
-- Name: planet planet_record_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_record_key UNIQUE (record);


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
-- Name: star star_record_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_record_key UNIQUE (record);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


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
-- Name: universe universe_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universe universe_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe universe_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe universe_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

