--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(255),
    owner_id integer,
    description text,
    uploaded_at character varying(255),
    size integer
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	Nonummy Ut Inc.	5	2022-05-09 22:01:15
2	Dolor Nonummy Ac Incorporated	45	2022-10-27 21:10:32
3	Aliquam Gravida Industries	69	2023-07-13 16:40:00
4	In Hendrerit Incorporated	19	2023-09-11 15:22:42
5	Malesuada Vel Institute	32	2022-04-26 23:45:39
6	Leo Elementum Consulting	7	2023-05-14 18:21:43
7	Lacus Vestibulum Corporation	35	2023-08-05 16:48:45
8	Orci Sem PC	25	2022-07-16 15:50:21
9	Leo Industries	50	2022-11-14 11:35:23
10	Donec Nibh PC	26	2023-07-22 08:57:15
11	Nisi Aenean Corp.	85	2022-07-26 18:44:05
12	Mi Pede Corporation	6	2023-01-27 18:42:25
13	Magna Et LLC	10	2022-06-16 21:14:31
14	Etiam Ligula Tortor Associates	36	2022-11-13 20:07:20
15	Neque Pellentesque Inc.	80	2022-08-05 19:40:52
16	Lacinia Mattis Industries	11	2022-12-27 10:22:58
17	Etiam Gravida Molestie Associates	12	2023-06-18 12:55:07
18	Ante Industries	13	2023-07-13 23:51:13
19	Tempus Eu LLC	77	2021-10-31 00:07:54
20	Imperdiet Ornare PC	55	2022-09-30 23:46:53
21	Amet Ultricies Corporation	78	2023-07-02 02:45:44
22	Dui Nec Corporation	89	2023-06-25 02:22:54
23	Arcu Vestibulum Industries	98	2022-02-13 19:17:58
24	Nam Interdum Institute	18	2023-07-27 14:08:31
25	Tempor Lorem Eget Institute	37	2023-08-01 19:04:37
26	Et LLP	29	2023-03-26 17:55:20
27	Non Luctus Foundation	51	2023-09-10 16:15:28
28	Sit Amet Consectetuer LLC	10	2023-08-03 07:07:44
29	Enim Nec Consulting	65	2023-04-13 22:57:02
30	Dui Suspendisse LLP	60	2022-01-29 20:31:41
31	Augue Sed Institute	25	2023-05-14 23:35:31
32	Arcu Corp.	3	2022-02-27 04:09:48
33	Vulputate Dui Nec Corporation	77	2022-09-25 09:03:17
34	Ut Ipsum Institute	72	2022-05-13 09:04:47
35	Suscipit Est Ac Incorporated	14	2023-09-17 04:38:24
36	Sed Molestie Inc.	54	2022-11-07 09:44:44
37	Lorem Incorporated	32	2021-10-19 01:00:03
38	Vitae Erat Consulting	83	2023-08-22 14:27:09
39	Aliquam Eu Accumsan Inc.	94	2021-12-21 17:35:06
40	Et Rutrum Industries	58	2022-10-18 08:30:45
41	Diam At Associates	24	2023-03-12 15:32:30
42	Erat Vitae Risus LLC	15	2022-07-10 09:41:18
43	Sociosqu Ad Litora PC	35	2022-07-14 07:54:42
44	Amet Consectetuer LLP	46	2022-04-14 01:26:53
45	Mauris Id Consulting	73	2023-07-09 01:13:22
46	Amet Dapibus Id Associates	43	2023-05-25 16:59:58
47	Sollicitudin Adipiscing LLC	64	2022-04-28 10:58:04
48	Purus In Molestie Institute	1	2022-11-05 16:24:24
49	Nisi Incorporated	67	2023-06-06 11:53:13
50	Vestibulum Lorem LLC	71	2022-10-23 09:02:03
51	Nunc Quis Company	46	2022-10-26 13:10:15
52	Magna Corp.	69	2023-09-21 03:49:16
53	Purus Ac Institute	66	2023-07-26 10:29:53
54	Arcu Institute	12	2022-07-21 00:27:59
55	Vivamus PC	57	2023-04-26 08:12:36
56	Nec Incorporated	92	2022-09-01 03:19:37
57	Mauris Elit Dictum Incorporated	23	2021-11-30 10:23:51
58	Placerat Cras Dictum LLP	59	2022-09-16 10:52:03
59	Ac Limited	71	2022-04-30 17:06:57
60	Tellus Industries	90	2023-06-21 13:54:12
61	Bibendum Ullamcorper Foundation	18	2022-06-02 20:09:07
62	Arcu Vestibulum Inc.	59	2023-05-27 17:56:49
63	Ac Eleifend Vitae Inc.	36	2023-08-05 15:28:48
64	Sit Amet Corp.	79	2023-08-03 02:07:15
65	Et Ipsum Corporation	61	2023-06-04 10:26:03
66	Quisque Institute	47	2022-02-24 04:56:28
67	Ac Sem Ut LLP	52	2022-08-31 20:27:48
68	Taciti Sociosqu Limited	52	2023-06-16 06:03:50
69	Urna Nunc Associates	29	2023-08-23 19:01:30
70	Dolor Tempus Inc.	65	2022-12-22 20:37:24
71	Donec Associates	28	2023-04-16 08:08:08
72	Nibh Foundation	33	2023-08-05 03:30:15
73	Congue In LLC	50	2023-05-13 03:57:32
74	Fermentum LLC	50	2023-08-21 13:31:45
75	Mattis Inc.	45	2023-07-15 22:38:33
76	Ullamcorper Magna Foundation	26	2023-09-05 16:45:23
77	In Ornare Sagittis Inc.	18	2022-11-26 15:06:51
78	Sed Neque Limited	40	2023-07-05 19:47:15
79	Lacus Mauris Associates	54	2023-03-26 15:46:58
80	Nam Porttitor Scelerisque LLP	9	2023-06-17 08:24:19
81	Nulla Interdum Curabitur Industries	15	2022-01-18 01:17:22
82	Duis Gravida Corp.	53	2021-11-03 16:18:05
83	Enim Diam Ltd	30	2023-05-13 08:30:04
84	Sociis Natoque Company	82	2023-06-28 14:36:31
85	Diam Duis Corp.	81	2022-03-01 09:42:13
86	Semper Egestas Urna Corp.	12	2023-04-16 17:31:26
87	Et Magnis Dis Foundation	83	2022-08-02 06:32:15
88	Ornare Tortor Company	82	2023-06-08 05:13:47
89	Nascetur Ridiculus Associates	33	2023-01-26 15:50:05
90	Imperdiet Nec LLC	90	2023-02-20 16:56:54
91	Quam Elementum Foundation	25	2021-12-27 05:10:43
92	Et Magnis Limited	10	2023-09-19 18:23:04
93	Fringilla Cursus Industries	79	2023-09-22 19:54:27
94	Mauris LLC	5	2022-04-25 18:00:13
95	Nonummy PC	80	2021-11-09 22:18:43
96	Eu Eros LLC	96	2022-05-04 08:34:54
97	Eget Ltd	13	2022-01-14 14:27:03
98	Magna Sed Institute	12	2022-07-24 18:13:30
99	Aenean Egestas Hendrerit Institute	55	2021-11-07 04:56:47
100	Phasellus Dapibus LLC	29	2022-04-30 02:02:07
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
1	34	2023-03-16 15:07:51
2	68	2022-04-19 03:06:14
3	77	2023-06-03 16:22:42
4	44	2023-02-16 18:37:16
5	2	2023-05-02 16:41:38
6	70	2023-07-26 16:11:27
7	12	2023-08-02 13:01:28
8	59	2022-12-09 06:07:21
9	98	2022-07-27 08:04:23
10	45	2022-09-25 15:09:08
11	59	2022-11-23 23:08:40
12	69	2022-03-04 14:47:33
13	69	2022-09-28 20:07:35
14	82	2023-07-10 18:21:48
15	68	2022-05-27 12:19:26
16	85	2023-05-28 17:31:36
17	17	2022-06-10 20:50:41
18	93	2023-01-03 21:33:47
19	38	2022-06-01 04:23:19
20	63	2022-02-22 13:33:26
21	24	2022-12-23 07:22:36
22	40	2023-07-27 05:41:15
23	31	2023-01-01 02:50:43
24	39	2023-08-10 03:59:36
25	65	2022-05-11 10:21:48
26	19	2023-09-02 02:24:28
27	68	2022-04-28 22:23:26
28	3	2022-07-10 08:16:17
29	68	2023-07-10 21:09:02
30	22	2023-07-18 20:25:04
31	86	2023-07-08 21:14:33
32	52	2021-10-12 23:47:59
33	54	2023-03-18 19:54:01
34	38	2023-09-12 07:30:53
35	84	2023-03-27 00:17:01
36	98	2023-02-09 07:54:04
37	29	2022-10-31 22:38:54
38	54	2022-12-31 17:48:26
39	74	2023-03-12 19:20:42
40	80	2022-11-24 01:08:36
41	33	2022-09-22 06:54:07
42	61	2022-01-26 10:53:56
43	19	2022-08-01 04:56:39
44	60	2023-06-20 11:57:15
45	28	2022-12-19 17:29:02
46	66	2023-02-19 13:42:37
47	69	2023-05-17 22:17:20
48	9	2022-02-26 09:38:28
49	31	2023-01-27 13:50:55
50	74	2021-12-25 16:09:11
51	82	2023-04-17 05:49:56
52	90	2023-02-16 02:02:58
53	90	2023-05-10 13:29:52
54	84	2021-11-03 20:08:28
55	99	2022-06-20 17:04:06
56	62	2023-03-29 06:12:30
57	99	2023-08-27 07:11:01
58	84	2022-11-16 13:34:14
59	49	2022-12-12 11:34:17
60	85	2021-12-10 20:05:34
61	75	2022-11-25 21:18:23
62	97	2023-08-15 20:21:27
63	82	2022-09-24 02:35:56
64	1	2022-10-26 20:53:00
65	27	2023-06-21 17:02:48
66	23	2021-10-25 07:07:27
67	86	2023-07-19 11:25:26
68	43	2021-09-30 08:39:53
69	98	2022-03-13 21:32:40
70	70	2021-10-07 04:06:49
71	88	2022-04-05 06:31:37
72	53	2022-10-09 04:30:58
73	53	2023-01-17 19:41:43
74	31	2022-12-03 23:50:07
75	13	2022-10-19 04:13:47
76	43	2023-05-11 15:24:24
77	30	2021-12-13 00:56:10
78	46	2022-07-17 08:15:49
79	66	2023-09-27 11:10:00
80	81	2022-04-19 19:30:18
81	75	2023-09-04 02:04:28
82	82	2021-11-23 20:20:12
83	85	2022-03-19 08:10:29
84	96	2023-03-14 15:12:40
85	28	2021-10-28 01:45:25
86	56	2023-06-08 20:04:50
87	63	2023-09-25 20:57:13
88	82	2022-04-29 07:24:44
89	96	2023-02-26 07:49:21
90	97	2021-12-25 12:36:51
91	63	2022-09-22 14:00:10
92	1	2023-04-26 15:53:40
93	86	2023-06-27 15:43:54
94	85	2021-11-19 02:47:36
95	40	2023-09-19 16:55:19
96	35	2022-07-17 04:33:01
97	51	2023-08-24 07:13:27
98	32	2021-11-11 03:12:19
99	21	2023-09-12 00:57:41
100	53	2021-12-14 03:44:46
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	65	74	7	2023-07-23 08:19:58	2022-05-25 16:49:09
2	71	31	9	2022-10-17 07:56:20	2022-09-05 21:22:34
3	73	27	8	2023-01-10 09:31:04	2021-12-02 07:40:49
4	68	31	9	2022-07-28 21:24:53	2021-10-01 00:17:02
5	91	10	2	2023-04-29 17:48:18	2022-01-16 00:22:59
6	6	29	8	2023-03-13 06:32:55	2022-10-16 09:43:22
7	31	36	4	2022-06-25 07:07:28	2023-05-10 04:45:51
8	10	66	10	2023-07-08 05:36:56	2022-01-12 13:07:28
9	53	50	5	2022-05-26 13:16:31	2022-08-28 17:48:13
10	59	96	2	2023-07-26 13:04:50	2022-02-14 09:32:47
11	41	71	1	2021-12-31 16:13:11	2021-12-14 06:57:19
12	20	7	9	2022-06-06 00:58:21	2022-12-15 21:39:11
13	50	73	2	2022-11-29 16:03:40	2021-10-17 13:51:05
14	81	77	10	2023-05-31 03:45:54	2023-02-22 02:24:41
15	50	92	2	2023-04-29 04:52:51	2021-12-30 04:02:22
16	78	13	6	2023-04-27 12:02:19	2023-08-18 10:21:37
17	72	97	5	2021-12-29 18:36:23	2022-01-27 04:27:43
18	61	36	6	2022-10-05 01:57:43	2021-10-18 06:26:07
19	37	37	4	2023-09-06 00:45:01	2022-08-13 02:26:02
20	49	83	8	2021-11-09 19:42:38	2023-02-27 21:07:43
21	12	90	6	2023-09-16 09:16:23	2022-06-15 11:37:52
22	33	46	9	2023-07-14 07:20:44	2022-08-01 05:42:18
23	81	94	3	2022-10-25 22:24:09	2022-04-14 00:22:19
24	57	87	9	2022-05-15 05:55:07	2023-09-01 04:27:06
25	99	45	6	2022-05-20 21:43:27	2022-04-01 01:46:22
26	73	89	9	2023-07-19 08:13:19	2023-09-07 13:30:38
27	51	70	2	2022-02-14 11:54:22	2022-07-22 07:54:51
28	91	83	10	2022-03-10 18:24:54	2021-11-13 11:39:51
29	16	95	5	2022-08-18 10:20:12	2023-07-04 01:03:24
30	11	98	10	2023-04-21 07:28:50	2022-08-12 20:59:50
31	31	64	2	2023-07-12 16:08:29	2023-09-20 21:28:05
32	60	24	3	2022-04-01 02:53:07	2023-07-01 01:32:44
33	83	9	6	2022-12-20 15:41:20	2021-10-12 21:47:28
34	92	61	5	2023-07-22 07:40:54	2022-07-03 00:35:42
35	17	70	3	2022-06-05 08:17:14	2022-12-19 15:58:10
36	73	54	3	2023-02-13 20:37:40	2023-06-11 19:55:51
37	42	10	5	2023-08-09 14:23:27	2023-09-10 08:38:48
38	39	91	9	2022-08-19 18:30:25	2022-05-14 15:59:48
39	38	8	9	2023-01-17 03:27:37	2023-07-28 15:59:42
40	57	86	3	2023-07-12 14:37:15	2023-02-14 19:54:21
41	53	81	7	2023-05-12 10:27:45	2022-06-11 20:19:26
42	29	23	4	2022-10-31 13:11:21	2022-02-22 00:51:20
43	37	54	4	2023-08-28 01:37:54	2023-03-08 20:42:44
44	17	45	8	2023-08-14 09:31:23	2022-05-25 07:26:27
45	60	11	2	2022-11-07 19:29:09	2023-04-04 12:19:49
46	23	31	9	2021-12-12 09:37:32	2022-11-02 19:55:37
47	53	24	3	2023-06-30 20:56:43	2022-10-11 18:14:01
48	36	50	8	2022-08-02 14:28:35	2022-04-16 13:41:35
49	95	6	2	2022-10-30 10:09:25	2023-04-06 12:54:52
50	86	21	4	2023-04-25 01:22:48	2022-03-19 04:43:02
51	22	28	4	2023-01-13 17:49:24	2023-01-05 16:56:33
52	36	9	7	2022-07-15 08:41:13	2021-10-11 00:40:49
53	43	76	4	2022-02-17 23:32:21	2023-01-01 02:43:59
54	57	19	4	2023-03-31 05:35:38	2022-09-05 10:37:05
55	53	26	6	2021-11-23 10:33:02	2022-11-14 07:08:20
56	7	53	8	2023-02-02 23:51:32	2022-04-10 13:21:24
57	13	13	3	2022-11-21 08:55:40	2022-04-22 15:52:09
58	52	47	4	2023-09-06 07:41:08	2023-07-09 10:48:50
59	30	78	10	2023-08-07 09:55:09	2022-07-31 17:29:02
60	43	90	3	2021-12-22 10:25:05	2022-01-16 23:12:04
61	74	11	4	2022-06-21 08:23:35	2022-01-02 09:15:41
62	23	14	7	2022-09-01 03:14:34	2021-12-01 08:22:39
63	65	73	5	2021-12-16 08:54:55	2022-06-06 23:00:50
64	54	7	2	2022-06-14 07:39:25	2023-06-04 17:46:37
65	46	85	4	2022-04-03 22:06:28	2022-01-25 06:56:14
66	60	35	6	2022-02-01 07:05:30	2023-08-11 15:45:45
67	85	29	5	2023-07-16 13:07:38	2021-10-02 08:20:02
68	20	57	4	2023-04-27 18:12:40	2021-09-30 18:52:35
69	89	11	8	2023-03-16 06:11:54	2023-03-03 00:16:09
70	32	67	5	2022-09-25 22:50:37	2022-09-07 10:30:33
71	44	51	7	2023-04-29 03:45:35	2022-02-20 02:25:55
72	66	37	4	2021-11-07 01:32:03	2023-03-04 08:18:02
73	96	2	8	2023-08-05 07:40:16	2022-05-20 09:36:58
74	36	33	7	2023-01-05 20:51:51	2021-11-25 18:10:55
75	21	55	7	2023-05-17 15:03:03	2022-11-22 06:32:39
76	86	70	8	2023-02-06 18:09:59	2022-06-26 23:04:03
77	22	80	8	2022-03-12 01:26:01	2021-12-20 12:34:20
78	87	48	4	2022-10-19 07:18:27	2021-10-11 19:41:52
79	91	44	8	2021-11-28 00:32:36	2021-12-04 18:53:31
80	80	90	7	2022-11-08 07:26:06	2022-05-05 07:19:38
81	16	77	3	2021-12-17 01:14:54	2023-06-23 23:45:09
82	71	86	8	2022-06-12 09:34:54	2023-09-05 17:57:47
83	43	18	4	2023-03-26 09:44:25	2022-03-12 07:04:13
84	23	25	3	2023-05-19 20:09:34	2021-10-29 02:28:17
85	8	48	3	2022-12-13 00:52:19	2021-12-29 09:53:12
86	33	39	8	2021-11-13 20:52:26	2023-01-26 13:32:22
87	72	77	5	2023-02-06 07:08:45	2022-10-30 19:52:04
88	47	25	6	2021-10-24 22:51:07	2022-08-23 13:48:02
89	99	34	1	2021-12-31 21:37:22	2022-03-12 21:15:00
90	60	43	9	2022-10-24 05:21:57	2021-12-27 09:26:29
91	94	37	9	2022-12-29 15:15:14	2022-05-24 04:26:06
92	26	23	3	2022-01-11 11:27:28	2023-05-28 23:44:24
93	62	1	5	2022-09-09 05:26:52	2022-08-20 11:32:26
94	88	53	10	2023-08-06 20:05:02	2023-07-28 10:53:04
95	26	23	7	2023-03-30 04:04:10	2023-08-27 13:41:10
96	55	76	5	2023-02-16 22:57:30	2022-01-11 20:45:56
97	34	59	4	2023-05-02 00:11:00	2022-06-06 20:58:35
98	83	8	4	2022-11-20 18:34:32	2022-07-02 13:30:26
99	29	12	6	2023-08-19 10:29:41	2022-07-03 16:12:51
100	39	28	9	2021-11-09 09:19:15	2023-08-25 06:28:50
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	ultrices,
2	dui.
3	gravida
4	vitae
5	rhoncus
6	massa
7	ultrices.
8	lectus
9	Duis
10	Vestibulum
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	2	74	Duis gravida. Praesent eu nulla	t	t	2023-04-01 20:34:12
2	46	87	penatibus et magnis dis parturient montes, nascetur	t	t	2022-10-07 04:56:20
3	62	46	et nunc. Quisque ornare tortor at risus.	t	t	2022-03-12 06:54:23
4	23	88	at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	t	t	2023-07-02 19:48:11
5	27	12	lectus sit amet luctus	f	t	2022-01-22 07:06:04
6	60	42	est. Nunc laoreet lectus quis massa. Mauris	f	t	2021-10-15 01:55:06
7	87	77	neque. Nullam ut nisi a odio	t	t	2021-12-17 10:12:18
8	86	67	blandit viverra. Donec tempus,	t	t	2023-02-06 05:06:53
9	8	55	Phasellus dolor elit, pellentesque a, facilisis non, bibendum	f	t	2022-12-23 20:45:02
10	30	64	amet ante. Vivamus non	t	t	2022-01-17 03:23:47
11	71	64	Donec est. Nunc ullamcorper,	f	t	2022-06-03 17:44:06
12	86	57	sed, est. Nunc laoreet	f	f	2021-11-18 15:39:51
13	94	99	libero. Proin sed turpis nec mauris	t	f	2022-04-12 13:54:30
14	32	100	aliquet libero. Integer in magna. Phasellus dolor	t	t	2022-01-05 10:14:49
15	86	70	dis parturient montes, nascetur ridiculus mus. Proin vel	f	f	2021-09-28 21:56:50
16	23	86	eu sem. Pellentesque ut ipsum	f	t	2021-10-31 20:31:06
17	7	88	turpis. Nulla aliquet. Proin velit. Sed malesuada augue	t	f	2022-03-05 19:57:54
18	32	44	tincidunt	f	f	2022-07-07 13:58:16
19	34	42	sodales purus, in molestie tortor nibh sit amet	t	f	2022-08-12 07:43:06
20	50	22	Nunc lectus pede, ultrices	t	f	2022-09-30 04:31:18
21	54	88	Nullam velit dui, semper et, lacinia vitae, sodales at,	t	f	2022-10-11 18:31:09
22	20	17	massa. Integer vitae nibh. Donec est mauris,	f	t	2021-10-27 14:40:00
23	44	59	sit amet, dapibus id, blandit at,	t	t	2023-03-23 03:03:23
24	57	93	Fusce diam nunc, ullamcorper eu, euismod ac, fermentum	f	t	2022-05-08 15:38:39
25	52	55	urna et arcu imperdiet ullamcorper.	f	t	2023-09-01 20:03:02
26	65	48	auctor odio a purus. Duis elementum, dui quis accumsan	t	f	2022-09-11 22:08:26
27	93	46	ac mattis ornare, lectus ante dictum mi, ac	t	f	2022-07-17 06:37:35
28	15	19	augue ut lacus. Nulla tincidunt, neque vitae semper egestas,	t	t	2023-09-19 05:16:27
29	74	31	nulla. Integer urna. Vivamus	t	t	2022-05-15 19:18:46
30	37	59	interdum. Nunc sollicitudin commodo ipsum. Suspendisse non	t	f	2023-07-28 13:28:46
31	64	70	sit amet ultricies sem magna nec quam. Curabitur	f	t	2023-04-25 12:08:32
32	50	40	Maecenas iaculis aliquet diam. Sed diam lorem,	t	f	2021-10-30 11:13:35
33	21	57	natoque penatibus et magnis	t	f	2022-09-12 11:24:41
34	52	42	malesuada fames	f	t	2023-08-01 21:36:41
35	46	15	imperdiet ornare. In faucibus. Morbi vehicula.	f	f	2023-01-22 12:29:00
36	42	2	ipsum. Curabitur consequat,	f	t	2021-11-09 21:10:16
37	74	11	Ut sagittis lobortis mauris. Suspendisse aliquet	f	f	2022-12-16 20:45:41
38	85	95	Donec at arcu. Vestibulum ante ipsum primis in faucibus	f	f	2021-11-08 06:14:50
39	52	99	Donec at arcu. Vestibulum ante ipsum primis	f	t	2023-04-02 12:52:52
40	24	55	Integer vitae nibh. Donec est mauris, rhoncus id, mollis	t	t	2021-10-11 08:08:18
41	48	10	nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor	f	t	2021-10-17 21:55:52
42	94	17	sit amet, risus. Donec nibh enim, gravida sit	t	f	2023-04-04 01:50:06
43	50	100	nec urna et arcu	t	t	2022-08-09 05:44:12
44	91	19	amet, consectetuer	t	f	2023-09-06 14:41:24
45	61	26	egestas.	t	f	2022-12-26 20:25:24
46	7	88	diam eu dolor egestas rhoncus. Proin nisl	t	f	2022-04-02 13:29:58
47	44	9	dis parturient montes, nascetur ridiculus	f	t	2022-04-26 01:33:44
48	79	72	cubilia Curae Phasellus ornare. Fusce mollis.	f	f	2022-01-07 15:19:03
49	16	89	Nam consequat dolor	f	f	2023-02-10 17:02:34
50	91	5	libero. Integer in magna. Phasellus dolor elit,	t	t	2023-05-24 15:17:44
51	22	40	fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula	f	f	2022-11-25 08:36:07
52	57	3	tortor. Nunc commodo auctor	t	t	2022-08-20 14:10:20
53	52	23	penatibus et magnis	f	t	2022-12-10 13:25:27
54	76	26	magnis dis parturient montes,	t	t	2023-03-14 11:10:13
55	62	61	ut eros non enim commodo hendrerit. Donec porttitor	f	f	2023-05-06 19:08:15
56	14	72	fermentum risus, at fringilla purus	f	t	2022-12-05 00:40:41
57	75	32	sapien, gravida non, sollicitudin a,	t	t	2023-02-27 14:04:57
58	96	53	ut ipsum	f	f	2022-06-13 05:31:59
59	92	43	faucibus lectus, a sollicitudin orci sem eget massa.	t	t	2023-08-24 09:50:52
60	56	55	sagittis placerat.	f	t	2023-09-01 15:28:28
61	62	16	sagittis semper.	t	f	2023-09-27 23:05:25
62	61	26	sem ut	f	f	2023-08-15 06:43:54
63	81	35	auctor	t	f	2023-06-14 03:18:02
64	9	36	cursus a, enim. Suspendisse aliquet, sem	f	f	2023-04-16 06:06:48
65	48	84	Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	f	t	2023-06-08 14:42:24
66	21	50	accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus	f	t	2023-03-16 07:06:20
67	58	7	penatibus	f	f	2022-10-28 03:20:43
68	15	52	vestibulum, neque sed dictum eleifend,	t	f	2023-03-25 21:34:41
69	43	84	auctor, nunc nulla vulputate dui,	t	f	2023-02-13 15:46:54
70	33	8	Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque.	t	t	2022-06-21 03:17:35
71	85	78	magna. Lorem	f	f	2021-11-15 11:01:32
72	25	47	ac libero nec ligula consectetuer rhoncus.	f	f	2023-04-29 20:08:06
73	78	77	erat semper rutrum. Fusce dolor quam,	t	t	2023-06-30 17:00:49
74	79	60	et magnis dis parturient montes, nascetur ridiculus mus.	t	f	2021-11-02 07:48:12
75	61	13	mus. Aenean eget magna. Suspendisse	f	t	2023-05-05 21:34:33
76	72	36	libero est, congue a,	t	t	2021-09-29 05:11:57
77	77	62	vestibulum lorem, sit amet ultricies	f	t	2023-05-23 21:10:34
78	70	58	faucibus id, libero. Donec consectetuer mauris id sapien.	f	f	2021-12-01 17:46:43
79	51	58	Nulla facilisi. Sed neque. Sed	t	t	2023-01-30 11:55:50
80	72	84	convallis convallis dolor. Quisque tincidunt pede ac	f	f	2022-03-26 20:27:41
81	91	34	suscipit, est ac facilisis facilisis, magna tellus faucibus leo,	f	t	2022-09-24 16:45:19
82	99	60	a mi fringilla mi	f	f	2022-03-06 02:18:23
83	33	47	elit. Aliquam auctor, velit	f	t	2023-07-29 20:07:53
84	36	12	elit erat vitae risus. Duis a	t	t	2022-02-28 16:32:44
85	12	10	massa. Integer vitae nibh. Donec	f	t	2023-05-22 00:52:51
86	76	86	eu, placerat eget, venenatis a, magna. Lorem ipsum dolor	t	f	2022-09-06 04:38:28
87	82	23	malesuada fames ac turpis egestas. Aliquam fringilla	f	f	2022-05-27 10:09:28
88	31	62	nonummy ipsum non arcu. Vivamus sit amet risus.	t	t	2021-12-19 17:12:10
89	58	27	augue ac ipsum. Phasellus vitae mauris sit amet lorem	t	t	2022-01-12 00:21:54
90	59	15	purus mauris a nunc.	f	f	2023-05-15 11:26:57
91	14	25	non, luctus sit	f	t	2023-09-10 01:32:37
92	10	12	dolor dolor, tempus non, lacinia	t	f	2023-09-24 02:54:57
93	7	27	Cras dolor dolor, tempus non, lacinia	t	t	2023-05-31 14:09:36
94	9	26	Aliquam erat volutpat. Nulla dignissim. Maecenas	f	t	2022-05-19 23:15:38
95	2	66	Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a,	t	f	2022-10-05 05:47:16
96	60	48	et ultrices posuere cubilia Curae Donec	t	f	2023-02-18 15:13:14
97	31	69	congue. In scelerisque scelerisque dui. Suspendisse	f	t	2022-04-25 19:08:59
98	80	38	tellus justo sit amet nulla.	f	f	2022-10-19 06:09:57
99	90	16	euismod est arcu ac orci. Ut semper pretium neque. Morbi	f	t	2022-12-16 19:24:44
100	46	65	faucibus orci luctus	f	t	2023-06-11 07:55:38
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	http://pinterest.com/group/9?q=0	51	nunc sed pede. Cum sociis	2022-02-19 12:29:26	3
2	https://cnn.com/user/110?k=0	56	feugiat non, lobortis quis, pede.	2023-06-29 05:17:48	4
3	https://wikipedia.org/user/110?k=0	81	eget ipsum. Suspendisse sagittis. Nullam	2023-05-11 02:24:56	2
4	https://wikipedia.org/user/110?q=11	96	quis massa. Mauris vestibulum, neque	2022-09-23 10:36:54	1
5	http://zoom.us/settings?ab=441&aad=2	82	tincidunt pede ac urna. Ut	2023-03-17 09:27:18	5
6	https://whatsapp.com/site?gi=100	85	eu, placerat eget, venenatis a,	2023-08-30 12:40:35	3
7	https://youtube.com/group/9?search=1&q=de	90	et ultrices posuere cubilia Curae	2022-03-10 14:08:37	4
8	https://facebook.com/sub/cars?q=0	44	placerat, orci lacus vestibulum lorem,	2022-04-28 18:31:07	2
9	http://nytimes.com/en-us?search=1	85	orci luctus et ultrices posuere	2022-03-21 13:16:47	3
10	https://wikipedia.org/sub?str=se	29	non dui nec urna suscipit	2023-09-08 04:14:31	3
11	http://walmart.com/settings?ad=115	54	tellus. Nunc lectus pede, ultrices	2022-07-19 08:02:15	4
12	https://google.com/fr?q=4	84	massa non ante bibendum ullamcorper.	2021-12-21 03:08:41	4
13	https://walmart.com/group/9?search=1&q=de	14	vitae, posuere at, velit. Cras	2022-03-09 08:47:21	5
14	http://pinterest.com/sub?p=8	63	urna, nec luctus felis purus	2021-10-05 23:34:17	2
15	https://twitter.com/user/110?gi=100	84	elementum sem, vitae aliquam eros	2022-11-03 11:21:36	4
16	http://google.com/settings?search=1	94	ac arcu. Nunc mauris. Morbi	2022-07-19 19:37:28	4
17	https://baidu.com/sub?q=0	43	ut, pharetra sed, hendrerit a,	2022-07-24 20:32:38	2
18	http://twitter.com/one?gi=100	24	lorem ac risus. Morbi metus.	2022-08-20 01:33:52	3
19	https://google.com/sub?q=0	75	sodales. Mauris blandit enim consequat	2023-06-25 14:37:18	3
20	https://whatsapp.com/fr?ab=441&aad=2	91	aliquam arcu. Aliquam ultrices iaculis	2022-08-28 12:59:07	4
21	http://ebay.com/fr?ab=441&aad=2	22	arcu vel quam dignissim pharetra.	2022-05-19 03:57:52	3
22	https://twitter.com/site?search=1&q=de	41	et ultrices posuere cubilia Curae	2022-01-19 14:58:04	4
23	http://yahoo.com/sub/cars?str=se	30	vitae, aliquet nec, imperdiet nec,	2022-05-05 10:35:06	5
24	http://reddit.com/sub/cars?ab=441&aad=2	67	est, vitae sodales nisi magna	2023-03-20 03:55:55	2
25	http://whatsapp.com/site?q=test	37	Sed nunc est, mollis non,	2022-06-20 05:22:01	1
26	https://yahoo.com/group/9?q=4	70	non ante bibendum ullamcorper. Duis	2023-06-27 09:28:42	1
27	http://reddit.com/settings?k=0	51	fames ac turpis egestas. Fusce	2022-08-18 00:49:20	5
28	https://twitter.com/site?ab=441&aad=2	43	Aenean gravida nunc sed pede.	2023-01-08 05:50:22	4
29	http://whatsapp.com/settings?k=0	57	fringilla mi lacinia mattis. Integer	2022-05-21 22:57:25	2
30	https://reddit.com/settings?client=g	45	nec tempus mauris erat eget	2023-09-18 04:37:34	3
31	https://zoom.us/one?client=g	81	aliquet. Proin velit. Sed malesuada	2021-10-01 00:14:35	3
32	https://guardian.co.uk/settings?ad=115	5	adipiscing lacus. Ut nec urna	2023-05-16 02:03:36	3
33	http://yahoo.com/sub?str=se	89	odio tristique pharetra. Quisque ac	2022-07-31 15:21:15	4
34	http://wikipedia.org/en-us?q=4	27	malesuada ut, sem. Nulla interdum.	2023-06-29 22:18:06	4
35	https://netflix.com/en-ca?search=1	49	egestas rhoncus. Proin nisl sem,	2023-09-01 16:04:18	5
36	https://baidu.com/fr?k=0	88	massa rutrum magna. Cras convallis	2023-05-08 12:15:27	4
37	http://walmart.com/en-ca?ab=441&aad=2	17	Fusce dolor quam, elementum at,	2023-05-31 15:37:44	3
38	http://google.com/fr?search=1	39	gravida sit amet, dapibus id,	2022-09-11 02:41:05	3
39	http://google.com/one?ab=441&aad=2	29	imperdiet non, vestibulum nec, euismod	2022-05-27 18:52:10	5
40	http://nytimes.com/en-us?ad=115	4	penatibus et magnis dis parturient	2022-08-14 14:04:12	3
41	http://twitter.com/one?gi=101	58	Cras convallis convallis dolor. Quisque	2022-03-29 02:04:29	2
42	https://nytimes.com/settings?page=1&offset=1	14	nulla. Integer urna. Vivamus molestie	2021-10-13 09:21:19	4
43	https://baidu.com/fr?client=g	29	tempor augue ac ipsum. Phasellus	2022-10-05 03:40:16	1
44	http://cnn.com/one?ad=115	22	Cras interdum. Nunc sollicitudin commodo	2023-09-13 12:36:47	4
45	https://reddit.com/user/110?q=test	85	lorem, luctus ut, pellentesque eget,	2023-01-01 03:23:25	3
46	http://google.com/en-us?search=1&q=de	16	tempor diam dictum sapien. Aenean	2022-09-22 19:01:03	3
47	http://wikipedia.org/site?str=se	39	lorem fringilla ornare placerat, orci	2021-10-04 03:44:39	4
48	http://pinterest.com/en-ca?str=se	99	arcu et pede. Nunc sed	2023-07-25 16:33:15	1
49	http://netflix.com/sub?q=4	94	fringilla purus mauris a nunc.	2022-09-09 02:06:44	3
50	https://nytimes.com/settings?q=11	17	eget, venenatis a, magna. Lorem	2023-06-18 13:45:26	4
51	https://cnn.com/one?q=0	64	adipiscing, enim mi tempor lorem,	2022-08-18 23:00:25	3
52	https://bbc.co.uk/site?gi=100	26	iaculis, lacus pede sagittis augue,	2023-08-27 15:40:38	4
53	http://whatsapp.com/one?gi=100	67	elementum sem, vitae aliquam eros	2022-01-23 16:26:07	2
54	https://bbc.co.uk/group/9?str=se	84	sit amet lorem semper auctor.	2022-02-18 08:56:22	5
55	https://youtube.com/en-us?q=11	83	diam at pretium aliquet, metus	2022-04-01 07:03:14	2
56	https://facebook.com/site?g=1	28	Nullam feugiat placerat velit. Quisque	2022-11-06 13:33:51	4
57	https://youtube.com/en-us?q=4	81	erat vitae risus. Duis a	2022-06-09 10:00:56	2
58	https://netflix.com/settings?search=1&q=de	80	id magna et ipsum cursus	2022-05-28 06:51:42	4
59	http://wikipedia.org/settings?q=test	98	vitae, aliquet nec, imperdiet nec,	2023-04-27 19:47:30	5
60	http://netflix.com/sub?p=8	26	In at pede. Cras vulputate	2022-05-17 02:02:49	3
61	http://facebook.com/en-us?q=11	26	sagittis augue, eu tempor erat	2023-03-08 22:40:49	4
62	http://wikipedia.org/site?p=8	70	penatibus et magnis dis parturient	2022-10-08 22:37:00	2
63	https://google.com/site?gi=100	87	Nam tempor diam dictum sapien.	2023-03-10 03:20:01	2
64	http://pinterest.com/sub/cars?q=test	61	erat vel pede blandit congue.	2023-08-02 08:01:23	4
65	https://facebook.com/sub/cars?q=11	88	lorem, vehicula et, rutrum eu,	2023-08-17 19:56:10	4
66	http://naver.com/user/110?ad=115	69	mi. Aliquam gravida mauris ut	2023-07-25 22:46:58	4
67	http://wikipedia.org/fr?ad=115	27	quis arcu vel quam dignissim	2022-06-27 18:34:19	1
68	https://wikipedia.org/group/9?client=g	75	tristique neque venenatis lacus. Etiam	2022-09-12 01:36:38	3
69	https://zoom.us/sub/cars?search=1&q=de	70	Phasellus fermentum convallis ligula. Donec	2021-12-23 00:26:42	4
70	http://youtube.com/en-us?gi=100	28	velit eu sem. Pellentesque ut	2023-08-04 00:59:21	1
71	http://netflix.com/settings?search=1	74	magna, malesuada vel, convallis in,	2022-07-19 19:22:34	5
72	http://whatsapp.com/site?q=test	9	vulputate mauris sagittis placerat. Cras	2023-01-30 14:11:30	1
73	http://nytimes.com/sub?client=g	4	Aliquam erat volutpat. Nulla facilisis.	2023-03-20 08:37:15	4
74	https://facebook.com/en-ca?q=4	23	a mi fringilla mi lacinia	2023-06-24 12:24:33	5
75	http://bbc.co.uk/en-ca?ad=115	74	nunc. Quisque ornare tortor at	2022-06-10 23:49:17	2
76	http://bbc.co.uk/fr?g=1	35	luctus, ipsum leo elementum sem,	2023-07-25 18:59:22	3
77	https://cnn.com/sub/cars?str=se	11	et nunc. Quisque ornare tortor	2022-01-12 03:25:46	2
78	https://whatsapp.com/one?q=4	10	malesuada vel, convallis in, cursus	2023-09-13 01:13:12	5
79	http://pinterest.com/sub/cars?search=1&q=de	70	Aliquam nisl. Nulla eu neque	2022-10-03 08:56:43	2
80	http://facebook.com/site?q=0	47	neque. Sed eget lacus. Mauris	2022-10-29 11:06:09	3
81	https://reddit.com/en-us?ab=441&aad=2	23	pede. Cum sociis natoque penatibus	2022-01-04 02:31:35	4
82	http://pinterest.com/sub/cars?p=8	49	tincidunt orci quis lectus. Nullam	2022-10-07 23:51:15	4
83	http://pinterest.com/user/110?q=0	14	tellus. Suspendisse sed dolor. Fusce	2022-08-01 19:22:51	3
84	https://facebook.com/one?gi=100	44	convallis ligula. Donec luctus aliquet	2023-03-25 03:31:41	2
85	http://zoom.us/sub?g=1	44	sit amet lorem semper auctor.	2023-07-02 00:41:17	2
86	http://naver.com/group/9?gi=100	39	non, cursus non, egestas a,	2022-05-03 14:04:43	4
87	http://twitter.com/site?search=1	62	ante dictum cursus. Nunc mauris	2023-05-19 09:03:57	3
88	https://whatsapp.com/settings?p=8	55	quis, pede. Praesent eu dui.	2023-05-20 14:54:12	2
89	http://yahoo.com/sub/cars?q=11	48	auctor. Mauris vel turpis. Aliquam	2021-11-08 18:01:11	2
90	http://wikipedia.org/en-ca?q=test	31	Mauris eu turpis. Nulla aliquet.	2023-07-12 00:56:15	2
91	http://whatsapp.com/settings?gi=100	54	mus. Proin vel nisl. Quisque	2023-03-24 23:13:54	2
92	http://instagram.com/en-ca?page=1&offset=1	39	sem semper erat, in consectetuer	2021-10-21 08:27:56	3
93	http://instagram.com/sub/cars?p=8	86	imperdiet dictum magna. Ut tincidunt	2022-05-07 03:32:02	1
94	http://instagram.com/site?search=1	81	nisl. Maecenas malesuada fringilla est.	2023-05-12 04:59:31	1
95	http://cnn.com/en-us?search=1&q=de	53	amet, risus. Donec nibh enim,	2023-09-18 23:40:23	1
96	https://wikipedia.org/settings?search=1&q=de	9	sed orci lobortis augue scelerisque	2022-08-16 20:01:01	4
97	http://google.com/en-us?ab=441&aad=2	7	sit amet ultricies sem magna	2022-12-07 05:47:31	1
98	http://walmart.com/settings?q=4	35	ante dictum mi, ac mattis	2022-06-22 23:38:33	1
99	http://whatsapp.com/group/9?client=g	16	amet ornare lectus justo eu	2021-10-19 08:20:05	4
100	http://bbc.co.uk/en-ca?q=11	97	volutpat ornare, facilisis eget, ipsum.	2023-08-18 12:30:37	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Candace	Woodard	donec.egestas@aol.com	082-206-3287	1	2022-04-27 09:42:33
2	Alice	Cherry	dis.parturient@google.couk	040-025-7581	33	2023-09-23 04:43:35
3	Nolan	Mason	magnis.dis.parturient@icloud.ca	055-278-5655	62	2021-11-08 14:19:11
4	Adena	Bond	vestibulum.accumsan@outlook.couk	022-394-0745	56	2023-03-24 12:38:24
5	Garth	Jefferson	congue.a.aliquet@protonmail.com	005-823-4087	6	2023-07-20 02:32:00
6	Blaze	Molina	purus.in.molestie@aol.net	051-137-6151	100	2023-09-03 05:54:02
7	Wyatt	Hunter	non.lobortis@icloud.org	090-948-4447	59	2022-07-20 10:11:52
8	Jena	Bailey	fermentum.vel@protonmail.edu	016-313-6557	24	2023-09-12 20:09:27
9	Andrew	Bruce	orci.ut@google.edu	055-741-8518	2	2022-10-18 05:29:58
10	David	Roberts	mauris.suspendisse.aliquet@protonmail.net	080-942-7370	61	2022-09-28 00:56:03
11	Brody	Albert	lectus@outlook.ca	021-344-7937	21	2022-10-30 10:44:14
12	Ifeoma	Gonzales	amet.faucibus@google.ca	067-288-6226	20	2023-03-01 23:01:04
13	Clementine	Dixon	parturient.montes@google.org	097-441-4384	42	2022-08-08 10:21:41
14	Fitzgerald	Riddle	tellus@hotmail.net	055-298-8891	95	2023-01-27 21:01:32
15	Beau	Hurst	molestie.in.tempus@hotmail.edu	070-333-6642	54	2022-05-03 08:29:06
16	Raymond	Langley	venenatis.vel.faucibus@hotmail.com	068-248-6066	24	2022-12-17 12:38:22
17	Arthur	Gregory	vestibulum@protonmail.net	047-663-7718	54	2022-09-19 04:21:30
18	Jakeem	Vasquez	non.nisi.aenean@google.ca	013-824-4353	58	2022-02-10 11:35:41
19	Peter	Knowles	imperdiet.ornare@google.net	067-662-8448	35	2023-01-15 20:09:21
20	Riley	Ballard	blandit.congue.in@hotmail.edu	081-815-2065	47	2022-08-29 18:44:59
21	Shaine	Ruiz	at.fringilla.purus@aol.ca	082-259-2218	34	2021-10-14 11:10:15
22	Hanna	Davidson	aenean.massa@protonmail.org	025-717-6345	76	2022-01-24 05:46:03
23	Risa	Hoover	aenean.eget@aol.org	046-511-2282	75	2023-08-05 17:39:29
24	Gregory	Terrell	at.arcu.vestibulum@hotmail.couk	027-165-3287	84	2023-09-09 00:34:22
25	Hayes	Ratliff	odio.a@protonmail.com	048-369-3642	29	2021-11-18 01:25:16
26	Barry	Pace	in.lobortis@icloud.couk	025-771-9482	71	2023-08-29 20:22:50
27	Basil	Riggs	purus@aol.com	046-928-8452	39	2022-12-08 12:16:08
28	Juliet	Decker	mattis@icloud.ca	042-614-5675	85	2021-10-21 22:11:01
29	Zeph	Alston	ac.facilisis.facilisis@aol.com	062-176-6565	83	2023-01-06 07:28:35
30	Chancellor	Montoya	ornare.fusce@outlook.org	007-427-2252	1	2022-02-14 18:58:41
31	Garth	Robles	sed@hotmail.edu	015-495-7766	24	2021-10-12 11:30:29
32	Colin	Strickland	massa.suspendisse.eleifend@hotmail.org	055-067-8137	22	2023-02-28 20:38:05
33	Hashim	Rice	mattis.cras@yahoo.org	074-704-4446	56	2023-03-25 05:16:10
34	Maia	Singleton	egestas.a.scelerisque@google.ca	029-603-9524	21	2023-04-09 08:59:27
35	Quon	Barrett	diam.nunc@hotmail.net	008-066-7158	12	2023-01-01 11:30:31
36	Timon	Salinas	sapien.nunc.pulvinar@protonmail.com	036-365-0978	69	2022-05-16 13:40:48
37	Samson	Sutton	mauris.rhoncus@aol.net	038-354-4316	77	2023-01-03 09:53:22
38	Jaquelyn	Coleman	enim.commodo@google.com	045-370-2326	38	2023-05-20 10:01:10
39	Marshall	Black	proin@aol.edu	027-745-4044	21	2022-08-26 01:34:43
40	Elton	King	aliquam.erat@aol.org	083-541-9252	18	2023-07-24 12:29:51
41	Sybil	Clark	massa.vestibulum@yahoo.org	098-884-4989	36	2022-03-20 03:44:20
42	Brian	Rodriguez	adipiscing.elit@aol.edu	030-878-1754	24	2022-09-25 11:38:18
43	Allegra	Jarvis	ante.ipsum@hotmail.ca	032-223-0172	63	2022-12-17 15:21:00
44	Naida	Zamora	aliquam.enim.nec@icloud.org	011-345-3715	52	2021-10-20 07:56:35
45	Maris	Valdez	et.netus@hotmail.edu	066-343-9467	52	2023-05-09 02:17:39
46	Ulysses	West	in.faucibus@yahoo.org	057-135-6732	31	2022-04-07 15:51:17
47	TaShya	Melton	eleifend.non.dapibus@icloud.couk	028-027-0732	43	2023-02-08 02:29:04
48	Gregory	Neal	in@outlook.com	059-151-6370	57	2021-12-13 07:21:22
49	Fredericka	Williamson	pulvinar@outlook.edu	016-356-1338	78	2022-06-24 06:08:40
50	Cade	Ortega	hendrerit.consectetuer@outlook.couk	062-697-6315	74	2022-06-28 00:34:32
51	Cleo	Carpenter	erat@hotmail.com	051-933-9168	43	2023-08-14 10:27:51
52	Hollee	Strong	risus@icloud.org	076-170-6658	100	2023-08-14 16:23:13
53	Murphy	O'connor	arcu.sed@protonmail.ca	006-714-4214	95	2021-11-17 17:56:05
54	Myles	Craig	auctor@aol.net	047-518-8898	74	2022-02-18 06:18:18
55	Jorden	Mayer	sagittis.semper@outlook.edu	065-761-2696	75	2022-03-12 11:17:29
56	Sade	Russo	natoque.penatibus.et@protonmail.couk	068-153-3976	19	2022-02-09 16:23:06
57	Chancellor	Cleveland	cum.sociis@icloud.couk	081-408-4243	13	2023-08-30 12:50:19
58	Gage	Rutledge	a@google.edu	056-159-9345	80	2022-07-28 11:23:01
59	Aphrodite	Guzman	ut@icloud.com	071-362-3211	62	2021-10-06 15:47:01
60	Lucius	Rivera	diam.at@yahoo.edu	049-393-2870	8	2023-03-12 23:52:25
61	Sasha	Garcia	orci@outlook.couk	033-472-5302	90	2022-11-26 07:33:21
62	Chadwick	Wilcox	ligula.tortor@google.ca	086-678-2558	78	2022-05-29 04:08:38
63	Hanae	Stein	consectetuer@icloud.net	068-767-5484	81	2022-05-23 18:42:00
64	Laura	Greer	vitae.sodales@protonmail.couk	011-818-6814	23	2023-06-28 23:59:05
65	Buckminster	Potts	sem.consequat.nec@hotmail.couk	017-068-9155	49	2022-03-19 04:29:37
66	Martina	Mcgee	imperdiet.dictum@protonmail.ca	037-853-0603	19	2022-07-03 23:25:26
67	Abdul	Fischer	dui.nec@protonmail.couk	055-101-1943	99	2022-05-10 13:03:26
68	Sean	Gross	nisi.sem@google.ca	055-687-4047	22	2022-10-13 22:25:32
69	Armando	Lucas	in.faucibus.orci@outlook.ca	022-687-5387	91	2022-04-03 23:18:14
70	Lucius	Ratliff	lorem.vitae@aol.org	072-287-0236	46	2022-02-04 01:04:11
71	Blake	Cain	interdum.curabitur.dictum@yahoo.com	037-055-0597	17	2023-07-28 01:05:25
72	Ethan	Weber	semper.dui.lectus@protonmail.ca	078-222-3807	31	2022-12-22 21:42:42
73	Emmanuel	Owen	viverra.donec@google.edu	033-027-6454	62	2023-09-06 06:47:46
74	Malik	Ratliff	arcu.sed@google.com	084-491-1328	39	2022-10-08 13:11:10
75	Kerry	Carson	cum.sociis.natoque@icloud.com	014-412-6462	53	2022-11-21 20:42:31
76	Cole	Pacheco	dolor.donec@outlook.couk	010-467-8085	86	2022-06-13 20:58:17
77	Rose	Dickerson	a@icloud.edu	019-797-5387	88	2023-03-17 18:46:20
78	Ian	Dawson	a@yahoo.net	054-382-5122	20	2023-04-07 09:24:26
79	Joan	Abbott	egestas.a@aol.edu	073-226-0568	5	2023-06-03 12:21:05
80	Nissim	Sanford	lorem@icloud.net	007-333-3638	85	2023-09-15 17:56:55
81	Acton	Gibson	quisque.fringilla@google.ca	007-830-0411	80	2022-06-30 06:47:24
82	Gail	Pittman	non.hendrerit@aol.couk	076-689-3825	46	2022-10-14 09:09:40
83	Serina	Merrill	amet.dapibus@hotmail.edu	040-129-3683	27	2022-11-18 20:35:28
84	Griffith	Baldwin	leo.morbi.neque@yahoo.ca	024-423-1673	4	2022-05-30 21:06:13
85	Ivory	Koch	cum.sociis@icloud.edu	049-570-1363	63	2022-08-21 23:33:26
86	Richard	Sandoval	sociis@protonmail.org	057-488-8351	94	2021-10-10 04:04:29
87	Alika	Rutledge	cursus@google.edu	034-434-6866	93	2021-11-13 15:17:04
88	Joshua	Lawrence	sed.dictum@aol.ca	061-071-4581	17	2022-07-29 10:42:38
89	Addison	Medina	at.iaculis@hotmail.ca	004-243-8378	32	2022-06-09 02:45:56
90	Sade	Stuart	neque@protonmail.net	083-019-2435	28	2022-02-17 00:23:30
91	Penelope	Holcomb	lobortis.quis@hotmail.net	027-184-6172	3	2022-04-07 00:05:44
92	Ashton	Ward	tempus@aol.org	084-713-5125	51	2022-07-31 23:03:23
93	Quemby	Baldwin	ut.nec@aol.ca	048-454-7055	79	2022-06-11 16:19:27
94	Clark	O'Neill	eu@icloud.org	040-759-5326	86	2022-08-17 07:47:44
95	Deborah	Hawkins	ac.mattis@protonmail.couk	084-845-6431	49	2022-03-05 10:11:43
96	Elliott	Patterson	suspendisse.non.leo@icloud.net	076-456-7510	10	2022-10-11 14:52:50
97	Devin	Riddle	et.magnis@google.net	076-354-1758	50	2023-05-06 15:00:14
98	Germaine	Holloway	rutrum.non@outlook.net	062-725-8048	57	2022-08-08 05:10:13
99	Wesley	Garner	etiam.laoreet@yahoo.net	057-220-7611	91	2021-11-05 09:53:27
100	Jana	Pittman	diam@protonmail.ca	088-848-8857	100	2021-10-04 13:20:18
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	http://reddit.com/sub/cars?gi=100	63	sit amet, dapibus id, blandit	2022-11-07 02:10:36	46
2	http://cnn.com/sub/cars?gi=100	84	eros. Nam consequat dolor vitae	2023-03-17 02:19:32	19
3	http://youtube.com/settings?p=8	55	porttitor tellus non magna. Nam	2023-03-30 09:43:59	0
4	http://nytimes.com/settings?p=8	76	vel arcu eu odio tristique	2022-12-10 18:10:17	45
5	http://whatsapp.com/fr?p=8	24	Nullam ut nisi a odio	2022-12-31 07:08:09	38
6	http://zoom.us/settings?q=0	25	posuere, enim nisl elementum purus,	2022-03-11 23:43:14	8
7	https://instagram.com/site?str=se	9	a mi fringilla mi lacinia	2022-12-28 22:10:33	1
8	http://wikipedia.org/settings?client=g	31	laoreet ipsum. Curabitur consequat, lectus	2022-05-11 10:51:12	4
9	https://naver.com/one?p=8	43	Sed molestie. Sed id risus	2022-03-05 04:46:00	27
10	https://zoom.us/site?q=11	91	iaculis odio. Nam interdum enim	2023-05-20 09:57:14	12
11	https://zoom.us/site?q=4	35	eget, dictum placerat, augue. Sed	2023-08-28 10:33:28	8
12	https://whatsapp.com/en-us?gi=100	84	urna et arcu imperdiet ullamcorper.	2021-12-01 23:16:51	15
13	https://guardian.co.uk/en-ca?q=11	24	a tortor. Nunc commodo auctor	2022-01-18 05:35:02	46
14	https://youtube.com/group/9?ad=115	21	enim nisl elementum purus, accumsan	2021-12-16 23:41:06	21
15	http://baidu.com/user/110?q=4	87	felis. Nulla tempor augue ac	2023-04-03 09:54:43	12
16	https://facebook.com/sub?gi=100	21	sed, hendrerit a, arcu. Sed	2021-10-03 10:29:46	27
17	https://instagram.com/en-ca?q=test	44	faucibus ut, nulla. Cras eu	2022-06-19 19:27:35	41
18	https://wikipedia.org/user/110?ad=115	81	ullamcorper, nisl arcu iaculis enim,	2022-11-23 11:19:44	42
19	https://ebay.com/sub/cars?p=8	71	accumsan laoreet ipsum. Curabitur consequat,	2023-08-23 16:01:52	50
20	https://nytimes.com/site?search=1	40	Curabitur sed tortor. Integer aliquam	2021-10-20 18:57:51	2
21	https://baidu.com/en-ca?q=4	38	lorem. Donec elementum, lorem ut	2023-02-16 20:09:48	41
22	http://cnn.com/sub?k=0	92	massa lobortis ultrices. Vivamus rhoncus.	2023-03-05 00:57:21	38
23	https://guardian.co.uk/group/9?g=1	82	nisi nibh lacinia orci, consectetuer	2021-12-13 22:22:03	26
24	https://pinterest.com/group/9?ad=115	14	Integer tincidunt aliquam arcu. Aliquam	2023-05-15 06:06:24	16
25	http://instagram.com/en-us?q=4	24	sapien. Aenean massa. Integer vitae	2022-12-19 16:30:36	24
26	http://instagram.com/fr?gi=100	37	ante. Maecenas mi felis, adipiscing	2022-11-29 03:14:49	38
27	http://ebay.com/sub?client=g	95	facilisis non, bibendum sed, est.	2022-09-30 20:40:59	49
28	https://twitter.com/en-ca?ab=441&aad=2	57	Donec tempor, est ac mattis	2023-01-07 02:49:11	37
29	http://zoom.us/user/110?ad=115	88	in consectetuer ipsum nunc id	2021-12-06 15:07:08	39
30	https://youtube.com/one?p=8	86	sed tortor. Integer aliquam adipiscing	2023-03-04 23:11:18	42
31	https://naver.com/fr?q=11	72	dui. Fusce aliquam, enim nec	2023-06-29 11:25:51	7
32	https://pinterest.com/user/110?search=1	100	Mauris blandit enim consequat purus.	2022-09-21 09:09:18	44
33	https://nytimes.com/fr?search=1&q=de	4	Vivamus nisi. Mauris nulla. Integer	2022-04-17 22:58:49	29
34	http://yahoo.com/sub/cars?str=se	4	est mauris, rhoncus id, mollis	2021-10-12 05:33:26	38
35	https://zoom.us/fr?q=0	1	sit amet diam eu dolor	2022-03-18 13:05:43	48
36	http://instagram.com/en-us?search=1&q=de	6	et arcu imperdiet ullamcorper. Duis	2023-08-27 11:16:37	30
37	https://naver.com/fr?search=1	85	nulla at sem molestie sodales.	2022-10-19 14:30:06	8
38	http://facebook.com/site?search=1&q=de	63	Lorem ipsum dolor sit amet,	2023-02-25 23:10:06	40
39	https://bbc.co.uk/sub/cars?g=1	13	nisl. Nulla eu neque pellentesque	2023-09-11 16:15:13	8
40	http://zoom.us/fr?q=4	49	eros turpis non enim. Mauris	2022-01-08 08:42:20	41
41	http://facebook.com/one?str=se	47	amet ante. Vivamus non lorem	2022-12-31 23:07:06	17
42	http://yahoo.com/group/9?ad=115	28	nibh. Quisque nonummy ipsum non	2023-09-24 21:40:09	33
43	http://yahoo.com/user/110?q=4	25	Donec nibh enim, gravida sit	2023-07-31 11:05:58	2
44	http://whatsapp.com/en-ca?search=1&q=de	18	Nunc quis arcu vel quam	2022-12-02 23:34:00	31
45	http://pinterest.com/sub?p=8	23	augue malesuada malesuada. Integer id	2022-06-23 14:43:05	18
46	https://reddit.com/one?q=test	96	neque. In ornare sagittis felis.	2023-08-28 08:33:31	10
47	http://pinterest.com/user/110?q=4	46	magnis dis parturient montes, nascetur	2022-08-07 15:45:44	40
48	https://instagram.com/sub?gi=100	71	est. Mauris eu turpis. Nulla	2022-03-07 00:22:20	41
49	http://whatsapp.com/sub/cars?q=0	80	tincidunt orci quis lectus. Nullam	2023-09-03 15:04:46	32
50	http://netflix.com/settings?search=1	15	lectus convallis est, vitae sodales	2023-09-03 01:09:10	16
51	https://youtube.com/en-ca?ab=441&aad=2	73	non, luctus sit amet, faucibus	2022-12-28 20:25:58	3
52	https://youtube.com/sub/cars?page=1&offset=1	83	Quisque fringilla euismod enim. Etiam	2021-10-25 02:46:17	7
53	http://cnn.com/fr?page=1&offset=1	42	Phasellus fermentum convallis ligula. Donec	2022-10-17 13:23:19	27
54	http://netflix.com/group/9?page=1&offset=1	25	convallis, ante lectus convallis est,	2022-09-16 19:17:06	49
55	http://instagram.com/settings?q=test	47	turpis non enim. Mauris quis	2022-07-11 21:40:57	13
56	http://naver.com/sub?g=1	33	lobortis, nisi nibh lacinia orci,	2023-02-04 10:50:11	20
57	http://facebook.com/sub?p=8	84	nec ligula consectetuer rhoncus. Nullam	2021-10-02 00:23:32	24
58	https://wikipedia.org/en-us?search=1	34	elit, pellentesque a, facilisis non,	2023-07-12 10:30:00	9
59	http://yahoo.com/en-ca?q=0	96	arcu. Vivamus sit amet risus.	2023-02-05 02:32:38	47
60	https://walmart.com/one?q=11	45	felis purus ac tellus. Suspendisse	2022-12-28 16:19:28	7
61	https://reddit.com/en-us?search=1&q=de	42	a, dui. Cras pellentesque. Sed	2021-11-19 14:53:29	23
62	http://baidu.com/sub?gi=100	74	iaculis nec, eleifend non, dapibus	2022-07-11 18:03:53	13
63	https://guardian.co.uk/group/9?q=test	89	augue ac ipsum. Phasellus vitae	2021-10-23 18:58:12	50
64	https://reddit.com/fr?ab=441&aad=2	90	aliquam arcu. Aliquam ultrices iaculis	2021-12-02 01:45:53	9
65	https://zoom.us/sub?q=0	40	sapien. Nunc pulvinar arcu et	2023-03-23 01:48:34	48
66	https://walmart.com/one?str=se	63	libero mauris, aliquam eu, accumsan	2023-07-12 22:24:00	14
67	http://instagram.com/user/110?q=0	48	elit, dictum eu, eleifend nec,	2022-09-01 06:21:42	28
68	https://wikipedia.org/user/110?p=8	18	accumsan convallis, ante lectus convallis	2023-08-29 00:28:03	19
69	https://whatsapp.com/en-ca?ad=115	89	nunc. Quisque ornare tortor at	2022-10-22 21:08:28	35
70	https://instagram.com/en-us?q=test	24	lobortis quis, pede. Suspendisse dui.	2022-10-08 18:08:25	46
71	https://twitter.com/fr?str=se	85	risus. Duis a mi fringilla	2023-02-03 15:51:58	1
72	http://zoom.us/en-ca?page=1&offset=1	69	tempor lorem, eget mollis lectus	2023-01-20 01:02:43	13
73	https://naver.com/en-ca?p=8	53	nunc ac mattis ornare, lectus	2022-05-18 22:11:31	47
74	http://naver.com/fr?k=0	59	aliquam iaculis, lacus pede sagittis	2022-06-14 10:04:25	5
75	http://instagram.com/sub/cars?str=se	57	senectus et netus et malesuada	2023-03-03 09:58:36	23
76	http://whatsapp.com/en-ca?g=1	66	neque sed dictum eleifend, nunc	2023-09-16 00:12:52	37
77	http://netflix.com/en-us?ad=115	73	ultrices posuere cubilia Curae Donec	2021-10-03 23:05:46	41
78	https://netflix.com/settings?gi=100	58	sed dui. Fusce aliquam, enim	2023-03-23 22:50:49	33
79	https://ebay.com/sub?client=g	85	Fusce dolor quam, elementum at,	2022-11-02 19:48:01	8
80	https://naver.com/one?str=se	71	tristique neque venenatis lacus. Etiam	2022-05-07 17:07:44	20
81	https://guardian.co.uk/user/110?client=g	4	libero mauris, aliquam eu, accumsan	2022-02-06 12:42:55	12
82	https://reddit.com/user/110?q=test	66	ut, pellentesque eget, dictum placerat,	2022-04-14 04:48:34	32
83	http://reddit.com/fr?gi=100	64	magna sed dui. Fusce aliquam,	2022-01-16 20:53:41	11
84	http://guardian.co.uk/fr?p=8	85	nibh. Quisque nonummy ipsum non	2022-06-20 07:02:30	23
85	http://wikipedia.org/settings?ab=441&aad=2	18	tempor lorem, eget mollis lectus	2022-11-21 13:30:28	28
86	http://bbc.co.uk/group/9?q=11	33	Aliquam adipiscing lobortis risus. In	2022-08-01 07:17:49	13
87	https://baidu.com/fr?search=1&q=de	26	magnis dis parturient montes, nascetur	2022-01-25 11:18:28	16
88	https://instagram.com/user/110?str=se	59	malesuada id, erat. Etiam vestibulum	2023-07-15 04:30:44	17
89	https://cnn.com/en-ca?q=test	96	orci luctus et ultrices posuere	2022-05-21 06:26:47	35
90	https://walmart.com/settings?ad=115	94	eu, odio. Phasellus at augue	2021-11-19 08:47:37	18
91	https://zoom.us/sub?g=1	69	Pellentesque ut ipsum ac mi	2022-09-17 01:29:58	15
92	http://reddit.com/one?str=se	37	a, arcu. Sed et libero.	2023-05-13 15:52:48	1
93	https://twitter.com/fr?page=1&offset=1	97	dolor sit amet, consectetuer adipiscing	2021-11-29 02:38:15	46
94	https://pinterest.com/sub?q=test	77	neque. Nullam ut nisi a	2022-01-01 08:25:56	32
95	https://walmart.com/one?ab=441&aad=2	7	et, magna. Praesent interdum ligula	2022-08-27 22:43:24	25
96	https://zoom.us/en-us?client=g	98	hendrerit id, ante. Nunc mauris	2022-10-11 18:48:34	6
97	http://ebay.com/sub/cars?p=8	24	penatibus et magnis dis parturient	2022-10-02 16:48:13	9
98	https://wikipedia.org/fr?search=1	77	pede. Praesent eu dui. Cum	2022-06-18 05:56:58	22
99	http://guardian.co.uk/fr?client=g	24	dolor egestas rhoncus. Proin nisl	2021-10-10 14:02:45	42
100	http://zoom.us/user/110?page=1&offset=1	46	Integer sem elit, pharetra ut,	2022-11-03 07:42:55	32
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 10, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

