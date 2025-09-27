-- DROP DATABASE: 
-----------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS universe;



-- CREATE DATABASE: 
-----------------------------------------------------------------------------------------

CREATE DATABASE universe;



-- DROP TABLES: 
-----------------------------------------------------------------------------------------

DROP TABLE IF EXISTS galaxy_type; 
DROP TABLE IF EXISTS star_type;
DROP TABLE IF EXISTS planet_type;
DROP TABLE IF EXISTS moon_type;
DROP TABLE IF EXISTS galaxy;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS planet;
DROP TABLE IF EXISTS moon;



-- CREATE TABLES: 
-----------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS galaxy_type(galaxy_type_id 		SERIAL PRIMARY KEY , 
						  				name 				VARCHAR(50) UNIQUE NOT NULL, 
						  				description 		TEXT NOT NULL );

CREATE TABLE IF NOT EXISTS star_type(star_type_id 		 	SERIAL PRIMARY KEY , 
									  name 					VARCHAR(20) UNIQUE NOT NULL, 
									  description 			TEXT NOT NULL );

CREATE TABLE IF NOT EXISTS planet_type(planet_type_id 		SERIAL PRIMARY KEY , 
						  			 	name				VARCHAR(20) UNIQUE NOT NULL, 
						  			 	description 		TEXT NOT NULL );

CREATE TABLE IF NOT EXISTS moon_type(moon_type_id 			SERIAL PRIMARY KEY , 
									  name 					VARCHAR(20) UNIQUE NOT NULL, 
									  description 			TEXT NOT NULL );	


CREATE TABLE IF NOT EXISTS galaxy(galaxy_id 		 			SERIAL PRIMARY KEY , 
								  name 			 				VARCHAR(60) UNIQUE NOT NULL, 
								  galaxy_type_id 				INT,		
								  distance_from_earth 			NUMERIC(7, 2) NOT NULL, 
								  age_in_millions_of_years 		INT,
								  FOREIGN KEY (galaxy_type_id) 	REFERENCES galaxy_type(galaxy_type_id) );

CREATE TABLE IF NOT EXISTS star(star_id 		 				SERIAL PRIMARY KEY , 
				  			 	name 			 				VARCHAR(20) UNIQUE NOT NULL, 
				  			 	galaxy_id 		 				INT, 
				  			 	star_type_id 		 			INT, 
				  			 	distance_from_earth 	 		NUMERIC(7, 2) NOT NULL, 
				  			 	age_in_millions_of_years 		INT,
				  			 	FOREIGN KEY (galaxy_id) 		REFERENCES galaxy(galaxy_id),
				  			 	FOREIGN KEY (star_type_id) 		REFERENCES star_type(star_type_id)  );

CREATE TABLE IF NOT EXISTS planet(  planet_id  		 			SERIAL PRIMARY KEY ,
									name 			 			VARCHAR(20) UNIQUE NOT NULL, 
									star_id   		 			INT,
									planet_type_id 		 		INT, 
									has_life 		 			BOOLEAN,
									distance_from_earth 	 	NUMERIC(7, 2) NOT NULL, 
									age_in_millions_of_years 	INT, 
									FOREIGN KEY (star_id)		REFERENCES star(star_id),
									FOREIGN KEY (planet_type_id)REFERENCES planet_type(planet_type_id));

CREATE TABLE IF NOT EXISTS moon(moon_id  		 				SERIAL PRIMARY KEY ,
							 	name  			 				VARCHAR(20) UNIQUE NOT NULL,
							 	planet_id  						INT,
							 	moon_type_id  		 			INT,
							 	is_spherical             		BOOLEAN,
							 	age_in_millions_of_years 		INT,
							 	FOREIGN KEY (planet_id)			REFERENCES planet(planet_id),
							 	FOREIGN KEY (moon_type_id) 		REFERENCES moon_type(moon_type_id));



-- INSERT VALUES: 
-----------------------------------------------------------------------------------------

INSERT INTO galaxy_type (name, description) VALUES ('Galaxia en espiral', 'Parecen gigantescos molinetes. Los brazos del molinillo están compuestos de estrellas y un 
								montón de gas y polvo. El gas y el polvo son algunos de los ingredientes principales necesarios para formar nuevas 
								estrellas. Las estrellas nuevas queman mucho más que las estrellas antiguas, así que las estrellas espirales son
								a menudo algunas algunas de las más brillantes en el universo. Alrededor del 60% de las galaxias cercanas son 
								espirales. Nuestra galaxia, la Vía Láctea, es un ejemplo de una.');
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia elíptica',  'Tienen forma de círculos estirados o elipses, algunas galaxias elípticas están más estiradas que 
								otras. Uno puede parecer casi perfectamente circular, otro podría parecer largo y plano. Las galáxias elípticas 
								contienen principalmente estrellas más viejas. Esto significa que a menudo no son tan brillantes como las galaxias
								espirales. También tienen muy poco polvo y gas. Las galaxias elípticas son las más grandes y están entre las más 
								comunes observadas. Constituyen alrededor del 20% de todas las galaxias cercanas.');	
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia lenticular', 'Las galaxias lenticulares constituyen un grupo de transición entre las galaxias elípticas 
								y las espirales, y se dividen en tres subgrupos: SO1, SO2 y SO3. Poseen un disco, una condensación central muy 
								importante y una envoltura extensa.

								Incluyen las lenticulares barradas (SBO), que comprenden tres grupos: en el primero (SBO-1), la barra es ancha y 
								difusa; en el segundo (SBO-2) es más luminosa en las extremidades que en el centro; y en el tercero (SBO-3) es ya 
								muy brillante y bien definidas. ');
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia iregular',  'Son sólo eso: irregular. No tienen una sola forma común. Están entre las galaxias más pequeñas 
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
								galaxia irregular.  ' );
INSERT INTO galaxy_type (name, description) VALUES ('Quásares',  'Un cuásar o quasar (acrónimo de «fuente de radio cuasiestelar», traducción del inglés quasi-stellar 
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
INSERT INTO galaxy_type (name, description) VALUES ('Blazares',  'Los quásares y los blazares son los objetos más lejanos y de mayor energía que se conocen. Están a 
						miles de millones de años luz de la Tierra. Los vemos tal y como eran en el pasado, cuando las galaxias aún se 
						estaban formando. Son los objetos más brillantes del Universo, aunque están tan lejos que su luz nos llega muy 
						débilmente. Casi todas las galaxias activas que se conocen son quásares.');
INSERT INTO galaxy_type (name, description) VALUES ('Radiogalaxia',  'Las radiogalaxias, así como los quásares radio-intensos y blazars, son tipos de galaxia activa muy 
							luminosas en frecuencias de radio (de hasta 1038 W entre 10 MHz y 100 GHz). La emisión de radio es debida a la 
							radiación sincrotrón. 

							Suelen estar asociadas a galaxias tipo E con núcleo activo. Emiten a longitudes de onda de radio 
							y algunas pueden ser relativamente débiles. Suelen ser galaxias que se extienden por amplias zonas del espacio. 
							Presentan un núcleo brillante y normalmente suelen estar rodeadas por dos chorros de partículas de grandes 
							dimensiones. Además, en muchas de ellas se ha detectado radiación de sincrotrón.

							Las radiogalaxias y las galaxias Seyfert son objetos más cercanos y también muy brillantes. Emiten 
							rayos X, radiación infrarroja y ondas de radio. Su radiación es tan grande, que son la principal fuente de ondas 
							de radio de todo el Cosmos.'); 
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia Seyfert', 'Es un tipo de galaxia activa que alberga un núcleo activo. Este núcleo produce líneas espectrales de 
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
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia Starburst', 'Son galaxias en las que se están formando enormes cantidades de estrellas, muchas de las cuales, al 
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
INSERT INTO galaxy_type (name, description) VALUES ('Galaxia enana esferoidal o enana elíptica', 'Es un tipo de galaxias muy pequeñas y poco luminosas, a veces más tenues que una gran estrella brillante. 
														Poseen una distribución espacial más o menos esférica y están constituidas por entre unos millones a unos cientos de 
														millones de estrellas. Han sido descubiertas solo recientemente debido a su bajo brillo superficial que las hace casi 
														indistinguibles del fondo estelar.

														En general, son objetos muy antiguos que han evolucionado poco, hablando en términos de formación estelar. Sus 
														estrellas son pobres en metales, con características afines a los cúmulos globulares.

														Son pocas las galaxias enanas esferoidales conocidas, bien satélites de la Vía Láctea o de la galaxia de Andrómeda. 
														Aun así, representan la mayoría de las galaxias del Grupo Local. Al ser tan poco luminosas es prácticamente imposible 
														observarlas a distancias mayores. ');
 

INSERT INTO star_type (name, description) VALUES ('Protoestrellas', 'Estrellas en formación.');
INSERT INTO star_type (name, description) VALUES ('De secuencia principal', 'La mayoría de las estrellas, como nuestro Sol, que queman hidrógeno en su núcleo.');
INSERT INTO star_type (name, description) VALUES ('Gigantes rojas', 'Estrellas que han agotado su hidrógeno y han comenzado a expandirse.');
INSERT INTO star_type (name, description) VALUES ('Enanas blancas','Núcleos de estrellas que han finalizado su vida como gigantes.');
INSERT INTO star_type (name, description) VALUES ('De neutrones','Remanentes extremadamente densos de supernovas.');
INSERT INTO star_type (name, description) VALUES ('Agujeros negros','La etapa final para algunas estrellas masivas, donde la gravedad es tan intensa que nada, ni la luz, puede escapar.');
INSERT INTO star_type (name, description) VALUES ('Supergigantes e hipergigantes','Las estrellas más grandes y luminosas. ');
INSERT INTO star_type (name, description) VALUES ('Gigantes luminosas','Estrellas muy brillantes entre las gigantes y supergigantes.');
INSERT INTO star_type (name, description) VALUES ('Gigantes','Estrellas que han agotado el hidrógeno en su núcleo.');
INSERT INTO star_type (name, description) VALUES ('Subgigantes','Estrellas que han comenzado a expandirse.');
INSERT INTO star_type (name, description) VALUES ('Enanas rojas','Incluyen a las enanas blancas y a las estrellas de secuencia principal como las enanas rojas, amarillas y naranjas.');
INSERT INTO star_type (name, description) VALUES ('clases O','Estrellas violetas y muy calientes.');
INSERT INTO star_type (name, description) VALUES ('clases B','Estrellas azules.');
INSERT INTO star_type (name, description) VALUES ('clases A','Estrellas blanquiazules.');
INSERT INTO star_type (name, description) VALUES ('clases F','Estrellas blancoamarillentas.');
INSERT INTO star_type (name, description) VALUES ('clases G','Estrellas amarillas, como el Sol.');
INSERT INTO star_type (name, description) VALUES ('clases K','Estrellas amarillo-anaranjadas.');
INSERT INTO star_type (name, description) VALUES ('clases M','Estrellas rojas anaranjadas, las más frías y comunes.');


INSERT INTO planet_type (name, description)
VALUES  ('terrestre o rocoso', 'Los planetas terrestres, que incluyen Mercurio, Venus, la Tierra y Marte, son más pequeños, 
								tienen la superficie sólida compuesta principalmente por rocas y metales, y se encuentran más cerca del sol. 
								Su atmósfera puede estar compuesta por gases como oxígeno, nitrógeno y dióxido de carbono. Sus superficies
								pueden tener cráteres, montañas, volcanes o extensas llanuras.'),
		('gaseoso', 'Los planetas gaseosos, formados por hidrógeno, metano y helio, son significativamente más grandes, 
					menos densos que los planetas terrestres y se sitúan más alejados del sol; este grupo incluye a Júpiter, Saturno, Urano y Neptuno. '),
		('enano', 'Los planetas enanos, como Plutón, Ceres, Eris, Makemake y Haumea, son cuerpos celestes más pequeños que
					no han limpiado su órbita de otros objetos similares, lo que los distingue de los planetas principales. Son planetas 
					que reúnen todas las condiciones para serlo excepto porque no tienen su órbita limpia. Se trata de una categoría
					relativamente reciente que fue adoptada por la Unión Astronómica Internacional en 2006. Suelen ser más pequeños que los planetas terrestres.'),
		('exoplaneta', 'Fuera del sistema solar, se han descubierto más de 5.000 exoplanetas, que presentan una gran variedad 
						de tipos incluyendo gigantes calientes, planetas superhabitable, planetas de carbono, planetas océano, planetas de 
						lava, planetas helados y planetas sin núcleo, entre otros. Estos exoplanetas pueden encontrarse en diferentes tipos
						de estrellas, aunque ciertos tipos, como los planetas tipo Tierra, son más comunes en estrellas de tipo G y M.'),
		('interestelares', 'Varias simulaciones por ordenador de la evolución estelar y formación de los sistemas planetarios 
							han sugerido que algunos objetos de masa planetaria habrían sido expulsados al espacio interestelar. Algunos 
							científicos han argumentado que esos objetos encontrados vagando en el espacio deben ser clasificados como 
							«planetas». Sin embargo, otros han sugerido que podrían ser estrellas de baja masa. La definición de la UAI 
							sobre planetas extrasolares no toma posición sobre la cuestión. '),
		('gigantes helados', 'Están formados por agua, amoníaco y metano congelados, con temperaturas extremadamente bajas y un color azul debido al metano.'),
		('superhabitable', 'Podrían tener condiciones más favorables para la vida que la Tierra.'),
		('océano', 'Con una superficie cubierta por océanos profundos.'),
		('de hierro', 'Con una alta proporción de hierro en su composición.');


INSERT INTO moon_type (name, description)
VALUES 	('Coorbital', 'on satélites que comparten una misma órbita con otro cuerpo celeste.'),
		('Pastor', 'Se encuentran en planetas con anillos y ejercen influencia gravitatoria sobre ellos, creando estructuras como surcos o divisiones en los anillos.'),
		('Asteroidal', 'Son satélites que orbitan alrededor de un asteroide.'),
		('Regular', 'Orbitan cerca del cuerpo celeste principal y giran en el mismo sentido de rotación del planeta.'),
		('Irregular', 'Tienen órbitas más alejadas y generalmente giran en sentido retrógrado respecto al cuerpo al que orbitan.');




-- SELECT name FROM galaxy; 
-- SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%';
-- SELECT name, (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%')  FROM galaxy; 


INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Vía Láctea', 1, 26000, 13610);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Galaxia del Sombrero (M104)', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%'), 28, 13000);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Galaxia del Remolino (M51)', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%'), 31, 400 );
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Andrómeda o Galaxia Espiral M31 o Messier 31 o NGC 224', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%'), 2.53, 10010);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Andrómeda I,', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%enana esferoidal%'), 2.64, 10010);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Enana Elíptica de Sagitario', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%enana elíptica%'), 70000, NULL);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Alcioneo', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%radiogalaxia%'), 3500, NULL);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Messier 87', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%galaxia elíptica%'), 54, 13240);
INSERT INTO galaxy (name,  galaxy_type_id,  distance_from_earth,  age_in_millions_of_years) VALUES ('Galaxia del Ojo Negro o M64 o NGC 4826', (SELECT galaxy_type_id FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%'), 17, 13280 );	

/*
SELECT galaxy_type_id, name FROM galaxy_type WHERE galaxy_type.name ILIKE '%espiral%';
| galaxy_type_id |        name        |
+----------------+--------------------+
|              1 | Galaxia en espiral |


SELECT galaxy_type_id, name FROM galaxy_type WHERE galaxy_type.name ILIKE '%enana esferoidal%';
| galaxy_type_id |                   name                    |
+----------------+-------------------------------------------+
|             10 | Galaxia enana esferoidal o enana elíptica |


SELECT galaxy_type_id, name FROM galaxy_type WHERE galaxy_type.name ILIKE '%enana elíptica%';
| galaxy_type_id |                   name                    |
+----------------+-------------------------------------------+
|             10 | Galaxia enana esferoidal o enana elíptica |


SELECT galaxy_type_id, name FROM galaxy_type WHERE galaxy_type.name ILIKE '%radiogalaxia%';
| galaxy_type_id |     name     |
+----------------+--------------+
|              7 | Radiogalaxia |


SELECT galaxy_type_id, name FROM galaxy_type WHERE galaxy_type.name ILIKE '%galaxia elíptica%';
| galaxy_type_id |       name       |
+----------------+------------------+
|              2 | Galaxia elíptica |

*/



INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Sol', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%Clase%G%'), 149.6, 4600);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Sirio (Sirius)', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%secuencia%'), 8.60, 242);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Canopo (Canopus)', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%supergigante%'), 309, 30);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Arturo (Arcturus)', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE 'Gigantes'), 36.7, 7100);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Vega o Alfa Lyrae', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%secuencia%'), 25.3, 455);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Betelgeuse', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%supergigante%'), 700, 10);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Aldebarán', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE 'Gigantes'), 65.1, 6400);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Próxima Centauri', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%Enanas rojas%'), 4.22, 4850);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Upsilon Andromedae', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%F%'), 44.0, 3300);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Kepler-186', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%clase%m%'), 492.51, 4000);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('TRAPPIST-1', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%Enanas rojas%'), 39.13, 5400);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Teegarden', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%Enanas rojas%'), 12.52, 8000);
INSERT INTO star (name,  galaxy_id,  star_type_id,  distance_from_earth,  age_in_millions_of_years)	VALUES	('Kepler-442', (SELECT galaxy_id FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%'), (SELECT star_type_id FROM star_type WHERE star_type.name ILIKE '%clase%k%'), 1194, 2900);

/*
SELECT galaxy_id, name FROM galaxy WHERE galaxy.name ILIKE '%Vía Láctea%';
+----------------+------------+
| galaxy_type_id |    name    |
+----------------+------------+
|              1 | Vía Láctea |
+----------------+------------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%Clase%G%';
+--------------+----------+
| star_type_id |   name   |
+--------------+----------+
|           16 | clases G |
+--------------+----------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%secuencia%';
+--------------+------------------------+
| star_type_id |          name          |
+--------------+------------------------+
|            2 | De secuencia principal |
+--------------+------------------------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%supergigante%';
+--------------+-------------------------------+
| star_type_id |             name              |
+--------------+-------------------------------+
|            7 | Supergigantes e hipergigantes |
+--------------+-------------------------------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE 'Gigantes';
+--------------+----------+
| star_type_id |   name   |
+--------------+----------+
|            9 | Gigantes |
+--------------+----------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%Enanas rojas%';
+--------------+--------------+
| star_type_id |     name     |
+--------------+--------------+
|           11 | Enanas rojas |
+--------------+--------------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%F%';
+--------------+----------+
| star_type_id |   name   |
+--------------+----------+
|           15 | clases F |
+--------------+----------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%clase%m%';
+--------------+----------+
| star_type_id |   name   |
+--------------+----------+
|           18 | clases M |
+--------------+----------+

SELECT star_type_id, name FROM star_type WHERE star_type.name ILIKE '%clase%k%';
+--------------+----------+
| star_type_id |   name   |
+--------------+----------+
|           17 | clases K |
+--------------+----------+
*/


INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Mercurio', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%rocoso%'), False, 77.3, 4503);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Venus', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%rocoso%'), False, 38.0, 4503);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Tierra', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%rocoso%'), True, 0, 4543);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Marte', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%rocoso%'), False, 225, 4603);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Júpiter', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%gaseoso%'), False,  778, 4603);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Saturno', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%gaseoso%'), False, 1200, 4503);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Urano', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%helado%'), False, 590, 4503);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Neptuno', (SELECT star_id FROM star WHERE star.name ILIKE '%sol%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%helado%'), False, 4321, 4503);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Proxima Centauri b', (SELECT star_id FROM star WHERE star.name ILIKE '%Centauri%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'), False, 4.0, 4850);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Kepler-186f', (SELECT star_id FROM star WHERE star.name ILIKE '%Kepler-186%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'), False, 492.3, 4000);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('TRAPPIST-1e', (SELECT star_id FROM star WHERE star.name ILIKE '%TRAPPIST-1%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'), False, 40, 5400);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Teegarden b', (SELECT star_id FROM star WHERE star.name ILIKE '%Teegarden%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'), False, 3831, 8000);
INSERT INTO planet (name, star_id, planet_type_id, has_life, distance_from_earth, age_in_millions_of_years) VALUES ('Kepler-442b', (SELECT star_id FROM star WHERE star.name ILIKE '%Kepler-442%'), (SELECT planet_type_id FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'), False, 1193.63, 2900);

/*
SELECT star_id, name FROM star WHERE star.name ILIKE '%sol%';
+---------+------+
| star_id | name |
+---------+------+
|       1 | Sol  |
+---------+------+

SELECT star_id, name FROM star WHERE star.name ILIKE '%Centauri%';
+---------+------------------+
| star_id |       name       |
+---------+------------------+
|       8 | Próxima Centauri |
+---------+------------------+

SELECT star_id, name FROM star WHERE star.name ILIKE '%Kepler-186%';
+---------+------------+
| star_id |    name    |
+---------+------------+
|      10 | Kepler-186 |
+---------+------------+

SELECT star_id, name FROM star WHERE star.name ILIKE '%TRAPPIST-1%';
+---------+------------+
| star_id |    name    |
+---------+------------+
|      11 | TRAPPIST-1 |
+---------+------------+

SELECT star_id, name FROM star WHERE star.name ILIKE '%Teegarden%';
+---------+-----------+
| star_id |   name    |
+---------+-----------+
|      12 | Teegarden |
+---------+-----------+

SELECT star_id, name FROM star WHERE star.name ILIKE '%Kepler-442%';
+---------+------------+
| star_id |    name    |
+---------+------------+
|      13 | Kepler-442 |
+---------+------------+



SELECT planet_type_id, name FROM planet_type WHERE planet_type.name ILIKE '%rocoso%'; 
+----------------+--------------------+
| planet_type_id |        name        |
+----------------+--------------------+
|              1 | terrestre o rocoso |
+----------------+--------------------+

SELECT planet_type_id, name FROM planet_type WHERE planet_type.name ILIKE '%terrestre%'; 
+----------------+--------------------+
| planet_type_id |        name        |
+----------------+--------------------+
|              1 | terrestre o rocoso |
+----------------+--------------------+

SELECT planet_type_id, name FROM planet_type WHERE planet_type.name ILIKE '%gaseoso%'; 
+----------------+---------+
| planet_type_id |  name   |
+----------------+---------+
|              2 | gaseoso |
+----------------+---------+

SELECT planet_type_id, name FROM planet_type WHERE planet_type.name ILIKE '%helado%'; 
+----------------+------------------+
| planet_type_id |       name       |
+----------------+------------------+
|              6 | gigantes helados |
+----------------+------------------+

SELECT planet_type_id, name FROM planet_type WHERE planet_type.name ILIKE '%exoplanet%'; 
+----------------+------------+
| planet_type_id |    name    |
+----------------+------------+
|              4 | exoplaneta |
+----------------+------------+

*/





INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Luna', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Tierra%'), 	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Fobos', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Marte%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),False,  2700);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Deimos', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Marte%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),True,  	2700);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Ganymede',	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Júpiter%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Calisto', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Júpiter%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True, 	4000);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Io', 			(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Júpiter%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	False, 	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Europa',  	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Júpiter%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'),  True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Titán', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4000);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Rea', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4460);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Dione', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'),  False,  4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Tetis', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4560);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Enceladus',	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	 100);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Mimas', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Hyperion',	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Helene', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Coorbital'),False,  4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Polydeuces', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Saturno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Coorbital'),False,  4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Miranda', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Urano%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Ariel', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Urano%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Umbriel', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Urano%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Titania', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Urano%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Oberon', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Urano%'),  	(SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Triton', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Neptuno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,  	 100);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Proteus', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Neptuno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Regular'), 	True,   4510);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Nereid', 		(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Neptuno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),True,   Null);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Larissa', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Neptuno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),True,   4500);
INSERT INTO moon (name, planet_id, moon_type_id, is_spherical, age_in_millions_of_years) VALUES ('Galatea', 	(SELECT planet_id FROM planet WHERE planet.name ILIKE '%Neptuno%'), (SELECT moon_type_id FROM moon_type WHERE moon_type.name ILIKE 'Irregular'),True,   4500);

/*
SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Tierra%';
+-----------+--------+
| planet_id |  name  |
+-----------+--------+
|         3 | Tierra |
+-----------+--------+

SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Marte%';
+-----------+-------+
| planet_id | name  |
+-----------+-------+
|         4 | Marte |
+-----------+-------+

SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Júpiter%';
+-----------+---------+
| planet_id |  name   |
+-----------+---------+
|         5 | Júpiter |
+-----------+---------+

SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Saturno%';
+-----------+---------+
| planet_id |  name   |
+-----------+---------+
|         6 | Saturno |
+-----------+---------+

SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Urano%';
+-----------+-------+
| planet_id | name  |
+-----------+-------+
|         7 | Urano |
+-----------+-------+

SELECT planet_id, name FROM planet WHERE planet.name ILIKE '%Neptuno%';
+-----------+---------+
| planet_id |  name   |
+-----------+---------+
|         8 | Neptuno |
+-----------+---------+




SELECT moon_type_id, name FROM moon_type WHERE moon_type.name ILIKE 'Regular';
+--------------+---------+
| moon_type_id |  name   |
+--------------+---------+
|            4 | Regular |
+--------------+---------+

SELECT moon_type_id, name FROM moon_type WHERE moon_type.name ILIKE 'Irregular';
+--------------+-----------+
| moon_type_id |   name    |
+--------------+-----------+
|            5 | Irregular |
+--------------+-----------+

SELECT moon_type_id, name FROM moon_type WHERE moon_type.name ILIKE 'Coorbital';
+--------------+-----------+
| moon_type_id |   name    |
+--------------+-----------+
|            1 | Coorbital |
+--------------+-----------+

*/


-- You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp universe > universe.sql in a bash 
-- terminal (not the psql one). It will save the commands to rebuild your database in universe.sql. The file will 
-- be located where the command was entered. If it's anything inside the project folder, the file will be saved in 
-- the VM. You can rebuild the database by entering psql -U postgres < universe.sql in a terminal where the .sql file is.