-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2016 at 03:40 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cadhac`
--

-- --------------------------------------------------------

--
-- Table structure for table `accion`
--

CREATE TABLE `accion` (
  `id` int(11) NOT NULL,
  `titulo` text COLLATE latin1_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `texto` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `accion`
--

INSERT INTO `accion` (`id`, `titulo`, `fecha`, `texto`) VALUES
(7, 'Carta al periodista Víctor Martínez Lucio y los medios de comunicación en general', '2016-11-28', 'Lorem ipsum dolor sit amet.'),
(8, 'Rechazamos las declaraciones del alcalde víctor fuentes sobre las personas privadas de su libertad', '2016-11-27', 'Lorem ipsum no asdadfasdf'),
(9, 'urge que el gobierno de nuevo león tome medidas diligentes sobre la situación penitenciaria', '2016-11-30', 'asdfasdfasdfadsfadsf'),
(10, 'ministro de perú y colombia vendrán a monterrey para hablar sobre la importancia del debido proceso', '2016-11-09', 'asdfasdfasdfasdfasdfasdfasdfasdfsadf');

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  `imagen` text COLLATE latin1_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `evento_id`, `imagen`) VALUES
(2, 1, '1-1.jpg'),
(3, 1, '1-2.png'),
(9, 1, '1-9.jpg'),
(10, 1, '1-10.jpg'),
(11, 1, '1-11.jpg'),
(12, 1, '1-12.jpg'),
(13, 1, '1-13.jpg'),
(14, 1, '1-14.jpg'),
(15, 2, '2-15.jpg'),
(16, 2, '2-16.jpg'),
(17, 3, '3-17.jpg'),
(18, 3, '3-18.jpg'),
(19, 3, '3-19.jpg'),
(20, 4, '4-20.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comunicado`
--

CREATE TABLE `comunicado` (
  `id` int(11) NOT NULL,
  `titulo` text COLLATE latin1_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `texto` text COLLATE latin1_general_ci NOT NULL,
  `imagen` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `comunicado`
--

INSERT INTO `comunicado` (`id`, `titulo`, `fecha`, `texto`, `imagen`) VALUES
(1, 'Día internacional de las víctimas de Desaparición Forzada: Exigimos justicia y reparación de daño para las víctimas', '2016-08-30', 'Hoy se conmemora el Día Internacional de las Víctimas de Desaparición Forzada, jornada en la que en México y el mundo se demanda verdad, justicia y el fin de la impunidad ante las miles de personas que han sido desaparecidas y separadas involuntariamente de sus seres queridos. ^En el país y en Nuevo León vivimos una crisis humanitaria: miles de personas continúan desaparecidas y sus familias han quedado devastadas emocional y económicamente debido a la violencia generada por el crimen organizado y el propio Estado.^Ante esto, urge que el gobierno de Nuevo León dé respuesta a las diversas necesidades de estas familias, a quienes la reparación del daño les resulta apremiante, en ese sentido es necesaria la real operatividad del Sistema Estatal de Atención a Víctimas y su Comisión Ejecutiva, con un presupuesto, programa y vinculaciones suficientes que le permitan funcionar efectivamente, como lo marca la Ley Estatal de Atención a Víctimas. Asimismo, es imperativo que el Grupo Especializado en Búsqueda Inmediata (GEBI), que actualmente existe en la entidad, opere bajo lo más altos estándares de calidad.^Si bien la Oficina en México del Alto Comisionado de las Naciones Unidas para los Derechos Humanos destacó ayer en su comunicado las experiencias de trabajo conjunto de búsqueda entre autoridades y familias que tenemos en Nuevo León y Coahuila, es necesario decir que en nuestros registros todavía tenemos más de 800 personas por localizar. ^En Ciudadanos en Apoyo a los Derechos Humanos, A.C., hemos documentado casos de desaparición ocurridos desde 2007 hasta la fecha. En nuestro registro las personas desaparecidas ascienden a 1363, de las cuales 35 corresponden al 2016. Además, se han localizado 159 personas: 72 personas vivas y 87 identificadas por perfiles genéticos. De estas, 151 personas localizadas son casos que pertenecen al estado de Nuevo León y 8 personas de Tamaulipas. En 2016 se han localizado 7 a personas: 2 por perfil genético y 5 personas con vida.^Hemos tenido avances pero la problemática no ha sido erradicada.^Seguimos caminando junto a las familias de AMORES con esperanza y fe de que llegaremos a la verdad. Seguimos demandando justicia al Estado y dando seguimiento a los procesos legales, teniendo la convicción de que trabajando junto a las familias encontraremos verdad y justicia.', '1.jpg'),
(5, 'AGRESIONES COTIDIANAS CONTRA LAS MUJERES. DÍA INTERNACIONAL DE LA ELIMINACIÓN DE LA VIOLENCIA CONTRA LA MUJER.', '2016-11-24', 'En el marco del Día Internacional de la Eliminación de la Violencia contra la Mujer, Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) se manifiesta en contra de la violencia de género, invitando a la población a reflexionar sobre los comportamientos sexistas y agresiones hacia las mujeres que son normalizados cotidianamente y que pueden terminar en hechos graves como las desapariciones o asesinatos de mujeres por el solo hecho de ser mujeres (feminicidio).^^Una desaparición o un feminicidio son actos de violencia que rara vez suceden de la noche a la mañana, sino que son expresiones violentas que día con día van escalando hasta terminar en consecuencias tan alarmantes como la muerte de la víctima.^^En el estado tenemos un grave problema de violencia contra la mujer, basta con ver las cifras de la Procuraduría General de Justicia de Nuevo León: en el tema de violencia familiar, de enero a octubre de 2016, han recibido 15 mil 371 denuncias por este delito.^^En lo que toca a las desapariciones, desde CADHAC hemos registrado de mayo 2011 a octubre de 2016 la desaparición de 86 mujeres.^^De acuerdo con cifras del Instituto Estatal de la Mujer, en 2016 (hasta noviembre del presente año) se han reportado 66 casos de mujeres asesinadas, 23 relacionados con la violencia familiar y/o de género.^^En las entidades de nuestro país, la violencia familiar, feminicida y la desaparición de mujeres expresan los retos para el diseño de políticas de equidad, igualdad social, seguridad y protección judicial, hacia la plena vigencia de derechos humanos de las mujeres.^^En Nuevo León, recientemente se aprobó la alerta de género, que es un paso positivo para combatir este problema desde las políticas públicas, pero es imperativo combatirlo también vigilando nuestros comportamientos diarios y estando conscientes de que los machismos alimentan la violencia contra las mujeres.^^Hacemos un llamado al gobierno estatal para redoble esfuerzos en el tema de violencia contra las mujeres, mejore el sistema de prevención y atención a víctimas en este tema, y a la población en general para revisar las violencias cotidianas que han sido permisibles, van creciendo, y debemos revertir, dirigiéndonos hacia el pleno ejercicio de las mujeres a vivir libres de violencia.^^', '5.jpg'),
(8, 'ESTA NAVIDAD, ¡AYÚDANOS A AYUDAR!', '2016-11-14', 'Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. te invitamos a que nos ayudes a llevar alegría a dos grupos de personas con mucha necesidad en esta Navidad.^^Por un lado, arrancamos hoy con la colecta de juguetes (en buen estado) para todos los niños y niñas que tienen algún familiar desaparecido/a. Estos menores forman parte de Amores y viven una situación social, familiar y económica bastante complicada. Con un juguete puedes darles ilusión y alegría esta Navidad. Abajo los detalles sobre cómo puedes ayudar.^^El segundo grupo de personas que puedes apoyar en esta Navidad es a mujeres en reclusión que se encuentras internas en el CEFERESO No. 16, en el estado de Morelos.^^Para ellas iniciamos una colecta de libros, que les ayudarán mucho a enfrentar la situación de reclusión en la que se encuentran. Abajo la información sobre cómo apoyarles.^^La fecha límite para traer tu donativo es el viernes 9 de diciembre.', '8.png'),
(9, 'URGENTE UN ANÁLISIS PROFUNDO SOBRE LA CRISIS EN EL SISTEMA PENITENCIA EN NUEVO LEÓN', '2016-11-02', 'Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. lanzamos un exhorto al gobierno del estado de Nuevo León para que analice profundamente las opciones que existen para reconstruir el sistema penitenciario del estado, ya que la experiencia de privatización de las cárceles en México tiene resultados dudosos y poco transparentes.^^El gobernador Jaime Rodríguez afirmó que se cabildearán recursos para reactivar el proyecto del Penal de Mina con inversión de la iniciativa privada, sin embargo, expertos en la materia como la investigadora y académica, Elena Azaola consideran que la privatización no es la mejor opción.^^“El esquema de privatización es muy costoso y lo que se privilegia es el tema económico, no los modelos de atención para los internos. Entiendo que el gobierno diga que no tiene recursos para construir un nuevo penal pero, al final, termina pagando mucho más y las únicas que ganan son las empresas”, dijo al respecto Azaola.^^Existe autogobierno, cobros de piso, tortura, condiciones de hacinamiento, es decir, la integridad y seguridad de las y los internos está en riesgo permanente, la prueba está en todos los episodios de violencia que se han vivido en el Penal de Topo Chico este año, incluyendo la revuelta de hoy en donde policías de Fuerza Civil resultaron heridos y heridas.^^La solución de todos estos problemas es responsabilidad del Estado. Estas responsabilidades no pueden depositarse en particulares bajo la lógica del mercado, es el Estado en el que tiene obligaciones contundentes en materia de respeto, protección y garantía de los derechos humanos de las quienes están privados de su libertad.^^Es un hecho que el sistema penitenciario de Nuevo León está en crisis, sobre todo el Penal del Topo Chico, sin embargo, es importante destacar que el sistema penitenciario colapsa por apartarse de los principios que se enmarcan en la Constitución, no por falta de inversión del sector privado.^^Existen estudios que confirman lo inconveniente de la participación privada en el sistema penitenciario, como por ejemplo, el informe: “Privatización del sistema penitenciario en México”, presentando este año ante la Comisión Interamericana de Derechos Humanos por diversas organizaciones de la sociedad civil como México Evalúa y la Fundación para el Debido Proceso [1]se deja bien claro los riesgos que traerían para las personas privadas de su libertad.^^The Sentencing Project, una organización estadounidense de la sociedad civil, realizó en 2013 un estudio que analiza el crecimiento de las tendencias privatizadoras de prisiones en países como Estados Unidos, Reino Unido, Australia, Sudáfrica, entre otros, llega a la conclusión de que los servicios prestados en las prisiones privadas no representan una diferencia sustantiva con las prisiones públicas. Señala que el fin preponderante de lucro provoca que los empresarios de la privación de libertad favorezcan las ganancias sobre la calidad de los servicios prestados. Por ejemplo, la atención médica y cuestiones de higiene son sacrificadas para ahorrar costos.[2]^^Por todo lo anterior, exhortamos a las autoridades penitenciarias y al gobierno del estado de Nuevo León tomen en cuenta estos estudios que les permitan contar con más elementos de análisis y así tomar una buena decisión para el sistema penitenciario estatal.^^ ^^ ^^[1] (2016).“Privatización del sistema penitenciario en México”. Ciudad de México. Disponible en: http://mexicoevalua.org/wp-content/uploads/2016/08/privatizacion-sistema-penitenciario.pdf^^[2] Mason, Cody (2013), International growth trends in prison privatization. The Sentencing Project. Washington, D.C. Disponible en http://sentencingproject.org/doc/publications/inc_International% 20Growth%20Trends%20in%20Prison%20Privatization.pdf', '9.jpg'),
(11, 'CADHAC TIENE CASA NUEVA/ CADHAC HAS A NEW HOUSE', '2016-11-01', 'Les compartimos que a partir del 7 de noviembre estaremos en una nueva casa.^^Agradecemos su compresión por las fallas técnicas que estamos teniendo con nuestro servicio telefónico y el de internet debido a los cambios que se están necesitando hacer.^^Seguimos trabajando junto a ustedes en este nuevo lugar.^^We are happy to inform you that CADHAC is changing location starting November 7th. In the poster you will find the details of our new address.^^We will appreciate your patience during this first week if we delay in responding emails, we may have some internet and phone problems due to our moving, but they will be solved briefly.^^We are ready to keep working together with you in our new place.', '11.png'),
(12, 'PRIMERA REUNIÓN CON AUTORIDADES EN PROYECTO DE INTERVENCIÓN COMUNITARIA EN SAN ÁNGEL', '2016-11-23', 'El 22 de noviembre Ciudadanos en Apoyo a los Derechos Humanos (CADHAC) y vecinos de la Colonia San Ángel y Ejido los Remates sostuvieron una reunión con el Alcalde de Monterrey, Adrián de la Garza, en la que expusieron algunas de sus problemáticas más apremiantes.^^Esta reunión es parte de un programa de intervención comunitaria de CADHAC que propicia la participación ciudadana para solucionar problemas sentidos de la comunidad. En este proceso, que se enmarca en un proyecto de Seguridad Ciudadana, la organización busca fortalecer el diálogo entre la comunidad y el gobierno para solucionar sus problemas y modificar factores que generan inseguridad.^^Los pasos anteriores a esta reunión implicaron más de 1,300 visitas domiciliarias, en las que CADHAC con apoyo de estudiantes y maestras de la Universidad Pedagógica Nacional (UPN) invitó a los vecinos a participar en reuniones semanales, en las que se hizo un diagnóstico comunitario para primero conocer los problemas de la comunidad y posteriormente priorizar las necesidades más urgentes. Fue así como decidieron la agenda comunitaria que presentaron ayer a las autoridades municipales.^^La reunión estuvo encabezada por Adrián de la Garza, Alcalde de Monterrey; Roberto Garza, Secretario de Desarrollo Social; Marcelo Segovia, Secretario de Servicios Públicos; Javier Sánchez, Secretario de Obras Públicas; la Hna. Consuelo Morales, directora de CADHAC; y por parte de los vecinos la Sra. Lourdes Araiza.^^El evento se llevó a cabo en el Salón Polivalente de Cáritas de Monterrey, ubicado en la misma colonia, a donde asistieron 30 vecinos, más de una decena de funcionarios del Municipio de Monterrey de diferentes niveles, y el equipo CADHAC con maestros y voluntarias de la UPN.^^Participaron en la presentación Sonia Torres, coordinadora del programa; y los vecinos Miguel Torres y Leticia Gómez, quienes expusieron la historia de la colonia y refirieron una serie de problemáticas que muestran la situación de abandono, pobreza e inseguridad en la que se encuentran.^^Al finalizar, el Alcalde de Monterrey se comprometió a resolver en los próximos dos meses las siguientes tareas:^^Reparar, cambiar o instalar las luminarias de la colonia para que esté bien iluminada ya que los vecinos se sienten inseguros al caminar por la noche en calles oscuras.^Hacer un estudio de campo para resolver las problemáticas de las privadas, que son callejones que se fueron formando sin planeación y en los que la falta de drenaje y de agua constituyen factores de graves problemas de salud y conflictos vecinales.^Resolver las necesidades particulares de tres vecinas cuyos techos se encuentran en malas condiciones por lo que se les inundan sus casas en tiempo de lluvias.^Revisar la zona para detectar un área donde se pudiera poner un parque puesto que los vecinos no tienen zonas de esparcimiento.^Favorecer el diálogo con autoridades del Gobierno estatal para que los vecinos señalen los problemas que tienen con el transporte público.^Se reflexionó que para resolver la situación es necesario contar con el trabajo conjunto de los ciudadanos y autoridades, por lo que con la anuencia de ambos actores se perfila la posibilidad de que esta experiencia sea muy exitosa.^^“Si ustedes nos ayudan, si ustedes se involucran con nosotros, a CADHAC, ustedes y nosotros nadie nos va a parar”, expresó el Alcalde de Monterrey.^^La reunión finalizó con los compromisos antes mencionados y el acuerdo de una segunda reunión en enero 2017 a fin de revisar los resultados y avances de estos compromisos.^^', '12.jpg'),
(13, 'OTRA RIÑA EN EL PENAL DEL TOPO CHICO…RESULTA INACEPTABLE', '2016-10-13', 'Una nueva riña ha ocurrido hoy en el Centro Preventivo de Reinserción Social Topo Chico. De acuerdo con medios de comunicación, esta riña ha dejado un saldo de un interno muerto y al menos 8 heridos (de los cuales 7 tuvieron que ser hospitalizados). Este hecho resulta completamente inaceptable ante el supuesto control asumido por las autoridades estatales.^^Una y otra vez hemos urgido al gobierno de Nuevo León dar prioridad a la seguridad y a la integridad física de las personas en los centros penitenciarios, pero esta solicitud parece ser minimizada. Las condiciones de vida de las y los internos en los centros penitenciarios estatales deben ser prioridad para que así proteger la integridad de las personas recluidas, cuya seguridad es únicamente responsabilidad del Estado.^^La muerte de Cristian Rubén Cantú Gómez, sucedida el día de hoy, suma la número 57 de las sucedidas en 2016 (56 en el Topo chico y 1 uno en Cadereyta). Lo que conlleva la responsabilidad de una investigación objetiva que concluya en la reparación a sus familiares por la muerte violenta de su ser querido.^^Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) consideramos que es urgente que se ejecuten las medidas necesarias para contener este gravísima situación y esclarecer la realidad de lo sucedido, así como la sanción correspondiente de los responsables.^^ ^^¡Ni una muerte más en los penales estatales de Nuevo León!', '13.jpg'),
(16, 'TE INVITAMOS A LA REUNIÓN 27 DE REVISIÓN DE EXPEDIENTES ENTRE CADHAC, AMORES Y LA PGJNL', '2016-10-10', '.', '16.jpg'),
(17, 'SE REGISTRA LA PRIMERA MUERTE DEL AÑO EN EL PENAL DE CADEREYTA', '2016-10-05', 'Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) lamenta la muerte de Julio César Verde Hernández, interno del Centro Preventivo y de Reinserción Social Cadereyta, quien falleció a consecuencia de las heridas recibidas en riña el día 28 de septiembre del año en curso.^^La muerte de Verde Hernández es la primera en este año a consecuencia de la violencia en este centro penitenciario. Reiteramos que el Penal de Cadereyta se ha distinguido por ser el que mejores niveles de seguridad y calidad de vida ofrece a los internos y es muy lamentable que estas condiciones se estén perdiendo.^^Exhortamos a las autoridades estatales a que vigilen la situación de los tres centros penitenciarios de Nuevo León, protejan la integridad física de cada una de las personas recluidas en ellos y realicen las estrategias correspondientes para este fin.^^Tan solo en este año CADHAC tiene registradas al menos 56 muertes en los centros penitenciario de Nuevo León (Topo Chico y Cadereyta), lo que resulta muy lamentable pues la seguridad de estas personas estaba bajo la responsabilidad directa de las autoridades estatales.', 'default.jpg'),
(18, 'URGE FORTALECER LAS MEDIDAS DE SEGURIDAD EN EL PENAL DE CADEREYTA', '2016-09-29', 'Una vez más los centros penitenciarios en Nuevo León son noticia. Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. lamentamos que el sistema penitenciario estatal siga mostrando fallas en la seguridad.^^Ayer se registró una riña entre grupos rivales de la delincuencia organizada en el Centro de Readaptación Social Cadereyta, en donde tres internos resultaron heridos. De acuerdo con los medios de comunicación, fueron al menos 10 internos los que se enfrentaron a golpes y con puntillas, pero fueron sometidos a tiempo por el personal de seguridad del penal.^^No nos sorprende que un evento de esta naturaleza haya sucedido en el penal de Cadereyta, pues recientemente hemos recibido reportes de que la seguridad en este lugar podría estar siendo vulnerada debido a ciertos traslados que se están realizando del penal del Topo Chico hacia el del Cadereyta.^^Urgimos a las autoridades estatales a tomar las medidas necesarias para fortalecer las medidas de seguridad que siempre se habían tenido en este centro penitenciario, que se distinguía por tener las mejores condiciones de seguridad y calidad de vida para los internos.^^De nuevo hacemos hincapié en que la seguridad de las personas privadas de su libertad es responsabilidad de las autoridades. El Estado tiene la obligación de garantizar el derecho a la vida y la integridad de las personas internas; y los hechos ocurridos ayer demuestran nuevamente que el Gobierno del Estado sigue fallando en esta labor.', '18.jpg'),
(19, 'CASO AYOTZINAPA PUSO AL DESNUDO SISTEMA JUDICIAL MEXICANO', '2016-09-25', 'Se cumplen dos años de la desaparición de los 43 estudiantes de Ayotzinapa. Lo ocurrido el 26 de septiembre de 2014 puso en la mira internacional la grave crisis de derechos humanos y del sistema judicial que se vive en México desde hace más de una década. Es alarmante que, a pesar de que la desaparición de los 43 es un caso emblemático, las autoridades no han podido dar con el paradero de los muchachos ni con los verdaderos responsables de su desaparición, sino por el contrario: sus investigaciones han derivado en conclusiones cuestionadas por instancias y expertos internacionales.^^Es urgente que el gobierno federal asuma su responsabilidad en este caso que es considerado paradigmático por instancias como la Comisión Interamericana de Derechos Humanos y Naciones Unidas, y en todos los cientos de casos sin resolver que existen en todo el país. Cada día que pasa sin conocer el paradero de estos jóvenes representa un golpe a nuestro sistema de justicia y al corazón de los padres y madres de estos estudiantes.^^Es de suma relevancia tener presente que la ausencia de acceso a la justicia en el caso de Ayotzinapa revela la incompetencia generalizada que existe para localizar a las más de veinte mil personas desaparecidas en nuestro país.^^El impacto en cada una de las familias es devastador, así como la afectación al conjunto de la sociedad. Es urgente que el gobierno actúe en lo inmediato, tanto para proporcionar apoyo integral a las víctimas, como para dar con el paradero de las personas desaparecidas.^^¿Dónde están los 43 estudiantes de Ayotzinapa?, ¿Dónde están las cientos de personas desaparecidas en Nuevo León?, ¿Dónde están todas y todos los desaparecidos en el país? ¡Exigimos justicia y saber dónde están!', '19.jpg'),
(20, 'EL MUNICIPIO DE SAN NICOLÁS DEBE RESPONSABILIZARSE POR MUERTE DE HUMBERTO BELMARES MONTANTES', '2016-09-20', 'Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) exigimos al ayuntamiento de San Nicolás actúe con firmeza y esclarezca la muerte de Humberto Belmares Montantes, quien fue detenido por la Polisan el jueves 15 de septiembre.^^De acuerdo con los medios de comunicación, el ahora occiso fue detenido por consumir alcohol en la vía pública y sus padres, al no poder pagar la multa, decidieron dejarlo detenido por 36 horas. Sin embargo, dentro de ese tiempo que Belmares Montantes estuvo bajo la custodia del municipio de San Nicolás, sufrió una fractura de cráneo, misma que presuntamente le ocasionó la muerte.^^Al respecto, el Edil Víctor Fuentes afirmó que se trató de un accidente, pues Belmares Montantes cayó de una litera de dos metros de altura debido a su estado de ebriedad, dicho que requiere ser validado con dictámenes médicos correspondientes.^^Consideramos que este incidente es muy grave, pues el ahora occiso se encontraba bajo el cuidado de la autoridad. Es imperativo que la administración de Víctor Fuentes dé respuesta inmediata a la familia de Belmares Montantes a través de una investigación objetiva que esclarezca el motivo y causas de este fallecimiento, además de reparar el daño.^^Recordemos que de acuerdo a la Constitución[1] y tratados internacionales, corresponde al Estado garantizar la seguridad, integridad y derechos de todas las personas que se encuentran en su municipio y de manera especial quienes se están privadas de su libertad.^^[1] Art. 115 Constitucional habla sobre la función de los municipios de proveer seguridad pública. En los casos de Vélez Loor v. Panamá, Neira Alegría y otros v. Perú y Pacheco Teruel y otros v. Honduras, la Corte Interamericana de Derechos Humanos ha reiterado el carácter especial de garante de todos los derechos de las personas en los centros de detención.', '20.jpg'),
(21, 'ROBERTA JACOBSON, EMBAJADORA DE ESTADOS UNIDOS EN MÉXICO, SE REUNIÓ CON AMORES Y CADHAC', '2016-09-14', 'La Embajadora de Estados Unidos en México, Roberta Jacobson, estuvo hoy en Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) para conversar con nuestro equipo y con integrantes de la Agrupación de Mujeres Organizadas por los Ejecutados, Secuestrados y Desaparecidos (Amores).^^Durante la hora que la Embajadora Jacobson estuvo en CADHAC tuvimos la oportunidad de platicar con ella sobre nuestras preocupaciones y temas de nuestro interés en Nuevo León, en la primera parte del encuentro.^^Después, las familias integrantes de Amores le presentaron a la Embajadora estadounidense un video con la historia de Tanya González, cuyo esposo Felipe de Jesús Pérez se encuentra desaparecidos desde 2013. También estuvieron compartiendo algunos de sus casos con la diplomática.^^“Ahora con el conocimeinto de sus casos reconozco el coraje que tienen ustedes y espero que eso les ayude a continuar su lucha y cuenten con la pequeña parte que yo pueda contribuir a eso, es una pequeña parte, yo sé, pero cuentan conmigo”, dijo la Embajadora a las familias^^Por su parte, la Hermana Consuelo Morales,directora de CADHAC, agradeció la visita recalcando que el apoyo de los diplomáticos es importante, pues nos dejan claro que las familias no están solas.^^“Tenemos unos ángeles que nos ayudan, son ustedes, y no estamos solas”, dijo al final del encuentro la directora de CADHAC.^^Para despedirse, la Embajadora entregó a CADHAC una figura de un corazón dorado como regalo y las familias le entregaron el libro “Te Seguiré Buscando”, que contiene algunas de las historias de sus personas desaparecidas.', '21.jpg'),
(22, 'EJECUCIÓN EXTRAJUDICIAL DE GUSTAVO ACOSTA LUJÁN POR MARINOS: 5 AÑOS DE IMPUNIDAD', '2016-09-03', 'Ciudadanos en Apoyo a los Derechos Humanos, A.C. junto a Eva Luján -madre de Gustavo Acosta- y su familia, exigimos el esclarecimiento de los hechos en los que integrantes de la Marina ejecutaron extrajudicialmente a Gustavo Acosta Luján en el año 2011, así como resarcir el daño a la víctima y su familia por seguir relacionando a Gustavo con la delincuencia organizada.^^El 1 de septiembre de 2011, Gustavo Acosta, de entonces 31 años, se encontraba en su casa con su familia, en el municipio de Apodaca, Nuevo León, cuando escuchó que un grupo de marinos estaba afuera disparando y gritando. Gustavo Acosta les dijo que esperaran, que les iba a abrir la puerta. Al abrir, en respuesta, recibió dos impactos de bala que terminaron con su vida. Acto seguido los marinos sacaron a la familia y manipularon la escena del crimen “sembrando” armas y señalando a la víctima como integrante de un grupo delictivo.^^Ese crimen se presentó en un contexto de ataques generalizados y sistemáticos en contra de la población civil, provenientes de una política pública ilegal que comprendía militarizar la seguridad pública, contraviniendo de esta manera diversas recomendaciones internacionales de derechos humanos. La ejecución extrajudicial de Gustavo Acosta Luján, sigue los patrones detectados en las violaciones de derechos humanos cometidas durante de la llamada “guerra” contra el narcotráfico:^^Uso indiscriminado y arbitrario de la fuerza ante la ausencia de una reglamentación.^Actividad preponderante de elementos militares en investigaciones sobre la comisión de delitos.^Manipulación de la escena del crimen y “siembra” de armas y otras pruebas.^Criminalización de las víctimas, ya que sigue en la internet el comunicado de la Secretaría de la Marina en donde se presenta a Gustavo Acosta como presunto delincuente.^Deficiente integración de la investigación por parte del Ministerio Público, motivo por el cual no hay ninguna persona consignada por el homicidio de Gustavo Acosta.^La actuación de los marinos en este caso ocasionó un impacto irreversible en la familia. Cabe decir que la ejecución se realizó estando el papá de Gustavo tras su espalda, mientras su madre, hermanos y sobrina se encontraban en la misma casa, de donde fueron sacados agresivamente, generando secuelas que no terminan por sanar.^^Por todo lo anterior, CADHAC exige a la Procuraduría General de la República (PGR) complete la investigación de la ejecución extrajudicial señalada, realice la consignación correspondiente ante la autoridad judicial y, así, se sancione a los marinos responsables de la muerte de Gustavo Acosta Luján. En el mismo sentido es urgente resarcir el daño y desmentir públicamente, por parte de la Marina, la criminalización hecha contra Gustavo Acosta.', '22.jpg'),
(23, 'POSTURA DE JERARCAS, ¿CRISTIANA?', '2016-08-19', 'Editorial publicada en Reforma^OPINIÓN INVITADA / PRESBÍTERO DAVID FERNÁNDEZ S.J.^Una de las frases más citadas del Papa Francisco es aquella que externó cuando, a su vuelta de Río de Janeiro, los periodistas le preguntaron sobre las personas homosexuales.^^“¿Quién soy yo para juzgarlos?”, dijo. Con esa expresión, ponía en práctica lo que expresó él en Roma desde el principio de su pontificado: “hay que dar menos importancia a las normas y más a la misericordia”.^^De hecho, en un documento de trabajo difundido en el mes de junio de 2014, el Papa jesuita señalaba, en alusión a las personas homosexuales, que “los católicos del mundo deben ser menos excluyentes y más humildes”. Más recientemente, también afirmó que la Iglesia debería pedir perdón a los y las homosexuales.^^En el documento preparatorio del Sínodo de Obispos de octubre de 2014 el Papa afirmó que, aunque los jerarcas sigan oponiéndose a las uniones entre personas del mismo sexo, “la Iglesia católica debe tener una actitud respetuosa”. Y un tono semejante, comedido, tuvo el documento oficial publicado en esa ocasión.^^Más misericordia quiere decir un trato respetuoso, afectuoso, con cariño, por todas las personas, incluidas aquellas cuya sexualidad es diversa a la de la mayoría. Algo que tiene que entender la Iglesia a la que pertenezco es que, mientras queramos seguir siendo cristianos seguidores de Jesús, debemos respetar a las personas gays y lesbianas.^^Desafortunadamente, no es precisamente esto lo que estamos viendo en estos días de debate sobre la iniciativa del Ejecutivo acerca del matrimonio igualitario.^^Muchos sacerdotes y dignatarios eclesiásticos, siguiendo la postura oficial de la Iglesia, afirman que ser homosexual no es pecado; pero al mismo tiempo preconizan que los homosexuales no deben practicar su homosexualidad, y los exhortan a abstenerse. Esto para mí es muy difícil de entender.^^Esa misma Iglesia que llama a la abstinencia postula que el celibato y la castidad son dones de Dios. Es decir, que no se pueden forzar: a unos los da y a otros no. ¿Todas las lesbianas y personas transgénero u homosexuales tienen el don de la castidad? Probablemente alguna de las dos posturas que sostiene la Iglesia debe estar equivocada. Obligar a algo que es un don, ¿es posible?^^Muchas veces, delante de Dios me he hecho esa y otras preguntas y admito que me siento confundido. ¿Podrá el Dios revelado por Jesús, el Dios de la misericordia, de la ternura, de la liberación, de la solidaridad, nuestro buen Padre Dios, exigirle obligatoriamente a un joven que nació homosexual o lesbiana que guarde un celibato impuesto hasta el día de su muerte?^^Y luego me pregunto de nuevo. ¿Podría ese Dios que es Padre y Madre buenos, ese Dios bondadoso y benévolo, exigir a un joven o una joven que nacieron distintos, que nunca, en toda su vida, tengan una pareja y expresen hacia ella su amor?^^Hay muchas hipótesis y teorías sobre el origen de estas sexualidades minoritarias. La discusión continúa y me confieso abierto a lo que la ciencia diga. Pero lo que puedo afirmar con toda rotundidad es que, en mi experiencia pastoral y educativa, la enorme mayoría de las personas que se consideran homosexuales lo descubrieron desde pequeños, y se asumen así desde su nacimiento.^^Su sexualidad no es mayoritaria, ciertamente, pero tampoco es anormal: justo igual que los zurdos. En todas las culturas, las más homofóbicas, incluso en aquellas en la que la homosexualidad se penaliza con la muerte, siempre hay un porcentaje constante de personas con estas orientaciones, que ronda entre el 6 y el 10 por ciento. De manera que lo verdaderamente importante para nosotros cristianos es que creemos que a todos y todas los ha creado Dios. Así como son.^^Y después de tratar a muchos durante mucho tiempo puedo afirmar que buena parte de ellos son excelentes seres humanos, sensibles, afectuosos, comprometidos, devotos del servicio y la compasión. Me atrevo a decir que Dios no sólo los ama, sino que le caen bien.^^¿Puede la Iglesia privar a estas personas del derecho al ejercicio genital de su sexualidad?^^Cuando la Carta a los Romanos habla de su condena a “cambiar el uso natural por otro contra la naturaleza”, el autor no tenía ni idea de las realidades que nosotros conocemos ahora de manera más científica sobre la sexualidad, y pensaban que sólo eran costumbres de paganos e idólatras.^^En el debate actual una pregunta central es si la unión de personas del mismo sexo es matrimonio u otra cosa. No lo sé. Pero me pregunto de nuevo: ¿discriminarlos es auténticamente humano, digno de un Dios fiel a lo que ha creado y rebosante de misericordia? Me siento ofuscado.^^Si a nosotros sacerdotes católicos que hemos abrazado libremente el celibato nos cuesta mucho trabajo ser fieles hasta la muerte, ¿cómo será para las personas homosexuales, lesbianas, transgénero o transexuales, llevar esa carga impuesta contra su voluntad por los años sin cuento que tienen por vivir después de confesarse a sí mismos y a sí mismas su condición?^^El Dios de Jesucristo es antes que nada misericordia, amor, perdón, cercanía, comprensión, ternura. Y no hace acepción de personas, no tiene preferencia entre sus hijos e hijas.^^El autor es Rector de la Universidad Iberoamericana.^^Disponible: http://www.elnorte.com/aplicaciones/editoriales/editorial.aspx?id=95223', '23.jpg'),
(24, 'PREOCUPANTE ESTRATEGIA DE SEGURIDAD DEL MUNICIPIO DE SAN NICOLÁS', '2016-08-31', 'Desde Ciudadanos en Apoyo a los Derechos Humanos, A.C. expresamos una vez más nuestro absoluto rechazo ante las declaraciones del Alcalde de San Nicolás de los Garza, Víctor Fuentes.^^Hace unos días medios de comunicación difundieron declaraciones del Edil en donde habló de sus intenciones de contratar [1]francotiradores con el objetivo de combatir el crimen en su municipio.^^Esto es muy preocupante. Si bien la policía debe ser capacitada, el enfoque y discurso del Alcalde nicolaíta abona a crear un ambiente de violencia y a la estigmatización de quienes entran en conflicto con la justicia, y lo que es mas grave, que pareciera invitar a su policía a actuar fuera del marco de la ley.^^En reiteradas ocasiones nos hemos pronunciado a favor de una policía de proximidad, una política de seguridad enfocada en la prevención y en contra de la constante militarización y política de seguridad reactiva. Expertos y la experiencia nos dicen, que por ningún motivo se debe combatir un delito, cometiendo otro delito.^^El Alcalde señala que sabrá lidiar con las agrupaciones de derechos humanos para que no se intente proteger más al criminal que al ciudadano. No sabemos si este tipo de señalamientos son de su propia convicción, o bien, pareciera pretender confundir a la población, ya que esa es una falsa disyuntiva: se deben de respetar todos los derechos humanos de todas las personas, así también se deben llevar ante la ley a cualquier persona que cometa delito, sea de la sociedad civil o sean servidores públicos.^^El camino a seguir es el de la seguridad ciudadana, no la lógica de guerra; el respeto irrestricto de los derechos humanos de la ciudadanía y el fortalecimiento de las instituciones para que se pueda respetar el debido proceso y sancionar a quienes sean verdaderamente responsables de los delitos.^^Invitamos al Alcalde de San Nicolás a consultar expertos en este tema, a explorar estrategias menos violentas y capacitar a sus elementos de seguridad en la lógica de la seguridad ciudadana y el respeto los principios constitucionales, para que pueda garantizar la seguridad de todos los nicolaítas.^^ ^^[1] Mendieta, Eduardo. 2016.“San Nicolás tendrá 50 francotiradores”. Milenio. Disponible en: http://www.milenio.com/region/milenio_noticias-san_nicolas_tendra_francotiradores-policia_san_nicolas_0_800920047.html', '24.jpg'),
(25, 'RETROCESO DE LA SCJN: CRITERIO DE LA PRIMERA SALA PODRÍA VALIDAR CONDENAS BASADAS EN TORTURA', '2016-08-23', '23 de agosto de 2016.- Externamos nuestro rechazo ante la tesis aislada CCV/2016 publicada el 19 de agosto por la Primera Sala de la Suprema Corte de Justicia de la Nación, la cual plantea que no procede reponer procesos penales para investigar actos de tortura denunciados por la defensa, a no ser que exista confesión o “autoincriminación” de la persona acusada.^^En otras palabras, si la declaración bajo tortura de la persona acusada no es calificada como confesión; si una persona es torturada para que incrimine a otra; o si la tortura produce cualquier otra prueba distinta a la autoincriminación, podrían quedar intactas las condenas basadas en tales pruebas ilícitas, según la regla aprobada por los Ministros Pardo Rebolledo, Cossío Díaz y Zaldívar Lelo de Larrea.^^Por esta razón, la tesis es violatoria de la prohibición absoluta de dar validez a cualquier prueba obtenida mediante tortura, reflejada en la Constitución (“Cualquier prueba obtenida con violación de derechos fundamentales será nula”[1]), el Código Nacional de Procedimientos Penales y numerosos tratados internacionales.^^El año pasado, el Relator Especial sobre Tortura de la ONU recordó las obligaciones de las autoridades judiciales bajo diversos tratados ratificados por México, incluyendo la de excluir “cualquier prueba o declaración respecto de la cual existan razones para creer que ha sido obtenida bajo tortura”[2]. La Corte Interamericana, misma que actualmente se encuentra en México a invitación de la propia SCJN, ha reiterado que “la regla de exclusión de pruebas obtenidas mediante la tortura… ostenta un carácter absoluto e inderogable”[3], observando además que “las declaraciones obtenidas mediante coacción no suelen ser veraces”[4].^^Recordamos que permitir que las condenas sigan basándose en declaraciones o pruebas fabricadas bajo tortura, significaría frenar desde el inicio el proyecto de transformación que debería representar el nuevo sistema penal. En tal escenario, en vez de mejorar la calidad de las investigaciones penales, el país seguiría en un ciclo vicioso, en el que la poca capacidad para investigar conlleva la falta de esclarecimiento y sanción de la gran mayoría de delitos cometidos, así como la fabricación de culpables mediante la tortura, entre otros, con tal de ocultar el tamaño de la impunidad.^^Por todo lo anterior, hacemos un enérgico llamado a la Primera Sala a modificar su criterio, aclarando que ninguna prueba obtenida mediante tortura es válida.^^ ^^Asistencia Legal por los Derechos Humanos (ASILEGAL)^^Asociadas por lo Justo (JASS)^^Asociación de Familiares de Detenidos Desaparecidos y Víctimas de Violaciones de Derechos Humanos en México (AFADEM-FEDEFAM)^^Centro de Derechos Humanos de la Montaña Tlachinollan^^Centro de Derechos Humanos de las Mujeres (CEDEHM)^^Centro de Derechos Humanos Fray Bartolomé de las Casas^^Centro de Derechos Humanos Fray Francisco de Vitoria^^Centro de Derechos Humanos Miguel Agustín Pro Juárez (Centro Prodh)^^Centro de Derechos Humanos Paso del Norte^^Centro de Derechos Humanos Zeferino Ladrillero^^Centro de Justicia para la Paz y el Desarrollo (CEPAD)^^Ciudadanos en Apoyo a los Derechos Humanos (CADHAC)^^Colectivo Contra la Tortura y la Impunidad (CCTI)^^Comisión Ciudadana de Derechos Humanos del Noroeste (CCDH)^^Comisión Independiente de Derechos Humanos de Morelos^^Comisión Mexicana de Defensa y Promoción de los Derechos Humanos (CMDPDH)^^Comité de Defensa Integral de Derechos Humanos Gobixha (Código DH)^^Documenta, Análisis y Acción para la Justicia Social^^Equis, Justicia para las Mujeres^^Fundación para el Debido Proceso (DPLF)^^Fundar, Centro de Análisis e Investigación^^I(dh)eas, Litigio Estratégico en Derechos Humanos^^Indignación – Promoción y Defensa de los Derechos Humanos^^Instituto de Justicia Procesal Penal (IJPP)^^Instituto Mexicano de Derechos Humanos y Democracia (IMDHD)^^Instituto para la Seguridad y la Democracia (INSYDE)^^Red Nacional de Organismos Civiles de Derechos Humanos, Todos los Derechos Para Todas y Todos (REDTDT)^^[1] Artículo 20(A)(9).^^[2] Informe sobre México del Relator Especial sobre tortura, A/HRC/28/68/Add.3, párr. 83(d).^^[3] Corte IDH, Cabrera García y Montiel Flores v. México, párr. 165.^^[4] Ibíd., párr. 167.', '25.png'),
(26, 'MAGISTRADOS COMPARTEN VISIONES SOBRE EL RESPETO AL DEBIDO PROCESO', '2016-08-16', 'Ayer por la tarde se llevó a cabo la conferencia “La importancia del debido proceso en contextos de violencia”, organizada por Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC), la Fundación para el Debido Proceso (DPLF) y el Tribunal Superior de Justicia de Nuevo León (TSJNL). Este evento fue encabezado por los Magistrados Alfredo Beltrán Sierra, de Colombia, César San Martín, de Perú, y Carlos Arenas Bátiz, de México.^^Los tres expertos señalaron la importancia del respeto al debido procesos para la construcción y existencia de un Estado verdaderamente democrático. Coincidieron en que los derechos fundamentales de todos los individuos deben ser respetados, y que el debido proceso garantiza el acceso a la justicia.^^Además hicieron un llamado para que las autoridades no justifiquen graves violaciones a los derechos humanos, como la tortura, en aras de combatir la violencia y el crimen organizado.^^“Esta práctica (torturar a una persona y hacerla firmar una confesión) nació del medievo, de la Inquisición y es una grave violación a los derechos humanos”, dijo Beltrán Sierra durante su intervención”.^^Sobre las críticas al nuevo Sistema Penal Acusatorio, que permite llevar procesos en libertad y por el cual se prevé la liberación de presos por delitos menores que hayan llevado más de la mitad de su condena, los tres magistrados coincidieron en que este sistema permite mejorar los procesos de imputación.^^“La ciudadanía no debe alarmarse porque se cumpla la ley, la alarma debe ser porque no se cumpla la ley”, expresó Beltrán Sierra.^^El Magistrado peruano César San Martín, por su parte, añadió que una sociedad segura no se mide por el número de personas que estén privadas de su libertad.^^“Una sociedad no es más sana o más segura cuantos más presos tiene, al contrario, es más insegura, porque uno tiene que preguntarse cuántos inocentes están presos”, consideró San Martín.^^Finalmente, en entrevista, el Magistrado Carlos Arenas Bátiz reiteró que el respeto al debido proceso y un combate efectivo al crimen organizado y la violencia no están peleado.^^“Dejemos o superemos esa falsa disyuntiva entre o respeto al debido proceso y los derechos humanos o eficacia en el combate al crimen, esa es una disyuntiva falsa, es un falso dilema”, aseguró Arenas Bátiz.', '26.jpg'),
(27, 'MINISTROS DE PERÚ Y COLOMBIA VENDRÁN A MONTERREY PARA HABLAR SOBRE LA IMPORTANCIA DEL DEBIDO PROCESO', '2016-08-08', 'Ciudadanos en Apoyo a los Derechos Humanos, A.C., la Fundación para el Debido Proceso y el Tribunal Superior de Justicia de Nuevo León (TSJ) unimos esfuerzos para traer a dos ministros de las respectivas Cortes Supremas de sus países en un evento en donde trataremos la importancia del debido proceso.^^El lunes 15 de agosto, los Ministros Alfredo Beltrán Sierra, de Perú, y Carlos San Martín, de Colombia, darán la conferencia: “La Importancia del Debido Proceso en contextos de Violencia”, junto al Magistrado Carlos Emilio Arenas Bátiz en la Sala Jorge A. Treviño del TSJ a las 17:00 horas.^^“El debido proceso es un derecho humano, es una garantía constitucional que debe estar presente en todos los procesos y no me refiero solamente a los procesos penales también a los procesos civiles, mercantiles, en todos los procesos, el artículo 14 constitucional establece la garantía del debido proceso. Creo que va a ser muy interesante la presencia de estos dos ministros de países con muchos más conflictos que los nuestros y a pesar de esos conflictos han salido adelante”, dijo el Magistrado Carlos Arenas durante el anuncio del evento.^^Para CADHAC este tema es importante porque el respeto a los derechos humanos y el respeto al debido proceso van unidos.^^“El combate a la delincuencia organizada y el respeto al debido proceso es algo que las autoridades debemos lograr de manera conjunta, no una cosa o la otra”, coincidió el Magistrado Arenas.^^La invitación a la conferencia del lunes 15 es para el público en general y la entrada es libre. Durante su visita los Ministros también sostendrán encuentros privados con académicos, columnistas e integrantes de organizaciones de la sociedad civil.', '27.jpg'),
(28, 'CARTA AL PERIODISTA VÍCTOR MARTÍNEZ LUCIO Y LOS MEDIOS DE COMUNICACIÓN EN GENERAL', '2016-08-04', 'Desde Ciudadanos en Apoyo a los Derechos Humanos A.C. le compartimos algunas ideas que consideramos importantes para precisar en relación a su comentario del día de hoy en “El Pulso” (Telediario):^^Es importante resaltar que las liberaciones que puedan darse a favor de personas privadas de su libertad, son en el marco de la legalidad establecida por nuestras y nuestros legisladores, lo que significa que las personas serán liberadas por haber cumplido con la sanción que la ley establece como necesaria para extinguir su obligación penal. Quienes obtengan su libertad será porque ya cumplieron su deuda con la sociedad.^Una vez que la persona cumple su sanción de privación de libertad, el Estado tiene la obligación de garantizar y proteger todos los derechos que le fueron suspendidos al momento de privarle de su libertad.^Referirse a cualquier persona como “rateros” o “ladrones” estigmatiza y criminaliza a una persona para toda su vida. La forma correcta de llamar a una persona que ha cometido un delito es esa, persona que ha cometido un robo, etc.^La declaración de un alcalde en el sentido de que vigilará particularmente a estas personas liberadas, contraría la integridad y seguridad y muchos otros derechos de estas personas, por no encontrarse fundada ni motivada.^Durante su intervención al aire habló sobre qué podría pasar con los índices delictivos cuando estas personas obtengan su libertad. Esto va a depender mucho de la actitud de las autoridades y de la sociedad, si éstos respetan sus derechos para que puedan conseguir un trabajo, para que tengan una vivienda, para que puedan tener las condiciones mínimas de dignidad para vivir, no hay ninguna razón para pensar que los índices delictivos van a subir. En cambio, si el Estado no provee las condiciones mínimas para su trabajo, manutención de salud, limitando sus posibilidades de conseguir trabajo al evitar que pueda obtener una licencia de manejo, al no poder tener una carta de no antecedentes difícilmente podrá encontrar un trabajo…de una forma sutil o cruel se estaría orillando a estas personas a una salida falsa, es decir, volver a delinquir.^Finalmente, reiteramos que todas las personas incluyendo las que han sido víctimas de delitos o víctimas de violaciones a derechos humanos tienen el derecho de que éstos le sean reconocidos y respetados.^Si no entendemos que los derechos humanos no son para “defender delincuentes”, sino defender el respeto a la dignidad humana, la legalidad y el Estado de Derechos, difícilmente tendremos una sociedad más justa con condiciones para reconstruir el tejido social.^^Quedamos a tus órdenes para cualquier duda.', 'default.jpg'),
(31, 'CONCLUYÓ LA 46 ASAMBLEA DE LA OEA EN REPÚBLICA DOMINICANA. CADHAC PRESENTE', '1969-12-31', 'La 46 Asamblea de la Organización de los Estados Americanos (OEA), que se llevó a cabo en Republica Dominicana y que tuvo como tema: “Fortalecimiento Institucional para el Fortalecimiento Sostenible en las Americas”, terminó ayer por la noche. Sin embargo, a lo largo de este evento se presentaron algunos incidentes.^^Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) estuvo presente, al igual que otras 500 organizaciones de la sociedad civil de todo el continente. El objetivo de las organizaciones de la sociedad civil al asistir a una asamblea de esta índole, es compartir sus preocupaciones en el tema de derechos humanos con los Estados que integran la OEA.^^Una primera preocupación fue que desde el inicio de las sesiones, antes del arranque del evento principal, el trabajo se vio entorpecido por grupos anti-derechos (porque atentan a la progresividad de los derechos humanos), provenientes de diferentes países, que dificultaron el trabajo de las organizaciones en las meses de trabajo por sus constantes interrupciones que pretendían colocar solamente los temas de su agenda: la defensa de la “familia tradicional” y la prohibición de la interrupción legal del embarazo.^^Un segundo momento de preocupación llegó cuando el lunes 13 de junio, la OEA avisó a los integrantes de la sociedad civil que no podrían entrar el martes a la Asamblea General, cosa que siempre se permite. Esta decisión, que los integrantes de las OSC tacharon de arbitraria, provocó protestas y presión ese martes. Ante esto, los organizadores permitieron el acceso a la sociedad civil el mismo martes por la tarde.^^El miércoles algunas organizaciones, entre ellas CADHAC, se reunieron en corto con las autoridades de la Comisión Interamericana de Derechos Humanos (CIDH) y la Corte Interamericana de Derechos Humano. En esta reunión, tanto la Corte como la CIDH ofrecieron disculpas por a las organizaciones por no haber estado más atentos de lo que sucedió un día antes.^^Durante sus intervenciones en la Asamblea General, los representantes de la CIDH y de la Corte respaldaron a las organizaciones de la sociedad civil, entregaron su informe e hicieron un llamado a los Estados integrantes de la OEA para pedir su apoyo ante la crisis financiera que ambas instituciones (la CIDH y la Corte) enfrentan en estos momentos.^^En el diálogo con las autoridades, las organizaciones de la sociedad civil manifestaron su inconformidad pues en ningún momento la OEA se pronunció en contra de las organizaciones anti-derechos, quienes a lo largo del evento estuvieron fomentando discursos homofóbicos y de odio, sobre todo contra las personas trans. Incluso, hubo varios episodios de violencia y agresiones verbales de las organizaciones anti-derechos contra integrantes de colectivos LGBTI que asistieron al evento.^^Las organizaciones civiles que asistieron a la 46 Asamblea de la Organización de los Estados Americanos (OEA) consideraron muy alarmante que estas organizaciones anti-derechos estén irrumpiendo en estos espacios para imponer su agenda que atenta contra la progresividad de los derechos humanos y que limita el espacio para discutir temas importantes como la progresividad de los derechos humanos, la impunidad, la violencia y la seguridad en todo el continente americano.', '31.jpg');
INSERT INTO `comunicado` (`id`, `titulo`, `fecha`, `texto`, `imagen`) VALUES
(46, 'REUNIÓN NO. 26 ENTRE CADHAC, AMORES Y LA PGJNL. ¿DÓNDE ESTÁN LOS PADRES E HIJOS AUSENTES?', '2016-11-27', 'Ciudadanos en Apoyo a los Derechos Humanos, A.C. (CADHAC) y la Agrupación de Mujeres Organizadas por los Ejecutados, Secuestrados y Desaparecidos de Nuevo León (AMORES) realizaremos hoy en conjunto con la Procuraduría General de Justicia de Nuevo León (PGJNL) la Reunión No. 26 de revisión de expedientes de personas desaparecidas en el estado.^^En el marco del Día del Padre, que se festeja este mes, centraremos la atención en todos los padres de familia que se encuentran desaparecidos y de todos esos padres que buscan a sus hijas e hijos desaparecidos.^^En esta lucha, guiada por el amor, muchos padres buscan incansablemente a sus hijos y que el día de hoy son ellos los que encabezarán esta reunión.^^Dentro de AMORES también hay hijas e hijos que buscan a sus padres. Estas familias viven una situación particularmente complicada pues además de la angustia de no saber de ellos, se tienen que enfrentar a graves dificultades económicas.^^Por ellos, hoy alzamos la voz y los hacemos visibles.^^En esta ocasión revisaremos 31 expedientes (casos) correspondientes a 74 víctimas de desaparición (18 mujeres y 56 hombres).^^Hacemos un llamado a las autoridades de Nuevo León a que asuman con seriedad el compromiso de trabajar para llegar a la verdad y urgimos a que Servicios Periciales cuente con los recursos materiales y humanos suficientes para que cumplan a cabalidad su misión, que sin duda nos acercará a la verdad. ¿Dónde están?^^ ^^Comunicado de AMORES^^Reunión de trabajo No. 26 entre AMORES y CADHAC con la PGJNL^^La Agrupación de Mujeres Organizadas por los Ejecutados, Secuestrados y Desaparecidos de Nuevo León, AMORES, con CADHAC, estamos aquí reunidas, en el marco de la Reunión No. 26 con la Procuraduría General de Justicia de Nuevo León, para la revisión de expedientes de la investigación que se sigue por la desaparición de nuestros seres amados.^^En esta ocasión que la reunión corresponde al mes de junio, que en México se celebra el Día del Padre, hacemos visible que en nuestra lucha también hay padres. Ellos sufren la desaparición de sus hijos e hijas, aunque no lo demuestren, lloran junto a nosotras, sus sentimientos son contrariados y de desolación igual que nosotras, aunque no lo hacen público. Las mujeres de AMORES somos testigas pues conocemos sus preocupaciones; pero culturalmente los hombres fueron educados para no expresar sus emociones por lo que reprimen sus sentimientos y viven de manera aislada ese dolor que a veces provoca enfermedades. Los padres fueron y están siendo privados de la posibilidad de convivir con sus hijos e hijas, de platicar, de reír, de ser padres.^^Reclamamos también que el futuro de los hombres jóvenes desaparecidos fue truncado, pues les quitaron el derecho a terminar sus estudios, a casarse, a ser padres, a ver crecer a sus hijos, a vivir su vida con libertad y ser felices. Además, los varones que desaparecen son estigmatizados, señalados porque se presume que “en algo andaban”, se les juzga, cuando hay que concentrarnos en buscarles.^^Por su parte a los hijos/as de personas desaparecidas se les niega el derecho a crecer con su padre, de conocerlos, de convivir y contar con ese referente de vida, dejando un vacío en su corazón. Y aunque existen figuras que cubren ese rol de figura paterna, como es el caso de los abuelos o los tíos, a veces esos hijos/as nos preguntan porque no están sus padres y, ¿qué decirles? Bebés, niños, niñas y jóvenes se encuentran sin sus papás, por lo que nos preguntamos ¿Qué será de esa generación de hijos/as? ¿Cómo se va a restituir ese derecho? ¿Dónde están sus padres?^^Desde AMORES seguimos aquí, luchando por conocer el paradero de quienes han sido desaparecidos/as, y no descansaremos hasta encontrarles, hasta saber ¿Dónde están?^^ ^^¿Dónde están nuestros desaparecidos y desaparecidas?^^¡Exigimos verdad y justicia!^^¡Los padres de familia, aún siguen llorando,^^la ausencia de su hijo, no pueden superarlo.^^Por ese tal motivo, luchamos y buscamos^^la marcha continúa, hasta encontrarlos!^', '46.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `desaparecido`
--

CREATE TABLE `desaparecido` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE latin1_general_ci NOT NULL,
  `imagen` text COLLATE latin1_general_ci,
  `fecha` date NOT NULL,
  `lugar` text COLLATE latin1_general_ci NOT NULL,
  `descripcion` text COLLATE latin1_general_ci NOT NULL,
  `estado_civil` text COLLATE latin1_general_ci,
  `ocupacion` text COLLATE latin1_general_ci,
  `edad` int(11) DEFAULT NULL,
  `talla` decimal(10,0) DEFAULT NULL,
  `tez` text COLLATE latin1_general_ci,
  `ojos` text COLLATE latin1_general_ci,
  `otras_senias` text COLLATE latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `desaparecido`
--

INSERT INTO `desaparecido` (`id`, `nombre`, `imagen`, `fecha`, `lugar`, `descripcion`, `estado_civil`, `ocupacion`, `edad`, `talla`, `tez`, `ojos`, `otras_senias`) VALUES
(1, 'Egdar Carranco Ruiz', '1.jpg', '2012-03-26', 'Monterrey, N.L.', 'Estaba en un grupo de 4 personas', 'soltero', 'ninguna', 23, '2', 'Blanca', 'Verdes', ''),
(24, 'Alejandra Amairani Tamez Rodriguez', '24.jpeg', '2012-03-24', 'Col. Contry Gpe. N.L.', 'Desapareció el 24 de marzo 2012', 'Soltera', '', 16, '157', 'Blanca', 'Cafes', 'marcas de varicela mejilla izquierda y lunar chamorro izquierdo'),
(25, 'Nadia Miroslava Reyes Vargas', '25.jpg', '2012-03-24', 'Col Cumbres, Monterrey N.L.', 'Estaba con 2 amigas que desaparecieron con ella', 'Soltera', '', 18, '165', 'Morena aperlada', 'Verdes', 'Lunar cuello derecho, Cicatriz operación apendice, tatuaje enramada a la altura del tobillo'),
(23, 'Cecilia Yolotsi Macías Mtz', '23.jpg', '2012-07-03', 'Guadalupe, N.L. ', 'Desapareció el 3 de Julio 2013', 'Soltera', 'Estudiante y trabaja', 19, '162', 'Blanca-clara', 'Cafe, medianos', 'Tatuajes en: \r\n1-. pantorrilla derecha(bonsai, flores golondrina)\r\n2-. omoplato derecho (sexy mama)\r\n3-. cadera lado derecho (hermandad)\r\n4-. piercing en ceja izquierda '),
(26, 'Omar Yair Velazquez Luna', '26.jpg', '2012-01-23', 'Ciudad Acuña ', 'Desaparecio del casino Rio de Cd. Acuña Coahuila', 'Soltero', 'Escolta', 24, '180', 'Blanca', 'Café claro', ''),
(27, 'Erika Garza Guerrero', '27.jpg', '2011-08-26', 'Guadalupe, N.L', 'Estaba con su hijo', 'Casada', 'Ama de casa', 35, '172', 'Apelada', 'Café', ''),
(28, 'Bruno Israel González Garza', '28.jpg', '2011-08-26', 'Guadalupe, N.L.', 'Estaba con su mama Erika Garza Guerrero', 'Soltero', '', 5, '85', 'Clara', 'Café oscuro', ''),
(29, 'Alma Mónica Álvarez García', '29.png', '2011-07-21', 'Reynosa, Tamaulipas ', 'salió con cinco jóvenes más de Reynosa hacia Monterrey pero no llegaron', 'Separada', 'comerciante informal', 30, '154', 'Aperlada', 'Negros', 'cicatriz de piercing en cejas y nariz\r\ndos tatuajes: \r\n"Monica" en la pierna derecha \r\nestrellitas en la espalda del lado izquierdo.'),
(30, 'Judith Ceja Aguirre', '30.png', '2011-07-21', 'Reynosa, Tamaulipas', 'Salió de trabajar con cinco compañeras más, dirigiéndose de Reynosa a Monterrey, pero no llegaron', 'Madre soltera', 'Comerciante', 25, '165', 'Blanco', 'Negros', 'tatuaje en la espalda baja, \r\nlunar en el labio, \r\ncejas delineadas.'),
(31, 'Fabián Hernández Vázquez', '31.png', '2011-07-11', 'Monterrey, N.L.', 'Después de ver a un cliente en la colonia Cumbres, al cual entregó unos muebles sobre diseño, fue interceptado por unos hombres que lo persiguieron en sus vehículos. Fabián iba con sus trabajadores en su camioneta, los impactaron y volcaron la camioneta; sólo se llevaron a Fabián', 'Soltero', 'Arquitecto', 35, '168', 'Morena', 'rasgados color café obscuro', 'lunar en la pierna derecha (tipo mancha)\r\nusaba brakets odontológicos; \r\nen sus manos le falta un nudillo en los dedos anulares.\r\n'),
(32, 'Jacobo Javier García Álvarez', '32.png', '2011-06-17', 'Carretera a San Roque, Juárez, N.L.', 'estaba en un bar con tres compañeros de trabajo, saliendo de ahí los detiene tránsito de Juárez, N.L., se los llevan y niegan paradero. Señalan haberlos entregado a delincuencia organizada ', 'Soltero', 'Empleado', 22, '155', 'Moreno', 'Negros', ''),
(33, 'Israel Arenas Durán', '33.png', '2011-06-17', 'Carretera a San Roque, Juárez, N.L.', 'estaba en un bar con tres compañeros de trabajo, saliendo de ahí los detiene tránsito de Juárez, N.L., se los llevan y niegan paradero. Señalan haberlos entregado a delincuencia organizada', 'Soltero', 'Comerciante', 19, '155', 'Morena', 'Negros', ''),
(34, 'Adrián Nava Cid', '34.png', '2011-06-17', 'Carretera a San Roque, Juárez, N.L.', 'estaba en un bar con tres compañeros de trabajo, saliendo de ahí los detiene tránsito de Juárez, N.L., se los llevan y niegan paradero. Señalan haberlos entregado a delincuencia organizada ', 'Casado', 'Empleado', 25, '160', 'Clara', 'Negros', ''),
(35, 'Reynaldo García Álvarez', '35.png', '2011-06-17', 'Carretera a San Roque, Juárez, N.L.', 'estaba en un bar con tres compañeros de trabajo, saliendo de ahí los detiene tránsito de Juárez, N.L., se los lleva y niegan paradero. Señalan haberlos entregado a delincuencia organizada ', 'Unión libre', 'Empleado', 28, '160', 'Moreno', 'Negros', ''),
(36, 'Juan Antonio Alvarado Alonso', '36.png', '2011-06-26', 'Colonia Casa Blanca, San Nicolas, N.L.', 'Regresando de una fiesta a la que acompaño a su hno. José Joaquín, organizada por la empresa Kraft ', 'Soltero', 'Ayudante', 28, NULL, 'Morena', 'Café oscuro', 'mancha en media espalda'),
(37, 'José Joaquín Alvarado Alonso', '37.png', '2011-06-26', 'Colonia Casa Blanca, San Nicolas, N.L.', 'regresando de una fiesta que organizó la empresa Kraft, donde trabajaba ', 'Soltero', 'Operario', 29, '174', 'Blanca', 'Café claros', ''),
(38, 'Miguel Ángel Grimaldo Sauceda', '38.jpg', '2011-06-26', 'San Nicolas, N.L. ', 'Desapareció el 26 de junio 2011 ', '', '', 28, '160', 'Aperlada', 'Café pequeño', 'tatuaje: 5 estrellas en el antebrazo izquierdo.'),
(39, 'Pedro Antonio Sánchez Guzmán', '39.png', '2011-06-06', 'Calle Zacatecas,1024 Sur ', 'Desapareció el 6 de Junio 2011 ', '', '', 65, '170', 'Moreno', 'Negros', 'cicatrices antebrazo derecho \r\ntabique desviado'),
(40, 'Edgar D. Castillo Rodriguez', '40.jpg', '2011-06-15', 'Santa Catarina, N.L. ', 'Desapareció el 15 de Junio 2011 ', 'Soltero', '', 22, '170', 'Moreno', 'Café y pequeños', ''),
(41, 'Leonardo Daniel Castañeda Castañeda', '41.jpg', '2011-06-27', 'Col. Burocratas Municipales del Estado', 'Se acompañaba de un vecino', '', '', 23, '170', 'Moreno', 'Cafés', 'cicatriz en ceja derecha y un tatuaje en pantorrilla izquierda ');

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE latin1_general_ci NOT NULL,
  `descripcion` text COLLATE latin1_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `titulo` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`id`, `nombre`, `descripcion`, `fecha`, `titulo`) VALUES
(1, 'Boletines', 'Boletines del mes.', '2016-11-29', NULL),
(2, 'Conferencia 3...', 'asdfasdfasdfasdfasdfasdf', '2016-11-30', NULL),
(3, 'Reunión', 'asdfasdfadsfasdfasdf', '2016-11-07', NULL),
(4, 'Marcha contra los desaparecidos', 'asdfasdfasdfasdfasdfadsf', '2016-11-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `imagen` text COLLATE latin1_general_ci NOT NULL,
  `comunicado_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `imagen`
--

INSERT INTO `imagen` (`id`, `imagen`, `comunicado_id`) VALUES
(1, '31-0.jpg', 31),
(16, '46-0.jpg', 46),
(17, '46-1.jpg', 46),
(18, '46-2.jpg', 46);

-- --------------------------------------------------------

--
-- Table structure for table `publicacion`
--

CREATE TABLE `publicacion` (
  `id` int(11) NOT NULL,
  `titulo` text COLLATE latin1_general_ci NOT NULL,
  `descripcion` text COLLATE latin1_general_ci NOT NULL,
  `espanol` text COLLATE latin1_general_ci NOT NULL,
  `ingles` text COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `publicacion`
--

INSERT INTO `publicacion` (`id`, `titulo`, `descripcion`, `espanol`, `ingles`) VALUES
(1, 'Desaparición de personas en Nuevo León', 'Sistematización de experiencias en búsqueda de la justicia y la verdad', 'desapariciones_español.pdf', 'desapariciones_ingles.pdf'),
(2, 'Grupo especializado de búsqueda inmediata', 'A un añp de su creación Marzo 2014 - Marzo 2015.\r\n\r\n', 'busqueda_español.pdf', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_id` (`evento_id`);

--
-- Indexes for table `comunicado`
--
ALTER TABLE `comunicado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `desaparecido`
--
ALTER TABLE `desaparecido`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comunicado_id` (`comunicado_id`),
  ADD KEY `comunicado_id_2` (`comunicado_id`);

--
-- Indexes for table `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accion`
--
ALTER TABLE `accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `comunicado`
--
ALTER TABLE `comunicado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `desaparecido`
--
ALTER TABLE `desaparecido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`comunicado_id`) REFERENCES `comunicado` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
