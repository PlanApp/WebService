--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    descripcion character varying(50),
    imagen character varying(250)
);


ALTER TABLE public.categoria OWNER TO planapp;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_categoria_seq OWNER TO planapp;

--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;


--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE comentarios (
    id_lugar numeric,
    id_usuario numeric,
    contenido text
);


ALTER TABLE public.comentarios OWNER TO planapp;

--
-- Name: detalle_lugar; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE detalle_lugar (
    id_lugar numeric,
    latitud character varying(100),
    longitud character varying(100),
    clima numeric(1,0)
);


ALTER TABLE public.detalle_lugar OWNER TO planapp;

--
-- Name: detalle_panorama; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE detalle_panorama (
    id_panorama numeric,
    fecha date,
    hora_inicio time without time zone,
    id_acompanante numeric,
    presupuesto numeric(3,0)
);


ALTER TABLE public.detalle_panorama OWNER TO planapp;

--
-- Name: horarios_dias; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE horarios_dias (
    id_horario integer NOT NULL,
    id_lugar numeric,
    horario_inicio time without time zone,
    horario_fin time without time zone,
    lunes numeric(1,0),
    martes numeric(1,0),
    miercoles numeric(1,0),
    jueves numeric(1,0),
    viernes numeric(1,0),
    sabado numeric(1,0),
    domingo numeric(1,0)
);


ALTER TABLE public.horarios_dias OWNER TO planapp;

--
-- Name: horarios_dias_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE horarios_dias_id_horario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horarios_dias_id_horario_seq OWNER TO planapp;

--
-- Name: horarios_dias_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE horarios_dias_id_horario_seq OWNED BY horarios_dias.id_horario;


--
-- Name: imagenes; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE imagenes (
    id_imagenes integer NOT NULL,
    id_lugar numeric,
    nombre_archivo character varying(50)
);


ALTER TABLE public.imagenes OWNER TO planapp;

--
-- Name: imagenes_id_imagenes_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE imagenes_id_imagenes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagenes_id_imagenes_seq OWNER TO planapp;

--
-- Name: imagenes_id_imagenes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE imagenes_id_imagenes_seq OWNED BY imagenes.id_imagenes;


--
-- Name: lugar; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE lugar (
    id_lugar integer NOT NULL,
    nombre character varying(50),
    ubicacion character varying(150),
    monto_promedio numeric,
    imagen character varying(250)
);


ALTER TABLE public.lugar OWNER TO planapp;

--
-- Name: lugar_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE lugar_id_lugar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugar_id_lugar_seq OWNER TO planapp;

--
-- Name: lugar_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE lugar_id_lugar_seq OWNED BY lugar.id_lugar;


--
-- Name: panorama; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE panorama (
    id_panorama integer NOT NULL,
    id_usuario numeric,
    id_lugar1 numeric,
    id_lugar2 numeric,
    id_lugar3 numeric
);


ALTER TABLE public.panorama OWNER TO planapp;

--
-- Name: panorama_id_panorama_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE panorama_id_panorama_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.panorama_id_panorama_seq OWNER TO planapp;

--
-- Name: panorama_id_panorama_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE panorama_id_panorama_seq OWNED BY panorama.id_panorama;


--
-- Name: rango_presupuesto; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE rango_presupuesto (
    id_presupuesto integer NOT NULL,
    limite_menor numeric,
    limite_mayor numeric
);


ALTER TABLE public.rango_presupuesto OWNER TO planapp;

--
-- Name: rango_presupuesto_id_presupuesto_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE rango_presupuesto_id_presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rango_presupuesto_id_presupuesto_seq OWNER TO planapp;

--
-- Name: rango_presupuesto_id_presupuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE rango_presupuesto_id_presupuesto_seq OWNED BY rango_presupuesto.id_presupuesto;


--
-- Name: tipo_acompanante; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE tipo_acompanante (
    id_acompanante numeric,
    descripcion character varying(60)
);


ALTER TABLE public.tipo_acompanante OWNER TO planapp;

--
-- Name: tipo_categoria; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE tipo_categoria (
    id_lugar numeric,
    id_categoria numeric
);


ALTER TABLE public.tipo_categoria OWNER TO planapp;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    mail character varying(100) NOT NULL,
    nombre character varying(50),
    password character varying(200),
    fecha_nacimiento date,
    sexo character varying(1)
);


ALTER TABLE public.usuario OWNER TO planapp;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: planapp
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO planapp;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: planapp
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- Name: votos; Type: TABLE; Schema: public; Owner: planapp; Tablespace: 
--

CREATE TABLE votos (
    id_lugar numeric NOT NULL,
    id_usuario numeric NOT NULL,
    voto_lugar numeric(2,0),
    voto_acompanante numeric,
    id_acompanante numeric
);


ALTER TABLE public.votos OWNER TO planapp;

--
-- Name: id_categoria; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);


--
-- Name: id_horario; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY horarios_dias ALTER COLUMN id_horario SET DEFAULT nextval('horarios_dias_id_horario_seq'::regclass);


--
-- Name: id_imagenes; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY imagenes ALTER COLUMN id_imagenes SET DEFAULT nextval('imagenes_id_imagenes_seq'::regclass);


--
-- Name: id_lugar; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY lugar ALTER COLUMN id_lugar SET DEFAULT nextval('lugar_id_lugar_seq'::regclass);


--
-- Name: id_panorama; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY panorama ALTER COLUMN id_panorama SET DEFAULT nextval('panorama_id_panorama_seq'::regclass);


--
-- Name: id_presupuesto; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY rango_presupuesto ALTER COLUMN id_presupuesto SET DEFAULT nextval('rango_presupuesto_id_presupuesto_seq'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: planapp
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY categoria (id_categoria, descripcion, imagen) FROM stdin;
1	Aire Libre	\N
2	Deportes	\N
3	Cine	\N
4	Actividades Culturales	\N
5	Baile	\N
6	Juegos Electronicos	\N
7	Pub	\N
8	Restaurantes	\N
9	Azar	\N
10	Zoologicos y Acuarios	\N
11	Conciertos	\N
12	Actividades Extremas	\N
13	Parques de divesiones	\N
14	Piscinas	\N
\.


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('categoria_id_categoria_seq', 14, true);


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY comentarios (id_lugar, id_usuario, contenido) FROM stdin;
\.


--
-- Data for Name: detalle_lugar; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY detalle_lugar (id_lugar, latitud, longitud, clima) FROM stdin;
1	-33.458737	-70.663746	0
3	-33.5781157	-70.4337707	0
4	-33.368248	-70.5194065	0
2	-33.5584434	-70.8014951	0
5	-33.4577065	-70.6684393	1
6	-33.406816	-70.6643088	1
8	-33.933746	-70.71599	1
7	-32.040465	-67.10575	1
9	-33,4592613	-70,6576684	0
10	-33,4592613	-70,6576684	0
11	-33,4537263	-70,6596074	0
12	-33,451184	-70,661515	0
13	-33,4592613	-70,6576684	0
14	-33,446951	-70,6616695	0
15	-33,451745	-70,6645164	1
16	-33,451745	-70,6645164	1
17	-33,451745	-70,6645164	1
18	-33,451745	-70,6645164	1
19	-33,451745	-70,6645164	1
20	-33,451745	-70,6645164	1
21	-33,4534628	-70,6607316	1
22	-33,4518312	-70,6657817	1
23	-33,45516711	-70,67745105	1
24	-33,44942296	-70,66046165	1
25	-33,460299	-70,657137	0
26	-33,4523208	-70,6622574	1
27	-33,4523208	-70,6622574	1
28	-33,45390561	-70,66412115	1
29	-33,4519702	-70,6504116	0
30	-33,4516377	-70,6631513	1
31	-33,451033	-70,6666075	1
32	-33,4511429	-70,6645678	1
33	-33,4510616	-70,6649256	1
34	-33,4512461	-70,6617725	1
35	-33,4512461	-70,6617725	1
36	-33,4512461	-70,6617725	1
37	-33,448954	-70,66215	1
38	-33,456624	-70,664044	1
39	-33,452728	-70,656872	1
40	-33,4558252	-70,6587603	1
41	-33,4497823	-70,6675005	1
42	-33,4464748	-70,6583002	1
\.


--
-- Data for Name: detalle_panorama; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY detalle_panorama (id_panorama, fecha, hora_inicio, id_acompanante, presupuesto) FROM stdin;
\.


--
-- Data for Name: horarios_dias; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY horarios_dias (id_horario, id_lugar, horario_inicio, horario_fin, lunes, martes, miercoles, jueves, viernes, sabado, domingo) FROM stdin;
1	1	12:00:00	21:00:00	1	1	1	1	1	1	1
2	2	11:00:00	19:30:00	0	0	0	0	0	1	1
3	3	11:00:00	19:30:00	0	0	0	0	0	1	1
4	4	10:45:00	19:30:00	0	0	0	0	0	1	1
5	5	14:00:00	21:00:00	1	0	0	0	1	0	0
6	6	14:00:00	21:00:00	0	0	0	1	0	1	0
7	7	10:00:00	04:00:00	1	1	1	1	1	1	1
8	8	14:00:00	22:00:00	1	1	1	1	0	0	0
9	8	12:00:00	00:00:00	0	0	0	0	1	1	0
10	8	12:00:00	22:00:00	0	0	0	0	0	0	1
11	23	11:00:00	23:00:00	1	1	1	1	1	1	1
12	24	11:00:00	23:00:00	1	1	1	1	1	1	1
13	25	11:00:00	23:00:00	1	1	1	1	1	1	1
14	26	11:00:00	23:00:00	1	1	1	1	1	1	1
15	27	11:00:00	23:00:00	1	1	1	1	1	1	1
16	28	11:00:00	23:00:00	1	1	1	1	1	1	1
17	30	11:00:00	23:00:00	1	1	1	1	1	1	1
18	31	11:00:00	23:00:00	1	1	1	1	1	1	1
19	32	11:00:00	23:00:00	1	1	1	1	1	1	1
20	33	11:00:00	23:00:00	1	1	1	1	1	1	1
21	34	11:00:00	23:00:00	1	1	1	1	1	1	1
22	35	11:00:00	23:00:00	1	1	1	1	1	1	1
23	36	10:00:00	23:00:00	1	1	1	1	1	1	1
24	37	11:00:00	23:00:00	1	1	1	1	1	1	1
25	38	11:00:00	23:00:00	1	1	1	1	1	1	1
26	39	11:00:00	23:00:00	1	1	1	1	1	1	1
27	40	11:00:00	23:00:00	1	1	1	1	1	1	1
28	41	11:00:00	23:00:00	1	1	1	1	1	1	1
29	42	11:00:00	23:00:00	1	1	1	1	1	1	1
\.


--
-- Name: horarios_dias_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('horarios_dias_id_horario_seq', 29, true);


--
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY imagenes (id_imagenes, id_lugar, nombre_archivo) FROM stdin;
\.


--
-- Name: imagenes_id_imagenes_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('imagenes_id_imagenes_seq', 1, false);


--
-- Data for Name: lugar; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY lugar (id_lugar, nombre, ubicacion, monto_promedio, imagen) FROM stdin;
1	Fantasilandia	Beaucheff esq. Tupper / Santiago, Chile	9990	\N
2	Mampato Padre Hurtado	Camino a Melipilla 490	4300	\N
3	Mampato Las Vizcachas	Camino Al Volcán 06540	5000	\N
4	Mampato Lo Barnechea	Avenida Raúl Labbé 12150 	5500	\N
5	Club Hípico	Av. Blanco Encalada 2540, Santiago - Chile	500	\N
6	Hipódromo	Av. Hipódromo Chile N°1715, Independencia - Chile	500	\N
7	Enjoy Santiago	Autopista Los Libertadores, kilometro 53, Rinconada - Chile	3500	\N
8	Monticello	Panamericana Sur, kilometro 57, San Francisco de Mostazal - Chile	3500	\N
12	Biblioteca Nicanor Parra, UDP	Vergara 324, Santiago	0	\N
9	Parque Ohiggins	Beauchef 398	0	\N
10	Centro Deportivo y recreativo del Parque Ohiggins	Beauchef 398	0	\N
11	Plaza Las Heras	Santa Isabel	0	\N
14	Ciclovia la Alameda	Av. Libertador Bernando Ohiggins	0	\N
16	Pool Japimax	Almirante Latorre 310, esquina Grajales, Santiago Centro  	3000	\N
17	Juegos Electronicos Japimax	Almirante Latorre 310, esquina Grajales, Santiago Centro  	1000	\N
15	Bowling Japimax	Almirante Latorre 310, esquina Grajales, Santiago Centro  	6000	\N
18	Doggis	Almirante Latorre 310, esquina Grajales, Santiago Centro  	2500	\N
19	Tarragona	Almirante Latorre 310, esquina Grajales, Santiago Centro  	2000	\N
20	Juan Maestro	Almirante Latorre 310, esquina Grajales, Santiago Centro  	3500	\N
21	Papa Johns	Toesca 1844, local 10, Santiago	6000	\N
13	Piscina del Parque Ohiggins	Beauchef 398	0	\N
22	El mechon	Grajales 2170, Santiago	1500	\N
23	El Hoyo	San Vicente 375	10000	\N
24	La Taberna de Moe	Sazie 1773	6000	\N
25	Skate park	Manuel Rodruez	0	\N
26	Wok	Gorbea 1948	3500	\N
27	Light House	Gorbea 1948	3500	\N
28	Sushi Hang Han	Toesca 2096	7000	\N
29	Parque Almagro	Santa Isabel con San Diego	0	\N
30	Templo Hare Krishna Iskcon	Jose Miguel Carrera 330	0	\N
31	Mundo Kebab	Echaurren Sazie	5000	\N
32	Ginos Pizza	Almirante Latorre 284	4500	\N
33	El Cafe Mundo	Plaza Manuel Rodriguez	4000	\N
34	Starbucks	Vergara 324	5000	\N
35	Casino Biblioteca UDP	Vergara 324	0	\N
36	Mirador Biblioteca UDP	Vergara 324	0	\N
37	Clandestino	Vergara 132	6000	\N
38	Pool bkn	Almirante Latorre 744	3500	\N
39	Palacio Cousio	Calle Dieciocho 438	2000	\N
40	Museo Historico y Militar de Chile	Blanco Encalada 1550	2000	\N
41	Burdeos	Av. Libertador Bernardo O`Higgins 2555	5000	\N
42	Discotheque 18	Dieciocho 44	5000	\N
\.


--
-- Name: lugar_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('lugar_id_lugar_seq', 42, true);


--
-- Data for Name: panorama; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY panorama (id_panorama, id_usuario, id_lugar1, id_lugar2, id_lugar3) FROM stdin;
1	12	1	2	3
2	12	1	2	3
3	12	1	2	3
4	18	1	2	3
5	18	1	2	3
6	18	1	2	3
7	12	1	2	3
8	23	1	2	3
9	12	1	2	3
10	12	1	2	3
\.


--
-- Name: panorama_id_panorama_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('panorama_id_panorama_seq', 10, true);


--
-- Data for Name: rango_presupuesto; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY rango_presupuesto (id_presupuesto, limite_menor, limite_mayor) FROM stdin;
\.


--
-- Name: rango_presupuesto_id_presupuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('rango_presupuesto_id_presupuesto_seq', 1, false);


--
-- Data for Name: tipo_acompanante; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY tipo_acompanante (id_acompanante, descripcion) FROM stdin;
\.


--
-- Data for Name: tipo_categoria; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY tipo_categoria (id_lugar, id_categoria) FROM stdin;
2	13
3	13
4	13
5	9
6	9
7	9
8	9
9	1
11	1
10	2
12	4
13	14
14	2
15	6
16	6
17	6
1	13
11	2
18	8
19	8
20	8
21	8
22	6
23	7
23	8
24	7
24	8
25	2
26	8
27	8
28	8
29	1
30	4
31	8
32	8
33	8
34	8
35	4
36	1
37	7
39	4
40	4
41	7
42	5
38	6
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY usuario (id_usuario, mail, nombre, password, fecha_nacimiento, sexo) FROM stdin;
1	leonardbravoillanes@gmail.com	l30bravo	lala	2014-10-01	M
10	test5@mail.cl	test5	213	2014-12-15	M
11	l30bravo@leobravo.cl	leo	123	2014-12-02	H
12	leo@mail.cl	leo	123	2014-12-02	H
13	lala@mail.cl	lala	123	2012-12-02	H
14	leonardo.bravo@mail.udp.cl	leo	123	1988-12-16	H
15	l30ravo@mail.cl	leo	123	1988-12-16	H
16	diego.wdm1@gmail.com	diego	qwerty	2014-01-12	H
17	test@alalalala.cl	test5	123	2014-02-15	H
2	test0@mail.cl	test0	123test	2014-12-15	M
8	test6@mail.cl	test6	123test	2014-12-13	M
6	test7@mail.cl	test7	123test	2014-12-13	M
18	rs10@mail.cl	RS10	rs10	1987-02-11	H
19	rp9@mail.cl	RP9	rp9	1989-04-15	H
20	ovejilla@mail.cl	Ovejilla	ovejilla	1992-06-26	H
3	test@mail.cl	test	123test	2014-12-15	M
5	test2@mail.cl	test2	123test	2014-12-15	M
7	test3@mail.cl	test3	123test	2014-12-15	M
9	test4@mail.cl	test4	123test	2014-12-15	M
4	test1@mail.cl	test1	123test	2014-12-12	M
21	kk@mail.cl	kk	123	2014-12-16	H
22	jj@mail.cl	jj	123	1988-12-16	H
23	tt@mail.cl	tt	123	2014-10-11	H
\.


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: planapp
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 23, true);


--
-- Data for Name: votos; Type: TABLE DATA; Schema: public; Owner: planapp
--

COPY votos (id_lugar, id_usuario, voto_lugar, voto_acompanante, id_acompanante) FROM stdin;
1	1	5	5	1
1	2	5	5	1
1	3	5	5	1
1	4	5	5	1
1	5	5	5	1
1	6	5	5	1
1	7	5	5	1
1	8	5	5	1
3	1	5	5	1
3	2	5	5	1
3	3	5	5	1
3	4	5	5	1
3	5	5	5	1
3	6	5	5	1
3	7	5	5	1
3	8	5	5	1
5	1	4	5	1
5	2	4	5	1
5	3	4	5	1
5	4	4	5	1
5	5	4	5	1
5	6	4	5	1
5	7	4	5	1
5	8	4	5	1
7	1	5	5	1
7	2	5	5	1
7	3	5	5	1
7	4	5	5	1
7	5	5	5	1
7	6	5	5	1
7	7	5	5	1
7	8	5	5	1
9	1	5	5	1
9	2	5	5	1
9	3	5	5	1
9	4	5	5	1
9	5	5	5	1
9	6	5	5	1
9	7	5	5	1
9	8	5	5	1
10	1	5	5	1
10	2	5	5	1
10	3	5	5	1
10	4	5	5	1
10	5	5	5	1
10	6	5	5	1
10	7	5	5	1
10	8	5	5	1
11	1	5	5	1
11	2	5	5	1
11	3	5	5	1
11	4	5	5	1
11	5	5	5	1
11	6	5	5	1
11	7	5	5	1
11	8	5	5	1
13	1	4	5	1
13	2	4	5	1
13	3	4	5	1
13	4	4	5	1
13	5	4	5	1
13	6	4	5	1
13	7	4	5	1
13	8	4	5	1
14	1	4	5	1
14	2	4	5	1
14	3	4	5	1
14	4	4	5	1
14	5	4	5	1
14	6	4	5	1
14	7	4	5	1
14	8	4	5	1
16	1	5	5	1
16	2	5	5	1
16	3	5	5	1
16	4	5	5	1
16	5	5	5	1
16	6	5	5	1
16	7	5	5	1
16	8	5	5	1
18	1	3	5	1
18	2	3	5	1
18	3	3	5	1
18	4	3	5	1
18	5	3	5	1
18	6	3	5	1
18	7	3	5	1
18	8	3	5	1
19	1	4	5	1
19	2	4	5	1
19	3	4	5	1
19	4	4	5	1
19	5	4	5	1
19	6	4	5	1
19	7	4	5	1
19	8	4	5	1
20	1	5	5	1
20	2	5	5	1
20	3	5	5	1
20	4	5	5	1
20	5	5	5	1
20	6	5	5	1
20	7	5	5	1
20	8	5	5	1
21	1	5	5	1
21	2	5	5	1
21	3	5	5	1
21	4	5	5	1
21	5	5	5	1
21	6	5	5	1
21	7	5	5	1
21	8	5	5	1
22	11	3	5	1
22	12	3	5	1
22	13	3	5	1
22	14	3	5	1
22	15	3	5	1
22	16	3	5	1
22	17	3	5	1
22	18	3	5	1
22	19	3	5	1
22	20	3	5	1
23	11	5	5	1
23	12	5	5	1
23	13	5	5	1
23	14	5	5	1
23	15	5	5	1
23	16	5	5	1
23	17	5	5	1
23	18	5	5	1
23	19	5	5	1
23	20	5	5	1
24	11	4	5	1
24	12	4	5	1
24	13	4	5	1
24	14	4	5	1
24	15	4	5	1
24	16	4	5	1
24	17	4	5	1
24	18	4	5	1
24	19	4	5	1
24	20	4	5	1
25	11	5	5	1
25	12	5	5	1
25	13	5	5	1
25	14	5	5	1
25	15	5	5	1
25	16	5	5	1
25	17	5	5	1
25	18	5	5	1
25	19	5	5	1
25	20	5	5	1
29	11	5	5	1
29	12	5	5	1
29	13	5	5	1
29	14	5	5	1
29	15	5	5	1
29	16	5	5	1
29	17	5	5	1
29	18	5	5	1
29	19	5	5	1
29	20	5	5	1
30	11	5	5	1
30	12	5	5	1
30	13	5	5	1
30	14	5	5	1
30	15	5	5	1
30	16	5	5	1
30	17	5	5	1
30	18	5	5	1
30	19	5	5	1
30	20	5	5	1
31	11	4	5	1
31	12	4	5	1
31	13	4	5	1
31	14	4	5	1
31	15	4	5	1
31	16	4	5	1
31	17	4	5	1
31	18	4	5	1
31	19	4	5	1
31	20	4	5	1
35	11	5	5	1
35	12	5	5	1
35	13	5	5	1
35	14	5	5	1
35	15	5	5	1
35	16	5	5	1
35	17	5	5	1
35	18	5	5	1
35	19	5	5	1
35	20	5	5	1
36	11	5	5	1
36	12	5	5	1
36	13	5	5	1
36	14	5	5	1
36	15	5	5	1
36	16	5	5	1
36	17	5	5	1
36	18	5	5	1
36	19	5	5	1
36	20	5	5	1
38	11	5	5	1
38	12	5	5	1
38	13	5	5	1
38	14	5	5	1
38	15	5	5	1
38	16	5	5	1
38	17	5	5	1
38	18	5	5	1
38	19	5	5	1
38	20	5	5	1
40	11	4	5	1
40	12	4	5	1
40	13	4	5	1
40	14	4	5	1
40	15	4	5	1
40	16	4	5	1
40	17	4	5	1
40	18	4	5	1
40	19	4	5	1
40	20	4	5	1
41	11	4	5	1
41	12	4	5	1
41	13	4	5	1
41	14	4	5	1
41	15	4	5	1
41	16	4	5	1
41	17	4	5	1
41	18	4	5	1
41	19	4	5	1
41	20	4	5	1
23	10	5	5	1
24	10	4	5	1
1	9	5	5	1
5	9	4	5	1
9	9	5	5	1
1	0	5	5	1
3	0	4	5	1
5	0	5	5	1
7	0	4	5	1
9	0	5	5	1
10	0	4	5	1
11	0	5	5	1
13	0	5	5	1
14	0	4	5	1
16	0	5	5	1
18	0	4	5	1
19	0	5	5	1
20	0	5	5	1
21	0	4	5	19
22	10	5	5	1
25	10	4	5	1
29	10	5	5	1
30	10	4	5	1
31	10	5	5	1
35	10	4	5	1
36	10	5	5	1
38	10	5	5	1
40	10	4	5	1
41	10	5	5	1
\.


--
-- Name: lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: planapp; Tablespace: 
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id_lugar);


--
-- Name: panorama_pkey; Type: CONSTRAINT; Schema: public; Owner: planapp; Tablespace: 
--

ALTER TABLE ONLY panorama
    ADD CONSTRAINT panorama_pkey PRIMARY KEY (id_panorama);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: planapp; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (mail);


--
-- Name: votos_pkey; Type: CONSTRAINT; Schema: public; Owner: planapp; Tablespace: 
--

ALTER TABLE ONLY votos
    ADD CONSTRAINT votos_pkey PRIMARY KEY (id_lugar, id_usuario);


--
-- Name: index_detallel; Type: INDEX; Schema: public; Owner: planapp; Tablespace: 
--

CREATE INDEX index_detallel ON detalle_lugar USING btree (id_lugar);


--
-- Name: index_detallep; Type: INDEX; Schema: public; Owner: planapp; Tablespace: 
--

CREATE INDEX index_detallep ON detalle_panorama USING btree (id_panorama);


--
-- Name: index_horario; Type: INDEX; Schema: public; Owner: planapp; Tablespace: 
--

CREATE INDEX index_horario ON horarios_dias USING btree (id_lugar);


--
-- Name: index_panorama; Type: INDEX; Schema: public; Owner: planapp; Tablespace: 
--

CREATE INDEX index_panorama ON panorama USING btree (id_usuario);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

