--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-05-31 00:22:41

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
-- TOC entry 223 (class 1259 OID 88982)
-- Name: admin_info; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.admin_info (
    pk_admin_ids integer NOT NULL,
    admin_id bigint NOT NULL
);


ALTER TABLE public.admin_info OWNER TO horoscope_bot_user;

--
-- TOC entry 222 (class 1259 OID 88981)
-- Name: admin_info_pk_admin_ids_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.admin_info_pk_admin_ids_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_info_pk_admin_ids_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 222
-- Name: admin_info_pk_admin_ids_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.admin_info_pk_admin_ids_seq OWNED BY public.admin_info.pk_admin_ids;


--
-- TOC entry 228 (class 1259 OID 89084)
-- Name: aspects_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.aspects_texts (
    pk_aspects_texts integer NOT NULL,
    planet1 integer NOT NULL,
    planet2 integer NOT NULL,
    aspect integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.aspects_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 229 (class 1259 OID 89089)
-- Name: aspects_texts_pk_aspects_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.aspects_texts_pk_aspects_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aspects_texts_pk_aspects_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 229
-- Name: aspects_texts_pk_aspects_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.aspects_texts_pk_aspects_texts_seq OWNED BY public.aspects_texts.pk_aspects_texts;


--
-- TOC entry 230 (class 1259 OID 89090)
-- Name: basic_horoscope_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.basic_horoscope_texts (
    pk_basic_horoscope_texts integer NOT NULL,
    horoscope_text text NOT NULL
);


ALTER TABLE public.basic_horoscope_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 231 (class 1259 OID 89095)
-- Name: basic_horoscope_texts_pk_basic_horoscope_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.basic_horoscope_texts_pk_basic_horoscope_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_horoscope_texts_pk_basic_horoscope_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 231
-- Name: basic_horoscope_texts_pk_basic_horoscope_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.basic_horoscope_texts_pk_basic_horoscope_texts_seq OWNED BY public.basic_horoscope_texts.pk_basic_horoscope_texts;


--
-- TOC entry 232 (class 1259 OID 89096)
-- Name: career_horoscope_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.career_horoscope_texts (
    pk_career_horoscope_texts integer NOT NULL,
    horoscope_text text NOT NULL
);


ALTER TABLE public.career_horoscope_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 233 (class 1259 OID 89101)
-- Name: career_horoscope_texts_pk_career_horoscope_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.career_horoscope_texts_pk_career_horoscope_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.career_horoscope_texts_pk_career_horoscope_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 233
-- Name: career_horoscope_texts_pk_career_horoscope_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.career_horoscope_texts_pk_career_horoscope_texts_seq OWNED BY public.career_horoscope_texts.pk_career_horoscope_texts;


--
-- TOC entry 225 (class 1259 OID 88989)
-- Name: horoscope_file_ids; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.horoscope_file_ids (
    pk_horoscope_file_ids integer NOT NULL,
    sign_name integer NOT NULL,
    type_name integer NOT NULL,
    file_id text NOT NULL
);


ALTER TABLE public.horoscope_file_ids OWNER TO horoscope_bot_user;

--
-- TOC entry 224 (class 1259 OID 88988)
-- Name: horoscope_file_ids_pk_horoscope_file_ids_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.horoscope_file_ids_pk_horoscope_file_ids_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horoscope_file_ids_pk_horoscope_file_ids_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 224
-- Name: horoscope_file_ids_pk_horoscope_file_ids_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.horoscope_file_ids_pk_horoscope_file_ids_seq OWNED BY public.horoscope_file_ids.pk_horoscope_file_ids;


--
-- TOC entry 221 (class 1259 OID 88973)
-- Name: horoscope_types; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.horoscope_types (
    pk_horoscope_types integer NOT NULL,
    type_name text NOT NULL
);


ALTER TABLE public.horoscope_types OWNER TO horoscope_bot_user;

--
-- TOC entry 220 (class 1259 OID 88972)
-- Name: horoscope_types_pk_horoscope_types_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.horoscope_types_pk_horoscope_types_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horoscope_types_pk_horoscope_types_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 220
-- Name: horoscope_types_pk_horoscope_types_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.horoscope_types_pk_horoscope_types_seq OWNED BY public.horoscope_types.pk_horoscope_types;


--
-- TOC entry 234 (class 1259 OID 89102)
-- Name: house_in_sign_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.house_in_sign_texts (
    pk_house_in_sign_texts integer NOT NULL,
    house text NOT NULL,
    sign text NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.house_in_sign_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 235 (class 1259 OID 89107)
-- Name: house_in_sign_texts_pk_house_in_sign_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.house_in_sign_texts_pk_house_in_sign_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.house_in_sign_texts_pk_house_in_sign_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 235
-- Name: house_in_sign_texts_pk_house_in_sign_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.house_in_sign_texts_pk_house_in_sign_texts_seq OWNED BY public.house_in_sign_texts.pk_house_in_sign_texts;


--
-- TOC entry 236 (class 1259 OID 89108)
-- Name: houses_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.houses_texts (
    pk_signs_in_houses_texts integer NOT NULL,
    house integer NOT NULL,
    sign integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.houses_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 237 (class 1259 OID 89113)
-- Name: houses_texts_pk_signs_in_houses_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.houses_texts_pk_signs_in_houses_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.houses_texts_pk_signs_in_houses_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 237
-- Name: houses_texts_pk_signs_in_houses_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.houses_texts_pk_signs_in_houses_texts_seq OWNED BY public.houses_texts.pk_signs_in_houses_texts;


--
-- TOC entry 238 (class 1259 OID 89114)
-- Name: planet_in_sign_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.planet_in_sign_texts (
    pk_planet_in_sign_texts integer NOT NULL,
    planet integer NOT NULL,
    sign integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.planet_in_sign_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 239 (class 1259 OID 89119)
-- Name: planet_in_sign_texts_pk_planet_in_sign_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.planet_in_sign_texts_pk_planet_in_sign_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_in_sign_texts_pk_planet_in_sign_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 239
-- Name: planet_in_sign_texts_pk_planet_in_sign_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.planet_in_sign_texts_pk_planet_in_sign_texts_seq OWNED BY public.planet_in_sign_texts.pk_planet_in_sign_texts;


--
-- TOC entry 240 (class 1259 OID 89120)
-- Name: romantic_horoscope_texts; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.romantic_horoscope_texts (
    pk_romantic_horoscope_texts integer NOT NULL,
    horoscope_text text NOT NULL
);


ALTER TABLE public.romantic_horoscope_texts OWNER TO horoscope_bot_user;

--
-- TOC entry 241 (class 1259 OID 89125)
-- Name: romantic_horoscope_texts_pk_romantic_horoscope_texts_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.romantic_horoscope_texts_pk_romantic_horoscope_texts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.romantic_horoscope_texts_pk_romantic_horoscope_texts_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 241
-- Name: romantic_horoscope_texts_pk_romantic_horoscope_texts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.romantic_horoscope_texts_pk_romantic_horoscope_texts_seq OWNED BY public.romantic_horoscope_texts.pk_romantic_horoscope_texts;


--
-- TOC entry 219 (class 1259 OID 88964)
-- Name: signs; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.signs (
    pk_signs integer NOT NULL,
    sign_name text NOT NULL
);


ALTER TABLE public.signs OWNER TO horoscope_bot_user;

--
-- TOC entry 218 (class 1259 OID 88963)
-- Name: signs_pk_signs_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.signs_pk_signs_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.signs_pk_signs_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 218
-- Name: signs_pk_signs_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.signs_pk_signs_seq OWNED BY public.signs.pk_signs;


--
-- TOC entry 215 (class 1259 OID 88946)
-- Name: user_base; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.user_base (
    pk_user_base integer NOT NULL,
    telegram_id bigint NOT NULL
);


ALTER TABLE public.user_base OWNER TO horoscope_bot_user;

--
-- TOC entry 214 (class 1259 OID 88945)
-- Name: user_base_pk_user_base_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.user_base_pk_user_base_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_base_pk_user_base_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_base_pk_user_base_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.user_base_pk_user_base_seq OWNED BY public.user_base.pk_user_base;


--
-- TOC entry 217 (class 1259 OID 88954)
-- Name: user_info; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.user_info (
    pk_user_info integer NOT NULL,
    telegram_id bigint NOT NULL,
    username text NOT NULL,
    datetime_of_birth timestamp without time zone NOT NULL,
    place_of_birth text NOT NULL,
    photo_file_id text,
    telegraph_link text
);


ALTER TABLE public.user_info OWNER TO horoscope_bot_user;

--
-- TOC entry 216 (class 1259 OID 88953)
-- Name: user_info_pk_user_info_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.user_info_pk_user_info_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_pk_user_info_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_info_pk_user_info_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.user_info_pk_user_info_seq OWNED BY public.user_info.pk_user_info;


--
-- TOC entry 227 (class 1259 OID 89065)
-- Name: user_sign; Type: TABLE; Schema: public; Owner: horoscope_bot_user
--

CREATE TABLE public.user_sign (
    pk_user_sign integer NOT NULL,
    telegram_id bigint NOT NULL,
    fk_sign integer,
    fk_horoscope_type integer
);


ALTER TABLE public.user_sign OWNER TO horoscope_bot_user;

--
-- TOC entry 226 (class 1259 OID 89064)
-- Name: user_sign_pk_user_sign_seq; Type: SEQUENCE; Schema: public; Owner: horoscope_bot_user
--

CREATE SEQUENCE public.user_sign_pk_user_sign_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_sign_pk_user_sign_seq OWNER TO horoscope_bot_user;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 226
-- Name: user_sign_pk_user_sign_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: horoscope_bot_user
--

ALTER SEQUENCE public.user_sign_pk_user_sign_seq OWNED BY public.user_sign.pk_user_sign;


--
-- TOC entry 3242 (class 2604 OID 88985)
-- Name: admin_info pk_admin_ids; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.admin_info ALTER COLUMN pk_admin_ids SET DEFAULT nextval('public.admin_info_pk_admin_ids_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 89126)
-- Name: aspects_texts pk_aspects_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.aspects_texts ALTER COLUMN pk_aspects_texts SET DEFAULT nextval('public.aspects_texts_pk_aspects_texts_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 89127)
-- Name: basic_horoscope_texts pk_basic_horoscope_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.basic_horoscope_texts ALTER COLUMN pk_basic_horoscope_texts SET DEFAULT nextval('public.basic_horoscope_texts_pk_basic_horoscope_texts_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 89128)
-- Name: career_horoscope_texts pk_career_horoscope_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.career_horoscope_texts ALTER COLUMN pk_career_horoscope_texts SET DEFAULT nextval('public.career_horoscope_texts_pk_career_horoscope_texts_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 88992)
-- Name: horoscope_file_ids pk_horoscope_file_ids; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.horoscope_file_ids ALTER COLUMN pk_horoscope_file_ids SET DEFAULT nextval('public.horoscope_file_ids_pk_horoscope_file_ids_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 88976)
-- Name: horoscope_types pk_horoscope_types; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.horoscope_types ALTER COLUMN pk_horoscope_types SET DEFAULT nextval('public.horoscope_types_pk_horoscope_types_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 89129)
-- Name: house_in_sign_texts pk_house_in_sign_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.house_in_sign_texts ALTER COLUMN pk_house_in_sign_texts SET DEFAULT nextval('public.house_in_sign_texts_pk_house_in_sign_texts_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 89130)
-- Name: houses_texts pk_signs_in_houses_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.houses_texts ALTER COLUMN pk_signs_in_houses_texts SET DEFAULT nextval('public.houses_texts_pk_signs_in_houses_texts_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 89131)
-- Name: planet_in_sign_texts pk_planet_in_sign_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.planet_in_sign_texts ALTER COLUMN pk_planet_in_sign_texts SET DEFAULT nextval('public.planet_in_sign_texts_pk_planet_in_sign_texts_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 89132)
-- Name: romantic_horoscope_texts pk_romantic_horoscope_texts; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.romantic_horoscope_texts ALTER COLUMN pk_romantic_horoscope_texts SET DEFAULT nextval('public.romantic_horoscope_texts_pk_romantic_horoscope_texts_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 88967)
-- Name: signs pk_signs; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.signs ALTER COLUMN pk_signs SET DEFAULT nextval('public.signs_pk_signs_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 88949)
-- Name: user_base pk_user_base; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_base ALTER COLUMN pk_user_base SET DEFAULT nextval('public.user_base_pk_user_base_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 88957)
-- Name: user_info pk_user_info; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_info ALTER COLUMN pk_user_info SET DEFAULT nextval('public.user_info_pk_user_info_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 89068)
-- Name: user_sign pk_user_sign; Type: DEFAULT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_sign ALTER COLUMN pk_user_sign SET DEFAULT nextval('public.user_sign_pk_user_sign_seq'::regclass);


--
-- TOC entry 3451 (class 0 OID 88982)
-- Dependencies: 223
-- Data for Name: admin_info; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.admin_info (pk_admin_ids, admin_id) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 89084)
-- Dependencies: 228
-- Data for Name: aspects_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.aspects_texts (pk_aspects_texts, planet1, planet2, aspect, text) FROM stdin;
1	1	0	0	Sample aspects_text\n
2	1	0	3	Sample aspects_text\n
3	1	0	5	Sample aspects_text\n
4	1	0	6	Sample aspects_text\n
5	1	0	9	Sample aspects_text\n
71	3	1	9	Sample aspects_text\n
6	1	0	10	Sample aspects_text\n
7	2	0	0	Sample aspects_text\n
8	2	0	3	 
9	2	0	5	 
10	2	0	6	 
11	2	0	9	 
12	2	0	10	 
13	2	1	0	Sample aspects_text\n
14	2	1	3	Sample aspects_text\n
15	2	1	5	Sample aspects_text\n
16	2	1	6	Sample aspects_text\n
17	2	1	9	Sample aspects_text\n
18	2	1	10	Sample aspects_text\n
19	2	3	0	Sample aspects_text\n
20	2	3	3	Sample aspects_text\n
21	2	3	5	 
22	2	3	6	 
23	2	3	9	 
24	2	3	10	 
25	2	4	0	Sample aspects_text\n
26	2	4	3	Sample aspects_text\n
27	2	4	5	Sample aspects_text\n
28	2	4	6	Sample aspects_text\n
29	2	4	9	Sample aspects_text\n
30	2	4	10	Sample aspects_text\n
39	2	6	5	Sample aspects_text\n
31	2	5	0	Sample aspects_text\n
32	2	5	3	Sample aspects_text\n
33	2	5	5	Sample aspects_text\n
34	2	5	6	Sample aspects_text\n
35	2	5	9	Sample aspects_text\n
36	2	5	10	Sample aspects_text\n
37	2	6	0	Sample aspects_text\n
38	2	6	3	Sample aspects_text\n
40	2	6	6	Sample aspects_text\n
41	2	6	9	Sample aspects_text\n
42	2	6	10	Sample aspects_text\n
43	2	7	0	Sample aspects_text\n
44	2	7	3	Sample aspects_text\n
45	2	7	5	Sample aspects_text\n
46	2	7	6	Sample aspects_text\n
47	2	7	9	Sample aspects_text\n
49	2	8	0	Sample aspects_text\n
50	2	8	3	Sample aspects_text\n
51	2	8	5	Sample aspects_text\n
52	2	8	6	Sample aspects_text\n
53	2	8	9	Sample aspects_text\n
54	2	8	10	Sample aspects_text\n
55	2	9	0	Sample aspects_text\n
56	2	9	3	Sample aspects_text\n
57	2	9	5	Sample aspects_text\n
58	2	9	6	Sample aspects_text\n
70	3	1	6	Sample aspects_text\n
59	2	9	9	Sample aspects_text\n
60	2	9	10	Sample aspects_text\n
61	3	0	0	Sample aspects_text\n
62	3	0	3	 
63	3	0	5	 
64	3	0	6	 
65	3	0	9	 
66	3	0	10	 
67	3	1	0	Sample aspects_text\n
68	3	1	3	Sample aspects_text\n
69	3	1	5	Sample aspects_text\n
72	3	1	10	Sample aspects_text\n
73	3	4	0	Sample aspects_text\n
74	3	4	3	Sample aspects_text\n
75	3	4	5	Sample aspects_text\n
76	3	4	6	Sample aspects_text\n
77	3	4	9	Sample aspects_text\n
78	3	4	10	Sample aspects_text\n
79	3	5	0	Sample aspects_text\n
80	3	5	3	Sample aspects_text\n
81	3	5	5	Sample aspects_text\n
82	3	5	6	Sample aspects_text\n
83	3	5	9	Sample aspects_text\n
84	3	5	10	Sample aspects_text\n
85	3	6	0	Sample aspects_text\n
101	3	8	9	Sample aspects_text\n
86	3	6	3	Sample aspects_text\n
87	3	6	5	Sample aspects_text\n
88	3	6	6	Sample aspects_text\n
89	3	6	9	Sample aspects_text\n
90	3	6	10	Sample aspects_text\n
91	3	7	0	Sample aspects_text\n
92	3	7	3	Sample aspects_text\n
93	3	7	5	Sample aspects_text\n
94	3	7	6	Sample aspects_text\n
95	3	7	9	Sample aspects_text\n
96	3	7	10	Sample aspects_text\n
97	3	8	0	Sample aspects_text\n
98	3	8	3	Sample aspects_text\n
99	3	8	5	Sample aspects_text\n
100	3	8	6	Sample aspects_text\n
102	3	8	10	Sample aspects_text\n
103	3	9	0	Sample aspects_text\n
104	3	9	3	Sample aspects_text\n
105	3	9	5	Sample aspects_text\n
106	3	9	6	Sample aspects_text\n
107	3	9	9	Sample aspects_text\n
108	3	9	10	Sample aspects_text\n
109	4	0	0	Sample aspects_text\n
110	4	0	3	Sample aspects_text\n
111	4	0	5	Sample aspects_text\n
112	4	0	6	Sample aspects_text\n
113	4	0	9	Sample aspects_text\n
114	4	0	10	Sample aspects_text\n
115	4	1	0	Sample aspects_text\n
116	4	1	3	Sample aspects_text\n
117	4	1	5	Sample aspects_text\n
118	4	1	6	Sample aspects_text\n
119	4	1	9	Sample aspects_text\n
120	4	1	10	Sample aspects_text\n
121	4	5	0	Sample aspects_text\n
122	4	5	3	Sample aspects_text\n
123	4	5	5	Sample aspects_text\n
124	4	5	6	Sample aspects_text\n
125	4	5	9	Sample aspects_text\n
126	4	5	10	Sample aspects_text\n
127	4	6	0	Sample aspects_text\n
135	4	7	5	Sample aspects_text\n
128	4	6	3	Sample aspects_text\n
129	4	6	5	Sample aspects_text\n
130	4	6	6	Sample aspects_text\n
131	4	6	9	Sample aspects_text\n
132	4	6	10	Sample aspects_text\n
133	4	7	0	Sample aspects_text\n
134	4	7	3	Sample aspects_text\n
136	4	7	6	Sample aspects_text\n
137	4	7	9	Sample aspects_text\n
138	4	7	10	Sample aspects_text\n
139	4	8	0	Sample aspects_text\n
140	4	8	3	Sample aspects_text\n
141	4	8	5	Sample aspects_text\n
142	4	8	6	Sample aspects_text\n
143	4	8	9	Sample aspects_text\n
144	4	8	10	Sample aspects_text\n
145	4	9	0	Sample aspects_text\n
146	4	9	3	Sample aspects_text\n
147	4	9	5	Sample aspects_text\n
148	4	9	6	Sample aspects_text\n
149	4	9	9	Sample aspects_text\n
150	4	9	10	Sample aspects_text\n
151	5	0	0	Sample aspects_text\n
152	5	0	3	Sample aspects_text\n
153	5	0	5	Sample aspects_text\n
154	5	0	6	Sample aspects_text\n
155	5	0	9	Sample aspects_text\n
156	5	0	10	Sample aspects_text\n
157	5	1	0	Sample aspects_text\n
158	5	1	3	Sample aspects_text\n
159	5	1	5	Sample aspects_text\n
160	5	1	6	Sample aspects_text\n
161	5	1	9	Sample aspects_text\n
162	5	1	10	Sample aspects_text\n
163	5	6	0	Sample aspects_text\n
164	5	6	3	Sample aspects_text\n
165	5	6	5	Sample aspects_text\n
166	5	6	6	Sample aspects_text\n
167	5	6	9	Sample aspects_text\n
168	5	6	10	Sample aspects_text\n
169	5	7	0	Sample aspects_text\n
170	5	7	3	Sample aspects_text\n
171	5	7	5	Sample aspects_text\n
172	5	7	6	Sample aspects_text\n
173	5	7	9	Sample aspects_text\n
187	6	0	0	Sample aspects_text\n
174	5	7	10	Sample aspects_text\n
175	5	8	0	Sample aspects_text\n
176	5	8	3	Sample aspects_text\n
177	5	8	5	Sample aspects_text\n
178	5	8	6	Sample aspects_text\n
179	5	8	9	Sample aspects_text\n
180	5	8	10	Sample aspects_text\n
188	6	0	3	Sample aspects_text\n
181	5	9	0	Sample aspects_text\n
182	5	9	3	Sample aspects_text\n
183	5	9	5	Sample aspects_text\n
184	5	9	6	Sample aspects_text\n
185	5	9	9	Sample aspects_text\n
186	5	9	10	Sample aspects_text\n
189	6	0	5	Sample aspects_text\n
190	6	0	6	Sample aspects_text\n
191	6	0	9	Sample aspects_text\n
192	6	0	10	Sample aspects_text\n
193	6	1	0	Sample aspects_text\n
194	6	1	3	Sample aspects_text\n
195	6	1	5	Sample aspects_text\n
196	6	1	6	Sample aspects_text\n
197	6	1	9	Sample aspects_text\n
198	6	1	10	Sample aspects_text\n
199	6	7	0	Sample aspects_text\n
200	6	7	3	Sample aspects_text\n
201	6	7	5	Sample aspects_text\n
202	6	7	6	Sample aspects_text\n
203	6	7	9	Sample aspects_text\n
204	6	7	10	Sample aspects_text\n
205	6	8	0	Sample aspects_text\n
206	6	8	3	Sample aspects_text\n
207	6	8	5	Sample aspects_text\n
208	6	8	6	Sample aspects_text\n
246	8	0	10	Sample aspects_text\n
209	6	8	9	Sample aspects_text\n
210	6	8	10	Sample aspects_text\n
211	6	9	0	Sample aspects_text\n
212	6	9	3	Sample aspects_text\n
213	6	9	5	Sample aspects_text\n
214	6	9	6	Sample aspects_text\n
215	6	9	9	Sample aspects_text\n
216	6	9	10	Sample aspects_text\n
217	7	0	0	Sample aspects_text\n
218	7	0	3	Sample aspects_text\n
219	7	0	5	Sample aspects_text\n
220	7	0	6	Sample aspects_text\n
221	7	0	9	Sample aspects_text\n
222	7	0	10	Sample aspects_text\n
223	7	1	0	Sample aspects_text\n
224	7	1	3	Sample aspects_text\n
225	7	1	5	Sample aspects_text\n
226	7	1	6	Sample aspects_text\n
227	7	1	9	Sample aspects_text\n
228	7	1	10	Sample aspects_text\n
229	7	8	0	Sample aspects_text\n
230	7	8	3	Sample aspects_text\n
231	7	8	5	Sample aspects_text\n
232	7	8	6	Sample aspects_text\n
233	7	8	9	 
234	7	8	10	 
235	7	9	0	Sample aspects_text\n
236	7	9	3	Sample aspects_text\n
237	7	9	5	Sample aspects_text\n
238	7	9	6	Sample aspects_text\n
239	7	9	9	 
240	7	9	10	 
241	8	0	0	Sample aspects_text\n
242	8	0	3	Sample aspects_text\n
243	8	0	5	Sample aspects_text\n
244	8	0	6	Sample aspects_text\n
245	8	0	9	 
247	8	1	0	Sample aspects_text\n
248	8	1	3	Sample aspects_text\n
249	8	1	5	Sample aspects_text\n
250	8	1	6	Sample aspects_text\n
251	8	1	9	Sample aspects_text\n
252	8	1	10	Sample aspects_text\n
253	8	9	0	 
254	8	9	3	Sample aspects_text\n
255	8	9	5	 
256	8	9	6	 
257	8	9	9	 
258	8	9	10	 
259	9	0	0	Sample aspects_text\n
260	9	0	3	Sample aspects_text\n
261	9	0	5	Sample aspects_text\n
262	9	0	6	Sample aspects_text\n
263	9	0	9	Sample aspects_text\n
264	9	0	10	Sample aspects_text\n
265	9	1	0	Sample aspects_text\n
266	9	1	3	Sample aspects_text\n
267	9	1	5	Sample aspects_text\n
268	9	1	6	Sample aspects_text\n
269	9	1	9	Sample aspects_text\n
270	9	1	10	Sample aspects_text\n
\.


--
-- TOC entry 3458 (class 0 OID 89090)
-- Dependencies: 230
-- Data for Name: basic_horoscope_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.basic_horoscope_texts (pk_basic_horoscope_texts, horoscope_text) FROM stdin;
1	Sample basic_horoscope_texts\n
2	Sample basic_horoscope_texts\n
3	Sample basic_horoscope_texts\n
4	Sample basic_horoscope_texts\n
5	Sample basic_horoscope_texts\n
6	Sample basic_horoscope_texts\n
7	Sample basic_horoscope_texts\n
8	Sample basic_horoscope_texts\n
9	Sample basic_horoscope_texts\n
10	Sample basic_horoscope_texts\n
11	Sample basic_horoscope_texts\n
12	Sample basic_horoscope_texts\n
13	Sample basic_horoscope_texts\n
14	Sample basic_horoscope_texts\n
15	Sample basic_horoscope_texts\n
16	Sample basic_horoscope_texts\n
17	Sample basic_horoscope_texts\n
18	Sample basic_horoscope_texts\n
19	Sample basic_horoscope_texts\n
20	Sample basic_horoscope_texts\n
21	Sample basic_horoscope_texts\n
22	Sample basic_horoscope_texts\n
23	Sample basic_horoscope_texts\n
24	Sample basic_horoscope_texts\n
25	Sample basic_horoscope_texts\n
26	Sample basic_horoscope_texts\n
27	Sample basic_horoscope_texts\n
28	Sample basic_horoscope_texts\n
29	Sample basic_horoscope_texts\n
30	Sample basic_horoscope_texts\n
31	Sample basic_horoscope_texts\n
32	Sample basic_horoscope_texts\n
33	Sample basic_horoscope_texts\n
34	Sample basic_horoscope_texts\n
35	Sample basic_horoscope_texts\n
36	Sample basic_horoscope_texts\n
37	Sample basic_horoscope_texts\n
38	Sample basic_horoscope_texts\n
39	Sample basic_horoscope_texts\n
40	Sample basic_horoscope_texts\n
41	Sample basic_horoscope_texts\n
42	Sample basic_horoscope_texts\n
43	Sample basic_horoscope_texts\n
44	Sample basic_horoscope_texts\n
45	Sample basic_horoscope_texts\n
46	Sample basic_horoscope_texts\n
47	Sample basic_horoscope_texts\n
48	Sample basic_horoscope_texts\n
49	Sample basic_horoscope_texts\n
50	Sample basic_horoscope_texts\n
51	Sample basic_horoscope_texts\n
52	Sample basic_horoscope_texts\n
53	Sample basic_horoscope_texts\n
54	Sample basic_horoscope_texts\n
55	Sample basic_horoscope_texts\n
56	Sample basic_horoscope_texts\n
57	Sample basic_horoscope_texts\n
58	Sample basic_horoscope_texts\n
59	Sample basic_horoscope_texts\n
60	Sample basic_horoscope_texts\n
61	Sample basic_horoscope_texts\n
62	Sample basic_horoscope_texts\n
63	Sample basic_horoscope_texts\n
64	Sample basic_horoscope_texts\n
65	Sample basic_horoscope_texts\n
66	Sample basic_horoscope_texts\n
67	Sample basic_horoscope_texts\n
68	Sample basic_horoscope_texts\n
69	Sample basic_horoscope_texts\n
70	Sample basic_horoscope_texts\n
71	Sample basic_horoscope_texts\n
72	Sample basic_horoscope_texts\n
73	Sample basic_horoscope_texts\n
74	Sample basic_horoscope_texts\n
75	Sample basic_horoscope_texts\n
76	Sample basic_horoscope_texts\n
77	Sample basic_horoscope_texts\n
78	Sample basic_horoscope_texts\n
79	Sample basic_horoscope_texts\n
80	Sample basic_horoscope_texts\n
81	Sample basic_horoscope_texts\n
82	Sample basic_horoscope_texts\n
83	Sample basic_horoscope_texts\n
84	Sample basic_horoscope_texts\n
85	Sample basic_horoscope_texts\n
86	Sample basic_horoscope_texts\n
87	Sample basic_horoscope_texts\n
88	Sample basic_horoscope_texts\n
89	Sample basic_horoscope_texts\n
90	Sample basic_horoscope_texts\n
91	Sample basic_horoscope_texts\n
92	Sample basic_horoscope_texts\n
93	Sample basic_horoscope_texts\n
94	Sample basic_horoscope_texts\n
95	Sample basic_horoscope_texts\n
96	Sample basic_horoscope_texts\n
97	Sample basic_horoscope_texts\n
98	Sample basic_horoscope_texts\n
99	Sample basic_horoscope_texts\n
100	Sample basic_horoscope_texts\n
101	Sample basic_horoscope_texts\n
102	Sample basic_horoscope_texts\n
103	Sample basic_horoscope_texts\n
104	Sample basic_horoscope_texts\n
105	Sample basic_horoscope_texts\n
106	Sample basic_horoscope_texts\n
107	Sample basic_horoscope_texts\n
108	Sample basic_horoscope_texts\n
109	Sample basic_horoscope_texts\n
110	Sample basic_horoscope_texts\n
111	Sample basic_horoscope_texts\n
112	Sample basic_horoscope_texts\n
113	Sample basic_horoscope_texts\n
114	Sample basic_horoscope_texts\n
115	Sample basic_horoscope_texts\n
116	Sample basic_horoscope_texts\n
117	Sample basic_horoscope_texts\n
118	Sample basic_horoscope_texts\n
119	Sample basic_horoscope_texts\n
120	Sample basic_horoscope_texts\n
121	Sample basic_horoscope_texts\n
122	Sample basic_horoscope_texts\n
123	Sample basic_horoscope_texts\n
124	Sample basic_horoscope_texts\n
125	Sample basic_horoscope_texts\n
126	Sample basic_horoscope_texts\n
127	Sample basic_horoscope_texts\n
128	Sample basic_horoscope_texts\n
129	Sample basic_horoscope_texts\n
130	Sample basic_horoscope_texts\n
131	Sample basic_horoscope_texts\n
132	Sample basic_horoscope_texts\n
133	Sample basic_horoscope_texts\n
134	Sample basic_horoscope_texts\n
135	Sample basic_horoscope_texts\n
136	Sample basic_horoscope_texts\n
137	Sample basic_horoscope_texts\n
138	Sample basic_horoscope_texts\n
139	Sample basic_horoscope_texts\n
140	Sample basic_horoscope_texts\n
141	Sample basic_horoscope_texts\n
142	Sample basic_horoscope_texts\n
143	Sample basic_horoscope_texts\n
144	Sample basic_horoscope_texts\n
145	Sample basic_horoscope_texts\n
146	Sample basic_horoscope_texts\n
147	Sample basic_horoscope_texts\n
148	Sample basic_horoscope_texts\n
149	Sample basic_horoscope_texts\n
150	Sample basic_horoscope_texts\n
151	Sample basic_horoscope_texts\n
152	Sample basic_horoscope_texts\n
153	Sample basic_horoscope_texts\n
154	Sample basic_horoscope_texts\n
155	Sample basic_horoscope_texts\n
156	Sample basic_horoscope_texts\n
157	Sample basic_horoscope_texts\n
158	Sample basic_horoscope_texts\n
159	Sample basic_horoscope_texts\n
160	Sample basic_horoscope_texts\n
161	Sample basic_horoscope_texts\n
162	Sample basic_horoscope_texts\n
163	Sample basic_horoscope_texts\n
164	Sample basic_horoscope_texts\n
165	Sample basic_horoscope_texts\n
166	Sample basic_horoscope_texts\n
167	Sample basic_horoscope_texts\n
168	Sample basic_horoscope_texts\n
169	Sample basic_horoscope_texts\n
170	Sample basic_horoscope_texts\n
171	Sample basic_horoscope_texts\n
172	Sample basic_horoscope_texts\n
173	Sample basic_horoscope_texts\n
174	Sample basic_horoscope_texts\n
175	Sample basic_horoscope_texts\n
176	Sample basic_horoscope_texts\n
177	Sample basic_horoscope_texts\n
178	Sample basic_horoscope_texts\n
179	Sample basic_horoscope_texts\n
180	Sample basic_horoscope_texts\n
181	Sample basic_horoscope_texts\n
182	Sample basic_horoscope_texts\n
183	Sample basic_horoscope_texts\n
184	Sample basic_horoscope_texts\n
185	Sample basic_horoscope_texts\n
186	Sample basic_horoscope_texts\n
187	Sample basic_horoscope_texts\n
188	Sample basic_horoscope_texts\n
189	Sample basic_horoscope_texts\n
190	Sample basic_horoscope_texts\n
191	Sample basic_horoscope_texts\n
192	Sample basic_horoscope_texts\n
193	Sample basic_horoscope_texts\n
194	Sample basic_horoscope_texts\n
195	Sample basic_horoscope_texts\n
196	Sample basic_horoscope_texts\n
197	Sample basic_horoscope_texts\n
198	Sample basic_horoscope_texts\n
199	Sample basic_horoscope_texts\n
200	Sample basic_horoscope_texts\n
201	Sample basic_horoscope_texts\n
202	Sample basic_horoscope_texts\n
203	Sample basic_horoscope_texts\n
204	Sample basic_horoscope_texts\n
205	Sample basic_horoscope_texts\n
206	Sample basic_horoscope_texts\n
207	Sample basic_horoscope_texts\n
208	Sample basic_horoscope_texts\n
209	Sample basic_horoscope_texts\n
210	Sample basic_horoscope_texts\n
211	Sample basic_horoscope_texts\n
212	Sample basic_horoscope_texts\n
213	Sample basic_horoscope_texts\n
214	Sample basic_horoscope_texts\n
215	Sample basic_horoscope_texts\n
216	Sample basic_horoscope_texts\n
217	Sample basic_horoscope_texts\n
218	Sample basic_horoscope_texts\n
219	Sample basic_horoscope_texts\n
220	Sample basic_horoscope_texts\n
221	Sample basic_horoscope_texts\n
222	Sample basic_horoscope_texts\n
223	Sample basic_horoscope_texts\n
224	Sample basic_horoscope_texts\n
225	Sample basic_horoscope_texts\n
226	Sample basic_horoscope_texts\n
227	Sample basic_horoscope_texts\n
228	Sample basic_horoscope_texts\n
229	Sample basic_horoscope_texts\n
230	Sample basic_horoscope_texts\n
231	Sample basic_horoscope_texts\n
232	Sample basic_horoscope_texts\n
233	Sample basic_horoscope_texts\n
234	Sample basic_horoscope_texts\n
235	Sample basic_horoscope_texts\n
236	Sample basic_horoscope_texts\n
237	Sample basic_horoscope_texts\n
238	Sample basic_horoscope_texts\n
239	Sample basic_horoscope_texts\n
240	Sample basic_horoscope_texts\n
241	Sample basic_horoscope_texts\n
242	Sample basic_horoscope_texts\n
243	Sample basic_horoscope_texts\n
244	Sample basic_horoscope_texts\n
245	Sample basic_horoscope_texts\n
246	Sample basic_horoscope_texts\n
247	Sample basic_horoscope_texts\n
248	Sample basic_horoscope_texts\n
249	Sample basic_horoscope_texts\n
250	Sample basic_horoscope_texts\n
251	Sample basic_horoscope_texts\n
252	Sample basic_horoscope_texts\n
253	Sample basic_horoscope_texts\n
254	Sample basic_horoscope_texts\n
255	Sample basic_horoscope_texts\n
256	Sample basic_horoscope_texts\n
257	Sample basic_horoscope_texts\n
258	Sample basic_horoscope_texts\n
259	Sample basic_horoscope_texts\n
260	Sample basic_horoscope_texts\n
261	Sample basic_horoscope_texts\n
262	Sample basic_horoscope_texts\n
263	Sample basic_horoscope_texts\n
264	Sample basic_horoscope_texts\n
265	Sample basic_horoscope_texts\n
266	Sample basic_horoscope_texts\n
267	Sample basic_horoscope_texts\n
268	Sample basic_horoscope_texts\n
269	Sample basic_horoscope_texts\n
270	Sample basic_horoscope_texts\n
271	Sample basic_horoscope_texts\n
272	Sample basic_horoscope_texts\n
273	Sample basic_horoscope_texts\n
274	Sample basic_horoscope_texts\n
275	Sample basic_horoscope_texts\n
276	Sample basic_horoscope_texts\n
277	Sample basic_horoscope_texts\n
278	Sample basic_horoscope_texts\n
279	Sample basic_horoscope_texts\n
280	Sample basic_horoscope_texts\n
281	Sample basic_horoscope_texts\n
282	Sample basic_horoscope_texts\n
283	Sample basic_horoscope_texts\n
284	Sample basic_horoscope_texts\n
285	Sample basic_horoscope_texts\n
286	Sample basic_horoscope_texts\n
287	Sample basic_horoscope_texts\n
288	Sample basic_horoscope_texts\n
289	Sample basic_horoscope_texts\n
290	Sample basic_horoscope_texts\n
291	Sample basic_horoscope_texts\n
292	Sample basic_horoscope_texts\n
293	Sample basic_horoscope_texts\n
294	Sample basic_horoscope_texts\n
295	Sample basic_horoscope_texts\n
296	Sample basic_horoscope_texts\n
297	Sample basic_horoscope_texts\n
298	Sample basic_horoscope_texts\n
299	Sample basic_horoscope_texts\n
300	Sample basic_horoscope_texts\n
301	Sample basic_horoscope_texts\n
302	Sample basic_horoscope_texts\n
303	Sample basic_horoscope_texts\n
304	Sample basic_horoscope_texts\n
305	Sample basic_horoscope_texts\n
306	Sample basic_horoscope_texts\n
307	Sample basic_horoscope_texts\n
308	Sample basic_horoscope_texts\n
309	Sample basic_horoscope_texts\n
310	Sample basic_horoscope_texts\n
311	Sample basic_horoscope_texts\n
312	Sample basic_horoscope_texts\n
313	Sample basic_horoscope_texts\n
314	Sample basic_horoscope_texts\n
315	Sample basic_horoscope_texts\n
316	Sample basic_horoscope_texts\n
317	Sample basic_horoscope_texts\n
318	Sample basic_horoscope_texts\n
319	Sample basic_horoscope_texts\n
320	Sample basic_horoscope_texts\n
321	Sample basic_horoscope_texts\n
322	Sample basic_horoscope_texts\n
323	Sample basic_horoscope_texts\n
324	Sample basic_horoscope_texts\n
325	Sample basic_horoscope_texts\n
326	Sample basic_horoscope_texts\n
327	Sample basic_horoscope_texts\n
328	Sample basic_horoscope_texts\n
329	Sample basic_horoscope_texts\n
330	Sample basic_horoscope_texts\n
331	Sample basic_horoscope_texts\n
332	Sample basic_horoscope_texts\n
333	Sample basic_horoscope_texts\n
334	Sample basic_horoscope_texts\n
335	Sample basic_horoscope_texts\n
336	Sample basic_horoscope_texts\n
337	Sample basic_horoscope_texts\n
338	Sample basic_horoscope_texts\n
339	Sample basic_horoscope_texts\n
340	Sample basic_horoscope_texts\n
341	Sample basic_horoscope_texts\n
342	Sample basic_horoscope_texts\n
343	Sample basic_horoscope_texts\n
344	Sample basic_horoscope_texts\n
345	Sample basic_horoscope_texts\n
346	Sample basic_horoscope_texts\n
347	Sample basic_horoscope_texts\n
348	Sample basic_horoscope_texts\n
349	Sample basic_horoscope_texts\n
350	Sample basic_horoscope_texts\n
351	Sample basic_horoscope_texts\n
352	Sample basic_horoscope_texts\n
353	Sample basic_horoscope_texts\n
354	Sample basic_horoscope_texts\n
355	Sample basic_horoscope_texts\n
356	Sample basic_horoscope_texts\n
357	Sample basic_horoscope_texts\n
358	Sample basic_horoscope_texts\n
359	Sample basic_horoscope_texts\n
360	Sample basic_horoscope_texts\n
361	Sample basic_horoscope_texts\n
362	Sample basic_horoscope_texts\n
363	Sample basic_horoscope_texts\n
364	Sample basic_horoscope_texts\n
365	Sample basic_horoscope_texts\n
366	Sample basic_horoscope_texts\n
367	Sample basic_horoscope_texts\n
368	Sample basic_horoscope_texts\n
369	Sample basic_horoscope_texts\n
370	Sample basic_horoscope_texts\n
371	Sample basic_horoscope_texts\n
372	Sample basic_horoscope_texts\n
373	Sample basic_horoscope_texts\n
374	Sample basic_horoscope_texts\n
375	Sample basic_horoscope_texts\n
376	Sample basic_horoscope_texts\n
377	Sample basic_horoscope_texts\n
378	Sample basic_horoscope_texts\n
379	Sample basic_horoscope_texts\n
380	Sample basic_horoscope_texts\n
381	Sample basic_horoscope_texts\n
382	Sample basic_horoscope_texts\n
383	Sample basic_horoscope_texts\n
384	Sample basic_horoscope_texts\n
385	Sample basic_horoscope_texts\n
386	Sample basic_horoscope_texts\n
387	Sample basic_horoscope_texts\n
388	Sample basic_horoscope_texts\n
389	Sample basic_horoscope_texts\n
390	Sample basic_horoscope_texts\n
391	Sample basic_horoscope_texts\n
392	Sample basic_horoscope_texts\n
393	Sample basic_horoscope_texts\n
394	Sample basic_horoscope_texts\n
395	Sample basic_horoscope_texts\n
396	Sample basic_horoscope_texts\n
397	Sample basic_horoscope_texts\n
398	Sample basic_horoscope_texts\n
399	Sample basic_horoscope_texts\n
400	Sample basic_horoscope_texts\n
401	Sample basic_horoscope_texts\n
402	Sample basic_horoscope_texts\n
403	Sample basic_horoscope_texts\n
404	Sample basic_horoscope_texts\n
405	Sample basic_horoscope_texts\n
406	Sample basic_horoscope_texts\n
407	Sample basic_horoscope_texts\n
408	Sample basic_horoscope_texts\n
409	Sample basic_horoscope_texts\n
410	Sample basic_horoscope_texts\n
411	Sample basic_horoscope_texts\n
412	Sample basic_horoscope_texts\n
413	Sample basic_horoscope_texts\n
414	Sample basic_horoscope_texts\n
415	Sample basic_horoscope_texts\n
416	Sample basic_horoscope_texts\n
417	Sample basic_horoscope_texts\n
418	Sample basic_horoscope_texts\n
419	Sample basic_horoscope_texts\n
420	Sample basic_horoscope_texts\n
421	Sample basic_horoscope_texts\n
422	Sample basic_horoscope_texts\n
423	Sample basic_horoscope_texts\n
424	Sample basic_horoscope_texts\n
425	Sample basic_horoscope_texts\n
426	Sample basic_horoscope_texts\n
427	Sample basic_horoscope_texts\n
428	Sample basic_horoscope_texts\n
429	Sample basic_horoscope_texts\n
430	Sample basic_horoscope_texts\n
431	Sample basic_horoscope_texts\n
432	Sample basic_horoscope_texts\n
433	Sample basic_horoscope_texts\n
434	Sample basic_horoscope_texts\n
435	Sample basic_horoscope_texts\n
436	Sample basic_horoscope_texts\n
437	Sample basic_horoscope_texts\n
438	Sample basic_horoscope_texts\n
439	Sample basic_horoscope_texts\n
440	Sample basic_horoscope_texts\n
441	Sample basic_horoscope_texts\n
442	Sample basic_horoscope_texts\n
443	Sample basic_horoscope_texts\n
444	Sample basic_horoscope_texts\n
445	Sample basic_horoscope_texts\n
446	Sample basic_horoscope_texts\n
447	Sample basic_horoscope_texts\n
448	Sample basic_horoscope_texts\n
449	Sample basic_horoscope_texts\n
450	Sample basic_horoscope_texts\n
451	Sample basic_horoscope_texts\n
452	Sample basic_horoscope_texts\n
453	Sample basic_horoscope_texts\n
454	Sample basic_horoscope_texts\n
455	Sample basic_horoscope_texts\n
456	Sample basic_horoscope_texts\n
457	Sample basic_horoscope_texts\n
458	Sample basic_horoscope_texts\n
459	Sample basic_horoscope_texts\n
460	Sample basic_horoscope_texts\n
461	Sample basic_horoscope_texts\n
462	Sample basic_horoscope_texts\n
463	Sample basic_horoscope_texts\n
464	Sample basic_horoscope_texts\n
465	Sample basic_horoscope_texts\n
466	Sample basic_horoscope_texts\n
467	Sample basic_horoscope_texts\n
468	Sample basic_horoscope_texts\n
469	Sample basic_horoscope_texts\n
470	Sample basic_horoscope_texts\n
471	Sample basic_horoscope_texts\n
472	Sample basic_horoscope_texts\n
473	Sample basic_horoscope_texts\n
474	Sample basic_horoscope_texts\n
475	Sample basic_horoscope_texts\n
476	Sample basic_horoscope_texts\n
477	Sample basic_horoscope_texts\n
478	Sample basic_horoscope_texts\n
479	Sample basic_horoscope_texts\n
480	Sample basic_horoscope_texts\n
481	Sample basic_horoscope_texts\n
482	Sample basic_horoscope_texts\n
483	Sample basic_horoscope_texts\n
484	Sample basic_horoscope_texts\n
485	Sample basic_horoscope_texts\n
486	Sample basic_horoscope_texts\n
487	Sample basic_horoscope_texts\n
488	Sample basic_horoscope_texts\n
489	Sample basic_horoscope_texts\n
490	Sample basic_horoscope_texts\n
491	Sample basic_horoscope_texts\n
492	Sample basic_horoscope_texts\n
493	Sample basic_horoscope_texts\n
494	Sample basic_horoscope_texts\n
495	Sample basic_horoscope_texts\n
496	Sample basic_horoscope_texts\n
497	Sample basic_horoscope_texts\n
498	Sample basic_horoscope_texts\n
499	Sample basic_horoscope_texts\n
500	Sample basic_horoscope_texts\n
501	Sample basic_horoscope_texts\n
502	Sample basic_horoscope_texts\n
503	Sample basic_horoscope_texts\n
504	Sample basic_horoscope_texts\n
505	Sample basic_horoscope_texts\n
506	Sample basic_horoscope_texts\n
507	Sample basic_horoscope_texts\n
508	Sample basic_horoscope_texts\n
509	Sample basic_horoscope_texts\n
510	Sample basic_horoscope_texts\n
511	Sample basic_horoscope_texts\n
512	Sample basic_horoscope_texts\n
513	Sample basic_horoscope_texts\n
514	Sample basic_horoscope_texts\n
515	Sample basic_horoscope_texts\n
516	Sample basic_horoscope_texts\n
517	Sample basic_horoscope_texts\n
518	Sample basic_horoscope_texts\n
519	Sample basic_horoscope_texts\n
520	Sample basic_horoscope_texts\n
521	Sample basic_horoscope_texts\n
522	Sample basic_horoscope_texts\n
523	Sample basic_horoscope_texts\n
524	Sample basic_horoscope_texts\n
525	Sample basic_horoscope_texts\n
526	Sample basic_horoscope_texts\n
527	Sample basic_horoscope_texts\n
528	Sample basic_horoscope_texts\n
529	Sample basic_horoscope_texts\n
530	Sample basic_horoscope_texts\n
531	Sample basic_horoscope_texts\n
532	Sample basic_horoscope_texts\n
533	Sample basic_horoscope_texts\n
534	Sample basic_horoscope_texts\n
535	Sample basic_horoscope_texts\n
536	Sample basic_horoscope_texts\n
537	Sample basic_horoscope_texts\n
538	Sample basic_horoscope_texts\n
539	Sample basic_horoscope_texts\n
540	Sample basic_horoscope_texts\n
541	Sample basic_horoscope_texts\n
542	Sample basic_horoscope_texts\n
543	Sample basic_horoscope_texts\n
544	Sample basic_horoscope_texts\n
545	Sample basic_horoscope_texts\n
546	Sample basic_horoscope_texts\n
547	Sample basic_horoscope_texts\n
548	Sample basic_horoscope_texts\n
549	Sample basic_horoscope_texts\n
550	Sample basic_horoscope_texts\n
551	Sample basic_horoscope_texts\n
552	Sample basic_horoscope_texts\n
553	Sample basic_horoscope_texts\n
554	Sample basic_horoscope_texts\n
555	Sample basic_horoscope_texts\n
556	Sample basic_horoscope_texts\n
557	Sample basic_horoscope_texts\n
558	Sample basic_horoscope_texts\n
559	Sample basic_horoscope_texts\n
560	Sample basic_horoscope_texts\n
561	Sample basic_horoscope_texts\n
562	Sample basic_horoscope_texts\n
563	Sample basic_horoscope_texts\n
564	Sample basic_horoscope_texts\n
565	Sample basic_horoscope_texts\n
566	Sample basic_horoscope_texts\n
567	Sample basic_horoscope_texts\n
568	Sample basic_horoscope_texts\n
569	Sample basic_horoscope_texts\n
570	Sample basic_horoscope_texts\n
571	Sample basic_horoscope_texts\n
572	Sample basic_horoscope_texts\n
573	Sample basic_horoscope_texts\n
574	Sample basic_horoscope_texts\n
575	Sample basic_horoscope_texts\n
576	Sample basic_horoscope_texts\n
577	Sample basic_horoscope_texts\n
578	Sample basic_horoscope_texts\n
579	Sample basic_horoscope_texts\n
580	Sample basic_horoscope_texts\n
581	Sample basic_horoscope_texts\n
582	Sample basic_horoscope_texts\n
583	Sample basic_horoscope_texts\n
584	Sample basic_horoscope_texts\n
585	Sample basic_horoscope_texts\n
586	Sample basic_horoscope_texts\n
587	Sample basic_horoscope_texts\n
588	Sample basic_horoscope_texts\n
589	Sample basic_horoscope_texts\n
590	Sample basic_horoscope_texts\n
591	Sample basic_horoscope_texts\n
592	Sample basic_horoscope_texts\n
593	Sample basic_horoscope_texts\n
594	Sample basic_horoscope_texts\n
595	Sample basic_horoscope_texts\n
596	Sample basic_horoscope_texts\n
597	Sample basic_horoscope_texts\n
598	Sample basic_horoscope_texts\n
599	Sample basic_horoscope_texts\n
600	Sample basic_horoscope_texts\n
601	Sample basic_horoscope_texts\n
602	Sample basic_horoscope_texts\n
603	Sample basic_horoscope_texts\n
604	Sample basic_horoscope_texts\n
605	Sample basic_horoscope_texts\n
606	Sample basic_horoscope_texts\n
607	Sample basic_horoscope_texts\n
608	Sample basic_horoscope_texts\n
609	Sample basic_horoscope_texts\n
610	Sample basic_horoscope_texts\n
611	Sample basic_horoscope_texts\n
612	Sample basic_horoscope_texts\n
613	Sample basic_horoscope_texts\n
614	Sample basic_horoscope_texts\n
615	Sample basic_horoscope_texts\n
616	Sample basic_horoscope_texts\n
617	Sample basic_horoscope_texts\n
618	Sample basic_horoscope_texts\n
619	Sample basic_horoscope_texts\n
620	Sample basic_horoscope_texts\n
621	Sample basic_horoscope_texts\n
622	Sample basic_horoscope_texts\n
623	Sample basic_horoscope_texts\n
624	Sample basic_horoscope_texts\n
625	Sample basic_horoscope_texts\n
626	Sample basic_horoscope_texts\n
627	Sample basic_horoscope_texts\n
628	Sample basic_horoscope_texts\n
629	Sample basic_horoscope_texts\n
630	Sample basic_horoscope_texts\n
631	Sample basic_horoscope_texts\n
632	Sample basic_horoscope_texts\n
633	Sample basic_horoscope_texts\n
634	Sample basic_horoscope_texts\n
635	Sample basic_horoscope_texts\n
636	Sample basic_horoscope_texts\n
637	Sample basic_horoscope_texts\n
638	Sample basic_horoscope_texts\n
639	Sample basic_horoscope_texts\n
640	Sample basic_horoscope_texts\n
641	Sample basic_horoscope_texts\n
642	Sample basic_horoscope_texts\n
643	Sample basic_horoscope_texts\n
644	Sample basic_horoscope_texts\n
645	Sample basic_horoscope_texts\n
646	Sample basic_horoscope_texts\n
647	Sample basic_horoscope_texts\n
648	Sample basic_horoscope_texts\n
649	Sample basic_horoscope_texts\n
650	Sample basic_horoscope_texts\n
651	Sample basic_horoscope_texts\n
652	Sample basic_horoscope_texts\n
653	Sample basic_horoscope_texts\n
654	Sample basic_horoscope_texts\n
655	Sample basic_horoscope_texts\n
656	Sample basic_horoscope_texts\n
657	Sample basic_horoscope_texts\n
658	Sample basic_horoscope_texts\n
659	Sample basic_horoscope_texts\n
660	Sample basic_horoscope_texts\n
661	Sample basic_horoscope_texts\n
662	Sample basic_horoscope_texts\n
663	Sample basic_horoscope_texts\n
664	Sample basic_horoscope_texts\n
665	Sample basic_horoscope_texts\n
666	Sample basic_horoscope_texts\n
667	Sample basic_horoscope_texts\n
668	Sample basic_horoscope_texts\n
669	Sample basic_horoscope_texts\n
670	Sample basic_horoscope_texts\n
671	Sample basic_horoscope_texts\n
672	Sample basic_horoscope_texts\n
673	Sample basic_horoscope_texts\n
674	Sample basic_horoscope_texts\n
675	Sample basic_horoscope_texts\n
676	Sample basic_horoscope_texts\n
677	Sample basic_horoscope_texts\n
678	Sample basic_horoscope_texts\n
679	Sample basic_horoscope_texts\n
680	Sample basic_horoscope_texts\n
681	Sample basic_horoscope_texts\n
682	Sample basic_horoscope_texts\n
683	Sample basic_horoscope_texts\n
684	Sample basic_horoscope_texts\n
685	Sample basic_horoscope_texts\n
686	Sample basic_horoscope_texts\n
687	Sample basic_horoscope_texts\n
688	Sample basic_horoscope_texts\n
689	Sample basic_horoscope_texts\n
690	Sample basic_horoscope_texts\n
691	Sample basic_horoscope_texts\n
692	Sample basic_horoscope_texts\n
693	Sample basic_horoscope_texts\n
694	Sample basic_horoscope_texts\n
695	Sample basic_horoscope_texts\n
696	Sample basic_horoscope_texts\n
697	Sample basic_horoscope_texts\n
698	Sample basic_horoscope_texts\n
699	Sample basic_horoscope_texts\n
700	Sample basic_horoscope_texts\n
701	Sample basic_horoscope_texts\n
702	Sample basic_horoscope_texts\n
703	Sample basic_horoscope_texts\n
704	Sample basic_horoscope_texts\n
705	Sample basic_horoscope_texts\n
706	Sample basic_horoscope_texts\n
707	Sample basic_horoscope_texts\n
708	Sample basic_horoscope_texts\n
709	Sample basic_horoscope_texts\n
710	Sample basic_horoscope_texts\n
711	Sample basic_horoscope_texts\n
712	Sample basic_horoscope_texts\n
713	Sample basic_horoscope_texts\n
714	Sample basic_horoscope_texts\n
715	Sample basic_horoscope_texts\n
716	Sample basic_horoscope_texts\n
717	Sample basic_horoscope_texts\n
718	Sample basic_horoscope_texts\n
719	Sample basic_horoscope_texts\n
720	Sample basic_horoscope_texts\n
721	Sample basic_horoscope_texts\n
722	Sample basic_horoscope_texts\n
723	Sample basic_horoscope_texts\n
724	Sample basic_horoscope_texts\n
725	Sample basic_horoscope_texts\n
726	Sample basic_horoscope_texts\n
727	Sample basic_horoscope_texts\n
728	Sample basic_horoscope_texts\n
729	Sample basic_horoscope_texts\n
730	Sample basic_horoscope_texts\n
731	Sample basic_horoscope_texts\n
732	Sample basic_horoscope_texts\n
733	Sample basic_horoscope_texts\n
734	Sample basic_horoscope_texts\n
735	Sample basic_horoscope_texts\n
736	Sample basic_horoscope_texts\n
737	Sample basic_horoscope_texts\n
738	Sample basic_horoscope_texts\n
739	Sample basic_horoscope_texts\n
740	Sample basic_horoscope_texts\n
741	Sample basic_horoscope_texts\n
742	Sample basic_horoscope_texts\n
743	Sample basic_horoscope_texts\n
744	Sample basic_horoscope_texts\n
745	Sample basic_horoscope_texts\n
746	Sample basic_horoscope_texts\n
747	Sample basic_horoscope_texts\n
748	Sample basic_horoscope_texts\n
749	Sample basic_horoscope_texts\n
750	Sample basic_horoscope_texts\n
751	Sample basic_horoscope_texts\n
752	Sample basic_horoscope_texts\n
753	Sample basic_horoscope_texts\n
754	Sample basic_horoscope_texts\n
755	Sample basic_horoscope_texts\n
756	Sample basic_horoscope_texts\n
757	Sample basic_horoscope_texts\n
758	Sample basic_horoscope_texts\n
759	Sample basic_horoscope_texts\n
760	Sample basic_horoscope_texts\n
761	Sample basic_horoscope_texts\n
762	Sample basic_horoscope_texts\n
763	Sample basic_horoscope_texts\n
764	Sample basic_horoscope_texts\n
765	Sample basic_horoscope_texts\n
766	Sample basic_horoscope_texts\n
767	Sample basic_horoscope_texts\n
768	Sample basic_horoscope_texts\n
769	Sample basic_horoscope_texts\n
770	Sample basic_horoscope_texts\n
771	Sample basic_horoscope_texts\n
772	Sample basic_horoscope_texts\n
773	Sample basic_horoscope_texts\n
774	Sample basic_horoscope_texts\n
775	Sample basic_horoscope_texts\n
776	Sample basic_horoscope_texts\n
777	Sample basic_horoscope_texts\n
778	Sample basic_horoscope_texts\n
779	Sample basic_horoscope_texts\n
780	Sample basic_horoscope_texts\n
781	Sample basic_horoscope_texts\n
782	Sample basic_horoscope_texts\n
783	Sample basic_horoscope_texts\n
784	Sample basic_horoscope_texts\n
785	Sample basic_horoscope_texts\n
786	Sample basic_horoscope_texts\n
787	Sample basic_horoscope_texts\n
788	Sample basic_horoscope_texts\n
789	Sample basic_horoscope_texts\n
790	Sample basic_horoscope_texts\n
791	Sample basic_horoscope_texts\n
792	Sample basic_horoscope_texts\n
793	Sample basic_horoscope_texts\n
794	Sample basic_horoscope_texts\n
795	Sample basic_horoscope_texts\n
796	Sample basic_horoscope_texts\n
797	Sample basic_horoscope_texts\n
798	Sample basic_horoscope_texts\n
799	Sample basic_horoscope_texts\n
800	Sample basic_horoscope_texts\n
801	Sample basic_horoscope_texts\n
802	Sample basic_horoscope_texts\n
803	Sample basic_horoscope_texts\n
804	Sample basic_horoscope_texts\n
805	Sample basic_horoscope_texts\n
806	Sample basic_horoscope_texts\n
807	Sample basic_horoscope_texts\n
808	Sample basic_horoscope_texts\n
809	Sample basic_horoscope_texts\n
810	Sample basic_horoscope_texts\n
811	Sample basic_horoscope_texts\n
812	Sample basic_horoscope_texts\n
813	Sample basic_horoscope_texts\n
814	Sample basic_horoscope_texts\n
815	Sample basic_horoscope_texts\n
816	Sample basic_horoscope_texts\n
817	Sample basic_horoscope_texts\n
818	Sample basic_horoscope_texts\n
819	Sample basic_horoscope_texts\n
820	Sample basic_horoscope_texts\n
821	Sample basic_horoscope_texts\n
822	Sample basic_horoscope_texts\n
823	Sample basic_horoscope_texts\n
824	Sample basic_horoscope_texts\n
825	Sample basic_horoscope_texts\n
826	Sample basic_horoscope_texts\n
827	Sample basic_horoscope_texts\n
828	Sample basic_horoscope_texts\n
829	Sample basic_horoscope_texts\n
830	Sample basic_horoscope_texts\n
831	Sample basic_horoscope_texts\n
832	Sample basic_horoscope_texts\n
833	Sample basic_horoscope_texts\n
834	Sample basic_horoscope_texts\n
835	Sample basic_horoscope_texts\n
836	Sample basic_horoscope_texts\n
837	Sample basic_horoscope_texts\n
838	Sample basic_horoscope_texts\n
839	Sample basic_horoscope_texts\n
840	Sample basic_horoscope_texts\n
841	Sample basic_horoscope_texts\n
842	Sample basic_horoscope_texts\n
843	Sample basic_horoscope_texts\n
844	Sample basic_horoscope_texts\n
845	Sample basic_horoscope_texts\n
846	Sample basic_horoscope_texts\n
847	Sample basic_horoscope_texts\n
848	Sample basic_horoscope_texts\n
849	Sample basic_horoscope_texts\n
850	Sample basic_horoscope_texts\n
851	Sample basic_horoscope_texts\n
852	Sample basic_horoscope_texts\n
853	Sample basic_horoscope_texts\n
854	Sample basic_horoscope_texts\n
855	Sample basic_horoscope_texts\n
856	Sample basic_horoscope_texts\n
857	Sample basic_horoscope_texts\n
858	Sample basic_horoscope_texts\n
859	Sample basic_horoscope_texts\n
860	Sample basic_horoscope_texts\n
861	Sample basic_horoscope_texts\n
862	Sample basic_horoscope_texts\n
863	Sample basic_horoscope_texts\n
864	Sample basic_horoscope_texts\n
865	Sample basic_horoscope_texts\n
866	Sample basic_horoscope_texts\n
867	Sample basic_horoscope_texts\n
868	Sample basic_horoscope_texts\n
869	Sample basic_horoscope_texts\n
870	Sample basic_horoscope_texts\n
871	Sample basic_horoscope_texts\n
872	Sample basic_horoscope_texts\n
873	Sample basic_horoscope_texts\n
874	Sample basic_horoscope_texts\n
875	Sample basic_horoscope_texts\n
876	Sample basic_horoscope_texts\n
877	Sample basic_horoscope_texts\n
878	Sample basic_horoscope_texts\n
879	Sample basic_horoscope_texts\n
880	Sample basic_horoscope_texts\n
881	Sample basic_horoscope_texts\n
882	Sample basic_horoscope_texts\n
883	Sample basic_horoscope_texts\n
884	Sample basic_horoscope_texts\n
885	Sample basic_horoscope_texts\n
886	Sample basic_horoscope_texts\n
887	Sample basic_horoscope_texts\n
888	Sample basic_horoscope_texts\n
889	Sample basic_horoscope_texts\n
890	Sample basic_horoscope_texts\n
891	Sample basic_horoscope_texts\n
892	Sample basic_horoscope_texts\n
893	Sample basic_horoscope_texts\n
894	Sample basic_horoscope_texts\n
895	Sample basic_horoscope_texts\n
896	Sample basic_horoscope_texts\n
897	Sample basic_horoscope_texts\n
898	Sample basic_horoscope_texts\n
899	Sample basic_horoscope_texts\n
900	Sample basic_horoscope_texts\n
901	Sample basic_horoscope_texts\n
902	Sample basic_horoscope_texts\n
903	Sample basic_horoscope_texts\n
904	Sample basic_horoscope_texts\n
905	Sample basic_horoscope_texts\n
906	Sample basic_horoscope_texts\n
907	Sample basic_horoscope_texts\n
908	Sample basic_horoscope_texts\n
909	Sample basic_horoscope_texts\n
910	Sample basic_horoscope_texts\n
911	Sample basic_horoscope_texts\n
912	Sample basic_horoscope_texts\n
913	Sample basic_horoscope_texts\n
914	Sample basic_horoscope_texts\n
915	Sample basic_horoscope_texts\n
916	Sample basic_horoscope_texts\n
917	Sample basic_horoscope_texts\n
918	Sample basic_horoscope_texts\n
919	Sample basic_horoscope_texts\n
920	Sample basic_horoscope_texts\n
921	Sample basic_horoscope_texts\n
922	Sample basic_horoscope_texts\n
923	Sample basic_horoscope_texts\n
924	Sample basic_horoscope_texts\n
925	Sample basic_horoscope_texts\n
926	Sample basic_horoscope_texts\n
927	Sample basic_horoscope_texts\n
928	Sample basic_horoscope_texts\n
929	Sample basic_horoscope_texts\n
930	Sample basic_horoscope_texts\n
931	Sample basic_horoscope_texts\n
932	Sample basic_horoscope_texts\n
933	Sample basic_horoscope_texts\n
934	Sample basic_horoscope_texts\n
935	Sample basic_horoscope_texts\n
936	Sample basic_horoscope_texts\n
937	Sample basic_horoscope_texts\n
938	Sample basic_horoscope_texts\n
939	Sample basic_horoscope_texts\n
940	Sample basic_horoscope_texts\n
941	Sample basic_horoscope_texts\n
942	Sample basic_horoscope_texts\n
943	Sample basic_horoscope_texts\n
944	Sample basic_horoscope_texts\n
945	Sample basic_horoscope_texts\n
946	Sample basic_horoscope_texts\n
947	Sample basic_horoscope_texts\n
948	Sample basic_horoscope_texts\n
949	Sample basic_horoscope_texts\n
950	Sample basic_horoscope_texts\n
951	Sample basic_horoscope_texts\n
952	Sample basic_horoscope_texts\n
953	Sample basic_horoscope_texts\n
954	Sample basic_horoscope_texts\n
955	Sample basic_horoscope_texts\n
956	Sample basic_horoscope_texts\n
957	Sample basic_horoscope_texts\n
958	Sample basic_horoscope_texts\n
959	Sample basic_horoscope_texts\n
960	Sample basic_horoscope_texts\n
961	Sample basic_horoscope_texts\n
962	Sample basic_horoscope_texts\n
963	Sample basic_horoscope_texts\n
964	Sample basic_horoscope_texts\n
965	Sample basic_horoscope_texts\n
966	Sample basic_horoscope_texts\n
967	Sample basic_horoscope_texts\n
968	Sample basic_horoscope_texts\n
969	Sample basic_horoscope_texts\n
970	Sample basic_horoscope_texts\n
971	Sample basic_horoscope_texts\n
972	Sample basic_horoscope_texts\n
973	Sample basic_horoscope_texts\n
974	Sample basic_horoscope_texts\n
975	Sample basic_horoscope_texts\n
976	Sample basic_horoscope_texts\n
977	Sample basic_horoscope_texts\n
978	Sample basic_horoscope_texts\n
979	Sample basic_horoscope_texts\n
980	Sample basic_horoscope_texts\n
981	Sample basic_horoscope_texts\n
982	Sample basic_horoscope_texts\n
983	Sample basic_horoscope_texts\n
984	Sample basic_horoscope_texts\n
985	Sample basic_horoscope_texts\n
986	Sample basic_horoscope_texts\n
987	Sample basic_horoscope_texts\n
988	Sample basic_horoscope_texts\n
989	Sample basic_horoscope_texts\n
990	Sample basic_horoscope_texts\n
991	Sample basic_horoscope_texts\n
992	Sample basic_horoscope_texts\n
993	Sample basic_horoscope_texts\n
994	Sample basic_horoscope_texts\n
995	Sample basic_horoscope_texts\n
996	Sample basic_horoscope_texts\n
997	Sample basic_horoscope_texts\n
998	Sample basic_horoscope_texts\n
999	Sample basic_horoscope_texts\n
1000	Sample basic_horoscope_texts\n
1001	Sample basic_horoscope_texts\n
1002	Sample basic_horoscope_texts\n
1003	Sample basic_horoscope_texts\n
1004	Sample basic_horoscope_texts\n
1005	Sample basic_horoscope_texts\n
1006	Sample basic_horoscope_texts\n
1007	Sample basic_horoscope_texts\n
1008	Sample basic_horoscope_texts\n
1009	Sample basic_horoscope_texts\n
1010	Sample basic_horoscope_texts\n
1011	Sample basic_horoscope_texts\n
1012	Sample basic_horoscope_texts\n
1013	Sample basic_horoscope_texts\n
1014	Sample basic_horoscope_texts\n
1015	Sample basic_horoscope_texts\n
1016	Sample basic_horoscope_texts\n
1017	Sample basic_horoscope_texts\n
1018	Sample basic_horoscope_texts\n
1019	Sample basic_horoscope_texts\n
1020	Sample basic_horoscope_texts\n
1021	Sample basic_horoscope_texts\n
1022	Sample basic_horoscope_texts\n
1023	Sample basic_horoscope_texts\n
1024	Sample basic_horoscope_texts\n
1025	Sample basic_horoscope_texts\n
1026	Sample basic_horoscope_texts\n
1027	Sample basic_horoscope_texts\n
1028	Sample basic_horoscope_texts\n
1029	Sample basic_horoscope_texts\n
1030	Sample basic_horoscope_texts\n
1031	Sample basic_horoscope_texts\n
1032	Sample basic_horoscope_texts\n
1033	Sample basic_horoscope_texts\n
1034	Sample basic_horoscope_texts\n
1035	Sample basic_horoscope_texts\n
1036	Sample basic_horoscope_texts\n
1037	Sample basic_horoscope_texts\n
1038	Sample basic_horoscope_texts\n
1039	Sample basic_horoscope_texts\n
1040	Sample basic_horoscope_texts\n
1041	Sample basic_horoscope_texts\n
1042	Sample basic_horoscope_texts\n
1043	Sample basic_horoscope_texts\n
1044	Sample basic_horoscope_texts\n
1045	Sample basic_horoscope_texts\n
1046	Sample basic_horoscope_texts\n
1047	Sample basic_horoscope_texts\n
1048	Sample basic_horoscope_texts\n
1049	Sample basic_horoscope_texts\n
1050	Sample basic_horoscope_texts\n
1051	Sample basic_horoscope_texts\n
1052	Sample basic_horoscope_texts\n
1053	Sample basic_horoscope_texts\n
1054	Sample basic_horoscope_texts\n
1055	Sample basic_horoscope_texts\n
1056	Sample basic_horoscope_texts\n
1057	Sample basic_horoscope_texts\n
1058	Sample basic_horoscope_texts\n
1059	Sample basic_horoscope_texts\n
1060	Sample basic_horoscope_texts\n
1061	Sample basic_horoscope_texts\n
1062	Sample basic_horoscope_texts\n
1063	Sample basic_horoscope_texts\n
1064	Sample basic_horoscope_texts\n
1065	Sample basic_horoscope_texts\n
1066	Sample basic_horoscope_texts\n
1067	Sample basic_horoscope_texts\n
1068	Sample basic_horoscope_texts\n
1069	Sample basic_horoscope_texts\n
1070	Sample basic_horoscope_texts\n
1071	Sample basic_horoscope_texts\n
1072	Sample basic_horoscope_texts\n
1073	Sample basic_horoscope_texts\n
1074	Sample basic_horoscope_texts\n
1075	Sample basic_horoscope_texts\n
1076	Sample basic_horoscope_texts\n
1077	Sample basic_horoscope_texts\n
1078	Sample basic_horoscope_texts\n
1079	Sample basic_horoscope_texts\n
1080	Sample basic_horoscope_texts\n
1081	Sample basic_horoscope_texts\n
1082	Sample basic_horoscope_texts\n
1083	Sample basic_horoscope_texts\n
1084	Sample basic_horoscope_texts\n
1085	Sample basic_horoscope_texts\n
1086	Sample basic_horoscope_texts\n
1087	Sample basic_horoscope_texts\n
1088	Sample basic_horoscope_texts\n
1089	Sample basic_horoscope_texts\n
1090	Sample basic_horoscope_texts\n
1091	Sample basic_horoscope_texts\n
1092	Sample basic_horoscope_texts\n
1093	Sample basic_horoscope_texts\n
1094	Sample basic_horoscope_texts\n
1095	Sample basic_horoscope_texts\n
1096	Sample basic_horoscope_texts\n
1097	Sample basic_horoscope_texts\n
1098	Sample basic_horoscope_texts\n
1099	Sample basic_horoscope_texts\n
1100	Sample basic_horoscope_texts\n
1101	Sample basic_horoscope_texts\n
1102	Sample basic_horoscope_texts\n
1103	Sample basic_horoscope_texts\n
1104	Sample basic_horoscope_texts\n
1105	Sample basic_horoscope_texts\n
1106	Sample basic_horoscope_texts\n
1107	Sample basic_horoscope_texts\n
1108	Sample basic_horoscope_texts\n
1109	Sample basic_horoscope_texts\n
1110	Sample basic_horoscope_texts\n
1111	Sample basic_horoscope_texts\n
1112	Sample basic_horoscope_texts\n
1113	Sample basic_horoscope_texts\n
1114	Sample basic_horoscope_texts\n
1115	Sample basic_horoscope_texts\n
1116	Sample basic_horoscope_texts\n
1117	Sample basic_horoscope_texts\n
1118	Sample basic_horoscope_texts\n
1119	Sample basic_horoscope_texts\n
1120	Sample basic_horoscope_texts\n
1121	Sample basic_horoscope_texts\n
1122	Sample basic_horoscope_texts\n
1123	Sample basic_horoscope_texts\n
1124	Sample basic_horoscope_texts\n
1125	Sample basic_horoscope_texts\n
1126	Sample basic_horoscope_texts\n
1127	Sample basic_horoscope_texts\n
1128	Sample basic_horoscope_texts\n
1129	Sample basic_horoscope_texts\n
1130	Sample basic_horoscope_texts\n
1131	Sample basic_horoscope_texts\n
1132	Sample basic_horoscope_texts\n
1133	Sample basic_horoscope_texts\n
1134	Sample basic_horoscope_texts\n
1135	Sample basic_horoscope_texts\n
1136	Sample basic_horoscope_texts\n
1137	Sample basic_horoscope_texts\n
1138	Sample basic_horoscope_texts\n
1139	Sample basic_horoscope_texts\n
1140	Sample basic_horoscope_texts\n
1141	Sample basic_horoscope_texts\n
1142	Sample basic_horoscope_texts\n
1143	Sample basic_horoscope_texts\n
1144	Sample basic_horoscope_texts\n
1145	Sample basic_horoscope_texts\n
1146	Sample basic_horoscope_texts\n
1147	Sample basic_horoscope_texts\n
1148	Sample basic_horoscope_texts\n
1149	Sample basic_horoscope_texts\n
1150	Sample basic_horoscope_texts\n
1151	Sample basic_horoscope_texts\n
1152	Sample basic_horoscope_texts\n
1153	Sample basic_horoscope_texts\n
1154	Sample basic_horoscope_texts\n
1155	Sample basic_horoscope_texts\n
1156	Sample basic_horoscope_texts\n
1157	Sample basic_horoscope_texts\n
1158	Sample basic_horoscope_texts\n
1159	Sample basic_horoscope_texts\n
1160	Sample basic_horoscope_texts\n
1161	Sample basic_horoscope_texts\n
1162	Sample basic_horoscope_texts\n
1163	Sample basic_horoscope_texts\n
1164	Sample basic_horoscope_texts\n
1165	Sample basic_horoscope_texts\n
1166	Sample basic_horoscope_texts\n
1167	Sample basic_horoscope_texts\n
1168	Sample basic_horoscope_texts\n
1169	Sample basic_horoscope_texts\n
1170	Sample basic_horoscope_texts\n
1171	Sample basic_horoscope_texts\n
1172	Sample basic_horoscope_texts\n
1173	Sample basic_horoscope_texts\n
1174	Sample basic_horoscope_texts\n
1175	Sample basic_horoscope_texts\n
1176	Sample basic_horoscope_texts\n
1177	Sample basic_horoscope_texts\n
1178	Sample basic_horoscope_texts\n
1179	Sample basic_horoscope_texts\n
1180	Sample basic_horoscope_texts\n
1181	Sample basic_horoscope_texts\n
1182	Sample basic_horoscope_texts\n
1183	Sample basic_horoscope_texts\n
1184	Sample basic_horoscope_texts\n
1185	Sample basic_horoscope_texts\n
1186	Sample basic_horoscope_texts\n
1187	Sample basic_horoscope_texts\n
1188	Sample basic_horoscope_texts\n
1189	Sample basic_horoscope_texts\n
1190	Sample basic_horoscope_texts\n
1191	Sample basic_horoscope_texts\n
1192	Sample basic_horoscope_texts\n
1193	Sample basic_horoscope_texts\n
1194	Sample basic_horoscope_texts\n
1195	Sample basic_horoscope_texts\n
1196	Sample basic_horoscope_texts\n
1197	Sample basic_horoscope_texts\n
1198	Sample basic_horoscope_texts\n
1199	Sample basic_horoscope_texts\n
1200	Sample basic_horoscope_texts\n
1201	Sample basic_horoscope_texts\n
1202	Sample basic_horoscope_texts\n
1203	Sample basic_horoscope_texts\n
1204	Sample basic_horoscope_texts\n
1205	Sample basic_horoscope_texts\n
1206	Sample basic_horoscope_texts\n
1207	Sample basic_horoscope_texts\n
1208	Sample basic_horoscope_texts\n
1209	Sample basic_horoscope_texts\n
1210	Sample basic_horoscope_texts\n
1211	Sample basic_horoscope_texts\n
1212	Sample basic_horoscope_texts\n
1213	Sample basic_horoscope_texts\n
1214	Sample basic_horoscope_texts\n
1215	Sample basic_horoscope_texts\n
1216	Sample basic_horoscope_texts\n
1217	Sample basic_horoscope_texts\n
1218	Sample basic_horoscope_texts\n
1219	Sample basic_horoscope_texts\n
1220	Sample basic_horoscope_texts\n
1221	Sample basic_horoscope_texts\n
1222	Sample basic_horoscope_texts\n
1223	Sample basic_horoscope_texts\n
1224	Sample basic_horoscope_texts\n
1225	Sample basic_horoscope_texts\n
1226	Sample basic_horoscope_texts\n
1227	Sample basic_horoscope_texts\n
1228	Sample basic_horoscope_texts\n
1229	Sample basic_horoscope_texts\n
1230	Sample basic_horoscope_texts\n
1231	Sample basic_horoscope_texts\n
1232	Sample basic_horoscope_texts\n
1233	Sample basic_horoscope_texts\n
1234	Sample basic_horoscope_texts\n
1235	Sample basic_horoscope_texts\n
1236	Sample basic_horoscope_texts\n
1237	Sample basic_horoscope_texts\n
1238	Sample basic_horoscope_texts\n
1239	Sample basic_horoscope_texts\n
1240	Sample basic_horoscope_texts\n
1241	Sample basic_horoscope_texts\n
1242	Sample basic_horoscope_texts\n
1243	Sample basic_horoscope_texts\n
1244	Sample basic_horoscope_texts\n
1245	Sample basic_horoscope_texts\n
1246	Sample basic_horoscope_texts\n
1247	Sample basic_horoscope_texts\n
1248	Sample basic_horoscope_texts\n
1249	Sample basic_horoscope_texts\n
1250	Sample basic_horoscope_texts\n
1251	Sample basic_horoscope_texts\n
1252	Sample basic_horoscope_texts\n
1253	Sample basic_horoscope_texts\n
1254	Sample basic_horoscope_texts\n
1255	Sample basic_horoscope_texts\n
1256	Sample basic_horoscope_texts\n
1257	Sample basic_horoscope_texts\n
1258	Sample basic_horoscope_texts\n
1259	Sample basic_horoscope_texts\n
1260	Sample basic_horoscope_texts\n
1261	Sample basic_horoscope_texts\n
1262	Sample basic_horoscope_texts\n
1263	Sample basic_horoscope_texts\n
1264	Sample basic_horoscope_texts\n
1265	Sample basic_horoscope_texts\n
1266	Sample basic_horoscope_texts\n
1267	Sample basic_horoscope_texts\n
1268	Sample basic_horoscope_texts\n
1269	Sample basic_horoscope_texts\n
1270	Sample basic_horoscope_texts\n
1271	Sample basic_horoscope_texts\n
1272	Sample basic_horoscope_texts\n
1273	Sample basic_horoscope_texts\n
1274	Sample basic_horoscope_texts\n
1275	Sample basic_horoscope_texts\n
1276	Sample basic_horoscope_texts\n
1277	Sample basic_horoscope_texts\n
1278	Sample basic_horoscope_texts\n
1279	Sample basic_horoscope_texts\n
1280	Sample basic_horoscope_texts\n
1281	Sample basic_horoscope_texts\n
1282	Sample basic_horoscope_texts\n
1283	Sample basic_horoscope_texts\n
1284	Sample basic_horoscope_texts\n
1285	Sample basic_horoscope_texts\n
1286	Sample basic_horoscope_texts\n
1287	Sample basic_horoscope_texts\n
1288	Sample basic_horoscope_texts\n
1289	Sample basic_horoscope_texts\n
1290	Sample basic_horoscope_texts\n
1291	Sample basic_horoscope_texts\n
1292	Sample basic_horoscope_texts\n
1293	Sample basic_horoscope_texts\n
1294	Sample basic_horoscope_texts\n
1295	Sample basic_horoscope_texts\n
1296	Sample basic_horoscope_texts\n
1297	Sample basic_horoscope_texts\n
1298	Sample basic_horoscope_texts\n
1299	Sample basic_horoscope_texts\n
1300	Sample basic_horoscope_texts\n
1301	Sample basic_horoscope_texts\n
1302	Sample basic_horoscope_texts\n
1303	Sample basic_horoscope_texts\n
1304	Sample basic_horoscope_texts\n
1305	Sample basic_horoscope_texts\n
1306	Sample basic_horoscope_texts\n
1307	Sample basic_horoscope_texts\n
1308	Sample basic_horoscope_texts\n
1309	Sample basic_horoscope_texts\n
1310	Sample basic_horoscope_texts\n
1311	Sample basic_horoscope_texts\n
1312	Sample basic_horoscope_texts\n
1313	Sample basic_horoscope_texts\n
1314	Sample basic_horoscope_texts\n
1315	Sample basic_horoscope_texts\n
1316	Sample basic_horoscope_texts\n
1317	Sample basic_horoscope_texts\n
1318	Sample basic_horoscope_texts\n
1319	Sample basic_horoscope_texts\n
1320	Sample basic_horoscope_texts\n
1321	Sample basic_horoscope_texts\n
1322	Sample basic_horoscope_texts\n
1323	Sample basic_horoscope_texts\n
1324	Sample basic_horoscope_texts\n
1325	Sample basic_horoscope_texts\n
1326	Sample basic_horoscope_texts\n
1327	Sample basic_horoscope_texts\n
1328	Sample basic_horoscope_texts\n
1329	Sample basic_horoscope_texts\n
1330	Sample basic_horoscope_texts\n
1331	Sample basic_horoscope_texts\n
1332	Sample basic_horoscope_texts\n
1333	Sample basic_horoscope_texts\n
1334	Sample basic_horoscope_texts\n
1335	Sample basic_horoscope_texts\n
1336	Sample basic_horoscope_texts\n
1337	Sample basic_horoscope_texts\n
1338	Sample basic_horoscope_texts\n
1339	Sample basic_horoscope_texts\n
1340	Sample basic_horoscope_texts\n
1341	Sample basic_horoscope_texts\n
1342	Sample basic_horoscope_texts\n
1343	Sample basic_horoscope_texts\n
1344	Sample basic_horoscope_texts\n
1345	Sample basic_horoscope_texts\n
1346	Sample basic_horoscope_texts\n
1347	Sample basic_horoscope_texts\n
1348	Sample basic_horoscope_texts\n
1349	Sample basic_horoscope_texts\n
1350	Sample basic_horoscope_texts\n
1351	Sample basic_horoscope_texts\n
1352	Sample basic_horoscope_texts\n
1353	Sample basic_horoscope_texts\n
1354	Sample basic_horoscope_texts\n
1355	Sample basic_horoscope_texts\n
1356	Sample basic_horoscope_texts\n
1357	Sample basic_horoscope_texts\n
1358	Sample basic_horoscope_texts\n
1359	Sample basic_horoscope_texts\n
1360	Sample basic_horoscope_texts\n
1361	Sample basic_horoscope_texts\n
1362	Sample basic_horoscope_texts\n
1363	Sample basic_horoscope_texts\n
1364	Sample basic_horoscope_texts\n
1365	Sample basic_horoscope_texts\n
1366	Sample basic_horoscope_texts\n
1367	Sample basic_horoscope_texts\n
1368	Sample basic_horoscope_texts\n
1369	Sample basic_horoscope_texts\n
1370	Sample basic_horoscope_texts\n
1371	Sample basic_horoscope_texts\n
1372	Sample basic_horoscope_texts\n
1373	Sample basic_horoscope_texts\n
1374	Sample basic_horoscope_texts\n
1375	Sample basic_horoscope_texts\n
1376	Sample basic_horoscope_texts\n
1377	Sample basic_horoscope_texts\n
1378	Sample basic_horoscope_texts\n
1379	Sample basic_horoscope_texts\n
1380	Sample basic_horoscope_texts\n
1381	Sample basic_horoscope_texts\n
1382	Sample basic_horoscope_texts\n
1383	Sample basic_horoscope_texts\n
1384	Sample basic_horoscope_texts\n
1385	Sample basic_horoscope_texts\n
1386	Sample basic_horoscope_texts\n
1387	Sample basic_horoscope_texts\n
1388	Sample basic_horoscope_texts\n
1389	Sample basic_horoscope_texts\n
1390	Sample basic_horoscope_texts\n
1391	Sample basic_horoscope_texts\n
1392	Sample basic_horoscope_texts\n
1393	Sample basic_horoscope_texts\n
1394	Sample basic_horoscope_texts\n
1395	Sample basic_horoscope_texts\n
1396	Sample basic_horoscope_texts\n
1397	Sample basic_horoscope_texts\n
1398	Sample basic_horoscope_texts\n
1399	Sample basic_horoscope_texts\n
1400	Sample basic_horoscope_texts\n
1401	Sample basic_horoscope_texts\n
1402	Sample basic_horoscope_texts\n
1403	Sample basic_horoscope_texts\n
1404	Sample basic_horoscope_texts\n
1405	Sample basic_horoscope_texts\n
1406	Sample basic_horoscope_texts\n
1407	Sample basic_horoscope_texts\n
1408	Sample basic_horoscope_texts\n
1409	Sample basic_horoscope_texts\n
1410	Sample basic_horoscope_texts\n
1411	Sample basic_horoscope_texts\n
1412	Sample basic_horoscope_texts\n
1413	Sample basic_horoscope_texts\n
1414	Sample basic_horoscope_texts\n
1415	Sample basic_horoscope_texts\n
1416	Sample basic_horoscope_texts\n
1417	Sample basic_horoscope_texts\n
1418	Sample basic_horoscope_texts\n
1419	Sample basic_horoscope_texts\n
1420	Sample basic_horoscope_texts\n
1421	Sample basic_horoscope_texts\n
1422	Sample basic_horoscope_texts\n
1423	Sample basic_horoscope_texts\n
1424	Sample basic_horoscope_texts\n
1425	Sample basic_horoscope_texts\n
1426	Sample basic_horoscope_texts\n
1427	Sample basic_horoscope_texts\n
1428	Sample basic_horoscope_texts\n
1429	Sample basic_horoscope_texts\n
1430	Sample basic_horoscope_texts\n
1431	Sample basic_horoscope_texts\n
1432	Sample basic_horoscope_texts\n
1433	Sample basic_horoscope_texts\n
1434	Sample basic_horoscope_texts\n
1435	Sample basic_horoscope_texts\n
1436	Sample basic_horoscope_texts\n
1437	Sample basic_horoscope_texts\n
1438	Sample basic_horoscope_texts\n
1439	Sample basic_horoscope_texts\n
1440	Sample basic_horoscope_texts\n
1441	Sample basic_horoscope_texts\n
1442	Sample basic_horoscope_texts\n
1443	Sample basic_horoscope_texts\n
1444	Sample basic_horoscope_texts\n
1445	Sample basic_horoscope_texts\n
1446	Sample basic_horoscope_texts\n
1447	Sample basic_horoscope_texts\n
1448	Sample basic_horoscope_texts\n
1449	Sample basic_horoscope_texts\n
1450	Sample basic_horoscope_texts\n
1451	Sample basic_horoscope_texts\n
1452	Sample basic_horoscope_texts\n
1453	Sample basic_horoscope_texts\n
1454	Sample basic_horoscope_texts\n
1455	Sample basic_horoscope_texts\n
1456	Sample basic_horoscope_texts\n
1457	Sample basic_horoscope_texts\n
1458	Sample basic_horoscope_texts\n
1459	Sample basic_horoscope_texts\n
1460	Sample basic_horoscope_texts\n
1461	Sample basic_horoscope_texts\n
1462	Sample basic_horoscope_texts\n
1463	Sample basic_horoscope_texts\n
1464	Sample basic_horoscope_texts\n
1465	Sample basic_horoscope_texts\n
1466	Sample basic_horoscope_texts\n
1467	Sample basic_horoscope_texts\n
1468	Sample basic_horoscope_texts\n
1469	Sample basic_horoscope_texts\n
1470	Sample basic_horoscope_texts\n
1471	Sample basic_horoscope_texts\n
1472	Sample basic_horoscope_texts\n
1473	Sample basic_horoscope_texts\n
1474	Sample basic_horoscope_texts\n
1475	Sample basic_horoscope_texts\n
1476	Sample basic_horoscope_texts\n
1477	Sample basic_horoscope_texts\n
1478	Sample basic_horoscope_texts\n
1479	Sample basic_horoscope_texts\n
1480	Sample basic_horoscope_texts\n
1481	Sample basic_horoscope_texts\n
1482	Sample basic_horoscope_texts\n
1483	Sample basic_horoscope_texts\n
1484	Sample basic_horoscope_texts\n
1485	Sample basic_horoscope_texts\n
1486	Sample basic_horoscope_texts\n
1487	Sample basic_horoscope_texts\n
1488	Sample basic_horoscope_texts\n
1489	Sample basic_horoscope_texts\n
1490	Sample basic_horoscope_texts\n
1491	Sample basic_horoscope_texts\n
1492	Sample basic_horoscope_texts\n
1493	Sample basic_horoscope_texts\n
1494	Sample basic_horoscope_texts\n
1495	Sample basic_horoscope_texts\n
1496	Sample basic_horoscope_texts\n
1497	Sample basic_horoscope_texts\n
1498	Sample basic_horoscope_texts\n
1499	Sample basic_horoscope_texts\n
1500	Sample basic_horoscope_texts\n
1501	Sample basic_horoscope_texts\n
1502	Sample basic_horoscope_texts\n
1503	Sample basic_horoscope_texts\n
1504	Sample basic_horoscope_texts\n
1505	Sample basic_horoscope_texts\n
1506	Sample basic_horoscope_texts\n
1507	Sample basic_horoscope_texts\n
1508	Sample basic_horoscope_texts\n
1509	Sample basic_horoscope_texts\n
1510	Sample basic_horoscope_texts\n
1511	Sample basic_horoscope_texts\n
1512	Sample basic_horoscope_texts\n
1513	Sample basic_horoscope_texts\n
1514	Sample basic_horoscope_texts\n
1515	Sample basic_horoscope_texts\n
1516	Sample basic_horoscope_texts\n
1517	Sample basic_horoscope_texts\n
1518	Sample basic_horoscope_texts\n
1519	Sample basic_horoscope_texts\n
1520	Sample basic_horoscope_texts\n
1521	Sample basic_horoscope_texts\n
1522	Sample basic_horoscope_texts\n
1523	Sample basic_horoscope_texts\n
1524	Sample basic_horoscope_texts\n
1525	Sample basic_horoscope_texts\n
1526	Sample basic_horoscope_texts\n
1527	Sample basic_horoscope_texts\n
1528	Sample basic_horoscope_texts\n
1529	Sample basic_horoscope_texts\n
1530	Sample basic_horoscope_texts\n
1531	Sample basic_horoscope_texts\n
1532	Sample basic_horoscope_texts\n
1533	Sample basic_horoscope_texts\n
1534	Sample basic_horoscope_texts\n
1535	Sample basic_horoscope_texts\n
1536	Sample basic_horoscope_texts\n
1537	Sample basic_horoscope_texts\n
1538	Sample basic_horoscope_texts\n
1539	Sample basic_horoscope_texts\n
1540	Sample basic_horoscope_texts\n
1541	Sample basic_horoscope_texts\n
1542	Sample basic_horoscope_texts\n
1543	Sample basic_horoscope_texts\n
1544	Sample basic_horoscope_texts\n
1545	Sample basic_horoscope_texts\n
1546	Sample basic_horoscope_texts\n
1547	Sample basic_horoscope_texts\n
1548	Sample basic_horoscope_texts\n
1549	Sample basic_horoscope_texts\n
1550	Sample basic_horoscope_texts\n
1551	Sample basic_horoscope_texts\n
1552	Sample basic_horoscope_texts\n
1553	Sample basic_horoscope_texts\n
1554	Sample basic_horoscope_texts\n
1555	Sample basic_horoscope_texts\n
1556	Sample basic_horoscope_texts\n
1557	Sample basic_horoscope_texts\n
1558	Sample basic_horoscope_texts\n
1559	Sample basic_horoscope_texts\n
1560	Sample basic_horoscope_texts\n
1561	Sample basic_horoscope_texts\n
1562	Sample basic_horoscope_texts\n
1563	Sample basic_horoscope_texts\n
1564	Sample basic_horoscope_texts\n
1565	Sample basic_horoscope_texts\n
1566	Sample basic_horoscope_texts\n
1567	Sample basic_horoscope_texts\n
1568	Sample basic_horoscope_texts\n
1569	Sample basic_horoscope_texts\n
1570	Sample basic_horoscope_texts\n
1571	Sample basic_horoscope_texts\n
1572	Sample basic_horoscope_texts\n
1573	Sample basic_horoscope_texts\n
1574	Sample basic_horoscope_texts\n
1575	Sample basic_horoscope_texts\n
1576	Sample basic_horoscope_texts\n
1577	Sample basic_horoscope_texts\n
1578	Sample basic_horoscope_texts\n
1579	Sample basic_horoscope_texts\n
1580	Sample basic_horoscope_texts\n
1581	Sample basic_horoscope_texts\n
1582	Sample basic_horoscope_texts\n
1583	Sample basic_horoscope_texts\n
1584	Sample basic_horoscope_texts\n
1585	Sample basic_horoscope_texts\n
1586	Sample basic_horoscope_texts\n
1587	Sample basic_horoscope_texts\n
1588	Sample basic_horoscope_texts\n
1589	Sample basic_horoscope_texts\n
1590	Sample basic_horoscope_texts\n
1591	Sample basic_horoscope_texts\n
1592	Sample basic_horoscope_texts\n
1593	Sample basic_horoscope_texts\n
1594	Sample basic_horoscope_texts\n
1595	Sample basic_horoscope_texts\n
1596	Sample basic_horoscope_texts\n
1597	Sample basic_horoscope_texts\n
1598	Sample basic_horoscope_texts\n
1599	Sample basic_horoscope_texts\n
1600	Sample basic_horoscope_texts\n
1601	Sample basic_horoscope_texts\n
1602	Sample basic_horoscope_texts\n
1603	Sample basic_horoscope_texts\n
1604	Sample basic_horoscope_texts\n
1605	Sample basic_horoscope_texts\n
1606	Sample basic_horoscope_texts\n
1607	Sample basic_horoscope_texts\n
1608	Sample basic_horoscope_texts\n
1609	Sample basic_horoscope_texts\n
1610	Sample basic_horoscope_texts\n
1611	Sample basic_horoscope_texts\n
1612	Sample basic_horoscope_texts\n
1613	Sample basic_horoscope_texts\n
1614	Sample basic_horoscope_texts\n
1615	Sample basic_horoscope_texts\n
1616	Sample basic_horoscope_texts\n
1617	Sample basic_horoscope_texts\n
1618	Sample basic_horoscope_texts\n
1619	Sample basic_horoscope_texts\n
1620	Sample basic_horoscope_texts\n
1621	Sample basic_horoscope_texts\n
1622	Sample basic_horoscope_texts\n
1623	Sample basic_horoscope_texts\n
1624	Sample basic_horoscope_texts\n
1625	Sample basic_horoscope_texts\n
1626	Sample basic_horoscope_texts\n
1627	Sample basic_horoscope_texts\n
1628	Sample basic_horoscope_texts\n
1629	Sample basic_horoscope_texts\n
1630	Sample basic_horoscope_texts\n
1631	Sample basic_horoscope_texts\n
1632	Sample basic_horoscope_texts\n
1633	Sample basic_horoscope_texts\n
1634	Sample basic_horoscope_texts\n
1635	Sample basic_horoscope_texts\n
1636	Sample basic_horoscope_texts\n
1637	Sample basic_horoscope_texts\n
1638	Sample basic_horoscope_texts\n
1639	Sample basic_horoscope_texts\n
1640	Sample basic_horoscope_texts\n
1641	Sample basic_horoscope_texts\n
1642	Sample basic_horoscope_texts\n
1643	Sample basic_horoscope_texts\n
1644	Sample basic_horoscope_texts\n
1645	Sample basic_horoscope_texts\n
1646	Sample basic_horoscope_texts\n
1647	Sample basic_horoscope_texts\n
1648	Sample basic_horoscope_texts\n
1649	Sample basic_horoscope_texts\n
1650	Sample basic_horoscope_texts\n
1651	Sample basic_horoscope_texts\n
1652	Sample basic_horoscope_texts\n
1653	Sample basic_horoscope_texts\n
1654	Sample basic_horoscope_texts\n
1655	Sample basic_horoscope_texts\n
1656	Sample basic_horoscope_texts\n
1657	Sample basic_horoscope_texts\n
1658	Sample basic_horoscope_texts\n
1659	Sample basic_horoscope_texts\n
1660	Sample basic_horoscope_texts\n
1661	Sample basic_horoscope_texts\n
1662	Sample basic_horoscope_texts\n
1663	Sample basic_horoscope_texts\n
1664	Sample basic_horoscope_texts\n
1665	Sample basic_horoscope_texts\n
1666	Sample basic_horoscope_texts\n
1667	Sample basic_horoscope_texts\n
1668	Sample basic_horoscope_texts\n
1669	Sample basic_horoscope_texts\n
1670	Sample basic_horoscope_texts\n
1671	Sample basic_horoscope_texts\n
1672	Sample basic_horoscope_texts\n
1673	Sample basic_horoscope_texts\n
1674	Sample basic_horoscope_texts\n
1675	Sample basic_horoscope_texts\n
1676	Sample basic_horoscope_texts\n
1677	Sample basic_horoscope_texts\n
1678	Sample basic_horoscope_texts\n
1679	Sample basic_horoscope_texts\n
1680	Sample basic_horoscope_texts\n
1681	Sample basic_horoscope_texts\n
1682	Sample basic_horoscope_texts\n
1683	Sample basic_horoscope_texts\n
1684	Sample basic_horoscope_texts\n
1685	Sample basic_horoscope_texts\n
1686	Sample basic_horoscope_texts\n
1687	Sample basic_horoscope_texts\n
1688	Sample basic_horoscope_texts\n
1689	Sample basic_horoscope_texts\n
1690	Sample basic_horoscope_texts\n
1691	Sample basic_horoscope_texts\n
1692	Sample basic_horoscope_texts\n
1693	Sample basic_horoscope_texts\n
1694	Sample basic_horoscope_texts\n
1695	Sample basic_horoscope_texts\n
1696	Sample basic_horoscope_texts\n
1697	Sample basic_horoscope_texts\n
1698	Sample basic_horoscope_texts\n
1699	Sample basic_horoscope_texts\n
1700	Sample basic_horoscope_texts\n
1701	Sample basic_horoscope_texts\n
1702	Sample basic_horoscope_texts\n
1703	Sample basic_horoscope_texts\n
1704	Sample basic_horoscope_texts\n
1705	Sample basic_horoscope_texts\n
1706	Sample basic_horoscope_texts\n
1707	Sample basic_horoscope_texts\n
1708	Sample basic_horoscope_texts\n
1709	Sample basic_horoscope_texts\n
1710	Sample basic_horoscope_texts\n
1711	Sample basic_horoscope_texts\n
1712	Sample basic_horoscope_texts\n
1713	Sample basic_horoscope_texts\n
1714	Sample basic_horoscope_texts\n
1715	Sample basic_horoscope_texts\n
1716	Sample basic_horoscope_texts\n
1717	Sample basic_horoscope_texts\n
1718	Sample basic_horoscope_texts\n
1719	Sample basic_horoscope_texts\n
1720	Sample basic_horoscope_texts\n
1721	Sample basic_horoscope_texts\n
1722	Sample basic_horoscope_texts\n
1723	Sample basic_horoscope_texts\n
1724	Sample basic_horoscope_texts\n
1725	Sample basic_horoscope_texts\n
1726	Sample basic_horoscope_texts\n
1727	Sample basic_horoscope_texts\n
1728	Sample basic_horoscope_texts\n
1729	Sample basic_horoscope_texts\n
1730	Sample basic_horoscope_texts\n
1731	Sample basic_horoscope_texts\n
1732	Sample basic_horoscope_texts\n
1733	Sample basic_horoscope_texts\n
1734	Sample basic_horoscope_texts\n
1735	Sample basic_horoscope_texts\n
1736	Sample basic_horoscope_texts\n
1737	Sample basic_horoscope_texts\n
1738	Sample basic_horoscope_texts\n
1739	Sample basic_horoscope_texts\n
1740	Sample basic_horoscope_texts\n
1741	Sample basic_horoscope_texts\n
1742	Sample basic_horoscope_texts\n
1743	Sample basic_horoscope_texts\n
1744	Sample basic_horoscope_texts\n
1745	Sample basic_horoscope_texts\n
1746	Sample basic_horoscope_texts\n
1747	Sample basic_horoscope_texts\n
1748	Sample basic_horoscope_texts\n
1749	Sample basic_horoscope_texts\n
1750	Sample basic_horoscope_texts\n
1751	Sample basic_horoscope_texts\n

\.


--
-- TOC entry 3460 (class 0 OID 89096)
-- Dependencies: 232
-- Data for Name: career_horoscope_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.career_horoscope_texts (pk_career_horoscope_texts, horoscope_text) FROM stdin;
1	Sample career_horoscope_text\n
2	Sample career_horoscope_text\n
3	Sample career_horoscope_text\n
4	Sample career_horoscope_text\n
5	Sample career_horoscope_text\n
6	Sample career_horoscope_text\n
7	Sample career_horoscope_text\n
8	Sample career_horoscope_text\n
9	Sample career_horoscope_text\n
10	Sample career_horoscope_text\n
11	Sample career_horoscope_text\n
12	Sample career_horoscope_text\n
13	Sample career_horoscope_text\n
14	Sample career_horoscope_text\n
15	Sample career_horoscope_text\n
16	Sample career_horoscope_text\n
17	Sample career_horoscope_text\n
18	Sample career_horoscope_text\n
19	Sample career_horoscope_text\n
20	Sample career_horoscope_text\n
21	Sample career_horoscope_text\n
22	Sample career_horoscope_text\n
23	Sample career_horoscope_text\n
24	Sample career_horoscope_text\n
25	Sample career_horoscope_text\n
26	Sample career_horoscope_text\n
27	Sample career_horoscope_text\n
28	Sample career_horoscope_text\n
29	Sample career_horoscope_text\n
30	Sample career_horoscope_text\n
31	Sample career_horoscope_text\n
32	Sample career_horoscope_text\n
33	Sample career_horoscope_text\n
34	Sample career_horoscope_text\n
35	Sample career_horoscope_text\n
36	Sample career_horoscope_text\n
37	Sample career_horoscope_text\n
38	Sample career_horoscope_text\n
39	Sample career_horoscope_text\n
40	Sample career_horoscope_text\n
41	Sample career_horoscope_text\n
42	Sample career_horoscope_text\n
43	Sample career_horoscope_text\n
44	Sample career_horoscope_text\n
45	Sample career_horoscope_text\n
46	Sample career_horoscope_text\n
47	Sample career_horoscope_text\n
48	Sample career_horoscope_text\n
49	Sample career_horoscope_text\n
50	Sample career_horoscope_text\n
51	Sample career_horoscope_text\n
52	Sample career_horoscope_text\n
53	Sample career_horoscope_text\n
54	Sample career_horoscope_text\n
55	Sample career_horoscope_text\n
56	Sample career_horoscope_text\n
57	Sample career_horoscope_text\n
58	Sample career_horoscope_text\n
59	Sample career_horoscope_text\n
60	Sample career_horoscope_text\n
61	Sample career_horoscope_text\n
62	Sample career_horoscope_text\n
63	Sample career_horoscope_text\n
64	Sample career_horoscope_text\n
65	Sample career_horoscope_text\n
66	Sample career_horoscope_text\n
67	Sample career_horoscope_text\n
68	Sample career_horoscope_text\n
69	Sample career_horoscope_text\n
70	Sample career_horoscope_text\n
71	Sample career_horoscope_text\n
72	Sample career_horoscope_text\n
73	Sample career_horoscope_text\n
74	Sample career_horoscope_text\n
75	Sample career_horoscope_text\n
76	Sample career_horoscope_text\n
77	Sample career_horoscope_text\n
78	Sample career_horoscope_text\n
79	Sample career_horoscope_text\n
80	Sample career_horoscope_text\n
81	Sample career_horoscope_text\n
82	Sample career_horoscope_text\n
83	Sample career_horoscope_text\n
84	Sample career_horoscope_text\n
85	Sample career_horoscope_text\n
86	Sample career_horoscope_text\n
87	Sample career_horoscope_text\n
88	Sample career_horoscope_text\n
89	Sample career_horoscope_text\n
90	Sample career_horoscope_text\n
91	Sample career_horoscope_text\n
92	Sample career_horoscope_text\n
93	Sample career_horoscope_text\n
94	Sample career_horoscope_text\n
95	Sample career_horoscope_text\n
96	Sample career_horoscope_text\n
97	Sample career_horoscope_text\n
98	Sample career_horoscope_text\n
99	Sample career_horoscope_text\n
100	Sample career_horoscope_text\n
101	Sample career_horoscope_text\n
102	Sample career_horoscope_text\n
103	Sample career_horoscope_text\n
104	Sample career_horoscope_text\n
105	Sample career_horoscope_text\n
106	Sample career_horoscope_text\n
107	Sample career_horoscope_text\n
108	Sample career_horoscope_text\n
109	Sample career_horoscope_text\n
110	Sample career_horoscope_text\n
111	Sample career_horoscope_text\n
112	Sample career_horoscope_text\n
113	Sample career_horoscope_text\n
114	Sample career_horoscope_text\n
115	Sample career_horoscope_text\n
116	Sample career_horoscope_text\n
117	Sample career_horoscope_text\n
118	Sample career_horoscope_text\n
119	Sample career_horoscope_text\n
120	Sample career_horoscope_text\n
121	Sample career_horoscope_text\n
122	Sample career_horoscope_text\n
123	Sample career_horoscope_text\n
124	Sample career_horoscope_text\n
125	Sample career_horoscope_text\n
126	Sample career_horoscope_text\n
127	Sample career_horoscope_text\n
128	Sample career_horoscope_text\n
129	Sample career_horoscope_text\n
130	Sample career_horoscope_text\n
131	Sample career_horoscope_text\n
132	Sample career_horoscope_text\n
133	Sample career_horoscope_text\n
134	Sample career_horoscope_text\n
135	Sample career_horoscope_text\n
136	Sample career_horoscope_text\n
137	Sample career_horoscope_text\n
138	Sample career_horoscope_text\n
139	Sample career_horoscope_text\n
140	Sample career_horoscope_text\n
141	Sample career_horoscope_text\n
142	Sample career_horoscope_text\n
143	Sample career_horoscope_text\n
144	Sample career_horoscope_text\n
145	Sample career_horoscope_text\n
146	Sample career_horoscope_text\n
147	Sample career_horoscope_text\n
148	Sample career_horoscope_text\n
149	Sample career_horoscope_text\n
150	Sample career_horoscope_text\n
151	Sample career_horoscope_text\n
152	Sample career_horoscope_text\n
153	Sample career_horoscope_text\n
154	Sample career_horoscope_text\n
155	Sample career_horoscope_text\n
156	Sample career_horoscope_text\n
157	Sample career_horoscope_text\n
158	Sample career_horoscope_text\n
159	Sample career_horoscope_text\n
160	Sample career_horoscope_text\n
161	Sample career_horoscope_text\n
162	Sample career_horoscope_text\n
163	Sample career_horoscope_text\n
164	Sample career_horoscope_text\n
165	Sample career_horoscope_text\n
166	Sample career_horoscope_text\n
167	Sample career_horoscope_text\n
168	Sample career_horoscope_text\n
169	Sample career_horoscope_text\n
170	Sample career_horoscope_text\n
171	Sample career_horoscope_text\n
172	Sample career_horoscope_text\n
173	Sample career_horoscope_text\n
174	Sample career_horoscope_text\n
175	Sample career_horoscope_text\n
176	Sample career_horoscope_text\n
177	Sample career_horoscope_text\n
178	Sample career_horoscope_text\n
179	Sample career_horoscope_text\n
180	Sample career_horoscope_text\n
181	Sample career_horoscope_text\n
182	Sample career_horoscope_text\n
183	Sample career_horoscope_text\n
184	Sample career_horoscope_text\n
185	Sample career_horoscope_text\n
186	Sample career_horoscope_text\n
187	Sample career_horoscope_text\n
188	Sample career_horoscope_text\n
189	Sample career_horoscope_text\n
190	Sample career_horoscope_text\n
191	Sample career_horoscope_text\n
192	Sample career_horoscope_text\n
193	Sample career_horoscope_text\n
194	Sample career_horoscope_text\n
195	Sample career_horoscope_text\n
196	Sample career_horoscope_text\n
197	Sample career_horoscope_text\n
198	Sample career_horoscope_text\n
199	Sample career_horoscope_text\n
200	Sample career_horoscope_text\n
201	Sample career_horoscope_text\n
202	Sample career_horoscope_text\n
203	Sample career_horoscope_text\n
204	Sample career_horoscope_text\n
205	Sample career_horoscope_text\n
206	Sample career_horoscope_text\n
207	Sample career_horoscope_text\n
208	Sample career_horoscope_text\n
209	Sample career_horoscope_text\n
210	Sample career_horoscope_text\n
211	Sample career_horoscope_text\n
212	Sample career_horoscope_text\n
213	Sample career_horoscope_text\n
214	Sample career_horoscope_text\n
215	Sample career_horoscope_text\n
216	Sample career_horoscope_text\n
217	Sample career_horoscope_text\n
218	Sample career_horoscope_text\n
219	Sample career_horoscope_text\n
220	Sample career_horoscope_text\n
221	Sample career_horoscope_text\n
222	Sample career_horoscope_text\n
223	Sample career_horoscope_text\n
224	Sample career_horoscope_text\n
225	Sample career_horoscope_text\n
226	Sample career_horoscope_text\n
227	Sample career_horoscope_text\n
228	Sample career_horoscope_text\n
229	Sample career_horoscope_text\n
230	Sample career_horoscope_text\n
231	Sample career_horoscope_text\n
232	Sample career_horoscope_text\n
233	Sample career_horoscope_text\n
234	Sample career_horoscope_text\n
235	Sample career_horoscope_text\n
236	Sample career_horoscope_text\n
237	Sample career_horoscope_text\n
238	Sample career_horoscope_text\n
239	Sample career_horoscope_text\n
240	Sample career_horoscope_text\n
241	Sample career_horoscope_text\n
242	Sample career_horoscope_text\n
243	Sample career_horoscope_text\n
244	Sample career_horoscope_text\n
245	Sample career_horoscope_text\n
246	Sample career_horoscope_text\n
247	Sample career_horoscope_text\n
248	Sample career_horoscope_text\n
249	Sample career_horoscope_text\n
250	Sample career_horoscope_text\n
251	Sample career_horoscope_text\n
252	Sample career_horoscope_text\n
253	Sample career_horoscope_text\n
254	Sample career_horoscope_text\n
255	Sample career_horoscope_text\n
256	Sample career_horoscope_text\n
257	Sample career_horoscope_text\n
258	Sample career_horoscope_text\n
259	Sample career_horoscope_text\n
260	Sample career_horoscope_text\n
261	Sample career_horoscope_text\n
262	Sample career_horoscope_text\n
263	Sample career_horoscope_text\n
264	Sample career_horoscope_text\n
265	Sample career_horoscope_text\n
266	Sample career_horoscope_text\n
267	Sample career_horoscope_text\n
268	Sample career_horoscope_text\n
269	Sample career_horoscope_text\n
270	Sample career_horoscope_text\n
271	Sample career_horoscope_text\n
272	Sample career_horoscope_text\n
273	Sample career_horoscope_text\n
274	Sample career_horoscope_text\n
275	Sample career_horoscope_text\n
276	Sample career_horoscope_text\n
277	Sample career_horoscope_text\n
278	Sample career_horoscope_text\n
279	Sample career_horoscope_text\n
280	Sample career_horoscope_text\n
281	Sample career_horoscope_text\n
282	Sample career_horoscope_text\n
283	Sample career_horoscope_text\n
284	Sample career_horoscope_text\n
285	Sample career_horoscope_text\n
286	Sample career_horoscope_text\n
287	Sample career_horoscope_text\n
288	Sample career_horoscope_text\n
289	Sample career_horoscope_text\n
290	Sample career_horoscope_text\n
291	Sample career_horoscope_text\n
292	Sample career_horoscope_text\n
293	Sample career_horoscope_text\n
294	Sample career_horoscope_text\n
295	Sample career_horoscope_text\n
296	Sample career_horoscope_text\n
297	Sample career_horoscope_text\n
298	Sample career_horoscope_text\n
299	Sample career_horoscope_text\n
300	Sample career_horoscope_text\n
301	Sample career_horoscope_text\n
302	Sample career_horoscope_text\n
303	Sample career_horoscope_text\n
304	Sample career_horoscope_text\n
305	Sample career_horoscope_text\n
306	Sample career_horoscope_text\n
307	Sample career_horoscope_text\n
308	Sample career_horoscope_text\n
309	Sample career_horoscope_text\n
310	Sample career_horoscope_text\n
311	Sample career_horoscope_text\n
312	Sample career_horoscope_text\n
313	Sample career_horoscope_text\n
314	Sample career_horoscope_text\n
315	Sample career_horoscope_text\n
316	Sample career_horoscope_text\n
317	Sample career_horoscope_text\n
318	Sample career_horoscope_text\n
319	Sample career_horoscope_text\n
320	Sample career_horoscope_text\n
321	Sample career_horoscope_text\n
322	Sample career_horoscope_text\n
323	Sample career_horoscope_text\n
324	Sample career_horoscope_text\n
325	Sample career_horoscope_text\n
326	Sample career_horoscope_text\n
327	Sample career_horoscope_text\n
328	Sample career_horoscope_text\n
329	Sample career_horoscope_text\n
330	Sample career_horoscope_text\n
331	Sample career_horoscope_text\n
332	Sample career_horoscope_text\n
333	Sample career_horoscope_text\n
334	Sample career_horoscope_text\n
335	Sample career_horoscope_text\n
336	Sample career_horoscope_text\n
337	Sample career_horoscope_text\n
338	Sample career_horoscope_text\n
339	Sample career_horoscope_text\n
340	Sample career_horoscope_text\n
341	Sample career_horoscope_text\n
342	Sample career_horoscope_text\n
343	Sample career_horoscope_text\n
344	Sample career_horoscope_text\n
345	Sample career_horoscope_text\n
346	Sample career_horoscope_text\n
347	Sample career_horoscope_text\n
348	Sample career_horoscope_text\n
349	Sample career_horoscope_text\n
350	Sample career_horoscope_text\n
351	Sample career_horoscope_text\n
352	Sample career_horoscope_text\n
353	Sample career_horoscope_text\n
354	Sample career_horoscope_text\n
355	Sample career_horoscope_text\n
356	Sample career_horoscope_text\n
357	Sample career_horoscope_text\n
358	Sample career_horoscope_text\n
359	Sample career_horoscope_text\n
360	Sample career_horoscope_text\n
361	Sample career_horoscope_text\n
362	Sample career_horoscope_text\n
363	Sample career_horoscope_text\n
364	Sample career_horoscope_text\n
365	Sample career_horoscope_text\n
366	Sample career_horoscope_text\n
367	Sample career_horoscope_text\n
368	Sample career_horoscope_text\n
369	Sample career_horoscope_text\n
370	Sample career_horoscope_text\n
371	Sample career_horoscope_text\n
372	Sample career_horoscope_text\n
373	Sample career_horoscope_text\n
374	Sample career_horoscope_text\n
375	Sample career_horoscope_text\n
376	Sample career_horoscope_text\n
377	Sample career_horoscope_text\n
378	Sample career_horoscope_text\n
379	Sample career_horoscope_text\n
380	Sample career_horoscope_text\n
381	Sample career_horoscope_text\n
382	Sample career_horoscope_text\n
383	Sample career_horoscope_text\n
384	Sample career_horoscope_text\n
385	Sample career_horoscope_text\n
386	Sample career_horoscope_text\n
387	Sample career_horoscope_text\n
388	Sample career_horoscope_text\n
389	Sample career_horoscope_text\n
390	Sample career_horoscope_text\n
391	Sample career_horoscope_text\n
392	Sample career_horoscope_text\n
393	Sample career_horoscope_text\n
394	Sample career_horoscope_text\n
395	Sample career_horoscope_text\n
396	Sample career_horoscope_text\n
397	Sample career_horoscope_text\n
398	Sample career_horoscope_text\n
399	Sample career_horoscope_text\n
400	Sample career_horoscope_text\n
401	Sample career_horoscope_text\n
402	Sample career_horoscope_text\n
403	Sample career_horoscope_text\n
404	Sample career_horoscope_text\n
405	Sample career_horoscope_text\n
406	Sample career_horoscope_text\n
407	Sample career_horoscope_text\n
408	Sample career_horoscope_text\n
409	Sample career_horoscope_text\n
410	Sample career_horoscope_text\n
411	Sample career_horoscope_text\n
412	Sample career_horoscope_text\n
413	Sample career_horoscope_text\n
414	Sample career_horoscope_text\n
415	Sample career_horoscope_text\n
416	Sample career_horoscope_text\n
417	Sample career_horoscope_text\n
418	Sample career_horoscope_text\n
419	Sample career_horoscope_text\n
420	Sample career_horoscope_text\n
421	Sample career_horoscope_text\n
422	Sample career_horoscope_text\n
423	Sample career_horoscope_text\n
424	Sample career_horoscope_text\n
425	Sample career_horoscope_text\n
426	Sample career_horoscope_text\n
427	Sample career_horoscope_text\n
428	Sample career_horoscope_text\n
429	Sample career_horoscope_text\n
430	Sample career_horoscope_text\n
431	Sample career_horoscope_text\n
432	Sample career_horoscope_text\n
433	Sample career_horoscope_text\n
434	Sample career_horoscope_text\n
435	Sample career_horoscope_text\n
436	Sample career_horoscope_text\n
437	Sample career_horoscope_text\n
438	Sample career_horoscope_text\n
439	Sample career_horoscope_text\n
440	Sample career_horoscope_text\n
441	Sample career_horoscope_text\n
442	Sample career_horoscope_text\n
443	Sample career_horoscope_text\n
444	Sample career_horoscope_text\n
445	Sample career_horoscope_text\n
446	Sample career_horoscope_text\n
447	Sample career_horoscope_text\n
448	Sample career_horoscope_text\n
449	Sample career_horoscope_text\n
450	Sample career_horoscope_text\n
451	Sample career_horoscope_text\n
452	Sample career_horoscope_text\n
453	Sample career_horoscope_text\n
454	Sample career_horoscope_text\n
455	Sample career_horoscope_text\n
456	Sample career_horoscope_text\n
457	Sample career_horoscope_text\n
458	Sample career_horoscope_text\n
459	Sample career_horoscope_text\n
460	Sample career_horoscope_text\n
461	Sample career_horoscope_text\n
462	Sample career_horoscope_text\n
463	Sample career_horoscope_text\n
464	Sample career_horoscope_text\n
465	Sample career_horoscope_text\n
466	Sample career_horoscope_text\n
467	Sample career_horoscope_text\n
468	Sample career_horoscope_text\n
469	Sample career_horoscope_text\n
470	Sample career_horoscope_text\n
471	Sample career_horoscope_text\n
472	Sample career_horoscope_text\n
473	Sample career_horoscope_text\n
474	Sample career_horoscope_text\n
475	Sample career_horoscope_text\n
476	Sample career_horoscope_text\n
477	Sample career_horoscope_text\n
478	Sample career_horoscope_text\n
479	Sample career_horoscope_text\n
480	Sample career_horoscope_text\n
481	Sample career_horoscope_text\n
482	Sample career_horoscope_text\n
483	Sample career_horoscope_text\n
484	Sample career_horoscope_text\n
485	Sample career_horoscope_text\n
486	Sample career_horoscope_text\n
487	Sample career_horoscope_text\n
488	Sample career_horoscope_text\n
489	Sample career_horoscope_text\n
490	Sample career_horoscope_text\n
491	Sample career_horoscope_text\n
492	Sample career_horoscope_text\n
493	Sample career_horoscope_text\n
494	Sample career_horoscope_text\n
495	Sample career_horoscope_text\n
496	Sample career_horoscope_text\n
497	Sample career_horoscope_text\n
498	Sample career_horoscope_text\n
499	Sample career_horoscope_text\n
500	Sample career_horoscope_text\n
501	Sample career_horoscope_text\n
502	Sample career_horoscope_text\n
503	Sample career_horoscope_text\n
504	Sample career_horoscope_text\n
505	Sample career_horoscope_text\n
506	Sample career_horoscope_text\n
507	Sample career_horoscope_text\n
508	Sample career_horoscope_text\n
509	Sample career_horoscope_text\n
510	Sample career_horoscope_text\n
511	Sample career_horoscope_text\n
512	Sample career_horoscope_text\n
513	Sample career_horoscope_text\n
514	Sample career_horoscope_text\n
515	Sample career_horoscope_text\n
516	Sample career_horoscope_text\n
517	Sample career_horoscope_text\n
518	Sample career_horoscope_text\n
519	Sample career_horoscope_text\n
520	Sample career_horoscope_text\n
521	Sample career_horoscope_text\n
522	Sample career_horoscope_text\n
523	Sample career_horoscope_text\n
524	Sample career_horoscope_text\n
525	Sample career_horoscope_text\n
526	Sample career_horoscope_text\n
527	Sample career_horoscope_text\n
528	Sample career_horoscope_text\n
529	Sample career_horoscope_text\n
530	Sample career_horoscope_text\n
531	Sample career_horoscope_text\n
532	Sample career_horoscope_text\n
533	Sample career_horoscope_text\n
534	Sample career_horoscope_text\n
535	Sample career_horoscope_text\n
536	Sample career_horoscope_text\n
537	Sample career_horoscope_text\n
538	Sample career_horoscope_text\n
539	Sample career_horoscope_text\n
540	Sample career_horoscope_text\n
541	Sample career_horoscope_text\n
542	Sample career_horoscope_text\n
543	Sample career_horoscope_text\n
544	Sample career_horoscope_text\n
545	Sample career_horoscope_text\n
546	Sample career_horoscope_text\n
547	Sample career_horoscope_text\n
548	Sample career_horoscope_text\n
549	Sample career_horoscope_text\n
550	Sample career_horoscope_text\n
551	Sample career_horoscope_text\n
552	Sample career_horoscope_text\n
553	Sample career_horoscope_text\n
554	Sample career_horoscope_text\n
555	Sample career_horoscope_text\n
556	Sample career_horoscope_text\n
557	Sample career_horoscope_text\n
558	Sample career_horoscope_text\n
559	Sample career_horoscope_text\n
560	Sample career_horoscope_text\n
561	Sample career_horoscope_text\n
562	Sample career_horoscope_text\n
563	Sample career_horoscope_text\n
564	Sample career_horoscope_text\n
565	Sample career_horoscope_text\n
566	Sample career_horoscope_text\n
567	Sample career_horoscope_text\n
568	Sample career_horoscope_text\n
569	Sample career_horoscope_text\n
570	Sample career_horoscope_text\n
571	Sample career_horoscope_text\n
572	Sample career_horoscope_text\n
573	Sample career_horoscope_text\n
574	Sample career_horoscope_text\n
575	Sample career_horoscope_text\n
576	Sample career_horoscope_text\n
577	Sample career_horoscope_text\n
578	Sample career_horoscope_text\n
579	Sample career_horoscope_text\n
580	Sample career_horoscope_text\n
581	Sample career_horoscope_text\n
582	Sample career_horoscope_text\n
583	Sample career_horoscope_text\n
584	Sample career_horoscope_text\n
585	Sample career_horoscope_text\n
586	Sample career_horoscope_text\n
587	Sample career_horoscope_text\n
588	Sample career_horoscope_text\n
589	Sample career_horoscope_text\n
590	Sample career_horoscope_text\n
591	Sample career_horoscope_text\n
592	Sample career_horoscope_text\n
593	Sample career_horoscope_text\n
594	Sample career_horoscope_text\n
595	Sample career_horoscope_text\n
596	Sample career_horoscope_text\n
597	Sample career_horoscope_text\n
598	Sample career_horoscope_text\n
599	Sample career_horoscope_text\n
600	Sample career_horoscope_text\n
601	Sample career_horoscope_text\n
602	Sample career_horoscope_text\n
603	Sample career_horoscope_text\n
604	Sample career_horoscope_text\n
605	Sample career_horoscope_text\n
606	Sample career_horoscope_text\n
607	Sample career_horoscope_text\n
608	Sample career_horoscope_text\n
609	Sample career_horoscope_text\n
610	Sample career_horoscope_text\n
611	Sample career_horoscope_text\n
612	Sample career_horoscope_text\n
613	Sample career_horoscope_text\n
614	Sample career_horoscope_text\n
615	Sample career_horoscope_text\n
616	Sample career_horoscope_text\n
617	Sample career_horoscope_text\n
618	Sample career_horoscope_text\n
619	Sample career_horoscope_text\n
620	Sample career_horoscope_text\n
621	Sample career_horoscope_text\n
622	Sample career_horoscope_text\n
623	Sample career_horoscope_text\n
624	Sample career_horoscope_text\n
625	Sample career_horoscope_text\n
626	Sample career_horoscope_text\n
627	Sample career_horoscope_text\n
628	Sample career_horoscope_text\n
629	Sample career_horoscope_text\n
630	Sample career_horoscope_text\n
631	Sample career_horoscope_text\n
632	Sample career_horoscope_text\n
633	Sample career_horoscope_text\n
634	Sample career_horoscope_text\n
635	Sample career_horoscope_text\n
636	Sample career_horoscope_text\n
637	Sample career_horoscope_text\n
638	Sample career_horoscope_text\n
639	Sample career_horoscope_text\n
640	Sample career_horoscope_text\n
641	Sample career_horoscope_text\n
642	Sample career_horoscope_text\n
643	Sample career_horoscope_text\n
644	Sample career_horoscope_text\n
645	Sample career_horoscope_text\n
646	Sample career_horoscope_text\n
647	Sample career_horoscope_text\n
648	Sample career_horoscope_text\n
649	Sample career_horoscope_text\n
650	Sample career_horoscope_text\n
651	Sample career_horoscope_text\n
652	Sample career_horoscope_text\n
653	Sample career_horoscope_text\n
654	Sample career_horoscope_text\n
655	Sample career_horoscope_text\n
656	Sample career_horoscope_text\n
657	Sample career_horoscope_text\n
658	Sample career_horoscope_text\n
659	Sample career_horoscope_text\n
660	Sample career_horoscope_text\n
661	Sample career_horoscope_text\n
662	Sample career_horoscope_text\n
663	Sample career_horoscope_text\n
664	Sample career_horoscope_text\n
665	Sample career_horoscope_text\n
666	Sample career_horoscope_text\n
667	Sample career_horoscope_text\n
668	Sample career_horoscope_text\n
669	Sample career_horoscope_text\n
670	Sample career_horoscope_text\n
671	Sample career_horoscope_text\n
672	Sample career_horoscope_text\n
673	Sample career_horoscope_text\n
674	Sample career_horoscope_text\n
675	Sample career_horoscope_text\n
676	Sample career_horoscope_text\n
677	Sample career_horoscope_text\n
678	Sample career_horoscope_text\n
679	Sample career_horoscope_text\n
680	Sample career_horoscope_text\n
681	Sample career_horoscope_text\n
682	Sample career_horoscope_text\n
683	Sample career_horoscope_text\n
684	Sample career_horoscope_text\n
685	Sample career_horoscope_text\n
686	Sample career_horoscope_text\n
687	Sample career_horoscope_text\n
688	Sample career_horoscope_text\n
689	Sample career_horoscope_text\n
690	Sample career_horoscope_text\n
691	Sample career_horoscope_text\n
692	Sample career_horoscope_text\n
693	Sample career_horoscope_text\n
694	Sample career_horoscope_text\n
695	Sample career_horoscope_text\n
696	Sample career_horoscope_text\n
697	Sample career_horoscope_text\n
698	Sample career_horoscope_text\n
699	Sample career_horoscope_text\n
700	Sample career_horoscope_text\n
701	Sample career_horoscope_text\n
702	Sample career_horoscope_text\n
703	Sample career_horoscope_text\n
704	Sample career_horoscope_text\n
705	Sample career_horoscope_text\n
706	Sample career_horoscope_text\n
707	Sample career_horoscope_text\n
708	Sample career_horoscope_text\n
709	Sample career_horoscope_text\n
710	Sample career_horoscope_text\n
711	Sample career_horoscope_text\n
712	Sample career_horoscope_text\n
713	Sample career_horoscope_text\n
714	Sample career_horoscope_text\n
715	Sample career_horoscope_text\n
716	Sample career_horoscope_text\n
717	Sample career_horoscope_text\n
718	Sample career_horoscope_text\n
719	Sample career_horoscope_text\n
720	Sample career_horoscope_text\n
721	Sample career_horoscope_text\n
722	Sample career_horoscope_text\n
723	Sample career_horoscope_text\n
724	Sample career_horoscope_text\n
725	Sample career_horoscope_text\n
726	Sample career_horoscope_text\n
727	Sample career_horoscope_text\n
728	Sample career_horoscope_text\n
729	Sample career_horoscope_text\n
730	Sample career_horoscope_text\n
731	Sample career_horoscope_text\n
732	Sample career_horoscope_text\n
733	Sample career_horoscope_text\n
734	Sample career_horoscope_text\n
735	Sample career_horoscope_text\n
736	Sample career_horoscope_text\n
737	Sample career_horoscope_text\n
738	Sample career_horoscope_text\n
739	Sample career_horoscope_text\n
740	Sample career_horoscope_text\n
741	Sample career_horoscope_text\n
742	Sample career_horoscope_text\n
743	Sample career_horoscope_text\n
744	Sample career_horoscope_text\n
745	Sample career_horoscope_text\n
746	Sample career_horoscope_text\n
747	Sample career_horoscope_text\n
748	Sample career_horoscope_text\n
749	Sample career_horoscope_text\n
750	Sample career_horoscope_text\n
751	Sample career_horoscope_text\n
752	Sample career_horoscope_text\n
753	Sample career_horoscope_text\n
754	Sample career_horoscope_text\n
755	Sample career_horoscope_text\n
756	Sample career_horoscope_text\n
757	Sample career_horoscope_text\n
758	Sample career_horoscope_text\n
759	Sample career_horoscope_text\n
760	Sample career_horoscope_text\n
761	Sample career_horoscope_text\n
762	Sample career_horoscope_text\n
763	Sample career_horoscope_text\n
764	Sample career_horoscope_text\n
765	Sample career_horoscope_text\n
766	Sample career_horoscope_text\n
767	Sample career_horoscope_text\n
768	Sample career_horoscope_text\n
769	Sample career_horoscope_text\n
770	Sample career_horoscope_text\n
771	Sample career_horoscope_text\n
772	Sample career_horoscope_text\n
773	Sample career_horoscope_text\n
774	Sample career_horoscope_text\n
775	Sample career_horoscope_text\n
776	Sample career_horoscope_text\n
777	Sample career_horoscope_text\n
778	Sample career_horoscope_text\n
779	Sample career_horoscope_text\n
780	Sample career_horoscope_text\n
781	Sample career_horoscope_text\n
782	Sample career_horoscope_text\n
783	Sample career_horoscope_text\n
784	Sample career_horoscope_text\n
785	Sample career_horoscope_text\n
786	Sample career_horoscope_text\n
787	Sample career_horoscope_text\n
788	Sample career_horoscope_text\n
789	Sample career_horoscope_text\n
790	Sample career_horoscope_text\n
791	Sample career_horoscope_text\n
792	Sample career_horoscope_text\n
793	Sample career_horoscope_text\n
794	Sample career_horoscope_text\n
795	Sample career_horoscope_text\n
796	Sample career_horoscope_text\n
797	Sample career_horoscope_text\n
798	Sample career_horoscope_text\n
799	Sample career_horoscope_text\n
800	Sample career_horoscope_text\n
801	Sample career_horoscope_text\n
802	Sample career_horoscope_text\n
803	Sample career_horoscope_text\n
804	Sample career_horoscope_text\n
805	Sample career_horoscope_text\n
806	Sample career_horoscope_text\n
807	Sample career_horoscope_text\n
808	Sample career_horoscope_text\n
809	Sample career_horoscope_text\n
810	Sample career_horoscope_text\n
811	Sample career_horoscope_text\n
812	Sample career_horoscope_text\n
813	Sample career_horoscope_text\n
814	Sample career_horoscope_text\n
815	Sample career_horoscope_text\n
816	Sample career_horoscope_text\n
817	Sample career_horoscope_text\n
818	Sample career_horoscope_text\n
819	Sample career_horoscope_text\n
820	Sample career_horoscope_text\n
821	Sample career_horoscope_text\n
822	Sample career_horoscope_text\n
823	Sample career_horoscope_text\n
824	Sample career_horoscope_text\n
825	Sample career_horoscope_text\n
826	Sample career_horoscope_text\n
827	Sample career_horoscope_text\n
828	Sample career_horoscope_text\n
829	Sample career_horoscope_text\n
830	Sample career_horoscope_text\n
831	Sample career_horoscope_text\n
832	Sample career_horoscope_text\n
833	Sample career_horoscope_text\n
834	Sample career_horoscope_text\n
835	Sample career_horoscope_text\n
836	Sample career_horoscope_text\n
837	Sample career_horoscope_text\n
838	Sample career_horoscope_text\n
839	Sample career_horoscope_text\n
840	Sample career_horoscope_text\n
841	Sample career_horoscope_text\n
842	Sample career_horoscope_text\n
843	Sample career_horoscope_text\n
844	Sample career_horoscope_text\n
845	Sample career_horoscope_text\n
846	Sample career_horoscope_text\n
847	Sample career_horoscope_text\n
848	Sample career_horoscope_text\n
849	Sample career_horoscope_text\n
850	Sample career_horoscope_text\n
851	Sample career_horoscope_text\n
852	Sample career_horoscope_text\n
853	Sample career_horoscope_text\n
854	Sample career_horoscope_text\n
855	Sample career_horoscope_text\n
856	Sample career_horoscope_text\n
857	Sample career_horoscope_text\n
858	Sample career_horoscope_text\n
859	Sample career_horoscope_text\n
860	Sample career_horoscope_text\n
861	Sample career_horoscope_text\n
862	Sample career_horoscope_text\n
863	Sample career_horoscope_text\n
864	Sample career_horoscope_text\n
865	Sample career_horoscope_text\n
866	Sample career_horoscope_text\n
867	Sample career_horoscope_text\n
868	Sample career_horoscope_text\n
869	Sample career_horoscope_text\n
870	Sample career_horoscope_text\n
871	Sample career_horoscope_text\n
872	Sample career_horoscope_text\n
873	Sample career_horoscope_text\n
874	Sample career_horoscope_text\n
875	Sample career_horoscope_text\n
876	Sample career_horoscope_text\n
877	Sample career_horoscope_text\n
878	Sample career_horoscope_text\n
879	Sample career_horoscope_text\n
880	Sample career_horoscope_text\n
881	Sample career_horoscope_text\n
882	Sample career_horoscope_text\n
883	Sample career_horoscope_text\n
884	Sample career_horoscope_text\n
885	Sample career_horoscope_text\n
886	Sample career_horoscope_text\n
887	Sample career_horoscope_text\n
888	Sample career_horoscope_text\n
889	Sample career_horoscope_text\n
890	Sample career_horoscope_text\n
891	Sample career_horoscope_text\n
892	Sample career_horoscope_text\n
893	Sample career_horoscope_text\n
894	Sample career_horoscope_text\n
895	Sample career_horoscope_text\n
896	Sample career_horoscope_text\n
897	Sample career_horoscope_text\n
898	Sample career_horoscope_text\n
899	Sample career_horoscope_text\n
900	Sample career_horoscope_text\n
901	Sample career_horoscope_text\n
902	Sample career_horoscope_text\n
903	Sample career_horoscope_text\n
904	Sample career_horoscope_text\n
905	Sample career_horoscope_text\n
906	Sample career_horoscope_text\n
907	Sample career_horoscope_text\n
908	Sample career_horoscope_text\n
909	Sample career_horoscope_text\n
910	Sample career_horoscope_text\n
911	Sample career_horoscope_text\n
912	Sample career_horoscope_text\n
913	Sample career_horoscope_text\n
914	Sample career_horoscope_text\n
915	Sample career_horoscope_text\n
916	Sample career_horoscope_text\n
917	Sample career_horoscope_text\n
918	Sample career_horoscope_text\n
919	Sample career_horoscope_text\n
920	Sample career_horoscope_text\n
921	Sample career_horoscope_text\n
922	Sample career_horoscope_text\n
923	Sample career_horoscope_text\n
924	Sample career_horoscope_text\n
925	Sample career_horoscope_text\n
926	Sample career_horoscope_text\n
927	Sample career_horoscope_text\n
928	Sample career_horoscope_text\n
929	Sample career_horoscope_text\n
930	Sample career_horoscope_text\n
931	Sample career_horoscope_text\n
932	Sample career_horoscope_text\n
933	Sample career_horoscope_text\n
934	Sample career_horoscope_text\n
935	Sample career_horoscope_text\n
936	Sample career_horoscope_text\n
937	Sample career_horoscope_text\n
938	Sample career_horoscope_text\n
939	Sample career_horoscope_text\n
940	Sample career_horoscope_text\n
941	Sample career_horoscope_text\n
942	Sample career_horoscope_text\n
943	Sample career_horoscope_text\n
944	Sample career_horoscope_text\n
945	Sample career_horoscope_text\n
946	Sample career_horoscope_text\n
947	Sample career_horoscope_text\n
948	Sample career_horoscope_text\n
949	Sample career_horoscope_text\n
950	Sample career_horoscope_text\n
951	Sample career_horoscope_text\n
952	Sample career_horoscope_text\n
953	Sample career_horoscope_text\n
954	Sample career_horoscope_text\n
955	Sample career_horoscope_text\n
956	Sample career_horoscope_text\n
957	Sample career_horoscope_text\n
958	Sample career_horoscope_text\n
959	Sample career_horoscope_text\n
960	Sample career_horoscope_text\n
961	Sample career_horoscope_text\n
962	Sample career_horoscope_text\n
963	Sample career_horoscope_text\n
964	Sample career_horoscope_text\n
965	Sample career_horoscope_text\n
966	Sample career_horoscope_text\n
967	Sample career_horoscope_text\n
968	Sample career_horoscope_text\n
969	Sample career_horoscope_text\n
970	Sample career_horoscope_text\n
971	Sample career_horoscope_text\n
972	Sample career_horoscope_text\n
973	Sample career_horoscope_text\n
974	Sample career_horoscope_text\n
975	Sample career_horoscope_text\n
976	Sample career_horoscope_text\n
977	Sample career_horoscope_text\n
978	Sample career_horoscope_text\n
979	Sample career_horoscope_text\n
980	Sample career_horoscope_text\n
981	Sample career_horoscope_text\n
982	Sample career_horoscope_text\n
983	Sample career_horoscope_text\n
984	Sample career_horoscope_text\n
985	Sample career_horoscope_text\n
986	Sample career_horoscope_text\n
987	Sample career_horoscope_text\n
988	Sample career_horoscope_text\n
989	Sample career_horoscope_text\n
990	Sample career_horoscope_text\n
991	Sample career_horoscope_text\n
992	Sample career_horoscope_text\n
993	Sample career_horoscope_text\n
994	Sample career_horoscope_text\n
995	Sample career_horoscope_text\n
996	Sample career_horoscope_text\n
997	Sample career_horoscope_text\n
998	Sample career_horoscope_text\n
999	Sample career_horoscope_text\n
1000	Sample career_horoscope_text\n
1001	Sample career_horoscope_text\n
1002	Sample career_horoscope_text\n
1003	Sample career_horoscope_text\n
1004	Sample career_horoscope_text\n
1005	Sample career_horoscope_text\n
1006	Sample career_horoscope_text\n
1007	Sample career_horoscope_text\n
1008	Sample career_horoscope_text\n
1009	Sample career_horoscope_text\n
1010	Sample career_horoscope_text\n
1011	Sample career_horoscope_text\n
1012	Sample career_horoscope_text\n
1013	Sample career_horoscope_text\n
1014	Sample career_horoscope_text\n
1015	Sample career_horoscope_text\n
1016	Sample career_horoscope_text\n
1017	Sample career_horoscope_text\n
1018	Sample career_horoscope_text\n
1019	Sample career_horoscope_text\n
1020	Sample career_horoscope_text\n
1021	Sample career_horoscope_text\n
1022	Sample career_horoscope_text\n
1023	Sample career_horoscope_text\n
1024	Sample career_horoscope_text\n
1025	Sample career_horoscope_text\n
1026	Sample career_horoscope_text\n
1027	Sample career_horoscope_text\n
1028	Sample career_horoscope_text\n
1029	Sample career_horoscope_text\n
1030	Sample career_horoscope_text\n
1031	Sample career_horoscope_text\n
1032	Sample career_horoscope_text\n
1033	Sample career_horoscope_text\n
1034	Sample career_horoscope_text\n
1035	Sample career_horoscope_text\n
1036	Sample career_horoscope_text\n
1037	Sample career_horoscope_text\n
1038	Sample career_horoscope_text\n
1039	Sample career_horoscope_text\n
1040	Sample career_horoscope_text\n
1041	Sample career_horoscope_text\n
1042	Sample career_horoscope_text\n
1043	Sample career_horoscope_text\n
1044	Sample career_horoscope_text\n
1045	Sample career_horoscope_text\n
1046	Sample career_horoscope_text\n
1047	Sample career_horoscope_text\n
1048	Sample career_horoscope_text\n
1049	Sample career_horoscope_text\n
1050	Sample career_horoscope_text\n
1051	Sample career_horoscope_text\n
1052	Sample career_horoscope_text\n
1053	Sample career_horoscope_text\n
1054	Sample career_horoscope_text\n
1055	Sample career_horoscope_text\n
1056	Sample career_horoscope_text\n
1057	Sample career_horoscope_text\n
1058	Sample career_horoscope_text\n
1059	Sample career_horoscope_text\n
1060	Sample career_horoscope_text\n
1061	Sample career_horoscope_text\n
1062	Sample career_horoscope_text\n
1063	Sample career_horoscope_text\n
1064	Sample career_horoscope_text\n
1065	Sample career_horoscope_text\n
1066	Sample career_horoscope_text\n
1067	Sample career_horoscope_text\n
1068	Sample career_horoscope_text\n
1069	Sample career_horoscope_text\n
1070	Sample career_horoscope_text\n
1071	Sample career_horoscope_text\n
1072	Sample career_horoscope_text\n
1073	Sample career_horoscope_text\n
1074	Sample career_horoscope_text\n
1075	Sample career_horoscope_text\n
1076	Sample career_horoscope_text\n
1077	Sample career_horoscope_text\n
1078	Sample career_horoscope_text\n
1079	Sample career_horoscope_text\n
1080	Sample career_horoscope_text\n
1081	Sample career_horoscope_text\n
1082	Sample career_horoscope_text\n
1083	Sample career_horoscope_text\n
1084	Sample career_horoscope_text\n
1085	Sample career_horoscope_text\n
1086	Sample career_horoscope_text\n
1087	Sample career_horoscope_text\n
1088	Sample career_horoscope_text\n
1089	Sample career_horoscope_text\n
1090	Sample career_horoscope_text\n
1091	Sample career_horoscope_text\n
1092	Sample career_horoscope_text\n
1093	Sample career_horoscope_text\n
1094	Sample career_horoscope_text\n
1095	Sample career_horoscope_text\n
1096	Sample career_horoscope_text\n
1097	Sample career_horoscope_text\n
1098	Sample career_horoscope_text\n
1099	Sample career_horoscope_text\n
1100	Sample career_horoscope_text\n
1101	Sample career_horoscope_text\n
1102	Sample career_horoscope_text\n
1103	Sample career_horoscope_text\n
1104	Sample career_horoscope_text\n
1105	Sample career_horoscope_text\n
1106	Sample career_horoscope_text\n
1107	Sample career_horoscope_text\n
1108	Sample career_horoscope_text\n
1109	Sample career_horoscope_text\n
1110	Sample career_horoscope_text\n
1111	Sample career_horoscope_text\n
1112	Sample career_horoscope_text\n
1113	Sample career_horoscope_text\n
1114	Sample career_horoscope_text\n
1115	Sample career_horoscope_text\n
1116	Sample career_horoscope_text\n
1117	Sample career_horoscope_text\n
1118	Sample career_horoscope_text\n
1119	Sample career_horoscope_text\n
1120	Sample career_horoscope_text\n
1121	Sample career_horoscope_text\n
1122	Sample career_horoscope_text\n
1123	Sample career_horoscope_text\n
1124	Sample career_horoscope_text\n
1125	Sample career_horoscope_text\n
1126	Sample career_horoscope_text\n
1127	Sample career_horoscope_text\n
1128	Sample career_horoscope_text\n
1129	Sample career_horoscope_text\n
1130	Sample career_horoscope_text\n
1131	Sample career_horoscope_text\n
1132	Sample career_horoscope_text\n
1133	Sample career_horoscope_text\n
1134	Sample career_horoscope_text\n
1135	Sample career_horoscope_text\n
1136	Sample career_horoscope_text\n
1137	Sample career_horoscope_text\n
1138	Sample career_horoscope_text\n
1139	Sample career_horoscope_text\n
1140	Sample career_horoscope_text\n
1141	Sample career_horoscope_text\n
1142	Sample career_horoscope_text\n
1143	Sample career_horoscope_text\n
1144	Sample career_horoscope_text\n
1145	Sample career_horoscope_text\n
1146	Sample career_horoscope_text\n
1147	Sample career_horoscope_text\n
1148	Sample career_horoscope_text\n
1149	Sample career_horoscope_text\n
1150	Sample career_horoscope_text\n
1151	Sample career_horoscope_text\n
1152	Sample career_horoscope_text\n
1153	Sample career_horoscope_text\n
1154	Sample career_horoscope_text\n
1155	Sample career_horoscope_text\n
1156	Sample career_horoscope_text\n
1157	Sample career_horoscope_text\n
1158	Sample career_horoscope_text\n
1159	Sample career_horoscope_text\n
1160	Sample career_horoscope_text\n
1161	Sample career_horoscope_text\n
1162	Sample career_horoscope_text\n
1163	Sample career_horoscope_text\n
1164	Sample career_horoscope_text\n
1165	Sample career_horoscope_text\n
1166	Sample career_horoscope_text\n
1167	Sample career_horoscope_text\n
1168	Sample career_horoscope_text\n
1169	Sample career_horoscope_text\n
1170	Sample career_horoscope_text\n
1171	Sample career_horoscope_text\n
1172	Sample career_horoscope_text\n
1173	Sample career_horoscope_text\n
1174	Sample career_horoscope_text\n
1175	Sample career_horoscope_text\n
1176	Sample career_horoscope_text\n
1177	Sample career_horoscope_text\n
1178	Sample career_horoscope_text\n
1179	Sample career_horoscope_text\n
1180	Sample career_horoscope_text\n
1181	Sample career_horoscope_text\n
1182	Sample career_horoscope_text\n
1183	Sample career_horoscope_text\n
1184	Sample career_horoscope_text\n
1185	Sample career_horoscope_text\n
1186	Sample career_horoscope_text\n
1187	Sample career_horoscope_text\n
1188	Sample career_horoscope_text\n
1189	Sample career_horoscope_text\n
1190	Sample career_horoscope_text\n
1191	Sample career_horoscope_text\n
1192	Sample career_horoscope_text\n
1193	Sample career_horoscope_text\n
1194	Sample career_horoscope_text\n
1195	Sample career_horoscope_text\n
1196	Sample career_horoscope_text\n
1197	Sample career_horoscope_text\n
1198	Sample career_horoscope_text\n
1199	Sample career_horoscope_text\n
1200	Sample career_horoscope_text\n
1201	Sample career_horoscope_text\n
1202	Sample career_horoscope_text\n
1203	Sample career_horoscope_text\n
1204	Sample career_horoscope_text\n
1205	Sample career_horoscope_text\n
1206	Sample career_horoscope_text\n
1207	Sample career_horoscope_text\n
1208	Sample career_horoscope_text\n
1209	Sample career_horoscope_text\n
1210	Sample career_horoscope_text\n
1211	Sample career_horoscope_text\n
1212	Sample career_horoscope_text\n
1213	Sample career_horoscope_text\n
1214	Sample career_horoscope_text\n
1215	Sample career_horoscope_text\n
1216	Sample career_horoscope_text\n
1217	Sample career_horoscope_text\n
1218	Sample career_horoscope_text\n
1219	Sample career_horoscope_text\n
1220	Sample career_horoscope_text\n
1221	Sample career_horoscope_text\n
1222	Sample career_horoscope_text\n
1223	Sample career_horoscope_text\n
1224	Sample career_horoscope_text\n
1225	Sample career_horoscope_text\n
1226	Sample career_horoscope_text\n
1227	Sample career_horoscope_text\n
1228	Sample career_horoscope_text\n
1229	Sample career_horoscope_text\n
1230	Sample career_horoscope_text\n
1231	Sample career_horoscope_text\n
1232	Sample career_horoscope_text\n
1233	Sample career_horoscope_text\n
1234	Sample career_horoscope_text\n
1235	Sample career_horoscope_text\n
1236	Sample career_horoscope_text\n
1237	Sample career_horoscope_text\n
1238	Sample career_horoscope_text\n
1239	Sample career_horoscope_text\n
1240	Sample career_horoscope_text\n
1241	Sample career_horoscope_text\n
1242	Sample career_horoscope_text\n
1243	Sample career_horoscope_text\n
1244	Sample career_horoscope_text\n
1245	Sample career_horoscope_text\n
1246	Sample career_horoscope_text\n
1247	Sample career_horoscope_text\n
1248	Sample career_horoscope_text\n
1249	Sample career_horoscope_text\n
1250	Sample career_horoscope_text\n
1251	Sample career_horoscope_text\n
1252	Sample career_horoscope_text\n
1253	Sample career_horoscope_text\n
1254	Sample career_horoscope_text\n
1255	Sample career_horoscope_text\n
1256	Sample career_horoscope_text\n
1257	Sample career_horoscope_text\n
1258	Sample career_horoscope_text\n
1259	Sample career_horoscope_text\n
1260	Sample career_horoscope_text\n
1261	Sample career_horoscope_text\n
1262	Sample career_horoscope_text\n
1263	Sample career_horoscope_text\n
1264	Sample career_horoscope_text\n
1265	Sample career_horoscope_text\n
1266	Sample career_horoscope_text\n
1267	Sample career_horoscope_text\n
1268	Sample career_horoscope_text\n
1269	Sample career_horoscope_text\n
1270	Sample career_horoscope_text\n
1271	Sample career_horoscope_text\n
1272	Sample career_horoscope_text\n
1273	Sample career_horoscope_text\n
1274	Sample career_horoscope_text\n
1275	Sample career_horoscope_text\n
1276	Sample career_horoscope_text\n
1277	Sample career_horoscope_text\n
1278	Sample career_horoscope_text\n
1279	Sample career_horoscope_text\n
1280	Sample career_horoscope_text\n
1281	Sample career_horoscope_text\n
1282	Sample career_horoscope_text\n
1283	Sample career_horoscope_text\n
1284	Sample career_horoscope_text\n
1285	Sample career_horoscope_text\n
1286	Sample career_horoscope_text\n
1287	Sample career_horoscope_text\n
1288	Sample career_horoscope_text\n
1289	Sample career_horoscope_text\n
1290	Sample career_horoscope_text\n
1291	Sample career_horoscope_text\n
1292	Sample career_horoscope_text\n
1293	Sample career_horoscope_text\n
1294	Sample career_horoscope_text\n
1295	Sample career_horoscope_text\n
1296	Sample career_horoscope_text\n
1297	Sample career_horoscope_text\n
1298	Sample career_horoscope_text\n
1299	Sample career_horoscope_text\n
1300	Sample career_horoscope_text\n
1301	Sample career_horoscope_text\n
1302	Sample career_horoscope_text\n
1303	Sample career_horoscope_text\n
1304	Sample career_horoscope_text\n
1305	Sample career_horoscope_text\n
1306	Sample career_horoscope_text\n
1307	Sample career_horoscope_text\n
1308	Sample career_horoscope_text\n
1309	Sample career_horoscope_text\n
1310	Sample career_horoscope_text\n
1311	Sample career_horoscope_text\n
1312	Sample career_horoscope_text\n
1313	Sample career_horoscope_text\n
1314	Sample career_horoscope_text\n
1315	Sample career_horoscope_text\n
1316	Sample career_horoscope_text\n
1317	Sample career_horoscope_text\n
1318	Sample career_horoscope_text\n
1319	Sample career_horoscope_text\n
1320	Sample career_horoscope_text\n
1321	Sample career_horoscope_text\n
1322	Sample career_horoscope_text\n
1323	Sample career_horoscope_text\n
1324	Sample career_horoscope_text\n
1325	Sample career_horoscope_text\n
1326	Sample career_horoscope_text\n
1327	Sample career_horoscope_text\n
1328	Sample career_horoscope_text\n
1329	Sample career_horoscope_text\n
1330	Sample career_horoscope_text\n
1331	Sample career_horoscope_text\n
1332	Sample career_horoscope_text\n
1333	Sample career_horoscope_text\n
1334	Sample career_horoscope_text\n
1335	Sample career_horoscope_text\n
1336	Sample career_horoscope_text\n
1337	Sample career_horoscope_text\n
1338	Sample career_horoscope_text\n
1339	Sample career_horoscope_text\n
1340	Sample career_horoscope_text\n
1341	Sample career_horoscope_text\n
1342	Sample career_horoscope_text\n
1343	Sample career_horoscope_text\n
1344	Sample career_horoscope_text\n
1345	Sample career_horoscope_text\n
1346	Sample career_horoscope_text\n
1347	Sample career_horoscope_text\n
1348	Sample career_horoscope_text\n
1349	Sample career_horoscope_text\n
1350	Sample career_horoscope_text\n
1351	Sample career_horoscope_text\n
1352	Sample career_horoscope_text\n
1353	Sample career_horoscope_text\n
1354	Sample career_horoscope_text\n
1355	Sample career_horoscope_text\n
1356	Sample career_horoscope_text\n
1357	Sample career_horoscope_text\n
1358	Sample career_horoscope_text\n
1359	Sample career_horoscope_text\n
1360	Sample career_horoscope_text\n
1361	Sample career_horoscope_text\n
1362	Sample career_horoscope_text\n
1363	Sample career_horoscope_text\n
1364	Sample career_horoscope_text\n
1365	Sample career_horoscope_text\n
1366	Sample career_horoscope_text\n
1367	Sample career_horoscope_text\n
1368	Sample career_horoscope_text\n
1369	Sample career_horoscope_text\n
1370	Sample career_horoscope_text\n
1371	Sample career_horoscope_text\n
1372	Sample career_horoscope_text\n
1373	Sample career_horoscope_text\n
1374	Sample career_horoscope_text\n
1375	Sample career_horoscope_text\n
1376	Sample career_horoscope_text\n
1377	Sample career_horoscope_text\n
1378	Sample career_horoscope_text\n
1379	Sample career_horoscope_text\n
1380	Sample career_horoscope_text\n
1381	Sample career_horoscope_text\n
1382	Sample career_horoscope_text\n
1383	Sample career_horoscope_text\n
1384	Sample career_horoscope_text\n
1385	Sample career_horoscope_text\n
1386	Sample career_horoscope_text\n
1387	Sample career_horoscope_text\n
1388	Sample career_horoscope_text\n
1389	Sample career_horoscope_text\n
1390	Sample career_horoscope_text\n
1391	Sample career_horoscope_text\n
1392	Sample career_horoscope_text\n
1393	Sample career_horoscope_text\n
1394	Sample career_horoscope_text\n
1395	Sample career_horoscope_text\n
1396	Sample career_horoscope_text\n
1397	Sample career_horoscope_text\n
1398	Sample career_horoscope_text\n
1399	Sample career_horoscope_text\n
1400	Sample career_horoscope_text\n
1401	Sample career_horoscope_text\n
1402	Sample career_horoscope_text\n
1403	Sample career_horoscope_text\n
1404	Sample career_horoscope_text\n
1405	Sample career_horoscope_text\n
1406	Sample career_horoscope_text\n
1407	Sample career_horoscope_text\n
1408	Sample career_horoscope_text\n
1409	Sample career_horoscope_text\n
1410	Sample career_horoscope_text\n
1411	Sample career_horoscope_text\n
1412	Sample career_horoscope_text\n
1413	Sample career_horoscope_text\n
1414	Sample career_horoscope_text\n
1415	Sample career_horoscope_text\n
1416	Sample career_horoscope_text\n
1417	Sample career_horoscope_text\n
1418	Sample career_horoscope_text\n
1419	Sample career_horoscope_text\n
1420	Sample career_horoscope_text\n
1421	Sample career_horoscope_text\n
1422	Sample career_horoscope_text\n
1423	Sample career_horoscope_text\n
1424	Sample career_horoscope_text\n
1425	Sample career_horoscope_text\n
1426	Sample career_horoscope_text\n
1427	Sample career_horoscope_text\n
1428	Sample career_horoscope_text\n
1429	Sample career_horoscope_text\n
1430	Sample career_horoscope_text\n
1431	Sample career_horoscope_text\n
1432	Sample career_horoscope_text\n
1433	Sample career_horoscope_text\n
1434	Sample career_horoscope_text\n
1435	Sample career_horoscope_text\n
1436	Sample career_horoscope_text\n
1437	Sample career_horoscope_text\n
1438	Sample career_horoscope_text\n
1439	Sample career_horoscope_text\n
1440	Sample career_horoscope_text\n
1441	Sample career_horoscope_text\n
1442	Sample career_horoscope_text\n
1443	Sample career_horoscope_text\n
1444	Sample career_horoscope_text\n
1445	Sample career_horoscope_text\n
1446	Sample career_horoscope_text\n
1447	Sample career_horoscope_text\n
1448	Sample career_horoscope_text\n
1449	Sample career_horoscope_text\n
1450	Sample career_horoscope_text\n
1451	Sample career_horoscope_text\n
1452	Sample career_horoscope_text\n
1453	Sample career_horoscope_text\n
1454	Sample career_horoscope_text\n
1455	Sample career_horoscope_text\n
1456	Sample career_horoscope_text\n
1457	Sample career_horoscope_text\n
1458	Sample career_horoscope_text\n
1459	Sample career_horoscope_text\n
1460	Sample career_horoscope_text\n
1461	Sample career_horoscope_text\n
1462	Sample career_horoscope_text\n
1463	Sample career_horoscope_text\n
1464	Sample career_horoscope_text\n
1465	Sample career_horoscope_text\n
1466	Sample career_horoscope_text\n
1467	Sample career_horoscope_text\n
1468	Sample career_horoscope_text\n
1469	Sample career_horoscope_text\n
1470	Sample career_horoscope_text\n
1471	Sample career_horoscope_text\n
1472	Sample career_horoscope_text\n
1473	Sample career_horoscope_text\n
1474	Sample career_horoscope_text\n
1475	Sample career_horoscope_text\n
1476	Sample career_horoscope_text\n
1477	Sample career_horoscope_text\n
1478	Sample career_horoscope_text\n
1479	Sample career_horoscope_text\n
1480	Sample career_horoscope_text\n
1481	Sample career_horoscope_text\n
1482	Sample career_horoscope_text\n
1483	Sample career_horoscope_text\n
1484	Sample career_horoscope_text\n
1485	Sample career_horoscope_text\n
1486	Sample career_horoscope_text\n
1487	Sample career_horoscope_text\n
1488	Sample career_horoscope_text\n
1489	Sample career_horoscope_text\n
1490	Sample career_horoscope_text\n
1491	Sample career_horoscope_text\n
1492	Sample career_horoscope_text\n
1493	Sample career_horoscope_text\n
1494	Sample career_horoscope_text\n
1495	Sample career_horoscope_text\n
1496	Sample career_horoscope_text\n
1497	Sample career_horoscope_text\n
1498	Sample career_horoscope_text\n
1499	Sample career_horoscope_text\n
1500	Sample career_horoscope_text\n
1501	Sample career_horoscope_text\n
1502	Sample career_horoscope_text\n
1503	Sample career_horoscope_text\n
1504	Sample career_horoscope_text\n
1505	Sample career_horoscope_text\n
1506	Sample career_horoscope_text\n
1507	Sample career_horoscope_text\n
1508	Sample career_horoscope_text\n
1509	Sample career_horoscope_text\n
1510	Sample career_horoscope_text\n
1511	Sample career_horoscope_text\n
1512	Sample career_horoscope_text\n
1513	Sample career_horoscope_text\n
1514	Sample career_horoscope_text\n
1515	Sample career_horoscope_text\n
1516	Sample career_horoscope_text\n
1517	Sample career_horoscope_text\n
1518	Sample career_horoscope_text\n
1519	Sample career_horoscope_text\n
1520	Sample career_horoscope_text\n
1521	Sample career_horoscope_text\n
1522	Sample career_horoscope_text\n
1523	Sample career_horoscope_text\n
1524	Sample career_horoscope_text\n
1525	Sample career_horoscope_text\n
1526	Sample career_horoscope_text\n
1527	Sample career_horoscope_text\n
1528	Sample career_horoscope_text\n
1529	Sample career_horoscope_text\n
1530	Sample career_horoscope_text\n
1531	Sample career_horoscope_text\n
1532	Sample career_horoscope_text\n
1533	Sample career_horoscope_text\n
1534	Sample career_horoscope_text\n
1535	Sample career_horoscope_text\n
1536	Sample career_horoscope_text\n
1537	Sample career_horoscope_text\n
1538	Sample career_horoscope_text\n
1539	Sample career_horoscope_text\n
1540	Sample career_horoscope_text\n
1541	Sample career_horoscope_text\n
1542	Sample career_horoscope_text\n
1543	Sample career_horoscope_text\n
1544	Sample career_horoscope_text\n
1545	Sample career_horoscope_text\n
1546	Sample career_horoscope_text\n
1547	Sample career_horoscope_text\n
1548	Sample career_horoscope_text\n
1549	Sample career_horoscope_text\n
1550	Sample career_horoscope_text\n
1551	Sample career_horoscope_text\n
1552	Sample career_horoscope_text\n
1553	Sample career_horoscope_text\n
1554	Sample career_horoscope_text\n
1555	Sample career_horoscope_text\n
1556	Sample career_horoscope_text\n
1557	Sample career_horoscope_text\n
1558	Sample career_horoscope_text\n
1559	Sample career_horoscope_text\n
1560	Sample career_horoscope_text\n
1561	Sample career_horoscope_text\n
1562	Sample career_horoscope_text\n
1563	Sample career_horoscope_text\n
1564	Sample career_horoscope_text\n
1565	Sample career_horoscope_text\n
1566	Sample career_horoscope_text\n
1567	Sample career_horoscope_text\n
1568	Sample career_horoscope_text\n
1569	Sample career_horoscope_text\n
1570	Sample career_horoscope_text\n
1571	Sample career_horoscope_text\n
1572	Sample career_horoscope_text\n
1573	Sample career_horoscope_text\n
1574	Sample career_horoscope_text\n
1575	Sample career_horoscope_text\n
1576	Sample career_horoscope_text\n
1577	Sample career_horoscope_text\n
1578	Sample career_horoscope_text\n
1579	Sample career_horoscope_text\n
1580	Sample career_horoscope_text\n
1581	Sample career_horoscope_text\n
1582	Sample career_horoscope_text\n
1583	Sample career_horoscope_text\n
1584	Sample career_horoscope_text\n
1585	Sample career_horoscope_text\n
1586	Sample career_horoscope_text\n
1587	Sample career_horoscope_text\n
1588	Sample career_horoscope_text\n
1589	Sample career_horoscope_text\n
1590	Sample career_horoscope_text\n
1591	Sample career_horoscope_text\n
1592	Sample career_horoscope_text\n
1593	Sample career_horoscope_text\n
1594	Sample career_horoscope_text\n
1595	Sample career_horoscope_text\n
1596	Sample career_horoscope_text\n
1597	Sample career_horoscope_text\n
1598	Sample career_horoscope_text\n
1599	Sample career_horoscope_text\n
1600	Sample career_horoscope_text\n
1601	Sample career_horoscope_text\n
1602	Sample career_horoscope_text\n
1603	Sample career_horoscope_text\n
1604	Sample career_horoscope_text\n
1605	Sample career_horoscope_text\n
1606	Sample career_horoscope_text\n
1607	Sample career_horoscope_text\n
1608	Sample career_horoscope_text\n
1609	Sample career_horoscope_text\n
1610	Sample career_horoscope_text\n
1611	Sample career_horoscope_text\n
1612	Sample career_horoscope_text\n
1613	Sample career_horoscope_text\n
1614	Sample career_horoscope_text\n
1615	Sample career_horoscope_text\n
1616	Sample career_horoscope_text\n
1617	Sample career_horoscope_text\n
1618	Sample career_horoscope_text\n
1619	Sample career_horoscope_text\n
1620	Sample career_horoscope_text\n
1621	Sample career_horoscope_text\n
1622	Sample career_horoscope_text\n
1623	Sample career_horoscope_text\n
1624	Sample career_horoscope_text\n
1625	Sample career_horoscope_text\n
1626	Sample career_horoscope_text\n
1627	Sample career_horoscope_text\n
1628	Sample career_horoscope_text\n
1629	Sample career_horoscope_text\n
1630	Sample career_horoscope_text\n
1631	Sample career_horoscope_text\n
1632	Sample career_horoscope_text\n
1633	Sample career_horoscope_text\n
1634	Sample career_horoscope_text\n
1635	Sample career_horoscope_text\n
1636	Sample career_horoscope_text\n
1637	Sample career_horoscope_text\n
1638	Sample career_horoscope_text\n
1639	Sample career_horoscope_text\n
1640	Sample career_horoscope_text\n
1641	Sample career_horoscope_text\n
1642	Sample career_horoscope_text\n
1643	Sample career_horoscope_text\n
1644	Sample career_horoscope_text\n
1645	Sample career_horoscope_text\n
1646	Sample career_horoscope_text\n
1647	Sample career_horoscope_text\n
1648	Sample career_horoscope_text\n
1649	Sample career_horoscope_text\n
1650	Sample career_horoscope_text\n
1651	Sample career_horoscope_text\n
1652	Sample career_horoscope_text\n
1653	Sample career_horoscope_text\n
1654	Sample career_horoscope_text\n
1655	Sample career_horoscope_text\n
1656	Sample career_horoscope_text\n
1657	Sample career_horoscope_text\n
1658	Sample career_horoscope_text\n
1659	Sample career_horoscope_text\n
1660	Sample career_horoscope_text\n
1661	Sample career_horoscope_text\n
1662	Sample career_horoscope_text\n
1663	Sample career_horoscope_text\n
1664	Sample career_horoscope_text\n
1665	Sample career_horoscope_text\n
1666	Sample career_horoscope_text\n
1667	Sample career_horoscope_text\n
1668	Sample career_horoscope_text\n
1669	Sample career_horoscope_text\n
1670	Sample career_horoscope_text\n
1671	Sample career_horoscope_text\n
1672	Sample career_horoscope_text\n
1673	Sample career_horoscope_text\n
1674	Sample career_horoscope_text\n
1675	Sample career_horoscope_text\n
1676	Sample career_horoscope_text\n
1677	Sample career_horoscope_text\n
1678	Sample career_horoscope_text\n
1679	Sample career_horoscope_text\n
1680	Sample career_horoscope_text\n
1681	Sample career_horoscope_text\n
1682	Sample career_horoscope_text\n
1683	Sample career_horoscope_text\n
1684	Sample career_horoscope_text\n
1685	Sample career_horoscope_text\n
1686	Sample career_horoscope_text\n
1687	Sample career_horoscope_text\n
1688	Sample career_horoscope_text\n
1689	Sample career_horoscope_text\n
1690	Sample career_horoscope_text\n
1691	Sample career_horoscope_text\n
1692	Sample career_horoscope_text\n
1693	Sample career_horoscope_text\n
1694	Sample career_horoscope_text\n
1695	Sample career_horoscope_text\n
1696	Sample career_horoscope_text\n
1697	Sample career_horoscope_text\n
1698	Sample career_horoscope_text\n
1699	Sample career_horoscope_text\n
1700	Sample career_horoscope_text\n
1701	Sample career_horoscope_text\n
1702	Sample career_horoscope_text\n
1703	Sample career_horoscope_text\n
1704	Sample career_horoscope_text\n
1705	Sample career_horoscope_text\n
1706	Sample career_horoscope_text\n
1707	Sample career_horoscope_text\n
1708	Sample career_horoscope_text\n
1709	Sample career_horoscope_text\n
1710	Sample career_horoscope_text\n
1711	Sample career_horoscope_text\n
1712	Sample career_horoscope_text\n
1713	Sample career_horoscope_text\n
1714	Sample career_horoscope_text\n
1715	Sample career_horoscope_text\n
1716	Sample career_horoscope_text\n
1717	Sample career_horoscope_text\n
1718	Sample career_horoscope_text\n
1719	Sample career_horoscope_text\n
1720	Sample career_horoscope_text\n
1721	Sample career_horoscope_text\n
1722	Sample career_horoscope_text\n
1723	Sample career_horoscope_text\n
1724	Sample career_horoscope_text\n
1725	Sample career_horoscope_text\n
1726	Sample career_horoscope_text\n
1727	Sample career_horoscope_text\n
1728	Sample career_horoscope_text\n
1729	Sample career_horoscope_text\n
1730	Sample career_horoscope_text\n
1731	Sample career_horoscope_text\n
1732	Sample career_horoscope_text\n
1733	Sample career_horoscope_text\n
1734	Sample career_horoscope_text\n
1735	Sample career_horoscope_text\n
1736	Sample career_horoscope_text\n
1737	Sample career_horoscope_text\n
1738	Sample career_horoscope_text\n
1739	Sample career_horoscope_text\n
1740	Sample career_horoscope_text\n
1741	Sample career_horoscope_text\n
1742	Sample career_horoscope_text\n
1743	Sample career_horoscope_text\n
1744	Sample career_horoscope_text\n
1745	Sample career_horoscope_text\n
1746	Sample career_horoscope_text\n
1747	Sample career_horoscope_text\n
1748	Sample career_horoscope_text\n
1749	Sample career_horoscope_text\n
1750	Sample career_horoscope_text\n
1751	Sample career_horoscope_text\n
1752	Sample career_horoscope_text\n
\.


--
-- TOC entry 3453 (class 0 OID 88989)
-- Dependencies: 225
-- Data for Name: horoscope_file_ids; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.horoscope_file_ids (pk_horoscope_file_ids, sign_name, type_name, file_id) FROM stdin;
\.


--
-- TOC entry 3449 (class 0 OID 88973)
-- Dependencies: 221
-- Data for Name: horoscope_types; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.horoscope_types (pk_horoscope_types, type_name) FROM stdin;
1	Basic
2	Career
3	Romantic
\.


--
-- TOC entry 3462 (class 0 OID 89102)
-- Dependencies: 234
-- Data for Name: house_in_sign_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.house_in_sign_texts (pk_house_in_sign_texts, house, sign, text) FROM stdin;
\.


--
-- TOC entry 3464 (class 0 OID 89108)
-- Dependencies: 236
-- Data for Name: houses_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.houses_texts (pk_signs_in_houses_texts, house, sign, text) FROM stdin;
1	1	0	Sample houses_text\n
2	1	1	Sample houses_text\n
3	1	2	Sample houses_text\n
4	1	3	Sample houses_text\n
5	1	4	Sample houses_text\n
6	1	5	Sample houses_text\n
7	1	6	Sample houses_text\n
8	1	7	Sample houses_text\n
9	1	8	Sample houses_text\n
10	1	9	Sample houses_text\n
11	1	10	Sample houses_text\n
12	1	11	Sample houses_text\n
13	2	0	Sample houses_text\n
14	2	1	Sample houses_text\n
15	2	2	Sample houses_text\n
16	2	3	Sample houses_text\n
17	2	4	Sample houses_text\n
18	2	5	Sample houses_text\n
19	2	6	Sample houses_text\n
20	2	7	Sample houses_text\n
21	2	8	Sample houses_text\n
22	2	9	Sample houses_text\n
23	2	10	Sample houses_text\n
24	2	11	Sample houses_text\n
25	3	0	Sample houses_text\n
26	3	1	Sample houses_text\n
27	3	2	Sample houses_text\n
28	3	3	Sample houses_text\n
29	3	4	Sample houses_text\n
30	3	5	Sample houses_text\n
31	3	6	Sample houses_text\n
32	3	7	Sample houses_text\n
33	3	8	Sample houses_text\n
34	3	9	Sample houses_text\n
35	3	10	Sample houses_text\n
36	3	11	Sample houses_text\n
37	4	0	Sample houses_text\n
38	4	1	Sample houses_text\n
39	4	2	Sample houses_text\n
40	4	3	Sample houses_text\n
41	4	4	Sample houses_text\n
42	4	5	Sample houses_text\n
43	4	6	Sample houses_text\n
44	4	7	Sample houses_text\n
45	4	8	Sample houses_text\n
46	4	9	Sample houses_text\n
47	4	10	Sample houses_text\n
48	4	11	Sample houses_text\n
49	5	0	Sample houses_text\n
50	5	1	Sample houses_text\n
51	5	2	Sample houses_text\n
52	5	3	Sample houses_text\n
53	5	4	Sample houses_text\n
54	5	5	Sample houses_text\n
55	5	6	Sample houses_text\n
56	5	7	Sample houses_text\n
57	5	8	Sample houses_text\n
58	5	9	Sample houses_text\n
59	5	10	Sample houses_text\n
60	5	11	Sample houses_text\n
61	6	0	Sample houses_text\n
62	6	1	Sample houses_text\n
63	6	2	Sample houses_text\n
64	6	3	Sample houses_text\n
65	6	4	Sample houses_text\n
66	6	5	Sample houses_text\n
67	6	6	Sample houses_text\n
68	6	7	Sample houses_text\n
69	6	8	Sample houses_text\n
70	6	9	Sample houses_text\n
71	6	10	Sample houses_text\n
103	9	6	Sample houses_text\n
72	6	11	Sample houses_text\n
73	7	0	Sample houses_text\n
74	7	1	Sample houses_text\n
75	7	2	Sample houses_text\n
76	7	3	Sample houses_text\n
77	7	4	Sample houses_text\n
78	7	5	Sample houses_text\n
79	7	6	Sample houses_text\n
80	7	7	Sample houses_text\n
81	7	8	Sample houses_text\n
82	7	9	Sample houses_text\n
83	7	10	Sample houses_text\n
84	7	11	Sample houses_text\n
85	8	0	Sample houses_text\n
86	8	1	Sample houses_text\n
87	8	2	Sample houses_text\n
88	8	3	Sample houses_text\n
89	8	4	Sample houses_text\n
90	8	5	Sample houses_text\n
91	8	6	Sample houses_text\n
92	8	7	Sample houses_text\n
93	8	8	Sample houses_text\n
94	8	9	Sample houses_text\n
95	8	10	Sample houses_text\n
96	8	11	Sample houses_text\n
97	9	0	Sample houses_text\n
98	9	1	Sample houses_text\n
99	9	2	Sample houses_text\n
100	9	3	Sample houses_text\n
101	9	4	Sample houses_text\n
102	9	5	Sample houses_text\n
104	9	7	Sample houses_text\n
105	9	8	Sample houses_text\n
106	9	9	Sample houses_text\n
107	9	10	Sample houses_text\n
108	9	11	Sample houses_text\n
109	10	0	Sample houses_text\n
110	10	1	Sample houses_text\n
111	10	2	Sample houses_text\n
112	10	3	Sample houses_text\n
113	10	4	Sample houses_text\n
114	10	5	Sample houses_text\n
115	10	6	Sample houses_text\n
116	10	7	Sample houses_text\n
117	10	8	Sample houses_text\n
118	10	9	Sample houses_text\n
119	10	10	Sample houses_text\n
120	10	11	Sample houses_text\n
121	11	0	Sample houses_text\n
122	11	1	Sample houses_text\n
123	11	2	Sample houses_text\n
124	11	3	Sample houses_text\n
125	11	4	Sample houses_text\n
126	11	5	Sample houses_text\n
127	11	6	Sample houses_text\n
128	11	7	Sample houses_text\n
129	11	8	Sample houses_text\n
130	11	9	Sample houses_text\n
131	11	10	Sample houses_text\n
132	11	11	Sample houses_text\n
133	12	0	Sample houses_text\n
134	12	1	Sample houses_text\n
135	12	2	Sample houses_text\n
136	12	3	Sample houses_text\n
137	12	4	Sample houses_text\n
138	12	5	Sample houses_text\n
139	12	6	Sample houses_text\n
140	12	7	Sample houses_text\n
141	12	8	Sample houses_text\n
142	12	9	Sample houses_text\n
143	12	10	Sample houses_text\n
144	12	11	Sample houses_text\n
\.


--
-- TOC entry 3466 (class 0 OID 89114)
-- Dependencies: 238
-- Data for Name: planet_in_sign_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.planet_in_sign_texts (pk_planet_in_sign_texts, planet, sign, text) FROM stdin;
1	1	1	Sample planet_in_sign_text\n
2	1	2	Sample planet_in_sign_text\n
3	1	3	Sample planet_in_sign_text\n
4	1	4	Sample planet_in_sign_text\n
5	1	5	Sample planet_in_sign_text\n
6	1	6	Sample planet_in_sign_text\n
7	1	7	Sample planet_in_sign_text\n
8	1	8	Sample planet_in_sign_text\n
9	1	9	Sample planet_in_sign_text\n
10	1	10	Sample planet_in_sign_text\n
11	1	11	Sample planet_in_sign_text\n
12	1	12	Sample planet_in_sign_text\n
13	2	1	Sample planet_in_sign_text\n
14	2	2	Sample planet_in_sign_text\n
15	2	3	Sample planet_in_sign_text\n
16	2	4	Sample planet_in_sign_text\n
17	2	5	Sample planet_in_sign_text\n
18	2	6	Sample planet_in_sign_text\n
19	2	7	Sample planet_in_sign_text\n
20	2	8	Sample planet_in_sign_text\n
21	2	9	Sample planet_in_sign_text\n
22	2	10	Sample planet_in_sign_text\n
23	2	11	Sample planet_in_sign_text\n
24	2	12	Sample planet_in_sign_text\n
25	3	1	Sample planet_in_sign_text\n
26	3	2	Sample planet_in_sign_text\n
27	3	3	Sample planet_in_sign_text\n
28	3	4	Sample planet_in_sign_text\n
29	3	5	Sample planet_in_sign_text\n
30	3	6	Sample planet_in_sign_text\n
31	3	7	Sample planet_in_sign_text\n
32	3	8	Sample planet_in_sign_text\n
33	3	9	Sample planet_in_sign_text\n
34	3	10	Sample planet_in_sign_text\n
35	3	11	Sample planet_in_sign_text\n
36	3	12	Sample planet_in_sign_text\n
37	4	1	Sample planet_in_sign_text\n
38	4	2	Sample planet_in_sign_text\n
39	4	3	Sample planet_in_sign_text\n
40	4	4	Sample planet_in_sign_text\n
41	4	5	Sample planet_in_sign_text\n
42	4	6	Sample planet_in_sign_text\n
43	4	7	Sample planet_in_sign_text\n
44	4	8	Sample planet_in_sign_text\n
45	4	9	Sample planet_in_sign_text\n
46	4	10	Sample planet_in_sign_text\n
47	4	11	Sample planet_in_sign_text\n
48	4	12	Sample planet_in_sign_text\n
49	5	1	Sample planet_in_sign_text\n
50	5	2	Sample planet_in_sign_text\n
51	5	3	Sample planet_in_sign_text\n
52	5	4	Sample planet_in_sign_text\n
53	5	5	Sample planet_in_sign_text\n
54	5	6	Sample planet_in_sign_text\n
55	5	7	Sample planet_in_sign_text\n
56	5	8	Sample planet_in_sign_text\n
57	5	9	Sample planet_in_sign_text\n
58	5	10	Sample planet_in_sign_text\n
59	5	11	Sample planet_in_sign_text\n
60	5	12	Sample planet_in_sign_text\n
61	6	1	Sample planet_in_sign_text\n
62	6	2	Sample planet_in_sign_text\n
63	6	3	Sample planet_in_sign_text\n
64	6	4	Sample planet_in_sign_text\n
65	6	5	Sample planet_in_sign_text\n
66	6	6	Sample planet_in_sign_text\n
67	6	7	Sample planet_in_sign_text\n
68	6	8	Sample planet_in_sign_text\n
69	6	9	Sample planet_in_sign_text\n
70	6	10	Sample planet_in_sign_text\n
71	6	11	Sample planet_in_sign_text\n
72	6	12	Sample planet_in_sign_text\n
73	7	1	Sample planet_in_sign_text\n
74	7	2	Sample planet_in_sign_text\n
75	7	3	Sample planet_in_sign_text\n
76	7	4	Sample planet_in_sign_text\n
77	7	5	Sample planet_in_sign_text\n
78	7	6	Sample planet_in_sign_text\n
96	8	12	Sample planet_in_sign_text\n
79	7	7	Sample planet_in_sign_text\n
80	7	8	Sample planet_in_sign_text\n
81	7	9	Sample planet_in_sign_text\n
82	7	10	Sample planet_in_sign_text\n
83	7	11	Sample planet_in_sign_text\n
84	7	12	Sample planet_in_sign_text\n
85	8	1	Sample planet_in_sign_text\n
86	8	2	Sample planet_in_sign_text\n
87	8	3	Sample planet_in_sign_text\n
88	8	4	Sample planet_in_sign_text\n
89	8	5	Sample planet_in_sign_text\n
90	8	6	Sample planet_in_sign_text\n
91	8	7	Sample planet_in_sign_text\n
92	8	8	Sample planet_in_sign_text\n
93	8	9	Sample planet_in_sign_text\n
94	8	10	Sample planet_in_sign_text\n
95	8	11	Sample planet_in_sign_text\n
97	9	1	Sample planet_in_sign_text\n
98	9	2	Sample planet_in_sign_text\n
99	9	3	Sample planet_in_sign_text\n
100	9	4	Sample planet_in_sign_text\n
101	9	5	Sample planet_in_sign_text\n
102	9	6	Sample planet_in_sign_text\n
103	9	7	Sample planet_in_sign_text\n
104	9	8	Sample planet_in_sign_text\n
105	9	9	Sample planet_in_sign_text\n
106	9	10	Sample planet_in_sign_text\n
107	9	11	Sample planet_in_sign_text\n
108	9	12	Sample planet_in_sign_text\n
109	10	1	Sample planet_in_sign_text\n
110	10	2	Sample planet_in_sign_text\n
111	10	3	Sample planet_in_sign_text\n
112	10	4	Sample planet_in_sign_text\n
113	10	5	Sample planet_in_sign_text\n
114	10	6	Sample planet_in_sign_text\n
115	10	7	Sample planet_in_sign_text\n
116	10	8	Sample planet_in_sign_text\n
117	10	9	Sample planet_in_sign_text\n
118	10	10	Sample planet_in_sign_text\n
119	10	11	Sample planet_in_sign_text\n
120	10	12	Sample planet_in_sign_text\n
\.


--
-- TOC entry 3468 (class 0 OID 89120)
-- Dependencies: 240
-- Data for Name: romantic_horoscope_texts; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.romantic_horoscope_texts (pk_romantic_horoscope_texts, horoscope_text) FROM stdin;
1	Sample romantic_horoscope_text\n
2	Sample romantic_horoscope_text\n
3	Sample romantic_horoscope_text\n
4	Sample romantic_horoscope_text\n
5	Sample romantic_horoscope_text\n
6	Sample romantic_horoscope_text\n
7	Sample romantic_horoscope_text\n
8	Sample romantic_horoscope_text\n
9	Sample romantic_horoscope_text\n
10	Sample romantic_horoscope_text\n
11	Sample romantic_horoscope_text\n
12	Sample romantic_horoscope_text\n
13	Sample romantic_horoscope_text\n
14	Sample romantic_horoscope_text\n
15	Sample romantic_horoscope_text\n
16	Sample romantic_horoscope_text\n
17	Sample romantic_horoscope_text\n
18	Sample romantic_horoscope_text\n
19	Sample romantic_horoscope_text\n
20	Sample romantic_horoscope_text\n
21	Sample romantic_horoscope_text\n
22	Sample romantic_horoscope_text\n
23	Sample romantic_horoscope_text\n
24	Sample romantic_horoscope_text\n
25	Sample romantic_horoscope_text\n
26	Sample romantic_horoscope_text\n
27	Sample romantic_horoscope_text\n
28	Sample romantic_horoscope_text\n
29	Sample romantic_horoscope_text\n
30	Sample romantic_horoscope_text\n
31	Sample romantic_horoscope_text\n
32	Sample romantic_horoscope_text\n
33	Sample romantic_horoscope_text\n
34	Sample romantic_horoscope_text\n
35	Sample romantic_horoscope_text\n
36	Sample romantic_horoscope_text\n
37	Sample romantic_horoscope_text\n
38	Sample romantic_horoscope_text\n
39	Sample romantic_horoscope_text\n
40	Sample romantic_horoscope_text\n
41	Sample romantic_horoscope_text\n
42	Sample romantic_horoscope_text\n
43	Sample romantic_horoscope_text\n
44	Sample romantic_horoscope_text\n
45	Sample romantic_horoscope_text\n
46	Sample romantic_horoscope_text\n
47	Sample romantic_horoscope_text\n
48	Sample romantic_horoscope_text\n
49	Sample romantic_horoscope_text\n
50	Sample romantic_horoscope_text\n
51	Sample romantic_horoscope_text\n
52	Sample romantic_horoscope_text\n
53	Sample romantic_horoscope_text\n
54	Sample romantic_horoscope_text\n
55	Sample romantic_horoscope_text\n
56	Sample romantic_horoscope_text\n
57	Sample romantic_horoscope_text\n
58	Sample romantic_horoscope_text\n
59	Sample romantic_horoscope_text\n
60	Sample romantic_horoscope_text\n
61	Sample romantic_horoscope_text\n
62	Sample romantic_horoscope_text\n
63	Sample romantic_horoscope_text\n
64	Sample romantic_horoscope_text\n
65	Sample romantic_horoscope_text\n
66	Sample romantic_horoscope_text\n
67	Sample romantic_horoscope_text\n
68	Sample romantic_horoscope_text\n
69	Sample romantic_horoscope_text\n
70	Sample romantic_horoscope_text\n
71	Sample romantic_horoscope_text\n
72	Sample romantic_horoscope_text\n
73	Sample romantic_horoscope_text\n
74	Sample romantic_horoscope_text\n
75	Sample romantic_horoscope_text\n
76	Sample romantic_horoscope_text\n
77	Sample romantic_horoscope_text\n
78	Sample romantic_horoscope_text\n
79	Sample romantic_horoscope_text\n
80	Sample romantic_horoscope_text\n
81	Sample romantic_horoscope_text\n
82	Sample romantic_horoscope_text\n
83	Sample romantic_horoscope_text\n
84	Sample romantic_horoscope_text\n
85	Sample romantic_horoscope_text\n
86	Sample romantic_horoscope_text\n
87	Sample romantic_horoscope_text\n
88	Sample romantic_horoscope_text\n
89	Sample romantic_horoscope_text\n
90	Sample romantic_horoscope_text\n
91	Sample romantic_horoscope_text\n
92	Sample romantic_horoscope_text\n
93	Sample romantic_horoscope_text\n
94	Sample romantic_horoscope_text\n
95	Sample romantic_horoscope_text\n
96	Sample romantic_horoscope_text\n
97	Sample romantic_horoscope_text\n
98	Sample romantic_horoscope_text\n
99	Sample romantic_horoscope_text\n
100	Sample romantic_horoscope_text\n
101	Sample romantic_horoscope_text\n
102	Sample romantic_horoscope_text\n
103	Sample romantic_horoscope_text\n
104	Sample romantic_horoscope_text\n
105	Sample romantic_horoscope_text\n
106	Sample romantic_horoscope_text\n
107	Sample romantic_horoscope_text\n
108	Sample romantic_horoscope_text\n
109	Sample romantic_horoscope_text\n
110	Sample romantic_horoscope_text\n
111	Sample romantic_horoscope_text\n
112	Sample romantic_horoscope_text\n
113	Sample romantic_horoscope_text\n
114	Sample romantic_horoscope_text\n
115	Sample romantic_horoscope_text\n
116	Sample romantic_horoscope_text\n
117	Sample romantic_horoscope_text\n
118	Sample romantic_horoscope_text\n
119	Sample romantic_horoscope_text\n
120	Sample romantic_horoscope_text\n
121	Sample romantic_horoscope_text\n
122	Sample romantic_horoscope_text\n
123	Sample romantic_horoscope_text\n
124	Sample romantic_horoscope_text\n
125	Sample romantic_horoscope_text\n
126	Sample romantic_horoscope_text\n
127	Sample romantic_horoscope_text\n
128	Sample romantic_horoscope_text\n
129	Sample romantic_horoscope_text\n
130	Sample romantic_horoscope_text\n
131	Sample romantic_horoscope_text\n
132	Sample romantic_horoscope_text\n
133	Sample romantic_horoscope_text\n
134	Sample romantic_horoscope_text\n
135	Sample romantic_horoscope_text\n
136	Sample romantic_horoscope_text\n
137	Sample romantic_horoscope_text\n
138	Sample romantic_horoscope_text\n
139	Sample romantic_horoscope_text\n
140	Sample romantic_horoscope_text\n
141	Sample romantic_horoscope_text\n
142	Sample romantic_horoscope_text\n
143	Sample romantic_horoscope_text\n
144	Sample romantic_horoscope_text\n
145	Sample romantic_horoscope_text\n
146	Sample romantic_horoscope_text\n
147	Sample romantic_horoscope_text\n
148	Sample romantic_horoscope_text\n
149	Sample romantic_horoscope_text\n
150	Sample romantic_horoscope_text\n
151	Sample romantic_horoscope_text\n
152	Sample romantic_horoscope_text\n
153	Sample romantic_horoscope_text\n
154	Sample romantic_horoscope_text\n
155	Sample romantic_horoscope_text\n
156	Sample romantic_horoscope_text\n
157	Sample romantic_horoscope_text\n
158	Sample romantic_horoscope_text\n
159	Sample romantic_horoscope_text\n
160	Sample romantic_horoscope_text\n
161	Sample romantic_horoscope_text\n
162	Sample romantic_horoscope_text\n
163	Sample romantic_horoscope_text\n
164	Sample romantic_horoscope_text\n
165	Sample romantic_horoscope_text\n
166	Sample romantic_horoscope_text\n
167	Sample romantic_horoscope_text\n
168	Sample romantic_horoscope_text\n
169	Sample romantic_horoscope_text\n
170	Sample romantic_horoscope_text\n
171	Sample romantic_horoscope_text\n
172	Sample romantic_horoscope_text\n
173	Sample romantic_horoscope_text\n
174	Sample romantic_horoscope_text\n
175	Sample romantic_horoscope_text\n
176	Sample romantic_horoscope_text\n
177	Sample romantic_horoscope_text\n
178	Sample romantic_horoscope_text\n
179	Sample romantic_horoscope_text\n
180	Sample romantic_horoscope_text\n
181	Sample romantic_horoscope_text\n
182	Sample romantic_horoscope_text\n
183	Sample romantic_horoscope_text\n
184	Sample romantic_horoscope_text\n
185	Sample romantic_horoscope_text\n
186	Sample romantic_horoscope_text\n
187	Sample romantic_horoscope_text\n
188	Sample romantic_horoscope_text\n
189	Sample romantic_horoscope_text\n
190	Sample romantic_horoscope_text\n
191	Sample romantic_horoscope_text\n
192	Sample romantic_horoscope_text\n
193	Sample romantic_horoscope_text\n
194	Sample romantic_horoscope_text\n
195	Sample romantic_horoscope_text\n
196	Sample romantic_horoscope_text\n
197	Sample romantic_horoscope_text\n
198	Sample romantic_horoscope_text\n
199	Sample romantic_horoscope_text\n
200	Sample romantic_horoscope_text\n
201	Sample romantic_horoscope_text\n
202	Sample romantic_horoscope_text\n
203	Sample romantic_horoscope_text\n
204	Sample romantic_horoscope_text\n
205	Sample romantic_horoscope_text\n
206	Sample romantic_horoscope_text\n
207	Sample romantic_horoscope_text\n
208	Sample romantic_horoscope_text\n
209	Sample romantic_horoscope_text\n
210	Sample romantic_horoscope_text\n
211	Sample romantic_horoscope_text\n
212	Sample romantic_horoscope_text\n
213	Sample romantic_horoscope_text\n
214	Sample romantic_horoscope_text\n
215	Sample romantic_horoscope_text\n
216	Sample romantic_horoscope_text\n
217	Sample romantic_horoscope_text\n
218	Sample romantic_horoscope_text\n
219	Sample romantic_horoscope_text\n
220	Sample romantic_horoscope_text\n
221	Sample romantic_horoscope_text\n
222	Sample romantic_horoscope_text\n
223	Sample romantic_horoscope_text\n
224	Sample romantic_horoscope_text\n
225	Sample romantic_horoscope_text\n
226	Sample romantic_horoscope_text\n
227	Sample romantic_horoscope_text\n
228	Sample romantic_horoscope_text\n
229	Sample romantic_horoscope_text\n
230	Sample romantic_horoscope_text\n
231	Sample romantic_horoscope_text\n
232	Sample romantic_horoscope_text\n
233	Sample romantic_horoscope_text\n
234	Sample romantic_horoscope_text\n
235	Sample romantic_horoscope_text\n
236	Sample romantic_horoscope_text\n
237	Sample romantic_horoscope_text\n
238	Sample romantic_horoscope_text\n
239	Sample romantic_horoscope_text\n
240	Sample romantic_horoscope_text\n
241	Sample romantic_horoscope_text\n
242	Sample romantic_horoscope_text\n
243	Sample romantic_horoscope_text\n
244	Sample romantic_horoscope_text\n
245	Sample romantic_horoscope_text\n
246	Sample romantic_horoscope_text\n
247	Sample romantic_horoscope_text\n
248	Sample romantic_horoscope_text\n
249	Sample romantic_horoscope_text\n
250	Sample romantic_horoscope_text\n
251	Sample romantic_horoscope_text\n
252	Sample romantic_horoscope_text\n
253	Sample romantic_horoscope_text\n
254	Sample romantic_horoscope_text\n
255	Sample romantic_horoscope_text\n
256	Sample romantic_horoscope_text\n
257	Sample romantic_horoscope_text\n
258	Sample romantic_horoscope_text\n
259	Sample romantic_horoscope_text\n
260	Sample romantic_horoscope_text\n
261	Sample romantic_horoscope_text\n
262	Sample romantic_horoscope_text\n
263	Sample romantic_horoscope_text\n
264	Sample romantic_horoscope_text\n
265	Sample romantic_horoscope_text\n
266	Sample romantic_horoscope_text\n
267	Sample romantic_horoscope_text\n
268	Sample romantic_horoscope_text\n
269	Sample romantic_horoscope_text\n
270	Sample romantic_horoscope_text\n
271	Sample romantic_horoscope_text\n
272	Sample romantic_horoscope_text\n
273	Sample romantic_horoscope_text\n
274	Sample romantic_horoscope_text\n
275	Sample romantic_horoscope_text\n
276	Sample romantic_horoscope_text\n
277	Sample romantic_horoscope_text\n
278	Sample romantic_horoscope_text\n
279	Sample romantic_horoscope_text\n
280	Sample romantic_horoscope_text\n
281	Sample romantic_horoscope_text\n
282	Sample romantic_horoscope_text\n
283	Sample romantic_horoscope_text\n
284	Sample romantic_horoscope_text\n
285	Sample romantic_horoscope_text\n
286	Sample romantic_horoscope_text\n
287	Sample romantic_horoscope_text\n
288	Sample romantic_horoscope_text\n
289	Sample romantic_horoscope_text\n
290	Sample romantic_horoscope_text\n
291	Sample romantic_horoscope_text\n
292	Sample romantic_horoscope_text\n
293	Sample romantic_horoscope_text\n
294	Sample romantic_horoscope_text\n
295	Sample romantic_horoscope_text\n
296	Sample romantic_horoscope_text\n
297	Sample romantic_horoscope_text\n
298	Sample romantic_horoscope_text\n
299	Sample romantic_horoscope_text\n
300	Sample romantic_horoscope_text\n
301	Sample romantic_horoscope_text\n
302	Sample romantic_horoscope_text\n
303	Sample romantic_horoscope_text\n
304	Sample romantic_horoscope_text\n
305	Sample romantic_horoscope_text\n
306	Sample romantic_horoscope_text\n
307	Sample romantic_horoscope_text\n
308	Sample romantic_horoscope_text\n
309	Sample romantic_horoscope_text\n
310	Sample romantic_horoscope_text\n
311	Sample romantic_horoscope_text\n
312	Sample romantic_horoscope_text\n
313	Sample romantic_horoscope_text\n
314	Sample romantic_horoscope_text\n
315	Sample romantic_horoscope_text\n
316	Sample romantic_horoscope_text\n
317	Sample romantic_horoscope_text\n
318	Sample romantic_horoscope_text\n
319	Sample romantic_horoscope_text\n
320	Sample romantic_horoscope_text\n
321	Sample romantic_horoscope_text\n
322	Sample romantic_horoscope_text\n
323	Sample romantic_horoscope_text\n
324	Sample romantic_horoscope_text\n
325	Sample romantic_horoscope_text\n
326	Sample romantic_horoscope_text\n
327	Sample romantic_horoscope_text\n
328	Sample romantic_horoscope_text\n
329	Sample romantic_horoscope_text\n
330	Sample romantic_horoscope_text\n
331	Sample romantic_horoscope_text\n
332	Sample romantic_horoscope_text\n
333	Sample romantic_horoscope_text\n
334	Sample romantic_horoscope_text\n
335	Sample romantic_horoscope_text\n
336	Sample romantic_horoscope_text\n
337	Sample romantic_horoscope_text\n
338	Sample romantic_horoscope_text\n
339	Sample romantic_horoscope_text\n
340	Sample romantic_horoscope_text\n
341	Sample romantic_horoscope_text\n
342	Sample romantic_horoscope_text\n
343	Sample romantic_horoscope_text\n
344	Sample romantic_horoscope_text\n
345	Sample romantic_horoscope_text\n
346	Sample romantic_horoscope_text\n
347	Sample romantic_horoscope_text\n
348	Sample romantic_horoscope_text\n
349	Sample romantic_horoscope_text\n
350	Sample romantic_horoscope_text\n
351	Sample romantic_horoscope_text\n
352	Sample romantic_horoscope_text\n
353	Sample romantic_horoscope_text\n
354	Sample romantic_horoscope_text\n
355	Sample romantic_horoscope_text\n
356	Sample romantic_horoscope_text\n
357	Sample romantic_horoscope_text\n
358	Sample romantic_horoscope_text\n
359	Sample romantic_horoscope_text\n
360	Sample romantic_horoscope_text\n
361	Sample romantic_horoscope_text\n
362	Sample romantic_horoscope_text\n
363	Sample romantic_horoscope_text\n
364	Sample romantic_horoscope_text\n
365	Sample romantic_horoscope_text\n
366	Sample romantic_horoscope_text\n
367	Sample romantic_horoscope_text\n
368	Sample romantic_horoscope_text\n
369	Sample romantic_horoscope_text\n
370	Sample romantic_horoscope_text\n
371	Sample romantic_horoscope_text\n
372	Sample romantic_horoscope_text\n
373	Sample romantic_horoscope_text\n
374	Sample romantic_horoscope_text\n
375	Sample romantic_horoscope_text\n
376	Sample romantic_horoscope_text\n
377	Sample romantic_horoscope_text\n
378	Sample romantic_horoscope_text\n
379	Sample romantic_horoscope_text\n
380	Sample romantic_horoscope_text\n
381	Sample romantic_horoscope_text\n
382	Sample romantic_horoscope_text\n
383	Sample romantic_horoscope_text\n
384	Sample romantic_horoscope_text\n
385	Sample romantic_horoscope_text\n
386	Sample romantic_horoscope_text\n
387	Sample romantic_horoscope_text\n
388	Sample romantic_horoscope_text\n
389	Sample romantic_horoscope_text\n
390	Sample romantic_horoscope_text\n
391	Sample romantic_horoscope_text\n
392	Sample romantic_horoscope_text\n
393	Sample romantic_horoscope_text\n
394	Sample romantic_horoscope_text\n
395	Sample romantic_horoscope_text\n
396	Sample romantic_horoscope_text\n
397	Sample romantic_horoscope_text\n
398	Sample romantic_horoscope_text\n
399	Sample romantic_horoscope_text\n
400	Sample romantic_horoscope_text\n
401	Sample romantic_horoscope_text\n
402	Sample romantic_horoscope_text\n
403	Sample romantic_horoscope_text\n
404	Sample romantic_horoscope_text\n
405	Sample romantic_horoscope_text\n
406	Sample romantic_horoscope_text\n
407	Sample romantic_horoscope_text\n
408	Sample romantic_horoscope_text\n
409	Sample romantic_horoscope_text\n
410	Sample romantic_horoscope_text\n
411	Sample romantic_horoscope_text\n
412	Sample romantic_horoscope_text\n
413	Sample romantic_horoscope_text\n
414	Sample romantic_horoscope_text\n
415	Sample romantic_horoscope_text\n
416	Sample romantic_horoscope_text\n
417	Sample romantic_horoscope_text\n
418	Sample romantic_horoscope_text\n
419	Sample romantic_horoscope_text\n
420	Sample romantic_horoscope_text\n
421	Sample romantic_horoscope_text\n
422	Sample romantic_horoscope_text\n
423	Sample romantic_horoscope_text\n
424	Sample romantic_horoscope_text\n
425	Sample romantic_horoscope_text\n
426	Sample romantic_horoscope_text\n
427	Sample romantic_horoscope_text\n
428	Sample romantic_horoscope_text\n
429	Sample romantic_horoscope_text\n
430	Sample romantic_horoscope_text\n
431	Sample romantic_horoscope_text\n
432	Sample romantic_horoscope_text\n
433	Sample romantic_horoscope_text\n
434	Sample romantic_horoscope_text\n
435	Sample romantic_horoscope_text\n
436	Sample romantic_horoscope_text\n
437	Sample romantic_horoscope_text\n
438	Sample romantic_horoscope_text\n
439	Sample romantic_horoscope_text\n
440	Sample romantic_horoscope_text\n
441	Sample romantic_horoscope_text\n
442	Sample romantic_horoscope_text\n
443	Sample romantic_horoscope_text\n
444	Sample romantic_horoscope_text\n
445	Sample romantic_horoscope_text\n
446	Sample romantic_horoscope_text\n
447	Sample romantic_horoscope_text\n
448	Sample romantic_horoscope_text\n
449	Sample romantic_horoscope_text\n
450	Sample romantic_horoscope_text\n
451	Sample romantic_horoscope_text\n
452	Sample romantic_horoscope_text\n
453	Sample romantic_horoscope_text\n
454	Sample romantic_horoscope_text\n
455	Sample romantic_horoscope_text\n
456	Sample romantic_horoscope_text\n
457	Sample romantic_horoscope_text\n
458	Sample romantic_horoscope_text\n
459	Sample romantic_horoscope_text\n
460	Sample romantic_horoscope_text\n
461	Sample romantic_horoscope_text\n
462	Sample romantic_horoscope_text\n
463	Sample romantic_horoscope_text\n
464	Sample romantic_horoscope_text\n
465	Sample romantic_horoscope_text\n
466	Sample romantic_horoscope_text\n
467	Sample romantic_horoscope_text\n
468	Sample romantic_horoscope_text\n
469	Sample romantic_horoscope_text\n
470	Sample romantic_horoscope_text\n
471	Sample romantic_horoscope_text\n
472	Sample romantic_horoscope_text\n
473	Sample romantic_horoscope_text\n
474	Sample romantic_horoscope_text\n
475	Sample romantic_horoscope_text\n
476	Sample romantic_horoscope_text\n
477	Sample romantic_horoscope_text\n
478	Sample romantic_horoscope_text\n
479	Sample romantic_horoscope_text\n
480	Sample romantic_horoscope_text\n
481	Sample romantic_horoscope_text\n
482	Sample romantic_horoscope_text\n
483	Sample romantic_horoscope_text\n
484	Sample romantic_horoscope_text\n
485	Sample romantic_horoscope_text\n
486	Sample romantic_horoscope_text\n
487	Sample romantic_horoscope_text\n
488	Sample romantic_horoscope_text\n
489	Sample romantic_horoscope_text\n
490	Sample romantic_horoscope_text\n
491	Sample romantic_horoscope_text\n
492	Sample romantic_horoscope_text\n
493	Sample romantic_horoscope_text\n
494	Sample romantic_horoscope_text\n
495	Sample romantic_horoscope_text\n
496	Sample romantic_horoscope_text\n
497	Sample romantic_horoscope_text\n
498	Sample romantic_horoscope_text\n
499	Sample romantic_horoscope_text\n
500	Sample romantic_horoscope_text\n
501	Sample romantic_horoscope_text\n
502	Sample romantic_horoscope_text\n
503	Sample romantic_horoscope_text\n
504	Sample romantic_horoscope_text\n
505	Sample romantic_horoscope_text\n
506	Sample romantic_horoscope_text\n
507	Sample romantic_horoscope_text\n
508	Sample romantic_horoscope_text\n
509	Sample romantic_horoscope_text\n
510	Sample romantic_horoscope_text\n
511	Sample romantic_horoscope_text\n
512	Sample romantic_horoscope_text\n
513	Sample romantic_horoscope_text\n
514	Sample romantic_horoscope_text\n
515	Sample romantic_horoscope_text\n
516	Sample romantic_horoscope_text\n
517	Sample romantic_horoscope_text\n
518	Sample romantic_horoscope_text\n
519	Sample romantic_horoscope_text\n
520	Sample romantic_horoscope_text\n
521	Sample romantic_horoscope_text\n
522	Sample romantic_horoscope_text\n
523	Sample romantic_horoscope_text\n
524	Sample romantic_horoscope_text\n
525	Sample romantic_horoscope_text\n
526	Sample romantic_horoscope_text\n
527	Sample romantic_horoscope_text\n
528	Sample romantic_horoscope_text\n
529	Sample romantic_horoscope_text\n
530	Sample romantic_horoscope_text\n
531	Sample romantic_horoscope_text\n
532	Sample romantic_horoscope_text\n
533	Sample romantic_horoscope_text\n
534	Sample romantic_horoscope_text\n
535	Sample romantic_horoscope_text\n
536	Sample romantic_horoscope_text\n
537	Sample romantic_horoscope_text\n
538	Sample romantic_horoscope_text\n
539	Sample romantic_horoscope_text\n
540	Sample romantic_horoscope_text\n
541	Sample romantic_horoscope_text\n
542	Sample romantic_horoscope_text\n
543	Sample romantic_horoscope_text\n
544	Sample romantic_horoscope_text\n
545	Sample romantic_horoscope_text\n
546	Sample romantic_horoscope_text\n
547	Sample romantic_horoscope_text\n
548	Sample romantic_horoscope_text\n
549	Sample romantic_horoscope_text\n
550	Sample romantic_horoscope_text\n
551	Sample romantic_horoscope_text\n
552	Sample romantic_horoscope_text\n
553	Sample romantic_horoscope_text\n
554	Sample romantic_horoscope_text\n
555	Sample romantic_horoscope_text\n
556	Sample romantic_horoscope_text\n
557	Sample romantic_horoscope_text\n
558	Sample romantic_horoscope_text\n
559	Sample romantic_horoscope_text\n
560	Sample romantic_horoscope_text\n
561	Sample romantic_horoscope_text\n
562	Sample romantic_horoscope_text\n
563	Sample romantic_horoscope_text\n
564	Sample romantic_horoscope_text\n
565	Sample romantic_horoscope_text\n
566	Sample romantic_horoscope_text\n
567	Sample romantic_horoscope_text\n
568	Sample romantic_horoscope_text\n
569	Sample romantic_horoscope_text\n
570	Sample romantic_horoscope_text\n
571	Sample romantic_horoscope_text\n
572	Sample romantic_horoscope_text\n
573	Sample romantic_horoscope_text\n
574	Sample romantic_horoscope_text\n
575	Sample romantic_horoscope_text\n
576	Sample romantic_horoscope_text\n
577	Sample romantic_horoscope_text\n
578	Sample romantic_horoscope_text\n
579	Sample romantic_horoscope_text\n
580	Sample romantic_horoscope_text\n
581	Sample romantic_horoscope_text\n
582	Sample romantic_horoscope_text\n
583	Sample romantic_horoscope_text\n
584	Sample romantic_horoscope_text\n
585	Sample romantic_horoscope_text\n
586	Sample romantic_horoscope_text\n
587	Sample romantic_horoscope_text\n
588	Sample romantic_horoscope_text\n
589	Sample romantic_horoscope_text\n
590	Sample romantic_horoscope_text\n
591	Sample romantic_horoscope_text\n
592	Sample romantic_horoscope_text\n
593	Sample romantic_horoscope_text\n
594	Sample romantic_horoscope_text\n
595	Sample romantic_horoscope_text\n
596	Sample romantic_horoscope_text\n
597	Sample romantic_horoscope_text\n
598	Sample romantic_horoscope_text\n
599	Sample romantic_horoscope_text\n
600	Sample romantic_horoscope_text\n
601	Sample romantic_horoscope_text\n
602	Sample romantic_horoscope_text\n
603	Sample romantic_horoscope_text\n
604	Sample romantic_horoscope_text\n
605	Sample romantic_horoscope_text\n
606	Sample romantic_horoscope_text\n
607	Sample romantic_horoscope_text\n
608	Sample romantic_horoscope_text\n
609	Sample romantic_horoscope_text\n
610	Sample romantic_horoscope_text\n
611	Sample romantic_horoscope_text\n
612	Sample romantic_horoscope_text\n
613	Sample romantic_horoscope_text\n
614	Sample romantic_horoscope_text\n
615	Sample romantic_horoscope_text\n
616	Sample romantic_horoscope_text\n
617	Sample romantic_horoscope_text\n
618	Sample romantic_horoscope_text\n
619	Sample romantic_horoscope_text\n
620	Sample romantic_horoscope_text\n
621	Sample romantic_horoscope_text\n
622	Sample romantic_horoscope_text\n
623	Sample romantic_horoscope_text\n
624	Sample romantic_horoscope_text\n
625	Sample romantic_horoscope_text\n
626	Sample romantic_horoscope_text\n
627	Sample romantic_horoscope_text\n
628	Sample romantic_horoscope_text\n
629	Sample romantic_horoscope_text\n
630	Sample romantic_horoscope_text\n
631	Sample romantic_horoscope_text\n
632	Sample romantic_horoscope_text\n
633	Sample romantic_horoscope_text\n
634	Sample romantic_horoscope_text\n
635	Sample romantic_horoscope_text\n
636	Sample romantic_horoscope_text\n
637	Sample romantic_horoscope_text\n
638	Sample romantic_horoscope_text\n
639	Sample romantic_horoscope_text\n
640	Sample romantic_horoscope_text\n
641	Sample romantic_horoscope_text\n
642	Sample romantic_horoscope_text\n
643	Sample romantic_horoscope_text\n
644	Sample romantic_horoscope_text\n
645	Sample romantic_horoscope_text\n
646	Sample romantic_horoscope_text\n
647	Sample romantic_horoscope_text\n
648	Sample romantic_horoscope_text\n
649	Sample romantic_horoscope_text\n
650	Sample romantic_horoscope_text\n
651	Sample romantic_horoscope_text\n
652	Sample romantic_horoscope_text\n
653	Sample romantic_horoscope_text\n
654	Sample romantic_horoscope_text\n
655	Sample romantic_horoscope_text\n
656	Sample romantic_horoscope_text\n
657	Sample romantic_horoscope_text\n
658	Sample romantic_horoscope_text\n
659	Sample romantic_horoscope_text\n
660	Sample romantic_horoscope_text\n
661	Sample romantic_horoscope_text\n
662	Sample romantic_horoscope_text\n
663	Sample romantic_horoscope_text\n
664	Sample romantic_horoscope_text\n
665	Sample romantic_horoscope_text\n
666	Sample romantic_horoscope_text\n
667	Sample romantic_horoscope_text\n
668	Sample romantic_horoscope_text\n
669	Sample romantic_horoscope_text\n
670	Sample romantic_horoscope_text\n
671	Sample romantic_horoscope_text\n
672	Sample romantic_horoscope_text\n
673	Sample romantic_horoscope_text\n
674	Sample romantic_horoscope_text\n
675	Sample romantic_horoscope_text\n
676	Sample romantic_horoscope_text\n
677	Sample romantic_horoscope_text\n
678	Sample romantic_horoscope_text\n
679	Sample romantic_horoscope_text\n
680	Sample romantic_horoscope_text\n
681	Sample romantic_horoscope_text\n
682	Sample romantic_horoscope_text\n
683	Sample romantic_horoscope_text\n
684	Sample romantic_horoscope_text\n
685	Sample romantic_horoscope_text\n
686	Sample romantic_horoscope_text\n
687	Sample romantic_horoscope_text\n
688	Sample romantic_horoscope_text\n
689	Sample romantic_horoscope_text\n
690	Sample romantic_horoscope_text\n
691	Sample romantic_horoscope_text\n
692	Sample romantic_horoscope_text\n
693	Sample romantic_horoscope_text\n
694	Sample romantic_horoscope_text\n
695	Sample romantic_horoscope_text\n
696	Sample romantic_horoscope_text\n
697	Sample romantic_horoscope_text\n
698	Sample romantic_horoscope_text\n
699	Sample romantic_horoscope_text\n
700	Sample romantic_horoscope_text\n
701	Sample romantic_horoscope_text\n
702	Sample romantic_horoscope_text\n
703	Sample romantic_horoscope_text\n
704	Sample romantic_horoscope_text\n
705	Sample romantic_horoscope_text\n
706	Sample romantic_horoscope_text\n
707	Sample romantic_horoscope_text\n
708	Sample romantic_horoscope_text\n
709	Sample romantic_horoscope_text\n
710	Sample romantic_horoscope_text\n
711	Sample romantic_horoscope_text\n
712	Sample romantic_horoscope_text\n
713	Sample romantic_horoscope_text\n
714	Sample romantic_horoscope_text\n
715	Sample romantic_horoscope_text\n
716	Sample romantic_horoscope_text\n
717	Sample romantic_horoscope_text\n
718	Sample romantic_horoscope_text\n
719	Sample romantic_horoscope_text\n
720	Sample romantic_horoscope_text\n
721	Sample romantic_horoscope_text\n
722	Sample romantic_horoscope_text\n
723	Sample romantic_horoscope_text\n
724	Sample romantic_horoscope_text\n
725	Sample romantic_horoscope_text\n
726	Sample romantic_horoscope_text\n
727	Sample romantic_horoscope_text\n
728	Sample romantic_horoscope_text\n
729	Sample romantic_horoscope_text\n
730	Sample romantic_horoscope_text\n
731	Sample romantic_horoscope_text\n
732	Sample romantic_horoscope_text\n
733	Sample romantic_horoscope_text\n
734	Sample romantic_horoscope_text\n
735	Sample romantic_horoscope_text\n
736	Sample romantic_horoscope_text\n
737	Sample romantic_horoscope_text\n
738	Sample romantic_horoscope_text\n
739	Sample romantic_horoscope_text\n
740	Sample romantic_horoscope_text\n
741	Sample romantic_horoscope_text\n
742	Sample romantic_horoscope_text\n
743	Sample romantic_horoscope_text\n
744	Sample romantic_horoscope_text\n
745	Sample romantic_horoscope_text\n
746	Sample romantic_horoscope_text\n
747	Sample romantic_horoscope_text\n
748	Sample romantic_horoscope_text\n
749	Sample romantic_horoscope_text\n
750	Sample romantic_horoscope_text\n
751	Sample romantic_horoscope_text\n
752	Sample romantic_horoscope_text\n
753	Sample romantic_horoscope_text\n
754	Sample romantic_horoscope_text\n
755	Sample romantic_horoscope_text\n
756	Sample romantic_horoscope_text\n
757	Sample romantic_horoscope_text\n
758	Sample romantic_horoscope_text\n
759	Sample romantic_horoscope_text\n
760	Sample romantic_horoscope_text\n
761	Sample romantic_horoscope_text\n
762	Sample romantic_horoscope_text\n
763	Sample romantic_horoscope_text\n
764	Sample romantic_horoscope_text\n
765	Sample romantic_horoscope_text\n
766	Sample romantic_horoscope_text\n
767	Sample romantic_horoscope_text\n
768	Sample romantic_horoscope_text\n
769	Sample romantic_horoscope_text\n
770	Sample romantic_horoscope_text\n
771	Sample romantic_horoscope_text\n
772	Sample romantic_horoscope_text\n
773	Sample romantic_horoscope_text\n
774	Sample romantic_horoscope_text\n
775	Sample romantic_horoscope_text\n
776	Sample romantic_horoscope_text\n
777	Sample romantic_horoscope_text\n
778	Sample romantic_horoscope_text\n
779	Sample romantic_horoscope_text\n
780	Sample romantic_horoscope_text\n
781	Sample romantic_horoscope_text\n
782	Sample romantic_horoscope_text\n
783	Sample romantic_horoscope_text\n
784	Sample romantic_horoscope_text\n
785	Sample romantic_horoscope_text\n
786	Sample romantic_horoscope_text\n
787	Sample romantic_horoscope_text\n
788	Sample romantic_horoscope_text\n
789	Sample romantic_horoscope_text\n
790	Sample romantic_horoscope_text\n
791	Sample romantic_horoscope_text\n
792	Sample romantic_horoscope_text\n
793	Sample romantic_horoscope_text\n
794	Sample romantic_horoscope_text\n
795	Sample romantic_horoscope_text\n
796	Sample romantic_horoscope_text\n
797	Sample romantic_horoscope_text\n
798	Sample romantic_horoscope_text\n
799	Sample romantic_horoscope_text\n
800	Sample romantic_horoscope_text\n
801	Sample romantic_horoscope_text\n
802	Sample romantic_horoscope_text\n
803	Sample romantic_horoscope_text\n
804	Sample romantic_horoscope_text\n
805	Sample romantic_horoscope_text\n
806	Sample romantic_horoscope_text\n
807	Sample romantic_horoscope_text\n
808	Sample romantic_horoscope_text\n
809	Sample romantic_horoscope_text\n
810	Sample romantic_horoscope_text\n
811	Sample romantic_horoscope_text\n
812	Sample romantic_horoscope_text\n
813	Sample romantic_horoscope_text\n
814	Sample romantic_horoscope_text\n
815	Sample romantic_horoscope_text\n
816	Sample romantic_horoscope_text\n
817	Sample romantic_horoscope_text\n
818	Sample romantic_horoscope_text\n
819	Sample romantic_horoscope_text\n
820	Sample romantic_horoscope_text\n
821	Sample romantic_horoscope_text\n
822	Sample romantic_horoscope_text\n
823	Sample romantic_horoscope_text\n
824	Sample romantic_horoscope_text\n
825	Sample romantic_horoscope_text\n
826	Sample romantic_horoscope_text\n
827	Sample romantic_horoscope_text\n
828	Sample romantic_horoscope_text\n
829	Sample romantic_horoscope_text\n
830	Sample romantic_horoscope_text\n
831	Sample romantic_horoscope_text\n
832	Sample romantic_horoscope_text\n
833	Sample romantic_horoscope_text\n
834	Sample romantic_horoscope_text\n
835	Sample romantic_horoscope_text\n
836	Sample romantic_horoscope_text\n
837	Sample romantic_horoscope_text\n
838	Sample romantic_horoscope_text\n
839	Sample romantic_horoscope_text\n
840	Sample romantic_horoscope_text\n
841	Sample romantic_horoscope_text\n
842	Sample romantic_horoscope_text\n
843	Sample romantic_horoscope_text\n
844	Sample romantic_horoscope_text\n
845	Sample romantic_horoscope_text\n
846	Sample romantic_horoscope_text\n
847	Sample romantic_horoscope_text\n
848	Sample romantic_horoscope_text\n
849	Sample romantic_horoscope_text\n
850	Sample romantic_horoscope_text\n
851	Sample romantic_horoscope_text\n
852	Sample romantic_horoscope_text\n
853	Sample romantic_horoscope_text\n
854	Sample romantic_horoscope_text\n
855	Sample romantic_horoscope_text\n
856	Sample romantic_horoscope_text\n
857	Sample romantic_horoscope_text\n
858	Sample romantic_horoscope_text\n
859	Sample romantic_horoscope_text\n
860	Sample romantic_horoscope_text\n
861	Sample romantic_horoscope_text\n
862	Sample romantic_horoscope_text\n
863	Sample romantic_horoscope_text\n
864	Sample romantic_horoscope_text\n
865	Sample romantic_horoscope_text\n
866	Sample romantic_horoscope_text\n
867	Sample romantic_horoscope_text\n
868	Sample romantic_horoscope_text\n
869	Sample romantic_horoscope_text\n
870	Sample romantic_horoscope_text\n
871	Sample romantic_horoscope_text\n
872	Sample romantic_horoscope_text\n
873	Sample romantic_horoscope_text\n
874	Sample romantic_horoscope_text\n
875	Sample romantic_horoscope_text\n
876	Sample romantic_horoscope_text\n
877	Sample romantic_horoscope_text\n
878	Sample romantic_horoscope_text\n
879	Sample romantic_horoscope_text\n
880	Sample romantic_horoscope_text\n
881	Sample romantic_horoscope_text\n
882	Sample romantic_horoscope_text\n
883	Sample romantic_horoscope_text\n
884	Sample romantic_horoscope_text\n
885	Sample romantic_horoscope_text\n
886	Sample romantic_horoscope_text\n
887	Sample romantic_horoscope_text\n
888	Sample romantic_horoscope_text\n
889	Sample romantic_horoscope_text\n
890	Sample romantic_horoscope_text\n
891	Sample romantic_horoscope_text\n
892	Sample romantic_horoscope_text\n
893	Sample romantic_horoscope_text\n
894	Sample romantic_horoscope_text\n
895	Sample romantic_horoscope_text\n
896	Sample romantic_horoscope_text\n
897	Sample romantic_horoscope_text\n
898	Sample romantic_horoscope_text\n
899	Sample romantic_horoscope_text\n
900	Sample romantic_horoscope_text\n
901	Sample romantic_horoscope_text\n
902	Sample romantic_horoscope_text\n
903	Sample romantic_horoscope_text\n
904	Sample romantic_horoscope_text\n
905	Sample romantic_horoscope_text\n
906	Sample romantic_horoscope_text\n
907	Sample romantic_horoscope_text\n
908	Sample romantic_horoscope_text\n
909	Sample romantic_horoscope_text\n
910	Sample romantic_horoscope_text\n
911	Sample romantic_horoscope_text\n
912	Sample romantic_horoscope_text\n
913	Sample romantic_horoscope_text\n
914	Sample romantic_horoscope_text\n
915	Sample romantic_horoscope_text\n
916	Sample romantic_horoscope_text\n
917	Sample romantic_horoscope_text\n
918	Sample romantic_horoscope_text\n
919	Sample romantic_horoscope_text\n
920	Sample romantic_horoscope_text\n
921	Sample romantic_horoscope_text\n
922	Sample romantic_horoscope_text\n
923	Sample romantic_horoscope_text\n
924	Sample romantic_horoscope_text\n
925	Sample romantic_horoscope_text\n
926	Sample romantic_horoscope_text\n
927	Sample romantic_horoscope_text\n
928	Sample romantic_horoscope_text\n
929	Sample romantic_horoscope_text\n
930	Sample romantic_horoscope_text\n
931	Sample romantic_horoscope_text\n
932	Sample romantic_horoscope_text\n
933	Sample romantic_horoscope_text\n
934	Sample romantic_horoscope_text\n
935	Sample romantic_horoscope_text\n
936	Sample romantic_horoscope_text\n
937	Sample romantic_horoscope_text\n
938	Sample romantic_horoscope_text\n
939	Sample romantic_horoscope_text\n
940	Sample romantic_horoscope_text\n
941	Sample romantic_horoscope_text\n
942	Sample romantic_horoscope_text\n
943	Sample romantic_horoscope_text\n
944	Sample romantic_horoscope_text\n
945	Sample romantic_horoscope_text\n
946	Sample romantic_horoscope_text\n
947	Sample romantic_horoscope_text\n
948	Sample romantic_horoscope_text\n
949	Sample romantic_horoscope_text\n
950	Sample romantic_horoscope_text\n
951	Sample romantic_horoscope_text\n
952	Sample romantic_horoscope_text\n
953	Sample romantic_horoscope_text\n
954	Sample romantic_horoscope_text\n
955	Sample romantic_horoscope_text\n
956	Sample romantic_horoscope_text\n
957	Sample romantic_horoscope_text\n
958	Sample romantic_horoscope_text\n
959	Sample romantic_horoscope_text\n
960	Sample romantic_horoscope_text\n
961	Sample romantic_horoscope_text\n
962	Sample romantic_horoscope_text\n
963	Sample romantic_horoscope_text\n
964	Sample romantic_horoscope_text\n
965	Sample romantic_horoscope_text\n
966	Sample romantic_horoscope_text\n
967	Sample romantic_horoscope_text\n
968	Sample romantic_horoscope_text\n
969	Sample romantic_horoscope_text\n
970	Sample romantic_horoscope_text\n
971	Sample romantic_horoscope_text\n
972	Sample romantic_horoscope_text\n
973	Sample romantic_horoscope_text\n
974	Sample romantic_horoscope_text\n
975	Sample romantic_horoscope_text\n
976	Sample romantic_horoscope_text\n
977	Sample romantic_horoscope_text\n
978	Sample romantic_horoscope_text\n
979	Sample romantic_horoscope_text\n
980	Sample romantic_horoscope_text\n
981	Sample romantic_horoscope_text\n
982	Sample romantic_horoscope_text\n
983	Sample romantic_horoscope_text\n
984	Sample romantic_horoscope_text\n
985	Sample romantic_horoscope_text\n
986	Sample romantic_horoscope_text\n
987	Sample romantic_horoscope_text\n
988	Sample romantic_horoscope_text\n
989	Sample romantic_horoscope_text\n
990	Sample romantic_horoscope_text\n
991	Sample romantic_horoscope_text\n
992	Sample romantic_horoscope_text\n
993	Sample romantic_horoscope_text\n
994	Sample romantic_horoscope_text\n
995	Sample romantic_horoscope_text\n
996	Sample romantic_horoscope_text\n
997	Sample romantic_horoscope_text\n
998	Sample romantic_horoscope_text\n
999	Sample romantic_horoscope_text\n
1000	Sample romantic_horoscope_text\n
1001	Sample romantic_horoscope_text\n
1002	Sample romantic_horoscope_text\n
1003	Sample romantic_horoscope_text\n
1004	Sample romantic_horoscope_text\n
1005	Sample romantic_horoscope_text\n
1006	Sample romantic_horoscope_text\n
1007	Sample romantic_horoscope_text\n
1008	Sample romantic_horoscope_text\n
1009	Sample romantic_horoscope_text\n
1010	Sample romantic_horoscope_text\n
1011	Sample romantic_horoscope_text\n
1012	Sample romantic_horoscope_text\n
1013	Sample romantic_horoscope_text\n
1014	Sample romantic_horoscope_text\n
1015	Sample romantic_horoscope_text\n
1016	Sample romantic_horoscope_text\n
1017	Sample romantic_horoscope_text\n
1018	Sample romantic_horoscope_text\n
1019	Sample romantic_horoscope_text\n
1020	Sample romantic_horoscope_text\n
1021	Sample romantic_horoscope_text\n
1022	Sample romantic_horoscope_text\n
1023	Sample romantic_horoscope_text\n
1024	Sample romantic_horoscope_text\n
1025	Sample romantic_horoscope_text\n
1026	Sample romantic_horoscope_text\n
1027	Sample romantic_horoscope_text\n
1028	Sample romantic_horoscope_text\n
1029	Sample romantic_horoscope_text\n
1030	Sample romantic_horoscope_text\n
1031	Sample romantic_horoscope_text\n
1032	Sample romantic_horoscope_text\n
1033	Sample romantic_horoscope_text\n
1034	Sample romantic_horoscope_text\n
1035	Sample romantic_horoscope_text\n
1036	Sample romantic_horoscope_text\n
1037	Sample romantic_horoscope_text\n
1038	Sample romantic_horoscope_text\n
1039	Sample romantic_horoscope_text\n
1040	Sample romantic_horoscope_text\n
1041	Sample romantic_horoscope_text\n
1042	Sample romantic_horoscope_text\n
1043	Sample romantic_horoscope_text\n
1044	Sample romantic_horoscope_text\n
1045	Sample romantic_horoscope_text\n
1046	Sample romantic_horoscope_text\n
1047	Sample romantic_horoscope_text\n
1048	Sample romantic_horoscope_text\n
1049	Sample romantic_horoscope_text\n
1050	Sample romantic_horoscope_text\n
1051	Sample romantic_horoscope_text\n
1052	Sample romantic_horoscope_text\n
1053	Sample romantic_horoscope_text\n
1054	Sample romantic_horoscope_text\n
1055	Sample romantic_horoscope_text\n
1056	Sample romantic_horoscope_text\n
1057	Sample romantic_horoscope_text\n
1058	Sample romantic_horoscope_text\n
1059	Sample romantic_horoscope_text\n
1060	Sample romantic_horoscope_text\n
1061	Sample romantic_horoscope_text\n
1062	Sample romantic_horoscope_text\n
1063	Sample romantic_horoscope_text\n
1064	Sample romantic_horoscope_text\n
1065	Sample romantic_horoscope_text\n
1066	Sample romantic_horoscope_text\n
1067	Sample romantic_horoscope_text\n
1068	Sample romantic_horoscope_text\n
1069	Sample romantic_horoscope_text\n
1070	Sample romantic_horoscope_text\n
1071	Sample romantic_horoscope_text\n
1072	Sample romantic_horoscope_text\n
1073	Sample romantic_horoscope_text\n
1074	Sample romantic_horoscope_text\n
1075	Sample romantic_horoscope_text\n
1076	Sample romantic_horoscope_text\n
1077	Sample romantic_horoscope_text\n
1078	Sample romantic_horoscope_text\n
1079	Sample romantic_horoscope_text\n
1080	Sample romantic_horoscope_text\n
1081	Sample romantic_horoscope_text\n
1082	Sample romantic_horoscope_text\n
1083	Sample romantic_horoscope_text\n
1084	Sample romantic_horoscope_text\n
1085	Sample romantic_horoscope_text\n
1086	Sample romantic_horoscope_text\n
1087	Sample romantic_horoscope_text\n
1088	Sample romantic_horoscope_text\n
1089	Sample romantic_horoscope_text\n
1090	Sample romantic_horoscope_text\n
1091	Sample romantic_horoscope_text\n
1092	Sample romantic_horoscope_text\n
1093	Sample romantic_horoscope_text\n
1094	Sample romantic_horoscope_text\n
1095	Sample romantic_horoscope_text\n
1096	Sample romantic_horoscope_text\n
1097	Sample romantic_horoscope_text\n
1098	Sample romantic_horoscope_text\n
1099	Sample romantic_horoscope_text\n
1100	Sample romantic_horoscope_text\n
1101	Sample romantic_horoscope_text\n
1102	Sample romantic_horoscope_text\n
1103	Sample romantic_horoscope_text\n
1104	Sample romantic_horoscope_text\n
1105	Sample romantic_horoscope_text\n
1106	Sample romantic_horoscope_text\n
1107	Sample romantic_horoscope_text\n
1108	Sample romantic_horoscope_text\n
1109	Sample romantic_horoscope_text\n
1110	Sample romantic_horoscope_text\n
1111	Sample romantic_horoscope_text\n
1112	Sample romantic_horoscope_text\n
1113	Sample romantic_horoscope_text\n
1114	Sample romantic_horoscope_text\n
1115	Sample romantic_horoscope_text\n
1116	Sample romantic_horoscope_text\n
1117	Sample romantic_horoscope_text\n
1118	Sample romantic_horoscope_text\n
1119	Sample romantic_horoscope_text\n
1120	Sample romantic_horoscope_text\n
1121	Sample romantic_horoscope_text\n
1122	Sample romantic_horoscope_text\n
1123	Sample romantic_horoscope_text\n
1124	Sample romantic_horoscope_text\n
1125	Sample romantic_horoscope_text\n
1126	Sample romantic_horoscope_text\n
1127	Sample romantic_horoscope_text\n
1128	Sample romantic_horoscope_text\n
1129	Sample romantic_horoscope_text\n
1130	Sample romantic_horoscope_text\n
1131	Sample romantic_horoscope_text\n
1132	Sample romantic_horoscope_text\n
1133	Sample romantic_horoscope_text\n
1134	Sample romantic_horoscope_text\n
1135	Sample romantic_horoscope_text\n
1136	Sample romantic_horoscope_text\n
1137	Sample romantic_horoscope_text\n
1138	Sample romantic_horoscope_text\n
1139	Sample romantic_horoscope_text\n
1140	Sample romantic_horoscope_text\n
1141	Sample romantic_horoscope_text\n
1142	Sample romantic_horoscope_text\n
1143	Sample romantic_horoscope_text\n
1144	Sample romantic_horoscope_text\n
1145	Sample romantic_horoscope_text\n
1146	Sample romantic_horoscope_text\n
1147	Sample romantic_horoscope_text\n
1148	Sample romantic_horoscope_text\n
1149	Sample romantic_horoscope_text\n
1150	Sample romantic_horoscope_text\n
1151	Sample romantic_horoscope_text\n
1152	Sample romantic_horoscope_text\n
1153	Sample romantic_horoscope_text\n
1154	Sample romantic_horoscope_text\n
1155	Sample romantic_horoscope_text\n
1156	Sample romantic_horoscope_text\n
1157	Sample romantic_horoscope_text\n
1158	Sample romantic_horoscope_text\n
1159	Sample romantic_horoscope_text\n
1160	Sample romantic_horoscope_text\n
1161	Sample romantic_horoscope_text\n
1162	Sample romantic_horoscope_text\n
1163	Sample romantic_horoscope_text\n
1164	Sample romantic_horoscope_text\n
1165	Sample romantic_horoscope_text\n
1166	Sample romantic_horoscope_text\n
1167	Sample romantic_horoscope_text\n
1168	Sample romantic_horoscope_text\n
1169	Sample romantic_horoscope_text\n
1170	Sample romantic_horoscope_text\n
1171	Sample romantic_horoscope_text\n
1172	Sample romantic_horoscope_text\n
1173	Sample romantic_horoscope_text\n
1174	Sample romantic_horoscope_text\n
1175	Sample romantic_horoscope_text\n
1176	Sample romantic_horoscope_text\n
1177	Sample romantic_horoscope_text\n
1178	Sample romantic_horoscope_text\n
1179	Sample romantic_horoscope_text\n
1180	Sample romantic_horoscope_text\n
1181	Sample romantic_horoscope_text\n
1182	Sample romantic_horoscope_text\n
1183	Sample romantic_horoscope_text\n
1184	Sample romantic_horoscope_text\n
1185	Sample romantic_horoscope_text\n
1186	Sample romantic_horoscope_text\n
1187	Sample romantic_horoscope_text\n
1188	Sample romantic_horoscope_text\n
1189	Sample romantic_horoscope_text\n
1190	Sample romantic_horoscope_text\n
1191	Sample romantic_horoscope_text\n
1192	Sample romantic_horoscope_text\n
1193	Sample romantic_horoscope_text\n
1194	Sample romantic_horoscope_text\n
1195	Sample romantic_horoscope_text\n
1196	Sample romantic_horoscope_text\n
1197	Sample romantic_horoscope_text\n
1198	Sample romantic_horoscope_text\n
1199	Sample romantic_horoscope_text\n
1200	Sample romantic_horoscope_text\n
1201	Sample romantic_horoscope_text\n
1202	Sample romantic_horoscope_text\n
1203	Sample romantic_horoscope_text\n
1204	Sample romantic_horoscope_text\n
1205	Sample romantic_horoscope_text\n
1206	Sample romantic_horoscope_text\n
1207	Sample romantic_horoscope_text\n
1208	Sample romantic_horoscope_text\n
1209	Sample romantic_horoscope_text\n
1210	Sample romantic_horoscope_text\n
1211	Sample romantic_horoscope_text\n
1212	Sample romantic_horoscope_text\n
1213	Sample romantic_horoscope_text\n
1214	Sample romantic_horoscope_text\n
1215	Sample romantic_horoscope_text\n
1216	Sample romantic_horoscope_text\n
1217	Sample romantic_horoscope_text\n
1218	Sample romantic_horoscope_text\n
1219	Sample romantic_horoscope_text\n
1220	Sample romantic_horoscope_text\n
1221	Sample romantic_horoscope_text\n
1222	Sample romantic_horoscope_text\n
1223	Sample romantic_horoscope_text\n
1224	Sample romantic_horoscope_text\n
1225	Sample romantic_horoscope_text\n
1226	Sample romantic_horoscope_text\n
1227	Sample romantic_horoscope_text\n
1228	Sample romantic_horoscope_text\n
1229	Sample romantic_horoscope_text\n
1230	Sample romantic_horoscope_text\n
1231	Sample romantic_horoscope_text\n
1232	Sample romantic_horoscope_text\n
1233	Sample romantic_horoscope_text\n
1234	Sample romantic_horoscope_text\n
1235	Sample romantic_horoscope_text\n
1236	Sample romantic_horoscope_text\n
1237	Sample romantic_horoscope_text\n
1238	Sample romantic_horoscope_text\n
1239	Sample romantic_horoscope_text\n
1240	Sample romantic_horoscope_text\n
1241	Sample romantic_horoscope_text\n
1242	Sample romantic_horoscope_text\n
1243	Sample romantic_horoscope_text\n
1244	Sample romantic_horoscope_text\n
1245	Sample romantic_horoscope_text\n
1246	Sample romantic_horoscope_text\n
1247	Sample romantic_horoscope_text\n
1248	Sample romantic_horoscope_text\n
1249	Sample romantic_horoscope_text\n
1250	Sample romantic_horoscope_text\n
1251	Sample romantic_horoscope_text\n
1252	Sample romantic_horoscope_text\n
1253	Sample romantic_horoscope_text\n
1254	Sample romantic_horoscope_text\n
1255	Sample romantic_horoscope_text\n
1256	Sample romantic_horoscope_text\n
1257	Sample romantic_horoscope_text\n
1258	Sample romantic_horoscope_text\n
1259	Sample romantic_horoscope_text\n
1260	Sample romantic_horoscope_text\n
1261	Sample romantic_horoscope_text\n
1262	Sample romantic_horoscope_text\n
1263	Sample romantic_horoscope_text\n
1264	Sample romantic_horoscope_text\n
1265	Sample romantic_horoscope_text\n
1266	Sample romantic_horoscope_text\n
1267	Sample romantic_horoscope_text\n
1268	Sample romantic_horoscope_text\n
1269	Sample romantic_horoscope_text\n
1270	Sample romantic_horoscope_text\n
1271	Sample romantic_horoscope_text\n
1272	Sample romantic_horoscope_text\n
1273	Sample romantic_horoscope_text\n
1274	Sample romantic_horoscope_text\n
1275	Sample romantic_horoscope_text\n
1276	Sample romantic_horoscope_text\n
1277	Sample romantic_horoscope_text\n
1278	Sample romantic_horoscope_text\n
1279	Sample romantic_horoscope_text\n
1280	Sample romantic_horoscope_text\n
1281	Sample romantic_horoscope_text\n
1282	Sample romantic_horoscope_text\n
1283	Sample romantic_horoscope_text\n
1284	Sample romantic_horoscope_text\n
1285	Sample romantic_horoscope_text\n
1286	Sample romantic_horoscope_text\n
1287	Sample romantic_horoscope_text\n
1288	Sample romantic_horoscope_text\n
1289	Sample romantic_horoscope_text\n
1290	Sample romantic_horoscope_text\n
1291	Sample romantic_horoscope_text\n
1292	Sample romantic_horoscope_text\n
1293	Sample romantic_horoscope_text\n
1294	Sample romantic_horoscope_text\n
1295	Sample romantic_horoscope_text\n
1296	Sample romantic_horoscope_text\n
1297	Sample romantic_horoscope_text\n
1298	Sample romantic_horoscope_text\n
1299	Sample romantic_horoscope_text\n
1300	Sample romantic_horoscope_text\n
1301	Sample romantic_horoscope_text\n
1302	Sample romantic_horoscope_text\n
1303	Sample romantic_horoscope_text\n
1304	Sample romantic_horoscope_text\n
1305	Sample romantic_horoscope_text\n
1306	Sample romantic_horoscope_text\n
1307	Sample romantic_horoscope_text\n
1308	Sample romantic_horoscope_text\n
1309	Sample romantic_horoscope_text\n
1310	Sample romantic_horoscope_text\n
1311	Sample romantic_horoscope_text\n
1312	Sample romantic_horoscope_text\n
1313	Sample romantic_horoscope_text\n
1314	Sample romantic_horoscope_text\n
1315	Sample romantic_horoscope_text\n
1316	Sample romantic_horoscope_text\n
1317	Sample romantic_horoscope_text\n
1318	Sample romantic_horoscope_text\n
1319	Sample romantic_horoscope_text\n
1320	Sample romantic_horoscope_text\n
1321	Sample romantic_horoscope_text\n
1322	Sample romantic_horoscope_text\n
1323	Sample romantic_horoscope_text\n
1324	Sample romantic_horoscope_text\n
1325	Sample romantic_horoscope_text\n
1326	Sample romantic_horoscope_text\n
1327	Sample romantic_horoscope_text\n
1328	Sample romantic_horoscope_text\n
1329	Sample romantic_horoscope_text\n
1330	Sample romantic_horoscope_text\n
1331	Sample romantic_horoscope_text\n
1332	Sample romantic_horoscope_text\n
1333	Sample romantic_horoscope_text\n
1334	Sample romantic_horoscope_text\n
1335	Sample romantic_horoscope_text\n
1336	Sample romantic_horoscope_text\n
1337	Sample romantic_horoscope_text\n
1338	Sample romantic_horoscope_text\n
1339	Sample romantic_horoscope_text\n
1340	Sample romantic_horoscope_text\n
1341	Sample romantic_horoscope_text\n
1342	Sample romantic_horoscope_text\n
1343	Sample romantic_horoscope_text\n
1344	Sample romantic_horoscope_text\n
1345	Sample romantic_horoscope_text\n
1346	Sample romantic_horoscope_text\n
1347	Sample romantic_horoscope_text\n
1348	Sample romantic_horoscope_text\n
1349	Sample romantic_horoscope_text\n
1350	Sample romantic_horoscope_text\n
1351	Sample romantic_horoscope_text\n
1352	Sample romantic_horoscope_text\n
1353	Sample romantic_horoscope_text\n
1354	Sample romantic_horoscope_text\n
1355	Sample romantic_horoscope_text\n
1356	Sample romantic_horoscope_text\n
1357	Sample romantic_horoscope_text\n
1358	Sample romantic_horoscope_text\n
1359	Sample romantic_horoscope_text\n
1360	Sample romantic_horoscope_text\n
1361	Sample romantic_horoscope_text\n
1362	Sample romantic_horoscope_text\n
1363	Sample romantic_horoscope_text\n
1364	Sample romantic_horoscope_text\n
1365	Sample romantic_horoscope_text\n
1366	Sample romantic_horoscope_text\n
1367	Sample romantic_horoscope_text\n
1368	Sample romantic_horoscope_text\n
1369	Sample romantic_horoscope_text\n
1370	Sample romantic_horoscope_text\n
1371	Sample romantic_horoscope_text\n
1372	Sample romantic_horoscope_text\n
1373	Sample romantic_horoscope_text\n
1374	Sample romantic_horoscope_text\n
1375	Sample romantic_horoscope_text\n
1376	Sample romantic_horoscope_text\n
1377	Sample romantic_horoscope_text\n
1378	Sample romantic_horoscope_text\n
1379	Sample romantic_horoscope_text\n
1380	Sample romantic_horoscope_text\n
1381	Sample romantic_horoscope_text\n
1382	Sample romantic_horoscope_text\n
1383	Sample romantic_horoscope_text\n
1384	Sample romantic_horoscope_text\n
1385	Sample romantic_horoscope_text\n
1386	Sample romantic_horoscope_text\n
1387	Sample romantic_horoscope_text\n
1388	Sample romantic_horoscope_text\n
1389	Sample romantic_horoscope_text\n
1390	Sample romantic_horoscope_text\n
1391	Sample romantic_horoscope_text\n
1392	Sample romantic_horoscope_text\n
1393	Sample romantic_horoscope_text\n
1394	Sample romantic_horoscope_text\n
1395	Sample romantic_horoscope_text\n
1396	Sample romantic_horoscope_text\n
1397	Sample romantic_horoscope_text\n
1398	Sample romantic_horoscope_text\n
1399	Sample romantic_horoscope_text\n
1400	Sample romantic_horoscope_text\n
1401	Sample romantic_horoscope_text\n
1402	Sample romantic_horoscope_text\n
1403	Sample romantic_horoscope_text\n
1404	Sample romantic_horoscope_text\n
1405	Sample romantic_horoscope_text\n
1406	Sample romantic_horoscope_text\n
1407	Sample romantic_horoscope_text\n
1408	Sample romantic_horoscope_text\n
1409	Sample romantic_horoscope_text\n
1410	Sample romantic_horoscope_text\n
1411	Sample romantic_horoscope_text\n
1412	Sample romantic_horoscope_text\n
1413	Sample romantic_horoscope_text\n
1414	Sample romantic_horoscope_text\n
1415	Sample romantic_horoscope_text\n
1416	Sample romantic_horoscope_text\n
1417	Sample romantic_horoscope_text\n
1418	Sample romantic_horoscope_text\n
1419	Sample romantic_horoscope_text\n
1420	Sample romantic_horoscope_text\n
1421	Sample romantic_horoscope_text\n
1422	Sample romantic_horoscope_text\n
1423	Sample romantic_horoscope_text\n
1424	Sample romantic_horoscope_text\n
1425	Sample romantic_horoscope_text\n
1426	Sample romantic_horoscope_text\n
1427	Sample romantic_horoscope_text\n
1428	Sample romantic_horoscope_text\n
1429	Sample romantic_horoscope_text\n
1430	Sample romantic_horoscope_text\n
1431	Sample romantic_horoscope_text\n
1432	Sample romantic_horoscope_text\n
1433	Sample romantic_horoscope_text\n
1434	Sample romantic_horoscope_text\n
1435	Sample romantic_horoscope_text\n
1436	Sample romantic_horoscope_text\n
1437	Sample romantic_horoscope_text\n
1438	Sample romantic_horoscope_text\n
1439	Sample romantic_horoscope_text\n
1440	Sample romantic_horoscope_text\n
1441	Sample romantic_horoscope_text\n
1442	Sample romantic_horoscope_text\n
1443	Sample romantic_horoscope_text\n
1444	Sample romantic_horoscope_text\n
1445	Sample romantic_horoscope_text\n
1446	Sample romantic_horoscope_text\n
1447	Sample romantic_horoscope_text\n
1448	Sample romantic_horoscope_text\n
1449	Sample romantic_horoscope_text\n
1450	Sample romantic_horoscope_text\n
1451	Sample romantic_horoscope_text\n
1452	Sample romantic_horoscope_text\n
1453	Sample romantic_horoscope_text\n
1454	Sample romantic_horoscope_text\n
1455	Sample romantic_horoscope_text\n
1456	Sample romantic_horoscope_text\n
1457	Sample romantic_horoscope_text\n
1458	Sample romantic_horoscope_text\n
1459	Sample romantic_horoscope_text\n
1460	Sample romantic_horoscope_text\n
1461	Sample romantic_horoscope_text\n
1462	Sample romantic_horoscope_text\n
1463	Sample romantic_horoscope_text\n
1464	Sample romantic_horoscope_text\n
1465	Sample romantic_horoscope_text\n
1466	Sample romantic_horoscope_text\n
1467	Sample romantic_horoscope_text\n
1468	Sample romantic_horoscope_text\n
1469	Sample romantic_horoscope_text\n
1470	Sample romantic_horoscope_text\n
1471	Sample romantic_horoscope_text\n
1472	Sample romantic_horoscope_text\n
1473	Sample romantic_horoscope_text\n
1474	Sample romantic_horoscope_text\n
1475	Sample romantic_horoscope_text\n
1476	Sample romantic_horoscope_text\n
1477	Sample romantic_horoscope_text\n
1478	Sample romantic_horoscope_text\n
1479	Sample romantic_horoscope_text\n
1480	Sample romantic_horoscope_text\n
1481	Sample romantic_horoscope_text\n
1482	Sample romantic_horoscope_text\n
1483	Sample romantic_horoscope_text\n
1484	Sample romantic_horoscope_text\n
1485	Sample romantic_horoscope_text\n
1486	Sample romantic_horoscope_text\n
1487	Sample romantic_horoscope_text\n
1488	Sample romantic_horoscope_text\n
1489	Sample romantic_horoscope_text\n
1490	Sample romantic_horoscope_text\n
1491	Sample romantic_horoscope_text\n
1492	Sample romantic_horoscope_text\n
1493	Sample romantic_horoscope_text\n
1494	Sample romantic_horoscope_text\n
1495	Sample romantic_horoscope_text\n
1496	Sample romantic_horoscope_text\n
1497	Sample romantic_horoscope_text\n
1498	Sample romantic_horoscope_text\n
1499	Sample romantic_horoscope_text\n
1500	Sample romantic_horoscope_text\n
1501	Sample romantic_horoscope_text\n
1502	Sample romantic_horoscope_text\n
1503	Sample romantic_horoscope_text\n
1504	Sample romantic_horoscope_text\n
1505	Sample romantic_horoscope_text\n
1506	Sample romantic_horoscope_text\n
1507	Sample romantic_horoscope_text\n
1508	Sample romantic_horoscope_text\n
1509	Sample romantic_horoscope_text\n
1510	Sample romantic_horoscope_text\n
1511	Sample romantic_horoscope_text\n
1512	Sample romantic_horoscope_text\n
1513	Sample romantic_horoscope_text\n
1514	Sample romantic_horoscope_text\n
1515	Sample romantic_horoscope_text\n
1516	Sample romantic_horoscope_text\n
1517	Sample romantic_horoscope_text\n
1518	Sample romantic_horoscope_text\n
1519	Sample romantic_horoscope_text\n
1520	Sample romantic_horoscope_text\n
1521	Sample romantic_horoscope_text\n
1522	Sample romantic_horoscope_text\n
1523	Sample romantic_horoscope_text\n
1524	Sample romantic_horoscope_text\n
1525	Sample romantic_horoscope_text\n
1526	Sample romantic_horoscope_text\n
1527	Sample romantic_horoscope_text\n
1528	Sample romantic_horoscope_text\n
1529	Sample romantic_horoscope_text\n
1530	Sample romantic_horoscope_text\n
1531	Sample romantic_horoscope_text\n
1532	Sample romantic_horoscope_text\n
1533	Sample romantic_horoscope_text\n
1534	Sample romantic_horoscope_text\n
1535	Sample romantic_horoscope_text\n
1536	Sample romantic_horoscope_text\n
1537	Sample romantic_horoscope_text\n
1538	Sample romantic_horoscope_text\n
1539	Sample romantic_horoscope_text\n
1540	Sample romantic_horoscope_text\n
1541	Sample romantic_horoscope_text\n
1542	Sample romantic_horoscope_text\n
1543	Sample romantic_horoscope_text\n
1544	Sample romantic_horoscope_text\n
1545	Sample romantic_horoscope_text\n
1546	Sample romantic_horoscope_text\n
1547	Sample romantic_horoscope_text\n
1548	Sample romantic_horoscope_text\n
1549	Sample romantic_horoscope_text\n
1550	Sample romantic_horoscope_text\n
1551	Sample romantic_horoscope_text\n
1552	Sample romantic_horoscope_text\n
1553	Sample romantic_horoscope_text\n
1554	Sample romantic_horoscope_text\n
1555	Sample romantic_horoscope_text\n
1556	Sample romantic_horoscope_text\n
1557	Sample romantic_horoscope_text\n
1558	Sample romantic_horoscope_text\n
1559	Sample romantic_horoscope_text\n
1560	Sample romantic_horoscope_text\n
1561	Sample romantic_horoscope_text\n
1562	Sample romantic_horoscope_text\n
1563	Sample romantic_horoscope_text\n
1564	Sample romantic_horoscope_text\n
1565	Sample romantic_horoscope_text\n
1566	Sample romantic_horoscope_text\n
1567	Sample romantic_horoscope_text\n
1568	Sample romantic_horoscope_text\n
1569	Sample romantic_horoscope_text\n
1570	Sample romantic_horoscope_text\n
1571	Sample romantic_horoscope_text\n
1572	Sample romantic_horoscope_text\n
1573	Sample romantic_horoscope_text\n
1574	Sample romantic_horoscope_text\n
1575	Sample romantic_horoscope_text\n
1576	Sample romantic_horoscope_text\n
1577	Sample romantic_horoscope_text\n
1578	Sample romantic_horoscope_text\n
1579	Sample romantic_horoscope_text\n
1580	Sample romantic_horoscope_text\n
1581	Sample romantic_horoscope_text\n
1582	Sample romantic_horoscope_text\n
1583	Sample romantic_horoscope_text\n
1584	Sample romantic_horoscope_text\n
1585	Sample romantic_horoscope_text\n
1586	Sample romantic_horoscope_text\n
1587	Sample romantic_horoscope_text\n
1588	Sample romantic_horoscope_text\n
1589	Sample romantic_horoscope_text\n
1590	Sample romantic_horoscope_text\n
1591	Sample romantic_horoscope_text\n
1592	Sample romantic_horoscope_text\n
1593	Sample romantic_horoscope_text\n
1594	Sample romantic_horoscope_text\n
1595	Sample romantic_horoscope_text\n
1596	Sample romantic_horoscope_text\n
1597	Sample romantic_horoscope_text\n
1598	Sample romantic_horoscope_text\n
1599	Sample romantic_horoscope_text\n
1600	Sample romantic_horoscope_text\n
1601	Sample romantic_horoscope_text\n
1602	Sample romantic_horoscope_text\n
1603	Sample romantic_horoscope_text\n
1604	Sample romantic_horoscope_text\n
1605	Sample romantic_horoscope_text\n
1606	Sample romantic_horoscope_text\n
1607	Sample romantic_horoscope_text\n
1608	Sample romantic_horoscope_text\n
1609	Sample romantic_horoscope_text\n
1610	Sample romantic_horoscope_text\n
1611	Sample romantic_horoscope_text\n
1612	Sample romantic_horoscope_text\n
1613	Sample romantic_horoscope_text\n
1614	Sample romantic_horoscope_text\n
1615	Sample romantic_horoscope_text\n
1616	Sample romantic_horoscope_text\n
1617	Sample romantic_horoscope_text\n
1618	Sample romantic_horoscope_text\n
1619	Sample romantic_horoscope_text\n
1620	Sample romantic_horoscope_text\n
1621	Sample romantic_horoscope_text\n
1622	Sample romantic_horoscope_text\n
1623	Sample romantic_horoscope_text\n
1624	Sample romantic_horoscope_text\n
1625	Sample romantic_horoscope_text\n
1626	Sample romantic_horoscope_text\n
1627	Sample romantic_horoscope_text\n
1628	Sample romantic_horoscope_text\n
1629	Sample romantic_horoscope_text\n
1630	Sample romantic_horoscope_text\n
1631	Sample romantic_horoscope_text\n
1632	Sample romantic_horoscope_text\n
1633	Sample romantic_horoscope_text\n
1634	Sample romantic_horoscope_text\n
1635	Sample romantic_horoscope_text\n
1636	Sample romantic_horoscope_text\n
1637	Sample romantic_horoscope_text\n
1638	Sample romantic_horoscope_text\n
1639	Sample romantic_horoscope_text\n
1640	Sample romantic_horoscope_text\n
1641	Sample romantic_horoscope_text\n
1642	Sample romantic_horoscope_text\n
1643	Sample romantic_horoscope_text\n
1644	Sample romantic_horoscope_text\n
1645	Sample romantic_horoscope_text\n
1646	Sample romantic_horoscope_text\n
1647	Sample romantic_horoscope_text\n
1648	Sample romantic_horoscope_text\n
1649	Sample romantic_horoscope_text\n
1650	Sample romantic_horoscope_text\n
1651	Sample romantic_horoscope_text\n
1652	Sample romantic_horoscope_text\n
1653	Sample romantic_horoscope_text\n
1654	Sample romantic_horoscope_text\n
1655	Sample romantic_horoscope_text\n
1656	Sample romantic_horoscope_text\n
1657	Sample romantic_horoscope_text\n
1658	Sample romantic_horoscope_text\n
1659	Sample romantic_horoscope_text\n
1660	Sample romantic_horoscope_text\n
1661	Sample romantic_horoscope_text\n
1662	Sample romantic_horoscope_text\n
1663	Sample romantic_horoscope_text\n
1664	Sample romantic_horoscope_text\n
1665	Sample romantic_horoscope_text\n
1666	Sample romantic_horoscope_text\n
1667	Sample romantic_horoscope_text\n
1668	Sample romantic_horoscope_text\n
1669	Sample romantic_horoscope_text\n
1670	Sample romantic_horoscope_text\n
1671	Sample romantic_horoscope_text\n
1672	Sample romantic_horoscope_text\n
1673	Sample romantic_horoscope_text\n
1674	Sample romantic_horoscope_text\n
1675	Sample romantic_horoscope_text\n
1676	Sample romantic_horoscope_text\n
1677	Sample romantic_horoscope_text\n
1678	Sample romantic_horoscope_text\n
1679	Sample romantic_horoscope_text\n
1680	Sample romantic_horoscope_text\n
1681	Sample romantic_horoscope_text\n
1682	Sample romantic_horoscope_text\n
1683	Sample romantic_horoscope_text\n
1684	Sample romantic_horoscope_text\n
1685	Sample romantic_horoscope_text\n
1686	Sample romantic_horoscope_text\n
1687	Sample romantic_horoscope_text\n
1688	Sample romantic_horoscope_text\n
1689	Sample romantic_horoscope_text\n
1690	Sample romantic_horoscope_text\n
1691	Sample romantic_horoscope_text\n
1692	Sample romantic_horoscope_text\n
1693	Sample romantic_horoscope_text\n
1694	Sample romantic_horoscope_text\n
1695	Sample romantic_horoscope_text\n
1696	Sample romantic_horoscope_text\n
1697	Sample romantic_horoscope_text\n
1698	Sample romantic_horoscope_text\n
1699	Sample romantic_horoscope_text\n
1700	Sample romantic_horoscope_text\n
1701	Sample romantic_horoscope_text\n
1702	Sample romantic_horoscope_text\n
1703	Sample romantic_horoscope_text\n
1704	Sample romantic_horoscope_text\n
1705	Sample romantic_horoscope_text\n
1706	Sample romantic_horoscope_text\n
1707	Sample romantic_horoscope_text\n
1708	Sample romantic_horoscope_text\n
1709	Sample romantic_horoscope_text\n
1710	Sample romantic_horoscope_text\n
1711	Sample romantic_horoscope_text\n
1712	Sample romantic_horoscope_text\n
1713	Sample romantic_horoscope_text\n
1714	Sample romantic_horoscope_text\n
1715	Sample romantic_horoscope_text\n
1716	Sample romantic_horoscope_text\n
1717	Sample romantic_horoscope_text\n
1718	Sample romantic_horoscope_text\n
1719	Sample romantic_horoscope_text\n
1720	Sample romantic_horoscope_text\n
1721	Sample romantic_horoscope_text\n
1722	Sample romantic_horoscope_text\n
1723	Sample romantic_horoscope_text\n
1724	Sample romantic_horoscope_text\n
1725	Sample romantic_horoscope_text\n
1726	Sample romantic_horoscope_text\n
1727	Sample romantic_horoscope_text\n
1728	Sample romantic_horoscope_text\n
1729	Sample romantic_horoscope_text\n
1730	Sample romantic_horoscope_text\n
1731	Sample romantic_horoscope_text\n
1732	Sample romantic_horoscope_text\n
1733	Sample romantic_horoscope_text\n
1734	Sample romantic_horoscope_text\n
1735	Sample romantic_horoscope_text\n
1736	Sample romantic_horoscope_text\n
1737	Sample romantic_horoscope_text\n
1738	Sample romantic_horoscope_text\n
1739	Sample romantic_horoscope_text\n
1740	Sample romantic_horoscope_text\n
1741	Sample romantic_horoscope_text\n
1742	Sample romantic_horoscope_text\n
1743	Sample romantic_horoscope_text\n
1744	Sample romantic_horoscope_text\n
1745	Sample romantic_horoscope_text\n
1746	Sample romantic_horoscope_text\n
1747	Sample romantic_horoscope_text\n
1748	Sample romantic_horoscope_text\n
1749	Sample romantic_horoscope_text\n
1750	Sample romantic_horoscope_text\n
1751	Sample romantic_horoscope_text\n
1752	Sample romantic_horoscope_text\n
1753	Sample romantic_horoscope_text\n
1754	Sample romantic_horoscope_text\n
1755	Sample romantic_horoscope_text\n
1756	Sample romantic_horoscope_text\n
1757	Sample romantic_horoscope_text\n


--
-- TOC entry 3447 (class 0 OID 88964)
-- Dependencies: 219
-- Data for Name: signs; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.signs (pk_signs, sign_name) FROM stdin;
1	Aries
2	Taurus
3	Gemini
4	Cancer
5	Leo
6	Virgo
7	Libra
8	Scorpio
9	Sagittarius
10	Capricornus
11	Aquarius
12	Pisces
\.


--
-- TOC entry 3443 (class 0 OID 88946)
-- Dependencies: 215
-- Data for Name: user_base; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.user_base (pk_user_base, telegram_id) FROM stdin;
12	282194233
\.


--
-- TOC entry 3445 (class 0 OID 88954)
-- Dependencies: 217
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.user_info (pk_user_info, telegram_id, username, datetime_of_birth, place_of_birth, photo_file_id, telegraph_link) FROM stdin;
\.


--
-- TOC entry 3455 (class 0 OID 89065)
-- Dependencies: 227
-- Data for Name: user_sign; Type: TABLE DATA; Schema: public; Owner: horoscope_bot_user
--

COPY public.user_sign (pk_user_sign, telegram_id, fk_sign, fk_horoscope_type) FROM stdin;
\.


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 222
-- Name: admin_info_pk_admin_ids_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.admin_info_pk_admin_ids_seq', 1, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 229
-- Name: aspects_texts_pk_aspects_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.aspects_texts_pk_aspects_texts_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 231
-- Name: basic_horoscope_texts_pk_basic_horoscope_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.basic_horoscope_texts_pk_basic_horoscope_texts_seq', 1751, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 233
-- Name: career_horoscope_texts_pk_career_horoscope_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.career_horoscope_texts_pk_career_horoscope_texts_seq', 1752, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 224
-- Name: horoscope_file_ids_pk_horoscope_file_ids_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.horoscope_file_ids_pk_horoscope_file_ids_seq', 72, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 220
-- Name: horoscope_types_pk_horoscope_types_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.horoscope_types_pk_horoscope_types_seq', 3, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 235
-- Name: house_in_sign_texts_pk_house_in_sign_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.house_in_sign_texts_pk_house_in_sign_texts_seq', 1, false);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 237
-- Name: houses_texts_pk_signs_in_houses_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.houses_texts_pk_signs_in_houses_texts_seq', 1, false);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 239
-- Name: planet_in_sign_texts_pk_planet_in_sign_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.planet_in_sign_texts_pk_planet_in_sign_texts_seq', 1, false);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 241
-- Name: romantic_horoscope_texts_pk_romantic_horoscope_texts_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.romantic_horoscope_texts_pk_romantic_horoscope_texts_seq', 1757, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 218
-- Name: signs_pk_signs_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.signs_pk_signs_seq', 12, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_base_pk_user_base_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.user_base_pk_user_base_seq', 13, true);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 216
-- Name: user_info_pk_user_info_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.user_info_pk_user_info_seq', 4, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 226
-- Name: user_sign_pk_user_sign_seq; Type: SEQUENCE SET; Schema: public; Owner: horoscope_bot_user
--

SELECT pg_catalog.setval('public.user_sign_pk_user_sign_seq', 29, true);


--
-- TOC entry 3263 (class 2606 OID 88987)
-- Name: admin_info admin_info_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.admin_info
    ADD CONSTRAINT admin_info_pkey PRIMARY KEY (pk_admin_ids);


--
-- TOC entry 3269 (class 2606 OID 89134)
-- Name: aspects_texts aspects_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.aspects_texts
    ADD CONSTRAINT aspects_texts_pkey PRIMARY KEY (pk_aspects_texts);


--
-- TOC entry 3275 (class 2606 OID 89136)
-- Name: basic_horoscope_texts basic_horoscope_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.basic_horoscope_texts
    ADD CONSTRAINT basic_horoscope_texts_pkey PRIMARY KEY (pk_basic_horoscope_texts);


--
-- TOC entry 3278 (class 2606 OID 89138)
-- Name: career_horoscope_texts career_horoscope_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.career_horoscope_texts
    ADD CONSTRAINT career_horoscope_texts_pkey PRIMARY KEY (pk_career_horoscope_texts);


--
-- TOC entry 3265 (class 2606 OID 88996)
-- Name: horoscope_file_ids horoscope_file_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.horoscope_file_ids
    ADD CONSTRAINT horoscope_file_ids_pkey PRIMARY KEY (pk_horoscope_file_ids);


--
-- TOC entry 3261 (class 2606 OID 88980)
-- Name: horoscope_types horoscope_types_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.horoscope_types
    ADD CONSTRAINT horoscope_types_pkey PRIMARY KEY (pk_horoscope_types);


--
-- TOC entry 3281 (class 2606 OID 89140)
-- Name: house_in_sign_texts house_in_sign_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.house_in_sign_texts
    ADD CONSTRAINT house_in_sign_texts_pkey PRIMARY KEY (pk_house_in_sign_texts);


--
-- TOC entry 3286 (class 2606 OID 89142)
-- Name: houses_texts houses_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.houses_texts
    ADD CONSTRAINT houses_texts_pkey PRIMARY KEY (pk_signs_in_houses_texts);


--
-- TOC entry 3294 (class 2606 OID 89144)
-- Name: planet_in_sign_texts planet_in_sign_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.planet_in_sign_texts
    ADD CONSTRAINT planet_in_sign_texts_pkey PRIMARY KEY (pk_planet_in_sign_texts);


--
-- TOC entry 3297 (class 2606 OID 89146)
-- Name: romantic_horoscope_texts romantic_horoscope_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.romantic_horoscope_texts
    ADD CONSTRAINT romantic_horoscope_texts_pkey PRIMARY KEY (pk_romantic_horoscope_texts);


--
-- TOC entry 3259 (class 2606 OID 88971)
-- Name: signs signs_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.signs
    ADD CONSTRAINT signs_pkey PRIMARY KEY (pk_signs);


--
-- TOC entry 3254 (class 2606 OID 88951)
-- Name: user_base user_base_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_base
    ADD CONSTRAINT user_base_pkey PRIMARY KEY (pk_user_base);


--
-- TOC entry 3257 (class 2606 OID 88961)
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (pk_user_info);


--
-- TOC entry 3267 (class 2606 OID 89070)
-- Name: user_sign user_sign_pkey; Type: CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_sign
    ADD CONSTRAINT user_sign_pkey PRIMARY KEY (pk_user_sign);


--
-- TOC entry 3270 (class 1259 OID 89147)
-- Name: ix_aspects_texts_aspect; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_aspects_texts_aspect ON public.aspects_texts USING btree (aspect);


--
-- TOC entry 3271 (class 1259 OID 89148)
-- Name: ix_aspects_texts_planet1; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_aspects_texts_planet1 ON public.aspects_texts USING btree (planet1);


--
-- TOC entry 3272 (class 1259 OID 89149)
-- Name: ix_aspects_texts_planet2; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_aspects_texts_planet2 ON public.aspects_texts USING btree (planet2);


--
-- TOC entry 3273 (class 1259 OID 89150)
-- Name: ix_aspects_texts_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_aspects_texts_text ON public.aspects_texts USING btree (text);


--
-- TOC entry 3276 (class 1259 OID 89151)
-- Name: ix_basic_horoscope_texts_horoscope_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_basic_horoscope_texts_horoscope_text ON public.basic_horoscope_texts USING btree (horoscope_text);


--
-- TOC entry 3279 (class 1259 OID 89152)
-- Name: ix_career_horoscope_texts_horoscope_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_career_horoscope_texts_horoscope_text ON public.career_horoscope_texts USING btree (horoscope_text);


--
-- TOC entry 3282 (class 1259 OID 89153)
-- Name: ix_house_in_sign_texts_house; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_house_in_sign_texts_house ON public.house_in_sign_texts USING btree (house);


--
-- TOC entry 3283 (class 1259 OID 89154)
-- Name: ix_house_in_sign_texts_sign; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_house_in_sign_texts_sign ON public.house_in_sign_texts USING btree (sign);


--
-- TOC entry 3284 (class 1259 OID 89155)
-- Name: ix_house_in_sign_texts_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_house_in_sign_texts_text ON public.house_in_sign_texts USING btree (text);


--
-- TOC entry 3287 (class 1259 OID 89156)
-- Name: ix_houses_texts_house; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_houses_texts_house ON public.houses_texts USING btree (house);


--
-- TOC entry 3288 (class 1259 OID 89157)
-- Name: ix_houses_texts_sign; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_houses_texts_sign ON public.houses_texts USING btree (sign);


--
-- TOC entry 3289 (class 1259 OID 89158)
-- Name: ix_houses_texts_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_houses_texts_text ON public.houses_texts USING btree (text);


--
-- TOC entry 3290 (class 1259 OID 89159)
-- Name: ix_planet_in_sign_texts_planet; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_planet_in_sign_texts_planet ON public.planet_in_sign_texts USING btree (planet);


--
-- TOC entry 3291 (class 1259 OID 89160)
-- Name: ix_planet_in_sign_texts_sign; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_planet_in_sign_texts_sign ON public.planet_in_sign_texts USING btree (sign);


--
-- TOC entry 3292 (class 1259 OID 89161)
-- Name: ix_planet_in_sign_texts_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_planet_in_sign_texts_text ON public.planet_in_sign_texts USING btree (text);


--
-- TOC entry 3295 (class 1259 OID 89162)
-- Name: ix_romantic_horoscope_texts_horoscope_text; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_romantic_horoscope_texts_horoscope_text ON public.romantic_horoscope_texts USING btree (horoscope_text);


--
-- TOC entry 3252 (class 1259 OID 88952)
-- Name: ix_user_base_telegram_id; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_user_base_telegram_id ON public.user_base USING btree (telegram_id);


--
-- TOC entry 3255 (class 1259 OID 88962)
-- Name: ix_user_info_telegram_id; Type: INDEX; Schema: public; Owner: horoscope_bot_user
--

CREATE INDEX ix_user_info_telegram_id ON public.user_info USING btree (telegram_id);


--
-- TOC entry 3298 (class 2606 OID 89076)
-- Name: user_sign user_sign_fk_horoscope_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_sign
    ADD CONSTRAINT user_sign_fk_horoscope_type_fkey FOREIGN KEY (fk_horoscope_type) REFERENCES public.horoscope_types(pk_horoscope_types);


--
-- TOC entry 3299 (class 2606 OID 89071)
-- Name: user_sign user_sign_fk_sign_fkey; Type: FK CONSTRAINT; Schema: public; Owner: horoscope_bot_user
--

ALTER TABLE ONLY public.user_sign
    ADD CONSTRAINT user_sign_fk_sign_fkey FOREIGN KEY (fk_sign) REFERENCES public.signs(pk_signs);


-- Completed on 2023-05-31 00:22:42

--
-- PostgreSQL database dump complete
--

