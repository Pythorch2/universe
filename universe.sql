-- camper: /project$ cat universe.sql
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
    name character varying(60) NOT NULL,
    galaxy_type_id integer,
    distance_from_earth numeric(9,2) NOT NULL,
    age_in_millions_of_years integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    moon_type_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer
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
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_moon_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_moon_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_moon_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    planet_type_id integer,
    has_life boolean,
    distance_from_earth numeric(7,2) NOT NULL,
    age_in_millions_of_years integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    star_type_id integer,
    distance_from_earth numeric(7,2) NOT NULL,
    age_in_millions_of_years integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_moon_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 1, 26000.00, 13610);
INSERT INTO public.galaxy VALUES (2, 'Galaxia del Sombrero (M104)', 1, 28.00, 13000);
INSERT INTO public.galaxy VALUES (3, 'Galaxia del Remolino (M51)', 1, 31.00, 400);
INSERT INTO public.galaxy VALUES (4, 'Andrómeda o Galaxia Espiral M31 o Messier 31 o NGC 224', 1, 2.53, 10010);
INSERT INTO public.galaxy VALUES (5, 'Enana Elíptica de Sagitario', 10, 70000.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Alcioneo', 7, 3500.00, NULL);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 2, 54.00, 13240);
INSERT INTO public.galaxy VALUES (8, 'Galaxia del Ojo Negro o M64 o NGC 4826', 1, 17.00, 13280);
INSERT INTO public.galaxy VALUES (9, 'Andrómeda I,', 10, 2.64, 10010);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Galaxia en espiral', 'Parecen gigantescos molinetes. Los brazos del molinillo están compuestos de estrellas y un 
        montón de gas y polvo. El gas y el polvo son algunos de los ingredientes principales necesarios para formar nuevas 
        estrellas. Las estrellas nuevas queman mucho más que las estrellas antiguas, así que las estrellas espirales son
        a menudo algunas algunas de las más brillantes en el universo. Alrededor del 60% de las galaxias cercanas son 
        espirales. Nuestra galaxia, la Vía Láctea, es un ejemplo de una.');
INSERT INTO public.galaxy_type VALUES (2, 'Galaxia elíptica', 'Tienen forma de círculos estirados o elipses, algunas galaxias elípticas están más estiradas que 
        otras. Uno puede parecer casi perfectamente circular, otro podría parecer largo y plano. Las galáxias elípticas 
        contienen principalmente estrellas más viejas. Esto significa que a menudo no son tan brillantes como las galaxias
        espirales. También tienen muy poco polvo y gas. Las galaxias elípticas son las más grandes y están entre las más 
        comunes observadas. Constituyen alrededor del 20% de todas las galaxias cercanas.');
INSERT INTO public.galaxy_type VALUES (3, 'Galaxia lenticular', 'Las galaxias lenticulares constituyen un grupo de transición entre las galaxias elípticas 
        y las espirales, y se dividen en tres subgrupos: SO1, SO2 y SO3. Poseen un disco, una condensación central muy 
        importante y una envoltura extensa.

        Incluyen las lenticulares barradas (SBO), que comprenden tres grupos: en el primero (SBO-1), la barra es ancha y 
        difusa; en el segundo (SBO-2) es más luminosa en las extremidades que en el centro; y en el tercero (SBO-3) es ya 
        muy brillante y bien definidas. ');
INSERT INTO public.galaxy_type VALUES (4, 'Galaxia iregular', 'Son sólo eso: irregular. No tienen una sola forma común. Están entre las galaxias más pequeñas 
        que los científicos han observado. Sin embargo, también pueden ser muy brillantes, al igual que las galaxias 
        espirales. Suelen estar llenas de gas, polvo y estrellas nuevas brillantes. Alrededor del 20% de las galaxias 
        cercanas son irregulares.
         
        Una galaxia irregular es una galaxia que no encaja en ninguna clasificación de galaxias de la secuencia 
        de Hubble. Son galaxias sin forma espiral ni elíptica.

        Hay dos tipos de galaxias irregulares. Una galaxia Irr-I (Irr I) es una galaxia irregular que muestra alguna 
        estructura pero no lo suficiente para encuadrarla claramente en la clasificación de la secuencia de Hubble. Una 
        galaxia Irr-II (Irr II) es una galaxia irregular que no muestra ninguna estructura que pueda encuadrarla en la 
        secuencia de Hubble.

        Las galaxias enanas irregulares suelen etiquetarse como dI. Algunas galaxias irregulares son pequeñas galaxias 
        espirales distorsionadas por la gravedad de un vecino mucho mayor.

        Del total de galaxias observadas hasta la fecha solo un 4.7 % de las galaxias brillantes reciben el nombre de 
        galaxia irregular.  ');
INSERT INTO public.galaxy_type VALUES (5, 'Quásares', 'Un cuásar o quasar (acrónimo de «fuente de radio cuasiestelar», traducción del inglés quasi-stellar 
      radio source) se define como, bien una galaxia recién nacida o bien aquella fuente de energía que se presenta en 
      el agujero negro del centro de dichas galaxias recién nacidas, caracterizados por ser una fuente astronómica de 
      energía electromagnética, que incluye radiofrecuencias y luz visible. 

      Son áreas compactas en el centro de una galaxia. Emiten enormes cantidades de energía por lo que son 
      algunos de los objetos más brillantes del universo. No hay cuásares cerca de nuestra Vía Láctea. 

      Tienen aparentemente el mismo aspecto de una estrella; de ahí su nombre, que proviene de la contracción inglesa
      quasi-stellar. En esencia, los cuásares consisten en un núcleo no resuelto y muy luminoso con fuertes líneas 
      de emisión anchas y estrechas. En los cuásares más cercanos se observa una nubosidad difusa, revelando que este 
      tipo de objetos no son más que núcleos de galaxias activas muy lejanas de las que únicamente somos capaces de 
      detectar su núcleo.

      Se sabe que la masa de estos objetos es muy elevada y que generalmente presentan una forma estructurada.');
INSERT INTO public.galaxy_type VALUES (6, 'Blazares', 'Los quásares y los blazares son los objetos más lejanos y de mayor energía que se conocen. Están a 
      miles de millones de años luz de la Tierra. Los vemos tal y como eran en el pasado, cuando las galaxias aún se 
      estaban formando. Son los objetos más brillantes del Universo, aunque están tan lejos que su luz nos llega muy 
      débilmente. Casi todas las galaxias activas que se conocen son quásares.');
INSERT INTO public.galaxy_type VALUES (7, 'Radiogalaxia', 'Las radiogalaxias, así como los quásares radio-intensos y blazars, son tipos de galaxia activa muy 
       luminosas en frecuencias de radio (de hasta 1038 W entre 10 MHz y 100 GHz). La emisión de radio es debida a la 
       radiación sincrotrón. 

       Suelen estar asociadas a galaxias tipo E con núcleo activo. Emiten a longitudes de onda de radio 
       y algunas pueden ser relativamente débiles. Suelen ser galaxias que se extienden por amplias zonas del espacio. 
       Presentan un núcleo brillante y normalmente suelen estar rodeadas por dos chorros de partículas de grandes 
       dimensiones. Además, en muchas de ellas se ha detectado radiación de sincrotrón.

       Las radiogalaxias y las galaxias Seyfert son objetos más cercanos y también muy brillantes. Emiten 
       rayos X, radiación infrarroja y ondas de radio. Su radiación es tan grande, que son la principal fuente de ondas 
       de radio de todo el Cosmos.');
INSERT INTO public.galaxy_type VALUES (8, 'Galaxia Seyfert', 'Es un tipo de galaxia activa que alberga un núcleo activo. Este núcleo produce líneas espectrales de 
       emisión de gas altamente ionizado. Son generalmente galaxias espirales. Su emisión es producida por el acrecimiento 
       de materia en el agujero negro supermasivo situado en su centro. 

       Representan alrededor del 10% de todas las galaxias[3]​ y son algunos de los objetos más intensamente estudiados en 
       astronomía, ya que se cree que están alimentadas por los mismos fenómenos que ocurren en los cuásares, aunque están 
       más cerca y son menos luminosas que los cuásares. Estas galaxias tienen en su centro agujeros negros supermasivos 
       rodeados por discos de acrecimiento de material en caída. 

       Son galaxias espirales que se caracterizan por tener un núcleo puntual muy brillante. Según su espectro 
       se distinguen:

       Galaxia Seyfert Tipo I: poseen líneas anchas de emisión.
       Galaxia Seyfert Tipo II: poseen líneas estrechas de emisión.

       También se observa que estas galaxias emiten débilmente en radio. 

       Las galaxias Seyfert deben su nombre a Carl Seyfert, quien describió por primera vez esta clase en 1943.');
INSERT INTO public.galaxy_type VALUES (9, 'Galaxia Starburst', 'Son galaxias en las que se están formando enormes cantidades de estrellas, muchas de las cuales, al 
        morir, explotan produciendo supernovas, pese a que este fenómeno forma parte de la evolución estelar y formalmente 
        este grupo no estaría en esta clasificación. Esta formación anormalmente alta de estrellas podría estar ligada a 
        mecanismos internos del núcleo de la galaxia. 

        Son aquellas galaxias en las que tiene lugar una tasa de nacimiento de estrellas muy superior a la de una galaxia 
        normal, en súper cúmulos estelares. Por ejemplo, la tasa de formación estelar de la galaxia Vía Láctea es de 
        aproximadamente 3 M☉/año (Masa Solar/año), mientras que las galaxias con brote estelar pueden experimentar tasas 
        de formación de estrellas que son más de un factor de 33 veces mayor.​ Estos brotes estelares se pueden detectar 
        con telescopios de infrarrojos o rayos x entre otros. 

        NGC 6946, M 82, y NGC 253 son buenos ejemplos de galaxias con brotes estelares. En la galaxia NGC 4303, una galaxia 
        activa de tipo Seyfert 2 de poca luminosidad, se ha observado la formación estelar gracias al Chandra y el STIS, con 
        sus técnicas de ultravioleta. En la Gran Nube de Magallanes también se ha localizado con el satélite japonés/europeo 
        AKARI estrellas en formación.');
INSERT INTO public.galaxy_type VALUES (10, 'Galaxia enana esferoidal o enana elíptica', 'Es un tipo de galaxias muy pequeñas y poco luminosas, a veces más tenues que una gran estrella brillante. 
              Poseen una distribución espacial más o menos esférica y están constituidas por entre unos millones a unos cientos de 
              millones de estrellas. Han sido descubiertas solo recientemente debido a su bajo brillo superficial que las hace casi 
              indistinguibles del fondo estelar.

              En general, son objetos muy antiguos que han evolucionado poco, hablando en términos de formación estelar. Sus 
              estrellas son pobres en metales, con características afines a los cúmulos globulares.

              Son pocas las galaxias enanas esferoidales conocidas, bien satélites de la Vía Láctea o de la galaxia de Andrómeda. 
              Aun así, representan la mayoría de las galaxias del Grupo Local. Al ser tan poco luminosas es prácticamente imposible 
              observarlas a distancias mayores. ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 4, true, 4500);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 5, false, 2700);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 5, true, 2700);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 4, true, 4500);
INSERT INTO public.moon VALUES (5, 'Calisto', 5, 4, true, 4000);
INSERT INTO public.moon VALUES (6, 'Io', 5, 4, false, 4500);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 4, true, 4500);
INSERT INTO public.moon VALUES (8, 'Titán', 6, 4, true, 4000);
INSERT INTO public.moon VALUES (9, 'Rea', 6, 4, true, 4460);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 4, false, 4500);
INSERT INTO public.moon VALUES (11, 'Tetis', 6, 4, true, 4560);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 4, true, 100);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, 4, true, 4500);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 5, true, 4500);
INSERT INTO public.moon VALUES (15, 'Helene', 6, 1, false, 4500);
INSERT INTO public.moon VALUES (16, 'Polydeuces', 6, 1, false, 4500);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 4, true, 4500);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 4, true, 4500);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 4, true, 4500);
INSERT INTO public.moon VALUES (20, 'Titania', 7, 4, true, 4500);
INSERT INTO public.moon VALUES (21, 'Oberon', 7, 4, true, 4500);
INSERT INTO public.moon VALUES (22, 'Triton', 8, 4, true, 100);
INSERT INTO public.moon VALUES (23, 'Proteus', 8, 4, true, 4510);
INSERT INTO public.moon VALUES (24, 'Nereid', 8, 5, true, NULL);
INSERT INTO public.moon VALUES (25, 'Larissa', 8, 5, true, 4500);
INSERT INTO public.moon VALUES (26, 'Galatea', 8, 5, true, 4500);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'Coorbital', 'on satélites que comparten una misma órbita con otro cuerpo celeste.');
INSERT INTO public.moon_type VALUES (2, 'Pastor', 'Se encuentran en planetas con anillos y ejercen influencia gravitatoria sobre ellos, creando estructuras como surcos o divisiones en los anillos.');
INSERT INTO public.moon_type VALUES (3, 'Asteroidal', 'Son satélites que orbitan alrededor de un asteroide.');
INSERT INTO public.moon_type VALUES (4, 'Regular', 'Orbitan cerca del cuerpo celeste principal y giran en el mismo sentido de rotación del planeta.');
INSERT INTO public.moon_type VALUES (5, 'Irregular', 'Tienen órbitas más alejadas y generalmente giran en sentido retrógrado respecto al cuerpo al que orbitan.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 1, false, 77.30, 4503);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, 38.00, 4503);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, 1, true, 0.00, 4543);
INSERT INTO public.planet VALUES (4, 'Marte', 1, 1, false, 225.00, 4603);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, 2, false, 778.00, 4603);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 2, false, 1200.00, 4503);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 6, false, 590.00, 4503);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 6, false, 4321.00, 4503);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 8, 4, false, 4.00, 4850);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 10, 4, false, 492.30, 4000);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 11, 4, false, 40.00, 5400);
INSERT INTO public.planet VALUES (12, 'Teegarden b', 12, 4, false, 3831.00, 8000);
INSERT INTO public.planet VALUES (13, 'Kepler-442b', 13, 4, false, 1193.63, 2900);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'terrestre o rocoso', 'Los planetas terrestres, que incluyen Mercurio, Venus, la Tierra y Marte, son más pequeños, 
        tienen la superficie sólida compuesta principalmente por rocas y metales, y se encuentran más cerca del sol. 
        Su atmósfera puede estar compuesta por gases como oxígeno, nitrógeno y dióxido de carbono. Sus superficies
        pueden tener cráteres, montañas, volcanes o extensas llanuras.');
INSERT INTO public.planet_type VALUES (2, 'gaseoso', 'Los planetas gaseosos, formados por hidrógeno, metano y helio, son significativamente más grandes, 
     menos densos que los planetas terrestres y se sitúan más alejados del sol; este grupo incluye a Júpiter, Saturno, Urano y Neptuno. ');
INSERT INTO public.planet_type VALUES (3, 'enano', 'Los planetas enanos, como Plutón, Ceres, Eris, Makemake y Haumea, son cuerpos celestes más pequeños que
     no han limpiado su órbita de otros objetos similares, lo que los distingue de los planetas principales. Son planetas 
     que reúnen todas las condiciones para serlo excepto porque no tienen su órbita limpia. Se trata de una categoría
     relativamente reciente que fue adoptada por la Unión Astronómica Internacional en 2006. Suelen ser más pequeños que los planetas terrestres.');
INSERT INTO public.planet_type VALUES (4, 'exoplaneta', 'Fuera del sistema solar, se han descubierto más de 5.000 exoplanetas, que presentan una gran variedad 
      de tipos incluyendo gigantes calientes, planetas superhabitable, planetas de carbono, planetas océano, planetas de 
      lava, planetas helados y planetas sin núcleo, entre otros. Estos exoplanetas pueden encontrarse en diferentes tipos
      de estrellas, aunque ciertos tipos, como los planetas tipo Tierra, son más comunes en estrellas de tipo G y M.');
INSERT INTO public.planet_type VALUES (5, 'interestelares', 'Varias simulaciones por ordenador de la evolución estelar y formación de los sistemas planetarios 
       han sugerido que algunos objetos de masa planetaria habrían sido expulsados al espacio interestelar. Algunos 
       científicos han argumentado que esos objetos encontrados vagando en el espacio deben ser clasificados como 
       «planetas». Sin embargo, otros han sugerido que podrían ser estrellas de baja masa. La definición de la UAI 
       sobre planetas extrasolares no toma posición sobre la cuestión. ');
INSERT INTO public.planet_type VALUES (6, 'gigantes helados', 'Están formados por agua, amoníaco y metano congelados, con temperaturas extremadamente bajas y un color azul debido al metano.');
INSERT INTO public.planet_type VALUES (7, 'superhabitable', 'Podrían tener condiciones más favorables para la vida que la Tierra.');
INSERT INTO public.planet_type VALUES (8, 'océano', 'Con una superficie cubierta por océanos profundos.');
INSERT INTO public.planet_type VALUES (9, 'de hierro', 'Con una alta proporción de hierro en su composición.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 16, 149.60, 4600);
INSERT INTO public.star VALUES (2, 'Sirio (Sirius)', 1, 2, 8.60, 242);
INSERT INTO public.star VALUES (3, 'Canopo (Canopus)', 1, 7, 309.00, 30);
INSERT INTO public.star VALUES (4, 'Arturo (Arcturus)', 1, 9, 36.70, 7100);
INSERT INTO public.star VALUES (5, 'Vega o Alfa Lyrae', 1, 2, 25.30, 455);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 7, 700.00, 10);
INSERT INTO public.star VALUES (7, 'Aldebarán', 1, 9, 65.10, 6400);
INSERT INTO public.star VALUES (8, 'Próxima Centauri', 1, 11, 4.22, 4850);
INSERT INTO public.star VALUES (9, 'Upsilon Andromedae', 1, 15, 44.00, 3300);
INSERT INTO public.star VALUES (10, 'Kepler-186', 1, 18, 492.51, 4000);
INSERT INTO public.star VALUES (11, 'TRAPPIST-1', 1, 11, 39.13, 5400);
INSERT INTO public.star VALUES (12, 'Teegarden', 1, 11, 12.52, 8000);
INSERT INTO public.star VALUES (13, 'Kepler-442', 1, 17, 1194.00, 2900);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Protoestrellas', 'Estrellas en formación.');
INSERT INTO public.star_type VALUES (2, 'De secuencia principal', 'La mayoría de las estrellas, como nuestro Sol, que queman hidrógeno en su núcleo.');
INSERT INTO public.star_type VALUES (3, 'Gigantes rojas', 'Estrellas que han agotado su hidrógeno y han comenzado a expandirse.');
INSERT INTO public.star_type VALUES (4, 'Enanas blancas', 'Núcleos de estrellas que han finalizado su vida como gigantes.');
INSERT INTO public.star_type VALUES (5, 'De neutrones', 'Remanentes extremadamente densos de supernovas.');
INSERT INTO public.star_type VALUES (6, 'Agujeros negros', 'La etapa final para algunas estrellas masivas, donde la gravedad es tan intensa que nada, ni la luz, puede escapar.');
INSERT INTO public.star_type VALUES (7, 'Supergigantes e hipergigantes', 'Las estrellas más grandes y luminosas. ');
INSERT INTO public.star_type VALUES (8, 'Gigantes luminosas', 'Estrellas muy brillantes entre las gigantes y supergigantes.');
INSERT INTO public.star_type VALUES (9, 'Gigantes', 'Estrellas que han agotado el hidrógeno en su núcleo.');
INSERT INTO public.star_type VALUES (10, 'Subgigantes', 'Estrellas que han comenzado a expandirse.');
INSERT INTO public.star_type VALUES (11, 'Enanas rojas', 'Incluyen a las enanas blancas y a las estrellas de secuencia principal como las enanas rojas, amarillas y naranjas.');
INSERT INTO public.star_type VALUES (12, 'clases O', 'Estrellas violetas y muy calientes.');
INSERT INTO public.star_type VALUES (13, 'clases B', 'Estrellas azules.');
INSERT INTO public.star_type VALUES (14, 'clases A', 'Estrellas blanquiazules.');
INSERT INTO public.star_type VALUES (15, 'clases F', 'Estrellas blancoamarillentas.');
INSERT INTO public.star_type VALUES (16, 'clases G', 'Estrellas amarillas, como el Sol.');
INSERT INTO public.star_type VALUES (17, 'clases K', 'Estrellas amarillo-anaranjadas.');
INSERT INTO public.star_type VALUES (18, 'clases M', 'Estrellas rojas anaranjadas, las más frías y comunes.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_moon_type_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 18, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: moon_type moon_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_name_key UNIQUE (name);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_moon_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_type_id_fkey FOREIGN KEY (moon_type_id) REFERENCES public.moon_type(moon_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--
