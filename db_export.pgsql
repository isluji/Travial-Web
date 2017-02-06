--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: travial_web_app_monument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travial_web_app_monument (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    city character varying(25) NOT NULL,
    monum_type character varying(25) NOT NULL,
    civilization character varying(25) NOT NULL,
    approx_end_date integer NOT NULL,
    arch_style character varying(25) NOT NULL
);


ALTER TABLE travial_web_app_monument OWNER TO postgres;

--
-- Name: travial_web_app_monument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travial_web_app_monument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travial_web_app_monument_id_seq OWNER TO postgres;

--
-- Name: travial_web_app_monument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travial_web_app_monument_id_seq OWNED BY travial_web_app_monument.id;


--
-- Name: travial_web_app_player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travial_web_app_player (
    id integer NOT NULL,
    birthdate date NOT NULL,
    gender character varying(1) NOT NULL,
    country character varying(25) NOT NULL,
    level integer NOT NULL,
    exp_points integer NOT NULL,
    user_id integer NOT NULL,
    avatar character varying(100)
);


ALTER TABLE travial_web_app_player OWNER TO postgres;

--
-- Name: travial_web_app_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travial_web_app_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travial_web_app_player_id_seq OWNER TO postgres;

--
-- Name: travial_web_app_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travial_web_app_player_id_seq OWNED BY travial_web_app_player.id;


--
-- Name: travial_web_app_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travial_web_app_question (
    id integer NOT NULL,
    text character varying(100) NOT NULL,
    options text NOT NULL,
    solution character varying(100) NOT NULL,
    hint character varying(100) NOT NULL
);


ALTER TABLE travial_web_app_question OWNER TO postgres;

--
-- Name: travial_web_app_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travial_web_app_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travial_web_app_question_id_seq OWNER TO postgres;

--
-- Name: travial_web_app_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travial_web_app_question_id_seq OWNED BY travial_web_app_question.id;


--
-- Name: travial_web_app_trivia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travial_web_app_trivia (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    size character varying(1) NOT NULL,
    difficulty character varying(1) NOT NULL,
    max_hints integer NOT NULL,
    monument_id integer NOT NULL,
    image character varying(100)
);


ALTER TABLE travial_web_app_trivia OWNER TO postgres;

--
-- Name: travial_web_app_trivia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travial_web_app_trivia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travial_web_app_trivia_id_seq OWNER TO postgres;

--
-- Name: travial_web_app_trivia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travial_web_app_trivia_id_seq OWNED BY travial_web_app_trivia.id;


--
-- Name: travial_web_app_trivia_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travial_web_app_trivia_questions (
    id integer NOT NULL,
    trivia_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE travial_web_app_trivia_questions OWNER TO postgres;

--
-- Name: travial_web_app_trivia_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travial_web_app_trivia_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travial_web_app_trivia_questions_id_seq OWNER TO postgres;

--
-- Name: travial_web_app_trivia_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travial_web_app_trivia_questions_id_seq OWNED BY travial_web_app_trivia_questions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_monument ALTER COLUMN id SET DEFAULT nextval('travial_web_app_monument_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_player ALTER COLUMN id SET DEFAULT nextval('travial_web_app_player_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_question ALTER COLUMN id SET DEFAULT nextval('travial_web_app_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia ALTER COLUMN id SET DEFAULT nextval('travial_web_app_trivia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia_questions ALTER COLUMN id SET DEFAULT nextval('travial_web_app_trivia_questions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add player	7	add_player
20	Can change player	7	change_player
21	Can delete player	7	delete_player
22	Can add question	8	add_question
23	Can change question	8	change_question
24	Can delete question	8	delete_question
25	Can add trivia	9	add_trivia
26	Can change trivia	9	change_trivia
27	Can delete trivia	9	delete_trivia
28	Can add monument	10	add_monument
29	Can change monument	10	change_monument
30	Can delete monument	10	delete_monument
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 30, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$30000$MfUOlMWmJxhG$sHMwjFsF+MZX4KZ2XAWxp01V5ldNnYTeF1Rmh9xl+g0=	2017-02-05 20:07:35.589344+01	f	gamer	John	Doe	gamer@anonymous.es	f	t	2017-02-04 19:56:53+01
5	pbkdf2_sha256$30000$uBLVRy8UuywM$DFv0QXTokK9IKvpKDSFeLrYwj2mQwpDmtXPDa8qJhrs=	\N	f	pepepepe	Pepe	Gonzalez	pepe@chiringuito.com	f	t	2017-02-06 17:38:07+01
6	pbkdf2_sha256$30000$c3UpECKebUF5$8rpV0LsWuKlZCj7CirEYIIuxqyVZDvsC2BCnSxhL41Q=	\N	f	jugona	Alice	in Wonderland		f	t	2017-02-06 18:15:24+01
7	pbkdf2_sha256$30000$CyUgSVJQdeIN$gawc1qMYwKng4nMJfHFNDPxsDuS0W9f7yk8vPsgD4Is=	\N	f	mastercommander	Peter	la Anguila		f	t	2017-02-06 18:16:40+01
3	pbkdf2_sha256$30000$rfuNLXyrxbrF$MuZJcrmSCM+p1z0ivUGzgYcHuKH332mAYVHJeh2wlkE=	2017-02-06 19:34:25.568832+01	t	isluji	Ismael	Luque	isluji@gmail.com	t	t	2017-02-04 19:52:41+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-02-04 19:56:53.475059+01	4	gamer	1	[{"added": {}}, {"added": {"object": "gamer", "name": "player"}}]	3	3
2	2017-02-05 19:34:32.903627+01	4	gamer	2	[{"changed": {"fields": ["avatar"], "object": "gamer", "name": "player"}}]	3	3
3	2017-02-05 20:05:28.120811+01	4	gamer	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}, {"changed": {"fields": ["exp_points"], "object": "gamer", "name": "player"}}]	3	3
4	2017-02-06 17:38:08.64339+01	5	pepepepe	1	[{"added": {}}, {"added": {"object": "pepepepe", "name": "player"}}]	3	3
5	2017-02-06 17:38:54.372343+01	5	pepepepe	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	3	3
6	2017-02-06 17:39:49.299833+01	3	isluji	2	[{"added": {"object": "isluji", "name": "player"}}]	3	3
7	2017-02-06 17:40:11.178974+01	3	isluji	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	3
8	2017-02-06 18:15:25.015399+01	6	jugona	1	[{"added": {}}, {"added": {"object": "jugona", "name": "player"}}]	3	3
9	2017-02-06 18:16:40.45744+01	7	mastercommander	1	[{"added": {}}, {"added": {"object": "mastercommander", "name": "player"}}]	3	3
10	2017-02-06 18:55:25.454119+01	6	jugona	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	3	3
11	2017-02-06 18:56:08.785594+01	7	mastercommander	2	[{"changed": {"fields": ["first_name", "last_name"]}}, {"changed": {"fields": ["avatar"], "object": "mastercommander", "name": "player"}}]	3	3
12	2017-02-06 18:57:41.784421+01	3	isluji	2	[{"changed": {"fields": ["last_name"]}}]	3	3
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 12, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	travial_web_app	player
8	travial_web_app	question
9	travial_web_app	trivia
10	travial_web_app	monument
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-02-04 18:54:54.173802+01
2	auth	0001_initial	2017-02-04 18:54:55.285852+01
3	admin	0001_initial	2017-02-04 18:54:55.619395+01
4	admin	0002_logentry_remove_auto_add	2017-02-04 18:54:55.752501+01
5	contenttypes	0002_remove_content_type_name	2017-02-04 18:54:55.828504+01
6	auth	0002_alter_permission_name_max_length	2017-02-04 18:54:55.862082+01
7	auth	0003_alter_user_email_max_length	2017-02-04 18:54:55.896331+01
8	auth	0004_alter_user_username_opts	2017-02-04 18:54:55.923825+01
9	auth	0005_alter_user_last_login_null	2017-02-04 18:54:55.950531+01
10	auth	0006_require_contenttypes_0002	2017-02-04 18:54:55.961831+01
11	auth	0007_alter_validators_add_error_messages	2017-02-04 18:54:55.991333+01
12	auth	0008_alter_user_username_max_length	2017-02-04 18:54:56.097166+01
13	sessions	0001_initial	2017-02-04 18:54:56.341855+01
14	travial_web_app	0001_initial	2017-02-04 18:54:57.010379+01
15	travial_web_app	0002_auto_20170205_1030	2017-02-05 19:32:01.096283+01
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
n3n6elmkvha8av9gfus859kn1qf3hmgu	YzJmYWYyZTAyMWY5MWI5OTM4NWU3MjAzYjhhOTU2NzQ2YjM0MjVjMTp7fQ==	2017-02-19 17:12:06.63557+01
jyksm2ch57rnobzy16pke9yilfyr1kyb	YzJmYWYyZTAyMWY5MWI5OTM4NWU3MjAzYjhhOTU2NzQ2YjM0MjVjMTp7fQ==	2017-02-19 17:13:32.327486+01
\.


--
-- Data for Name: travial_web_app_monument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travial_web_app_monument (id, name, city, monum_type, civilization, approx_end_date, arch_style) FROM stdin;
2	Alhambra	Granada	castle	muslim	1369	
\.


--
-- Name: travial_web_app_monument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travial_web_app_monument_id_seq', 2, true);


--
-- Data for Name: travial_web_app_player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travial_web_app_player (id, birthdate, gender, country, level, exp_points, user_id, avatar) FROM stdin;
3	2017-02-04	M	Spain	1	345	4	user_avatars/default_avatar.png
4	2017-02-06	M	Spain	5	480	5	user_avatars/dexter.png
5	2016-11-15	M	Spain	3	398	3	user_avatars/brazos.jpg
6	2017-02-06	F	USA	7	0	6	user_avatars/chica.jpg
7	2017-02-01	F	Guatemala	10	0	7	user_avatars/pajarraco.jpg
\.


--
-- Name: travial_web_app_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travial_web_app_player_id_seq', 7, true);


--
-- Data for Name: travial_web_app_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travial_web_app_question (id, text, options, solution, hint) FROM stdin;
1	Who commanded to begin the construction of the Alhambra?	"[Rajoy, Ibn Zamrak, Mussolini, Ibn Nasr]"	Ibn Nasr	It has a surname similar to a french Sevilla FC player
2	Who commanded to begin the construction of the Alhambra?	["Rajoy","Ibn Zamrak","Mussolini","Ibn Nasr"]	Ibn Nasr	It has a surname similar to a french Sevilla FC player
3	Which architectural style has the Alhambra?	["Nazari","Romantic","Baroque","Modernism"]	Nazari	It is related to the dynasty that was governing Granada in that age
5	In which year was the Alhambra finished (approximately)?	["1369","1420","1235","1456"]	1369	Not so close to the discovery of America, but not the most distant
\.


--
-- Name: travial_web_app_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travial_web_app_question_id_seq', 5, true);


--
-- Data for Name: travial_web_app_trivia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travial_web_app_trivia (id, title, size, difficulty, max_hints, monument_id, image) FROM stdin;
1	Discovering the Alhambra	S	M	3	2	\N
\.


--
-- Name: travial_web_app_trivia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travial_web_app_trivia_id_seq', 1, true);


--
-- Data for Name: travial_web_app_trivia_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travial_web_app_trivia_questions (id, trivia_id, question_id) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Name: travial_web_app_trivia_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travial_web_app_trivia_questions_id_seq', 3, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: travial_web_app_monument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_monument
    ADD CONSTRAINT travial_web_app_monument_pkey PRIMARY KEY (id);


--
-- Name: travial_web_app_player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_player
    ADD CONSTRAINT travial_web_app_player_pkey PRIMARY KEY (id);


--
-- Name: travial_web_app_player_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_player
    ADD CONSTRAINT travial_web_app_player_user_id_key UNIQUE (user_id);


--
-- Name: travial_web_app_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_question
    ADD CONSTRAINT travial_web_app_question_pkey PRIMARY KEY (id);


--
-- Name: travial_web_app_trivia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia
    ADD CONSTRAINT travial_web_app_trivia_pkey PRIMARY KEY (id);


--
-- Name: travial_web_app_trivia_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia_questions
    ADD CONSTRAINT travial_web_app_trivia_questions_pkey PRIMARY KEY (id);


--
-- Name: travial_web_app_trivia_questions_trivia_id_910ad186_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia_questions
    ADD CONSTRAINT travial_web_app_trivia_questions_trivia_id_910ad186_uniq UNIQUE (trivia_id, question_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: travial_web_app_trivia_4af8bcb6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX travial_web_app_trivia_4af8bcb6 ON travial_web_app_trivia USING btree (monument_id);


--
-- Name: travial_web_app_trivia_questions_05f98d54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX travial_web_app_trivia_questions_05f98d54 ON travial_web_app_trivia_questions USING btree (trivia_id);


--
-- Name: travial_web_app_trivia_questions_7aa0f6ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX travial_web_app_trivia_questions_7aa0f6ee ON travial_web_app_trivia_questions USING btree (question_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travial_web_app_player_user_id_d96292cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_player
    ADD CONSTRAINT travial_web_app_player_user_id_d96292cd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travial_web_app_trivia_id_03bd54e0_fk_travial_web_app_trivia_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia_questions
    ADD CONSTRAINT travial_web_app_trivia_id_03bd54e0_fk_travial_web_app_trivia_id FOREIGN KEY (trivia_id) REFERENCES travial_web_app_trivia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travial_web_monument_id_0f3e331a_fk_travial_web_app_monument_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia
    ADD CONSTRAINT travial_web_monument_id_0f3e331a_fk_travial_web_app_monument_id FOREIGN KEY (monument_id) REFERENCES travial_web_app_monument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travial_web_question_id_3d80f2e4_fk_travial_web_app_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travial_web_app_trivia_questions
    ADD CONSTRAINT travial_web_question_id_3d80f2e4_fk_travial_web_app_question_id FOREIGN KEY (question_id) REFERENCES travial_web_app_question(id) DEFERRABLE INITIALLY DEFERRED;


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

