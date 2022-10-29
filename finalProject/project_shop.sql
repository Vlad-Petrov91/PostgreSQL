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

--
-- Name: count_of_user_orders(integer); Type: FUNCTION; Schema: public; Owner: gb_user
--

CREATE FUNCTION public.count_of_user_orders(id integer) RETURNS bigint
    LANGUAGE sql
    AS $$
SELECT COUNT(*)
FROM orders
WHERE user_id = id;
$$;


ALTER FUNCTION public.count_of_user_orders(id integer) OWNER TO gb_user;

--
-- Name: update_product_description_trigger(); Type: FUNCTION; Schema: public; Owner: gb_user
--

CREATE FUNCTION public.update_product_description_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE count INTEGER;
BEGIN
count := (SELECT description FROM products WHERE count = NEW.count);
IF NEW.count = 0 THEN
NEW.description = "The product is over";
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_product_description_trigger() OWNER TO gb_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    user_id integer NOT NULL,
    products_and_quantity json[],
    price double precision
);


ALTER TABLE public.baskets OWNER TO gb_user;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO gb_user;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(250) NOT NULL
);


ALTER TABLE public.categories OWNER TO gb_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO gb_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: delivery_methods; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.delivery_methods (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(250) NOT NULL
);


ALTER TABLE public.delivery_methods OWNER TO gb_user;

--
-- Name: delivery_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.delivery_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_methods_id_seq OWNER TO gb_user;

--
-- Name: delivery_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.delivery_methods_id_seq OWNED BY public.delivery_methods.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.images (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.images OWNER TO gb_user;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO gb_user;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: images_of_reviews; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.images_of_reviews (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.images_of_reviews OWNER TO gb_user;

--
-- Name: images_of_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.images_of_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_of_reviews_id_seq OWNER TO gb_user;

--
-- Name: images_of_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.images_of_reviews_id_seq OWNED BY public.images_of_reviews.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    category_id integer NOT NULL,
    description character varying(250) NOT NULL,
    count integer,
    images_id integer NOT NULL,
    average_rating double precision,
    added_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products OWNER TO gb_user;

--
-- Name: largest_number_of_products; Type: VIEW; Schema: public; Owner: gb_user
--

CREATE VIEW public.largest_number_of_products AS
 SELECT categories.name AS category,
    products.name AS product,
    products.count
   FROM (public.categories
     LEFT JOIN public.products ON ((categories.id = products.category_id)))
  ORDER BY products.count DESC
 LIMIT 10;


ALTER TABLE public.largest_number_of_products OWNER TO gb_user;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    products_and_quantity json[],
    price double precision,
    delivery_method_id integer NOT NULL,
    payment_method_id integer NOT NULL,
    shop_id integer NOT NULL,
    completed boolean,
    added_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO gb_user;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO gb_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    description character varying(250) NOT NULL,
    requisites character varying(250)
);


ALTER TABLE public.payment_methods OWNER TO gb_user;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO gb_user;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO gb_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_of_category; Type: VIEW; Schema: public; Owner: gb_user
--

CREATE VIEW public.products_of_category AS
 SELECT products.id,
    products.name,
    products.count
   FROM (public.products
     LEFT JOIN public.categories ON ((products.category_id = categories.id)))
  WHERE ((categories.name)::text = 'Cras Limited'::text);


ALTER TABLE public.products_of_category OWNER TO gb_user;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    text character varying(500),
    rating integer,
    images_id integer NOT NULL,
    added_at timestamp without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO gb_user;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO gb_user;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.shops (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    address character varying(250) NOT NULL,
    opening_hors character varying(100) NOT NULL
);


ALTER TABLE public.shops OWNER TO gb_user;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.shops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO gb_user;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(250) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
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
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: delivery_methods id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.delivery_methods ALTER COLUMN id SET DEFAULT nextval('public.delivery_methods_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: images_of_reviews id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images_of_reviews ALTER COLUMN id SET DEFAULT nextval('public.images_of_reviews_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.baskets (id, user_id, products_and_quantity, price) FROM stdin;
1	83	{"{\\"product_id\\" : 59, \\"count\\" : 11}","{\\"product_id\\" : 61, \\"count\\" : 6}","{\\"product_id\\" : 75, \\"count\\" : 15}","{\\"product_id\\" : 96, \\"count\\" : 10}"}	842
2	34	{"{\\"product_id\\" : 84, \\"count\\" : 2}","{\\"product_id\\" : 31, \\"count\\" : 10}"}	9477
3	80	{"{\\"product_id\\" : 8, \\"count\\" : 9}","{\\"product_id\\" : 95, \\"count\\" : 12}"}	9603
4	1	{"{\\"product_id\\" : 6, \\"count\\" : 18}","{\\"product_id\\" : 42, \\"count\\" : 9}"}	1166
5	82	{"{\\"product_id\\" : 74, \\"count\\" : 2}","{\\"product_id\\" : 24, \\"count\\" : 6}"}	2640
6	46	{"{\\"product_id\\" : 12, \\"count\\" : 17}","{\\"product_id\\" : 37, \\"count\\" : 9}"}	5270
7	7	{"{\\"product_id\\" : 35, \\"count\\" : 1}","{\\"product_id\\" : 30, \\"count\\" : 10}"}	7978
8	10	{"{\\"product_id\\" : 73, \\"count\\" : 14}","{\\"product_id\\" : 62, \\"count\\" : 17}"}	2343
9	64	{"{\\"product_id\\" : 58, \\"count\\" : 1}","{\\"product_id\\" : 19, \\"count\\" : 8}"}	3971
10	56	{"{\\"product_id\\" : 70, \\"count\\" : 11}","{\\"product_id\\" : 39, \\"count\\" : 17}"}	3454
11	96	{"{\\"product_id\\" : 53, \\"count\\" : 2}","{\\"product_id\\" : 28, \\"count\\" : 19}"}	4222
12	97	{"{\\"product_id\\" : 51, \\"count\\" : 8}","{\\"product_id\\" : 98, \\"count\\" : 2}"}	316
13	70	{"{\\"product_id\\" : 39, \\"count\\" : 1}","{\\"product_id\\" : 12, \\"count\\" : 10}"}	260
14	59	{"{\\"product_id\\" : 62, \\"count\\" : 9}","{\\"product_id\\" : 81, \\"count\\" : 12}"}	1989
15	75	{"{\\"product_id\\" : 53, \\"count\\" : 15}","{\\"product_id\\" : 77, \\"count\\" : 19}"}	8108
16	12	{"{\\"product_id\\" : 47, \\"count\\" : 8}","{\\"product_id\\" : 88, \\"count\\" : 18}"}	539
17	67	{"{\\"product_id\\" : 94, \\"count\\" : 11}","{\\"product_id\\" : 58, \\"count\\" : 6}"}	9434
18	98	{"{\\"product_id\\" : 4, \\"count\\" : 10}","{\\"product_id\\" : 67, \\"count\\" : 3}"}	9599
19	63	{"{\\"product_id\\" : 4, \\"count\\" : 11}","{\\"product_id\\" : 63, \\"count\\" : 16}"}	3717
20	9	{"{\\"product_id\\" : 3, \\"count\\" : 17}","{\\"product_id\\" : 99, \\"count\\" : 13}"}	7200
21	95	{"{\\"product_id\\" : 95, \\"count\\" : 9}","{\\"product_id\\" : 5, \\"count\\" : 4}"}	5704
22	6	{"{\\"product_id\\" : 3, \\"count\\" : 12}","{\\"product_id\\" : 26, \\"count\\" : 3}"}	7029
23	17	{"{\\"product_id\\" : 2, \\"count\\" : 8}","{\\"product_id\\" : 38, \\"count\\" : 10}"}	3032
24	54	{"{\\"product_id\\" : 51, \\"count\\" : 2}","{\\"product_id\\" : 34, \\"count\\" : 13}"}	162
25	6	{"{\\"product_id\\" : 37, \\"count\\" : 0}","{\\"product_id\\" : 27, \\"count\\" : 19}"}	2304
26	30	{"{\\"product_id\\" : 20, \\"count\\" : 6}","{\\"product_id\\" : 19, \\"count\\" : 15}"}	6899
27	59	{"{\\"product_id\\" : 98, \\"count\\" : 12}","{\\"product_id\\" : 49, \\"count\\" : 10}"}	8973
28	17	{"{\\"product_id\\" : 43, \\"count\\" : 19}","{\\"product_id\\" : 98, \\"count\\" : 13}"}	7552
29	92	{"{\\"product_id\\" : 41, \\"count\\" : 3}","{\\"product_id\\" : 49, \\"count\\" : 12}"}	4846
30	10	{"{\\"product_id\\" : 82, \\"count\\" : 2}","{\\"product_id\\" : 78, \\"count\\" : 12}"}	7305
31	45	{"{\\"product_id\\" : 40, \\"count\\" : 15}","{\\"product_id\\" : 23, \\"count\\" : 2}"}	5218
32	60	{"{\\"product_id\\" : 44, \\"count\\" : 17}","{\\"product_id\\" : 8, \\"count\\" : 2}"}	9263
33	73	{"{\\"product_id\\" : 85, \\"count\\" : 13}","{\\"product_id\\" : 85, \\"count\\" : 8}"}	5991
34	41	{"{\\"product_id\\" : 85, \\"count\\" : 13}","{\\"product_id\\" : 25, \\"count\\" : 19}"}	9840
35	70	{"{\\"product_id\\" : 56, \\"count\\" : 15}","{\\"product_id\\" : 61, \\"count\\" : 1}"}	9962
36	9	{"{\\"product_id\\" : 30, \\"count\\" : 11}","{\\"product_id\\" : 37, \\"count\\" : 5}"}	4327
37	33	{"{\\"product_id\\" : 8, \\"count\\" : 7}","{\\"product_id\\" : 65, \\"count\\" : 20}"}	4419
38	5	{"{\\"product_id\\" : 54, \\"count\\" : 12}","{\\"product_id\\" : 35, \\"count\\" : 20}"}	1595
39	48	{"{\\"product_id\\" : 78, \\"count\\" : 15}","{\\"product_id\\" : 10, \\"count\\" : 14}"}	835
40	1	{"{\\"product_id\\" : 10, \\"count\\" : 13}","{\\"product_id\\" : 57, \\"count\\" : 12}"}	9117
41	63	{"{\\"product_id\\" : 26, \\"count\\" : 20}","{\\"product_id\\" : 87, \\"count\\" : 2}"}	9490
42	10	{"{\\"product_id\\" : 7, \\"count\\" : 7}","{\\"product_id\\" : 59, \\"count\\" : 8}"}	4607
43	11	{"{\\"product_id\\" : 35, \\"count\\" : 10}","{\\"product_id\\" : 74, \\"count\\" : 10}"}	8177
44	5	{"{\\"product_id\\" : 45, \\"count\\" : 5}","{\\"product_id\\" : 74, \\"count\\" : 18}"}	3610
45	42	{"{\\"product_id\\" : 84, \\"count\\" : 13}","{\\"product_id\\" : 49, \\"count\\" : 14}"}	6397
46	82	{"{\\"product_id\\" : 12, \\"count\\" : 17}","{\\"product_id\\" : 7, \\"count\\" : 0}"}	7375
47	57	{"{\\"product_id\\" : 93, \\"count\\" : 10}","{\\"product_id\\" : 9, \\"count\\" : 8}"}	9932
48	8	{"{\\"product_id\\" : 29, \\"count\\" : 4}","{\\"product_id\\" : 6, \\"count\\" : 6}"}	5824
49	19	{"{\\"product_id\\" : 11, \\"count\\" : 16}","{\\"product_id\\" : 25, \\"count\\" : 2}"}	3089
50	35	{"{\\"product_id\\" : 79, \\"count\\" : 5}","{\\"product_id\\" : 11, \\"count\\" : 0}"}	8783
51	38	{"{\\"product_id\\" : 95, \\"count\\" : 14}","{\\"product_id\\" : 93, \\"count\\" : 14}"}	4228
52	81	{"{\\"product_id\\" : 49, \\"count\\" : 12}","{\\"product_id\\" : 0, \\"count\\" : 4}"}	4031
53	92	{"{\\"product_id\\" : 61, \\"count\\" : 14}","{\\"product_id\\" : 19, \\"count\\" : 14}"}	9199
54	79	{"{\\"product_id\\" : 14, \\"count\\" : 9}","{\\"product_id\\" : 38, \\"count\\" : 10}"}	7229
55	93	{"{\\"product_id\\" : 46, \\"count\\" : 16}","{\\"product_id\\" : 13, \\"count\\" : 6}"}	6530
56	92	{"{\\"product_id\\" : 22, \\"count\\" : 10}","{\\"product_id\\" : 50, \\"count\\" : 10}"}	463
57	16	{"{\\"product_id\\" : 64, \\"count\\" : 2}","{\\"product_id\\" : 5, \\"count\\" : 10}"}	5051
58	24	{"{\\"product_id\\" : 13, \\"count\\" : 19}","{\\"product_id\\" : 46, \\"count\\" : 11}"}	1685
59	47	{"{\\"product_id\\" : 57, \\"count\\" : 7}","{\\"product_id\\" : 98, \\"count\\" : 1}"}	8287
60	19	{"{\\"product_id\\" : 18, \\"count\\" : 2}","{\\"product_id\\" : 17, \\"count\\" : 5}"}	1413
61	34	{"{\\"product_id\\" : 44, \\"count\\" : 13}","{\\"product_id\\" : 80, \\"count\\" : 6}"}	2437
62	80	{"{\\"product_id\\" : 40, \\"count\\" : 13}","{\\"product_id\\" : 75, \\"count\\" : 17}"}	4803
63	10	{"{\\"product_id\\" : 76, \\"count\\" : 2}","{\\"product_id\\" : 31, \\"count\\" : 19}"}	1941
64	39	{"{\\"product_id\\" : 8, \\"count\\" : 8}","{\\"product_id\\" : 54, \\"count\\" : 8}"}	4949
65	24	{"{\\"product_id\\" : 82, \\"count\\" : 2}","{\\"product_id\\" : 8, \\"count\\" : 14}"}	4644
66	29	{"{\\"product_id\\" : 26, \\"count\\" : 11}","{\\"product_id\\" : 32, \\"count\\" : 12}"}	2917
67	68	{"{\\"product_id\\" : 52, \\"count\\" : 12}","{\\"product_id\\" : 46, \\"count\\" : 17}"}	5801
68	84	{"{\\"product_id\\" : 11, \\"count\\" : 8}","{\\"product_id\\" : 41, \\"count\\" : 11}"}	5858
69	42	{"{\\"product_id\\" : 87, \\"count\\" : 17}","{\\"product_id\\" : 61, \\"count\\" : 0}"}	4328
70	76	{"{\\"product_id\\" : 72, \\"count\\" : 16}","{\\"product_id\\" : 85, \\"count\\" : 3}"}	9535
71	7	{"{\\"product_id\\" : 7, \\"count\\" : 15}","{\\"product_id\\" : 34, \\"count\\" : 20}"}	3675
72	69	{"{\\"product_id\\" : 80, \\"count\\" : 11}","{\\"product_id\\" : 72, \\"count\\" : 8}"}	2743
73	43	{"{\\"product_id\\" : 1, \\"count\\" : 3}","{\\"product_id\\" : 31, \\"count\\" : 17}"}	7992
74	40	{"{\\"product_id\\" : 56, \\"count\\" : 7}","{\\"product_id\\" : 38, \\"count\\" : 14}"}	5792
75	99	{"{\\"product_id\\" : 88, \\"count\\" : 9}","{\\"product_id\\" : 53, \\"count\\" : 2}"}	6714
76	14	{"{\\"product_id\\" : 65, \\"count\\" : 3}","{\\"product_id\\" : 56, \\"count\\" : 7}"}	1829
77	32	{"{\\"product_id\\" : 33, \\"count\\" : 12}","{\\"product_id\\" : 29, \\"count\\" : 10}"}	4408
78	73	{"{\\"product_id\\" : 82, \\"count\\" : 4}","{\\"product_id\\" : 14, \\"count\\" : 2}"}	5165
79	77	{"{\\"product_id\\" : 100, \\"count\\" : 10}","{\\"product_id\\" : 71, \\"count\\" : 6}"}	4193
80	87	{"{\\"product_id\\" : 85, \\"count\\" : 1}","{\\"product_id\\" : 90, \\"count\\" : 15}"}	8241
81	46	{"{\\"product_id\\" : 12, \\"count\\" : 8}","{\\"product_id\\" : 9, \\"count\\" : 17}"}	2935
82	49	{"{\\"product_id\\" : 35, \\"count\\" : 11}","{\\"product_id\\" : 33, \\"count\\" : 9}"}	9108
83	54	{"{\\"product_id\\" : 93, \\"count\\" : 3}","{\\"product_id\\" : 34, \\"count\\" : 11}"}	802
84	38	{"{\\"product_id\\" : 49, \\"count\\" : 7}","{\\"product_id\\" : 40, \\"count\\" : 10}"}	2544
85	16	{"{\\"product_id\\" : 73, \\"count\\" : 4}","{\\"product_id\\" : 2, \\"count\\" : 11}"}	9190
86	65	{"{\\"product_id\\" : 65, \\"count\\" : 16}","{\\"product_id\\" : 55, \\"count\\" : 0}"}	2510
87	78	{"{\\"product_id\\" : 3, \\"count\\" : 15}","{\\"product_id\\" : 25, \\"count\\" : 19}"}	7657
88	23	{"{\\"product_id\\" : 53, \\"count\\" : 18}","{\\"product_id\\" : 45, \\"count\\" : 18}"}	6867
89	9	{"{\\"product_id\\" : 69, \\"count\\" : 7}","{\\"product_id\\" : 54, \\"count\\" : 6}"}	2781
90	96	{"{\\"product_id\\" : 38, \\"count\\" : 7}","{\\"product_id\\" : 17, \\"count\\" : 3}"}	1963
91	94	{"{\\"product_id\\" : 18, \\"count\\" : 11}","{\\"product_id\\" : 83, \\"count\\" : 2}"}	1136
92	68	{"{\\"product_id\\" : 4, \\"count\\" : 19}","{\\"product_id\\" : 22, \\"count\\" : 4}"}	2224
93	45	{"{\\"product_id\\" : 53, \\"count\\" : 12}","{\\"product_id\\" : 12, \\"count\\" : 4}"}	2859
94	50	{"{\\"product_id\\" : 58, \\"count\\" : 6}","{\\"product_id\\" : 54, \\"count\\" : 6}"}	3691
95	24	{"{\\"product_id\\" : 23, \\"count\\" : 4}","{\\"product_id\\" : 23, \\"count\\" : 2}"}	8716
96	72	{"{\\"product_id\\" : 19, \\"count\\" : 4}","{\\"product_id\\" : 89, \\"count\\" : 19}"}	3750
97	66	{"{\\"product_id\\" : 17, \\"count\\" : 3}","{\\"product_id\\" : 75, \\"count\\" : 17}"}	9101
98	23	{"{\\"product_id\\" : 96, \\"count\\" : 12}","{\\"product_id\\" : 90, \\"count\\" : 19}"}	8259
99	88	{"{\\"product_id\\" : 85, \\"count\\" : 4}","{\\"product_id\\" : 14, \\"count\\" : 8}"}	1383
100	57	{"{\\"product_id\\" : 53, \\"count\\" : 15}","{\\"product_id\\" : 44, \\"count\\" : 7}"}	6736
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.categories (id, name, description) FROM stdin;
1	Tempus Lorem Fringilla Corporation	magna. Praesent interdum
2	Molestie Pharetra Nibh Ltd	Nunc ut erat. Sed nunc est, mollis non,
3	Amet Ornare Lectus Institute	taciti
4	Convallis Ligula Limited	et magnis dis parturient montes,
5	Cras Limited	porttitor vulputate, posuere vulputate, lacus.
6	Et Magnis Dis Ltd	tellus. Suspendisse sed dolor.
7	Aenean Eget Magna Associates	dictum ultricies ligula. Nullam
8	Quisque Industries	Phasellus in felis. Nulla tempor augue ac
9	In Institute	nisi magna sed dui. Fusce aliquam, enim nec
10	Non Quam Corporation	interdum. Sed auctor odio a purus. Duis elementum, dui quis
11	Quam Curabitur Corporation	sociosqu ad litora torquent per
12	Sed Sem Associates	vitae, aliquet nec, imperdiet
13	Aliquet Diam Incorporated	Integer vitae nibh. Donec est mauris, rhoncus id,
14	In Industries	orci. Ut
15	Feugiat Metus Ltd	fames ac turpis
16	Dolor Sit Amet Foundation	in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula
17	Ad Foundation	aliquam iaculis, lacus pede
18	Rutrum PC	eros non enim commodo
19	Praesent Industries	a ultricies adipiscing, enim mi tempor lorem, eget mollis
20	Velit Industries	non, sollicitudin a, malesuada id,
21	Dis Parturient Ltd	tincidunt dui augue eu tellus. Phasellus elit
22	Aliquam Adipiscing Incorporated	gravida sit amet, dapibus id, blandit
23	Ante Vivamus Inc.	nascetur ridiculus mus. Donec dignissim magna a
24	Odio Semper Incorporated	fringilla ornare placerat, orci lacus vestibulum lorem, sit amet
25	Pellentesque A Limited	arcu. Morbi sit amet massa.
\.


--
-- Data for Name: delivery_methods; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.delivery_methods (id, name, description) FROM stdin;
1	Hendrerit Id Ante Ltd	id nunc interdum feugiat. Sed nec metus
2	Elit Nulla Foundation	Suspendisse dui. Fusce diam nunc, ullamcorper eu,
3	Magnis Dis Parturient Consulting	in lobortis tellus justo sit amet nulla.
4	Eleifend Egestas Ltd	convallis ligula. Donec luctus aliquet odio. Etiam
5	Massa Mauris Vestibulum PC	ligula. Nullam enim. Sed nulla ante, iaculis
6	Nec Mollis Vitae Associates	placerat, augue. Sed molestie. Sed id risus
7	Eget Nisi Associates	pharetra. Quisque ac libero nec ligula consectetuer
8	Nascetur Ridiculus Incorporated	elementum sem, vitae aliquam eros turpis non
9	Amet Diam Eu LLC	libero at auctor ullamcorper, nisl arcu iaculis
10	Commodo Hendrerit Company	tellus, imperdiet non, vestibulum nec, euismod in,
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.images (id, url, description, uploaded_at, size) FROM stdin;
1	https://zoom.us/fr?g=1	gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis	2022-11-16 22:07:06	18
2	https://youtube.com/user/110?gi=100	sed sem	2023-02-08 01:44:22	2
3	https://netflix.com/en-us?search=1&q=de	amet, risus. Donec	2023-04-25 15:52:21	12
4	http://google.com/site?gi=100	ante ipsum primis in faucibus orci luctus et ultrices	2022-08-31 22:33:37	6
5	https://baidu.com/site?page=1&offset=1	tempor arcu. Vestibulum ut eros non enim	2023-09-30 21:44:24	15
6	https://pinterest.com/sub?p=8	et netus et malesuada fames ac turpis	2022-01-31 06:12:18	24
7	http://cnn.com/one?ad=115	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.	2023-06-11 17:46:36	22
8	https://wikipedia.org/sub/cars?gi=100	magnis dis parturient	2022-10-03 19:10:09	25
9	http://cnn.com/one?search=1	Quisque libero	2023-05-24 09:45:46	14
10	http://instagram.com/sub?search=1	varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla	2023-05-14 20:26:25	4
11	https://yahoo.com/fr?search=1&q=de	libero. Integer in	2023-01-14 13:24:52	10
12	http://whatsapp.com/en-ca?search=1&q=de	tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,	2022-04-09 03:55:15	6
13	https://facebook.com/user/110?str=se	nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit	2023-10-05 15:08:06	3
14	http://whatsapp.com/site?p=8	sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit	2022-06-27 00:08:52	17
15	http://reddit.com/sub/cars?q=11	ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum.	2023-01-26 11:38:50	8
16	http://facebook.com/en-us?ad=115	feugiat non,	2022-06-13 00:42:45	19
17	http://naver.com/fr?k=0	eget odio. Aliquam	2023-01-28 20:01:04	12
18	https://twitter.com/sub/cars?q=4	parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	2022-06-26 01:45:37	8
19	https://reddit.com/en-ca?page=1&offset=1	tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla	2022-11-14 11:32:47	7
20	https://baidu.com/settings?q=11	sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in	2022-04-26 14:13:06	21
21	https://reddit.com/sub/cars?ab=441&aad=2	nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	2022-08-31 14:51:04	6
22	https://yahoo.com/en-us?q=0	penatibus et magnis dis parturient montes, nascetur	2022-08-05 11:21:00	18
23	http://twitter.com/en-ca?q=11	nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc	2023-02-22 02:46:15	12
24	https://cnn.com/en-ca?page=1&offset=1	hendrerit consectetuer, cursus et, magna.	2022-08-21 11:46:43	10
25	https://youtube.com/settings?gi=100	Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec	2022-05-05 15:49:58	8
26	https://youtube.com/en-ca?q=11	et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit	2021-11-15 15:32:29	21
27	http://nytimes.com/one?p=8	Aenean eget metus. In nec orci. Donec nibh. Quisque	2023-06-26 21:45:03	10
28	http://ebay.com/settings?ad=115	est. Mauris eu turpis. Nulla aliquet. Proin velit.	2023-02-13 09:28:23	15
29	http://baidu.com/user/110?search=1&q=de	nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim	2022-02-03 18:15:59	20
30	http://google.com/en-ca?search=1	libero est, congue a, aliquet vel, vulputate eu,	2023-07-11 07:13:12	22
31	http://yahoo.com/sub?client=g	a, malesuada id, erat. Etiam vestibulum massa rutrum	2022-06-02 06:55:21	9
32	http://youtube.com/settings?k=0	enim. Nunc ut erat. Sed nunc est, mollis non, cursus	2023-10-03 00:42:56	17
33	https://naver.com/site?search=1&q=de	imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit	2023-10-24 02:24:33	18
34	http://bbc.co.uk/one?k=0	per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus	2022-03-22 21:06:49	21
35	https://facebook.com/sub?client=g	ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.	2023-10-22 18:45:02	3
36	http://twitter.com/site?gi=100	vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.	2023-09-08 14:08:13	9
37	https://wikipedia.org/en-us?k=0	ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie	2022-12-19 14:44:19	15
38	http://baidu.com/sub?gi=100	montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla	2023-04-19 19:36:18	14
39	https://pinterest.com/en-us?search=1	et netus et	2023-08-14 19:21:45	24
40	https://facebook.com/group/9?q=test	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.	2023-06-16 22:03:36	18
41	http://whatsapp.com/one?str=se	nec metus facilisis lorem tristique aliquet.	2022-12-21 18:40:46	16
42	http://youtube.com/sub/cars?search=1	faucibus ut, nulla.	2023-02-16 04:42:47	23
43	https://cnn.com/en-ca?ad=115	non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam	2022-06-09 15:29:29	21
44	https://walmart.com/group/9?q=0	cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut,	2023-01-01 22:01:57	10
45	http://youtube.com/en-ca?q=test	Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie	2022-08-28 16:01:05	24
46	https://wikipedia.org/en-ca?q=4	est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum	2022-11-04 03:35:07	9
47	http://baidu.com/en-ca?str=se	auctor, nunc	2022-04-24 16:40:09	2
48	https://cnn.com/user/110?p=8	Nullam suscipit, est ac facilisis facilisis, magna tellus	2022-04-06 05:51:50	24
49	https://walmart.com/sub/cars?q=0	sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet,	2023-05-13 14:20:04	17
50	https://youtube.com/fr?q=11	justo. Praesent luctus. Curabitur egestas	2022-03-05 23:53:50	22
51	https://google.com/en-us?client=g	lacus. Nulla tincidunt, neque vitae semper egestas,	2023-07-21 17:35:14	22
52	http://google.com/sub/cars?p=8	placerat velit.	2022-10-15 00:52:45	23
53	https://twitter.com/fr?q=4	dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed	2023-05-24 12:14:31	15
54	https://yahoo.com/en-ca?ab=441&aad=2	nec tellus. Nunc lectus pede, ultrices	2022-05-19 15:20:09	14
55	http://whatsapp.com/user/110?g=1	ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi	2023-08-23 23:41:23	9
56	https://bbc.co.uk/user/110?q=11	bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus	2021-11-15 11:08:01	7
57	http://reddit.com/sub?client=g	mollis. Integer	2022-03-19 02:53:25	6
58	http://pinterest.com/site?gi=100	vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie	2023-03-05 16:51:20	16
59	https://zoom.us/settings?q=test	ut, nulla. Cras eu tellus	2023-05-07 19:48:16	2
60	http://whatsapp.com/sub?gi=100	aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel,	2022-01-20 22:31:54	21
61	https://ebay.com/one?k=0	tincidunt. Donec vitae erat vel	2023-03-10 02:38:29	4
62	https://guardian.co.uk/sub?q=0	erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et	2022-10-14 22:38:08	8
63	https://guardian.co.uk/en-us?g=1	pellentesque massa lobortis ultrices.	2022-08-19 00:09:38	12
64	http://youtube.com/en-ca?q=11	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a,	2022-08-07 15:27:09	11
65	http://walmart.com/settings?g=1	nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac,	2022-01-04 19:23:43	7
66	https://cnn.com/user/110?search=1&q=de	consequat enim diam vel arcu. Curabitur ut odio vel est	2023-03-23 18:51:50	7
67	https://youtube.com/sub/cars?p=8	ac ipsum. Phasellus	2023-10-15 18:24:13	9
68	http://youtube.com/site?gi=100	Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam	2022-06-19 11:05:31	8
69	http://ebay.com/user/110?search=1&q=de	id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet	2023-02-05 22:08:11	6
70	https://twitter.com/sub/cars?q=test	nunc. Quisque ornare tortor at risus. Nunc	2022-06-29 10:41:46	25
71	https://baidu.com/site?q=0	eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo	2023-07-14 18:40:59	19
72	https://yahoo.com/settings?search=1	id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent	2022-03-01 07:49:28	19
73	https://netflix.com/settings?k=0	nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec	2022-01-07 01:01:55	7
74	http://google.com/site?g=1	convallis convallis	2023-08-03 10:31:40	17
75	https://netflix.com/site?ab=441&aad=2	Donec est mauris, rhoncus id,	2021-12-10 02:17:16	1
76	http://youtube.com/group/9?q=11	ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis	2022-03-15 13:59:35	12
77	http://facebook.com/en-ca?search=1	dui, nec tempus mauris erat eget ipsum.	2023-07-15 14:49:41	21
78	http://twitter.com/sub/cars?search=1&q=de	lorem, sit amet ultricies sem magna nec quam.	2023-05-18 16:14:54	7
79	https://netflix.com/site?search=1&q=de	malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut	2023-02-14 06:47:53	9
80	https://cnn.com/user/110?search=1	non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.	2023-02-15 00:55:36	21
81	http://google.com/one?q=11	neque pellentesque massa lobortis	2022-04-23 04:34:43	19
82	https://instagram.com/sub?search=1&q=de	lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel	2022-08-07 03:51:39	20
83	http://bbc.co.uk/one?str=se	Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut	2022-09-02 20:53:57	6
84	https://bbc.co.uk/fr?q=test	libero est, congue a, aliquet	2023-08-27 08:06:34	12
85	https://wikipedia.org/fr?gi=100	dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.	2022-05-02 06:11:08	8
86	https://netflix.com/one?k=0	tristique senectus et netus et malesuada fames ac turpis	2022-07-17 23:21:54	11
87	http://netflix.com/fr?client=g	eget odio.	2022-06-17 20:21:02	15
88	https://wikipedia.org/settings?page=1&offset=1	est. Nunc	2022-05-11 03:18:06	23
89	http://naver.com/sub?search=1	lectus rutrum urna,	2023-04-30 08:12:20	9
90	https://zoom.us/fr?q=0	posuere at, velit. Cras lorem lorem,	2022-05-28 18:03:59	1
91	https://pinterest.com/en-ca?ab=441&aad=2	Proin vel arcu	2022-11-23 23:08:20	12
92	http://ebay.com/one?k=0	purus, in molestie tortor nibh sit amet orci. Ut sagittis	2022-08-05 21:34:54	24
93	https://bbc.co.uk/en-ca?p=8	nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus.	2022-01-30 03:52:11	3
94	https://ebay.com/en-ca?str=se	libero. Integer in magna.	2023-03-21 21:09:28	25
95	http://facebook.com/group/9?k=0	ipsum sodales purus, in molestie tortor nibh sit amet orci.	2023-02-15 22:46:50	17
96	http://yahoo.com/fr?g=1	Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc	2023-01-10 11:58:52	22
97	https://naver.com/group/9?q=0	ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis	2022-05-30 09:29:45	6
98	https://wikipedia.org/sub/cars?ab=441&aad=2	urna. Nullam lobortis quam a felis ullamcorper viverra.	2022-12-25 23:56:30	20
99	https://twitter.com/one?search=1&q=de	luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue.	2022-05-28 16:25:06	11
100	http://facebook.com/one?k=0	ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus	2022-01-11 11:12:43	25
\.


--
-- Data for Name: images_of_reviews; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.images_of_reviews (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	http://wikipedia.org/settings?client=g	69	ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque	2022-05-29 03:36:30	3
2	http://twitter.com/en-ca?q=0	19	nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a,	2023-08-28 02:05:19	7
3	https://facebook.com/sub?q=test	56	odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla.	2023-01-10 05:06:02	4
4	http://naver.com/sub/cars?str=se	31	Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt	2022-07-16 03:40:18	7
5	http://whatsapp.com/sub?q=11	57	sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non,	2022-10-17 20:17:31	1
6	https://zoom.us/group/9?client=g	37	aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat	2023-10-03 06:57:07	6
7	https://zoom.us/en-ca?gi=100	60	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique	2023-10-08 16:17:38	4
8	https://cnn.com/user/110?q=test	65	nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.	2023-04-18 03:08:42	5
9	https://reddit.com/fr?g=1	77	Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris	2022-04-06 01:12:33	7
10	http://reddit.com/group/9?q=test	54	metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,	2023-01-04 19:57:19	1
11	https://netflix.com/fr?g=1	83	ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.	2022-02-09 15:05:44	8
12	http://yahoo.com/site?page=1&offset=1	82	aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt	2022-01-24 06:16:02	9
13	https://baidu.com/one?ad=115	58	varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec	2022-07-09 10:04:25	1
14	http://cnn.com/group/9?search=1&q=de	54	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare.	2022-11-02 13:26:45	8
15	https://yahoo.com/user/110?page=1&offset=1	32	sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero	2023-01-05 08:33:50	9
16	https://yahoo.com/site?str=se	71	ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor	2022-04-06 06:06:33	8
17	http://yahoo.com/settings?q=4	85	nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	2022-01-09 23:46:36	8
18	http://nytimes.com/settings?search=1	93	sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien.	2022-05-18 04:05:00	4
19	http://yahoo.com/sub/cars?q=4	4	nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque	2023-04-25 17:35:26	2
20	http://instagram.com/en-ca?search=1&q=de	93	iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes,	2022-07-25 13:15:22	2
21	http://pinterest.com/sub?q=11	24	convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec	2021-11-23 17:47:19	7
22	http://baidu.com/site?str=se	16	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum	2022-10-05 20:46:18	6
23	http://google.com/fr?client=g	99	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.	2023-06-08 12:34:01	2
24	https://google.com/one?k=0	38	sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient	2022-04-30 22:21:29	7
25	http://baidu.com/site?q=11	98	neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam	2022-03-30 16:07:00	2
26	https://yahoo.com/settings?str=se	48	non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed	2022-06-09 22:59:46	3
27	http://naver.com/user/110?client=g	44	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus.	2022-07-08 20:01:52	2
28	https://pinterest.com/one?q=test	60	Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit	2022-08-01 14:15:15	2
29	http://facebook.com/group/9?q=0	14	dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2023-07-24 01:51:22	9
30	https://yahoo.com/sub?q=0	42	aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac	2022-02-12 10:58:19	8
31	https://cnn.com/fr?page=1&offset=1	22	Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec	2023-10-01 03:10:30	2
32	https://twitter.com/one?str=se	94	eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at,	2022-12-06 04:01:17	6
33	http://wikipedia.org/site?g=1	22	mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	2023-01-25 11:54:42	4
34	https://zoom.us/group/9?ad=115	80	risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque	2022-12-12 16:45:14	6
35	http://yahoo.com/en-us?str=se	23	neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec	2023-01-19 06:03:28	8
36	https://pinterest.com/group/9?g=1	38	diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra	2023-08-04 08:02:04	1
37	https://instagram.com/sub?search=1&q=de	86	Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum	2022-05-23 23:23:08	1
38	https://naver.com/fr?k=0	26	luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum	2023-07-29 10:26:45	6
39	https://reddit.com/en-us?search=1	74	non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.	2023-01-26 00:55:04	5
40	http://walmart.com/settings?str=se	36	in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante	2022-02-09 14:51:02	4
41	http://facebook.com/site?q=4	19	In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat	2023-08-14 18:27:03	1
42	http://youtube.com/group/9?client=g	87	in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget	2023-02-07 08:08:38	5
43	https://ebay.com/sub?q=test	57	ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat	2023-08-28 09:35:52	7
44	https://reddit.com/settings?gi=100	2	Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet	2023-02-11 04:16:59	6
45	https://ebay.com/one?str=se	70	magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus.	2022-10-08 00:31:05	5
46	https://instagram.com/fr?q=0	39	velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id	2021-11-28 00:54:06	1
47	https://bbc.co.uk/settings?gi=100	75	sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis	2021-12-27 02:10:59	6
48	https://youtube.com/settings?gi=100	27	metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor	2022-11-17 22:26:17	3
49	http://ebay.com/en-ca?page=1&offset=1	76	vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec	2022-08-24 14:19:05	10
50	https://whatsapp.com/en-us?str=se	72	a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique	2022-06-11 06:14:28	6
51	https://twitter.com/sub/cars?q=11	8	aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet	2023-07-19 23:18:22	9
52	http://yahoo.com/en-us?p=8	74	aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor	2023-02-09 08:27:58	4
53	https://naver.com/en-ca?str=se	73	dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.	2022-06-12 03:38:07	5
54	http://facebook.com/user/110?q=4	63	risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus	2022-08-12 07:47:20	9
55	http://whatsapp.com/en-ca?search=1&q=de	34	morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a	2023-07-06 15:05:05	7
56	https://facebook.com/settings?search=1	99	nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim,	2021-11-02 21:08:26	5
57	https://facebook.com/settings?ad=115	100	urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	2022-04-03 21:10:39	5
58	https://bbc.co.uk/sub?client=g	15	metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.	2023-05-13 17:02:16	1
59	http://wikipedia.org/fr?g=1	91	lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,	2023-02-26 18:26:10	7
60	https://youtube.com/group/9?search=1	23	interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit,	2023-07-29 10:34:37	7
61	https://cnn.com/settings?search=1&q=de	60	morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.	2022-03-23 16:44:09	9
62	http://guardian.co.uk/en-us?q=4	26	blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat	2023-01-04 00:09:29	6
63	http://youtube.com/fr?ab=441&aad=2	55	dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	2022-06-21 19:30:45	5
64	https://google.com/sub?ad=115	72	dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit	2022-04-07 06:42:12	3
65	https://youtube.com/en-ca?str=se	39	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,	2022-08-22 20:40:08	7
66	https://netflix.com/en-ca?q=4	80	Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis	2022-06-02 11:39:30	7
67	https://guardian.co.uk/user/110?ab=441&aad=2	51	Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.	2023-06-27 01:05:40	3
68	http://facebook.com/en-ca?client=g	23	aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent	2022-10-03 12:55:30	9
69	https://youtube.com/en-us?p=8	89	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac	2022-08-29 17:51:00	5
70	https://twitter.com/one?q=test	5	in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna.	2021-12-29 03:21:31	9
71	https://walmart.com/en-ca?p=8	43	aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.	2023-08-22 00:23:19	5
72	http://twitter.com/fr?search=1&q=de	46	adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet	2022-07-22 03:58:53	5
73	http://zoom.us/site?search=1	37	dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	2022-06-03 13:31:09	2
74	https://zoom.us/sub/cars?ab=441&aad=2	83	ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat.	2023-01-31 23:46:23	2
75	https://netflix.com/fr?str=se	41	adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non	2023-04-10 17:25:22	5
76	https://nytimes.com/sub?client=g	71	porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin	2023-03-01 08:06:29	3
77	http://cnn.com/sub/cars?g=1	49	placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu	2022-03-23 13:44:44	1
78	http://netflix.com/group/9?gi=100	1	sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non,	2022-04-19 08:41:34	10
79	https://google.com/user/110?g=1	83	vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales	2022-05-18 15:03:14	10
80	http://instagram.com/user/110?str=se	35	fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	2022-11-13 22:11:15	6
81	https://cnn.com/en-ca?search=1	67	Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam	2023-08-06 14:16:35	8
82	https://walmart.com/sub?q=4	11	Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor	2023-10-22 04:24:50	8
83	https://naver.com/sub/cars?search=1&q=de	1	sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien	2022-11-27 04:32:04	7
84	https://reddit.com/sub/cars?p=8	23	dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	2022-03-19 14:20:46	4
85	http://youtube.com/settings?k=0	78	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.	2022-11-16 08:33:20	8
86	https://youtube.com/en-ca?search=1&q=de	62	non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis	2022-08-28 09:18:37	7
87	https://ebay.com/en-ca?k=0	68	dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam	2022-05-13 07:29:48	6
88	http://cnn.com/sub?client=g	14	est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse	2022-06-08 16:24:39	5
89	https://wikipedia.org/one?search=1	78	vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.	2023-05-25 06:00:20	3
90	https://ebay.com/fr?gi=100	39	a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque	2023-05-24 18:51:18	6
91	http://pinterest.com/group/9?p=8	12	fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	2023-07-18 11:02:11	6
92	http://wikipedia.org/one?ad=115	21	Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est,	2023-06-21 19:42:57	3
93	http://netflix.com/fr?page=1&offset=1	25	neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse	2023-01-06 04:35:06	2
94	http://netflix.com/en-us?client=g	88	Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla	2023-09-15 17:19:04	10
95	http://whatsapp.com/settings?gi=100	83	lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus	2023-05-27 20:30:11	6
96	http://instagram.com/en-us?q=11	1	blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat	2023-03-29 21:32:55	3
97	https://instagram.com/sub?q=11	72	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam	2021-12-03 05:16:13	5
98	http://zoom.us/sub/cars?q=test	30	posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	2023-03-26 00:15:17	10
99	https://walmart.com/site?page=1&offset=1	99	semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus	2023-10-27 09:02:45	5
100	http://bbc.co.uk/en-us?str=se	77	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum	2023-05-16 05:21:29	4
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.orders (id, user_id, products_and_quantity, price, delivery_method_id, payment_method_id, shop_id, completed, added_at) FROM stdin;
1	48	{"{\\"product_id\\" : 77, \\"count\\" : 19}","{\\"product_id\\" : 66, \\"count\\" : 13}","{\\"product_id\\" : 74, \\"count\\" : 12}"}	2006.93	4	7	65	t	2022-12-20 12:45:23
2	96	{"{\\"product_id\\" : 67, \\"count\\" : 12}","{\\"product_id\\" : 63, \\"count\\" : 19}","{\\"product_id\\" : 47, \\"count\\" : 16}"}	1855.79	9	3	89	f	2022-02-04 15:05:15
3	40	{"{\\"product_id\\" : 23, \\"count\\" : 19}","{\\"product_id\\" : 12, \\"count\\" : 9}","{\\"product_id\\" : 7, \\"count\\" : 10}"}	2023.57	5	9	94	t	2023-01-19 07:01:39
4	75	{"{\\"product_id\\" : 90, \\"count\\" : 5}","{\\"product_id\\" : 24, \\"count\\" : 10}","{\\"product_id\\" : 21, \\"count\\" : 6}"}	2109.75	6	6	35	f	2022-08-30 09:12:48
26	42	{"{\\"product_id\\" : 20, \\"count\\" : 10}","{\\"product_id\\" : 76, \\"count\\" : 18}","{\\"product_id\\" : 45, \\"count\\" : 5}"}	1989.94	6	9	70	t	2023-05-17 14:26:11
27	18	{"{\\"product_id\\" : 28, \\"count\\" : 18}","{\\"product_id\\" : 28, \\"count\\" : 2}","{\\"product_id\\" : 9, \\"count\\" : 8}"}	2040.7	3	7	27	f	2022-10-26 04:12:43
28	27	{"{\\"product_id\\" : 63, \\"count\\" : 19}","{\\"product_id\\" : 52, \\"count\\" : 15}","{\\"product_id\\" : 77, \\"count\\" : 11}"}	1999.69	8	8	67	f	2022-06-04 22:42:42
29	99	{"{\\"product_id\\" : 46, \\"count\\" : 18}","{\\"product_id\\" : 43, \\"count\\" : 3}","{\\"product_id\\" : 61, \\"count\\" : 19}"}	1956.91	2	4	72	f	2022-05-17 12:47:50
30	3	{"{\\"product_id\\" : 99, \\"count\\" : 4}","{\\"product_id\\" : 44, \\"count\\" : 6}","{\\"product_id\\" : 28, \\"count\\" : 5}"}	2085.83	8	1	58	f	2023-09-06 02:32:32
31	69	{"{\\"product_id\\" : 76, \\"count\\" : 16}","{\\"product_id\\" : 1, \\"count\\" : 9}","{\\"product_id\\" : 15, \\"count\\" : 13}"}	2079.34	6	3	78	f	2022-01-11 19:05:19
32	86	{"{\\"product_id\\" : 56, \\"count\\" : 20}","{\\"product_id\\" : 26, \\"count\\" : 11}","{\\"product_id\\" : 54, \\"count\\" : 16}"}	1916.51	9	7	49	f	2022-09-05 11:33:13
33	70	{"{\\"product_id\\" : 96, \\"count\\" : 19}","{\\"product_id\\" : 47, \\"count\\" : 14}","{\\"product_id\\" : 90, \\"count\\" : 16}"}	1975.95	10	8	46	f	2022-08-12 04:09:54
34	32	{"{\\"product_id\\" : 48, \\"count\\" : 15}","{\\"product_id\\" : 33, \\"count\\" : 10}","{\\"product_id\\" : 73, \\"count\\" : 14}"}	1833.73	6	6	44	f	2022-02-05 18:59:28
35	8	{"{\\"product_id\\" : 81, \\"count\\" : 9}","{\\"product_id\\" : 75, \\"count\\" : 17}","{\\"product_id\\" : 19, \\"count\\" : 9}"}	1989.65	6	7	62	f	2022-08-02 02:26:48
36	33	{"{\\"product_id\\" : 32, \\"count\\" : 5}","{\\"product_id\\" : 88, \\"count\\" : 17}","{\\"product_id\\" : 64, \\"count\\" : 5}"}	1822.13	7	2	87	f	2023-06-11 18:42:16
37	39	{"{\\"product_id\\" : 4, \\"count\\" : 10}","{\\"product_id\\" : 34, \\"count\\" : 11}","{\\"product_id\\" : 33, \\"count\\" : 1}"}	1981.81	3	1	11	f	2023-10-24 02:05:14
39	48	{"{\\"product_id\\" : 28, \\"count\\" : 9}","{\\"product_id\\" : 70, \\"count\\" : 18}","{\\"product_id\\" : 70, \\"count\\" : 1}"}	1912.81	7	4	100	t	2022-07-23 20:45:06
40	99	{"{\\"product_id\\" : 11, \\"count\\" : 16}","{\\"product_id\\" : 65, \\"count\\" : 9}","{\\"product_id\\" : 98, \\"count\\" : 9}"}	1924.43	2	5	77	f	2023-02-24 09:33:22
41	19	{"{\\"product_id\\" : 16, \\"count\\" : 1}","{\\"product_id\\" : 35, \\"count\\" : 2}","{\\"product_id\\" : 31, \\"count\\" : 12}"}	2189.12	7	8	98	t	2023-07-26 03:20:15
42	78	{"{\\"product_id\\" : 35, \\"count\\" : 19}","{\\"product_id\\" : 58, \\"count\\" : 14}","{\\"product_id\\" : 8, \\"count\\" : 2}"}	2146.96	9	1	72	t	2022-09-08 14:27:38
43	43	{"{\\"product_id\\" : 90, \\"count\\" : 6}","{\\"product_id\\" : 83, \\"count\\" : 15}","{\\"product_id\\" : 84, \\"count\\" : 5}"}	2157.92	5	5	26	f	2022-05-13 15:07:23
44	51	{"{\\"product_id\\" : 26, \\"count\\" : 5}","{\\"product_id\\" : 16, \\"count\\" : 13}","{\\"product_id\\" : 98, \\"count\\" : 15}"}	2032.04	3	4	64	f	2023-03-16 11:05:10
45	57	{"{\\"product_id\\" : 70, \\"count\\" : 18}","{\\"product_id\\" : 56, \\"count\\" : 15}","{\\"product_id\\" : 74, \\"count\\" : 13}"}	1800.33	6	6	92	f	2022-02-05 00:40:15
46	47	{"{\\"product_id\\" : 20, \\"count\\" : 1}","{\\"product_id\\" : 30, \\"count\\" : 1}","{\\"product_id\\" : 41, \\"count\\" : 18}"}	1905.67	7	1	65	t	2022-02-12 05:21:01
47	17	{"{\\"product_id\\" : 44, \\"count\\" : 6}","{\\"product_id\\" : 18, \\"count\\" : 14}","{\\"product_id\\" : 74, \\"count\\" : 16}"}	2060.37	5	7	14	f	2023-07-15 02:30:40
48	65	{"{\\"product_id\\" : 82, \\"count\\" : 15}","{\\"product_id\\" : 31, \\"count\\" : 12}","{\\"product_id\\" : 8, \\"count\\" : 2}"}	2201.18	3	4	3	t	2023-03-09 16:56:43
49	57	{"{\\"product_id\\" : 46, \\"count\\" : 6}","{\\"product_id\\" : 100, \\"count\\" : 8}","{\\"product_id\\" : 25, \\"count\\" : 8}"}	1987.52	9	3	91	f	2023-04-07 21:40:03
50	94	{"{\\"product_id\\" : 56, \\"count\\" : 8}","{\\"product_id\\" : 87, \\"count\\" : 2}","{\\"product_id\\" : 63, \\"count\\" : 11}"}	2009.27	4	1	7	f	2023-05-10 02:17:23
51	91	{"{\\"product_id\\" : 99, \\"count\\" : 9}","{\\"product_id\\" : 71, \\"count\\" : 7}","{\\"product_id\\" : 99, \\"count\\" : 13}"}	2051.6	6	10	49	t	2021-12-31 17:38:43
52	98	{"{\\"product_id\\" : 49, \\"count\\" : 4}","{\\"product_id\\" : 2, \\"count\\" : 1}","{\\"product_id\\" : 27, \\"count\\" : 15}"}	2170.35	8	6	94	t	2022-09-14 20:34:49
53	41	{"{\\"product_id\\" : 95, \\"count\\" : 8}","{\\"product_id\\" : 94, \\"count\\" : 4}","{\\"product_id\\" : 1, \\"count\\" : 14}"}	2179.78	4	4	91	f	2023-06-27 05:57:41
54	16	{"{\\"product_id\\" : 88, \\"count\\" : 7}","{\\"product_id\\" : 95, \\"count\\" : 11}","{\\"product_id\\" : 63, \\"count\\" : 18}"}	2005.21	2	5	38	f	2021-11-29 00:48:08
55	23	{"{\\"product_id\\" : 96, \\"count\\" : 16}","{\\"product_id\\" : 37, \\"count\\" : 18}","{\\"product_id\\" : 10, \\"count\\" : 15}"}	2282.85	8	7	93	t	2023-02-07 09:35:27
38	44	{"{\\"product_id\\" : 75, \\"count\\" : 14}","{\\"product_id\\" : 53, \\"count\\" : 12}","{\\"product_id\\" : 83, \\"count\\" : 1}"}	1984.37	2	4	85	f	2021-12-27 20:27:07
56	46	{"{\\"product_id\\" : 47, \\"count\\" : 19}","{\\"product_id\\" : 93, \\"count\\" : 8}","{\\"product_id\\" : 0, \\"count\\" : 4}"}	1991.92	5	1	71	t	2022-04-03 20:58:15
57	18	{"{\\"product_id\\" : 95, \\"count\\" : 4}","{\\"product_id\\" : 39, \\"count\\" : 10}","{\\"product_id\\" : 7, \\"count\\" : 17}"}	2052.64	2	8	81	f	2023-08-09 03:09:50
58	23	{"{\\"product_id\\" : 18, \\"count\\" : 5}","{\\"product_id\\" : 64, \\"count\\" : 5}","{\\"product_id\\" : 60, \\"count\\" : 13}"}	2086.11	2	8	4	f	2022-07-10 17:00:43
60	46	{"{\\"product_id\\" : 20, \\"count\\" : 15}","{\\"product_id\\" : 40, \\"count\\" : 15}","{\\"product_id\\" : 75, \\"count\\" : 19}"}	1968.59	10	4	60	f	2023-06-29 19:04:55
61	79	{"{\\"product_id\\" : 36, \\"count\\" : 5}","{\\"product_id\\" : 71, \\"count\\" : 18}","{\\"product_id\\" : 77, \\"count\\" : 10}"}	1767.99	7	3	29	f	2022-05-21 05:27:13
62	64	{"{\\"product_id\\" : 46, \\"count\\" : 6}","{\\"product_id\\" : 4, \\"count\\" : 11}","{\\"product_id\\" : 18, \\"count\\" : 1}"}	1908.66	8	8	41	t	2022-02-17 14:10:16
63	99	{"{\\"product_id\\" : 37, \\"count\\" : 1}","{\\"product_id\\" : 90, \\"count\\" : 6}","{\\"product_id\\" : 39, \\"count\\" : 8}"}	1783.43	3	5	50	t	2022-05-03 17:30:39
64	89	{"{\\"product_id\\" : 30, \\"count\\" : 7}","{\\"product_id\\" : 26, \\"count\\" : 7}","{\\"product_id\\" : 32, \\"count\\" : 6}"}	2088.32	9	7	98	f	2023-05-27 20:10:38
65	36	{"{\\"product_id\\" : 35, \\"count\\" : 19}","{\\"product_id\\" : 18, \\"count\\" : 18}","{\\"product_id\\" : 63, \\"count\\" : 13}"}	1991.65	8	1	5	t	2022-10-16 20:01:07
66	71	{"{\\"product_id\\" : 24, \\"count\\" : 12}","{\\"product_id\\" : 22, \\"count\\" : 10}","{\\"product_id\\" : 24, \\"count\\" : 9}"}	1892.65	8	1	3	t	2021-12-01 04:48:50
67	38	{"{\\"product_id\\" : 8, \\"count\\" : 4}","{\\"product_id\\" : 44, \\"count\\" : 12}","{\\"product_id\\" : 9, \\"count\\" : 9}"}	1815.95	3	2	73	t	2022-01-11 21:57:20
68	49	{"{\\"product_id\\" : 66, \\"count\\" : 17}","{\\"product_id\\" : 13, \\"count\\" : 0}","{\\"product_id\\" : 11, \\"count\\" : 1}"}	2031	6	3	87	f	2023-01-24 23:07:14
69	28	{"{\\"product_id\\" : 0, \\"count\\" : 19}","{\\"product_id\\" : 72, \\"count\\" : 17}","{\\"product_id\\" : 63, \\"count\\" : 17}"}	1740.3	3	1	13	t	2023-09-04 16:00:24
70	58	{"{\\"product_id\\" : 38, \\"count\\" : 18}","{\\"product_id\\" : 76, \\"count\\" : 13}","{\\"product_id\\" : 13, \\"count\\" : 8}"}	2171.73	7	4	5	f	2022-02-06 16:45:52
71	96	{"{\\"product_id\\" : 30, \\"count\\" : 9}","{\\"product_id\\" : 74, \\"count\\" : 19}","{\\"product_id\\" : 7, \\"count\\" : 3}"}	1951.44	4	2	18	t	2022-07-28 19:55:16
72	80	{"{\\"product_id\\" : 76, \\"count\\" : 20}","{\\"product_id\\" : 22, \\"count\\" : 15}","{\\"product_id\\" : 61, \\"count\\" : 8}"}	1864.07	6	8	31	t	2023-07-16 17:13:46
73	77	{"{\\"product_id\\" : 22, \\"count\\" : 14}","{\\"product_id\\" : 38, \\"count\\" : 3}","{\\"product_id\\" : 15, \\"count\\" : 10}"}	2011.31	7	3	82	f	2022-12-28 03:00:33
91	73	{"{\\"product_id\\" : 80, \\"count\\" : 19}","{\\"product_id\\" : 89, \\"count\\" : 11}","{\\"product_id\\" : 42, \\"count\\" : 5}"}	2083.09	9	3	96	t	2022-08-09 06:53:36
92	17	{"{\\"product_id\\" : 82, \\"count\\" : 2}","{\\"product_id\\" : 0, \\"count\\" : 14}","{\\"product_id\\" : 17, \\"count\\" : 12}"}	1889.09	2	9	27	t	2023-10-03 07:13:27
93	87	{"{\\"product_id\\" : 52, \\"count\\" : 14}","{\\"product_id\\" : 36, \\"count\\" : 12}","{\\"product_id\\" : 25, \\"count\\" : 1}"}	1995.18	8	3	90	f	2022-04-17 13:11:35
94	79	{"{\\"product_id\\" : 57, \\"count\\" : 5}","{\\"product_id\\" : 80, \\"count\\" : 5}","{\\"product_id\\" : 66, \\"count\\" : 12}"}	1702.81	8	5	73	t	2022-11-24 13:58:16
95	26	{"{\\"product_id\\" : 73, \\"count\\" : 12}","{\\"product_id\\" : 71, \\"count\\" : 20}","{\\"product_id\\" : 51, \\"count\\" : 16}"}	2049.1	10	4	26	f	2022-09-12 03:15:43
96	40	{"{\\"product_id\\" : 19, \\"count\\" : 12}","{\\"product_id\\" : 53, \\"count\\" : 14}","{\\"product_id\\" : 88, \\"count\\" : 14}"}	2493.23	3	8	54	t	2022-04-11 22:42:07
97	60	{"{\\"product_id\\" : 78, \\"count\\" : 17}","{\\"product_id\\" : 90, \\"count\\" : 11}","{\\"product_id\\" : 28, \\"count\\" : 2}"}	1921.19	8	2	42	t	2022-04-08 04:29:41
98	51	{"{\\"product_id\\" : 12, \\"count\\" : 8}","{\\"product_id\\" : 77, \\"count\\" : 20}","{\\"product_id\\" : 20, \\"count\\" : 6}"}	1846.78	4	9	9	f	2022-02-10 07:19:54
99	2	{"{\\"product_id\\" : 19, \\"count\\" : 15}","{\\"product_id\\" : 32, \\"count\\" : 12}","{\\"product_id\\" : 6, \\"count\\" : 14}"}	2319.71	3	4	38	t	2022-08-22 12:57:42
100	45	{"{\\"product_id\\" : 38, \\"count\\" : 14}","{\\"product_id\\" : 49, \\"count\\" : 0}","{\\"product_id\\" : 16, \\"count\\" : 0}"}	2055.69	7	6	46	f	2023-01-25 15:12:10
59	86	{"{\\"product_id\\" : 89, \\"count\\" : 1}","{\\"product_id\\" : 39, \\"count\\" : 6}","{\\"product_id\\" : 98, \\"count\\" : 7}"}	1758.75	7	7	57	f	2021-12-05 00:08:16
5	26	{"{\\"product_id\\" : 63, \\"count\\" : 1}","{\\"product_id\\" : 33, \\"count\\" : 13}","{\\"product_id\\" : 45, \\"count\\" : 7}"}	2035.85	3	6	23	t	2022-01-27 23:56:31
6	16	{"{\\"product_id\\" : 25, \\"count\\" : 5}","{\\"product_id\\" : 72, \\"count\\" : 0}","{\\"product_id\\" : 46, \\"count\\" : 13}"}	1732.08	4	5	24	t	2022-10-24 17:20:30
7	22	{"{\\"product_id\\" : 5, \\"count\\" : 1}","{\\"product_id\\" : 35, \\"count\\" : 16}","{\\"product_id\\" : 2, \\"count\\" : 16}"}	1808.16	4	8	73	t	2022-12-16 22:31:08
8	69	{"{\\"product_id\\" : 55, \\"count\\" : 14}","{\\"product_id\\" : 95, \\"count\\" : 5}","{\\"product_id\\" : 68, \\"count\\" : 17}"}	2125.52	5	10	64	t	2022-12-15 12:48:26
9	70	{"{\\"product_id\\" : 93, \\"count\\" : 5}","{\\"product_id\\" : 70, \\"count\\" : 14}","{\\"product_id\\" : 28, \\"count\\" : 3}"}	1853.9	1	3	74	f	2023-05-06 04:29:11
10	24	{"{\\"product_id\\" : 78, \\"count\\" : 4}","{\\"product_id\\" : 81, \\"count\\" : 1}","{\\"product_id\\" : 68, \\"count\\" : 16}"}	1857.94	9	9	8	f	2022-12-09 19:45:38
11	46	{"{\\"product_id\\" : 24, \\"count\\" : 9}","{\\"product_id\\" : 61, \\"count\\" : 13}","{\\"product_id\\" : 27, \\"count\\" : 20}"}	1970.75	6	7	44	f	2023-10-02 02:24:38
12	65	{"{\\"product_id\\" : 83, \\"count\\" : 17}","{\\"product_id\\" : 13, \\"count\\" : 13}","{\\"product_id\\" : 50, \\"count\\" : 5}"}	2159.57	8	2	17	f	2022-11-14 22:25:12
13	2	{"{\\"product_id\\" : 46, \\"count\\" : 19}","{\\"product_id\\" : 74, \\"count\\" : 9}","{\\"product_id\\" : 33, \\"count\\" : 16}"}	1888.13	8	8	88	t	2022-08-30 04:36:55
14	26	{"{\\"product_id\\" : 98, \\"count\\" : 14}","{\\"product_id\\" : 61, \\"count\\" : 2}","{\\"product_id\\" : 25, \\"count\\" : 3}"}	2122.65	3	9	38	f	2021-12-23 02:35:41
15	1	{"{\\"product_id\\" : 5, \\"count\\" : 6}","{\\"product_id\\" : 24, \\"count\\" : 3}","{\\"product_id\\" : 43, \\"count\\" : 4}"}	1872.76	1	10	61	t	2021-12-15 22:24:41
16	84	{"{\\"product_id\\" : 42, \\"count\\" : 1}","{\\"product_id\\" : 83, \\"count\\" : 14}","{\\"product_id\\" : 96, \\"count\\" : 6}"}	1953.41	4	9	84	f	2023-05-12 01:14:20
17	15	{"{\\"product_id\\" : 67, \\"count\\" : 4}","{\\"product_id\\" : 47, \\"count\\" : 3}","{\\"product_id\\" : 20, \\"count\\" : 12}"}	1987.95	8	9	37	f	2022-01-29 10:36:27
18	47	{"{\\"product_id\\" : 95, \\"count\\" : 6}","{\\"product_id\\" : 47, \\"count\\" : 9}","{\\"product_id\\" : 88, \\"count\\" : 8}"}	2070.18	2	9	22	f	2022-12-30 14:43:14
19	4	{"{\\"product_id\\" : 99, \\"count\\" : 8}","{\\"product_id\\" : 2, \\"count\\" : 15}","{\\"product_id\\" : 74, \\"count\\" : 19}"}	2100.12	6	1	5	f	2022-02-21 15:28:01
20	13	{"{\\"product_id\\" : 35, \\"count\\" : 4}","{\\"product_id\\" : 19, \\"count\\" : 3}","{\\"product_id\\" : 58, \\"count\\" : 8}"}	2132.03	1	3	55	t	2022-07-24 09:05:11
21	16	{"{\\"product_id\\" : 53, \\"count\\" : 7}","{\\"product_id\\" : 30, \\"count\\" : 1}","{\\"product_id\\" : 13, \\"count\\" : 13}"}	2028.31	4	9	55	f	2022-07-09 17:34:04
22	21	{"{\\"product_id\\" : 13, \\"count\\" : 13}","{\\"product_id\\" : 48, \\"count\\" : 6}","{\\"product_id\\" : 69, \\"count\\" : 1}"}	1961.45	8	4	89	t	2022-10-01 08:56:41
23	71	{"{\\"product_id\\" : 5, \\"count\\" : 13}","{\\"product_id\\" : 60, \\"count\\" : 17}","{\\"product_id\\" : 75, \\"count\\" : 1}"}	2101.91	9	3	94	f	2023-04-17 13:19:57
24	24	{"{\\"product_id\\" : 79, \\"count\\" : 3}","{\\"product_id\\" : 42, \\"count\\" : 1}","{\\"product_id\\" : 14, \\"count\\" : 8}"}	1949.99	8	6	84	f	2023-07-01 02:19:53
25	97	{"{\\"product_id\\" : 27, \\"count\\" : 2}","{\\"product_id\\" : 54, \\"count\\" : 9}","{\\"product_id\\" : 86, \\"count\\" : 12}"}	1916.01	9	1	5	f	2023-05-30 10:09:24
74	63	{"{\\"product_id\\" : 95, \\"count\\" : 12}","{\\"product_id\\" : 68, \\"count\\" : 1}","{\\"product_id\\" : 90, \\"count\\" : 11}"}	1926.63	5	5	20	t	2023-01-26 09:59:09
75	22	{"{\\"product_id\\" : 61, \\"count\\" : 2}","{\\"product_id\\" : 13, \\"count\\" : 13}","{\\"product_id\\" : 36, \\"count\\" : 6}"}	2019.61	8	8	37	t	2022-08-04 14:01:42
76	94	{"{\\"product_id\\" : 16, \\"count\\" : 2}","{\\"product_id\\" : 83, \\"count\\" : 8}","{\\"product_id\\" : 30, \\"count\\" : 10}"}	2007.28	3	4	91	t	2022-02-01 08:21:23
77	37	{"{\\"product_id\\" : 36, \\"count\\" : 11}","{\\"product_id\\" : 98, \\"count\\" : 16}","{\\"product_id\\" : 88, \\"count\\" : 19}"}	2023.21	7	4	45	t	2023-03-07 20:47:23
78	58	{"{\\"product_id\\" : 98, \\"count\\" : 1}","{\\"product_id\\" : 30, \\"count\\" : 12}","{\\"product_id\\" : 13, \\"count\\" : 7}"}	2183.27	5	4	80	f	2023-05-13 06:36:02
79	17	{"{\\"product_id\\" : 68, \\"count\\" : 2}","{\\"product_id\\" : 29, \\"count\\" : 8}","{\\"product_id\\" : 28, \\"count\\" : 14}"}	1949.32	2	3	82	f	2022-02-02 23:27:19
80	97	{"{\\"product_id\\" : 29, \\"count\\" : 16}","{\\"product_id\\" : 25, \\"count\\" : 12}","{\\"product_id\\" : 27, \\"count\\" : 15}"}	1881.69	8	2	65	t	2023-10-20 21:32:08
81	41	{"{\\"product_id\\" : 22, \\"count\\" : 10}","{\\"product_id\\" : 62, \\"count\\" : 4}","{\\"product_id\\" : 97, \\"count\\" : 8}"}	2018.65	6	8	95	f	2022-12-21 09:16:24
82	94	{"{\\"product_id\\" : 83, \\"count\\" : 15}","{\\"product_id\\" : 30, \\"count\\" : 15}","{\\"product_id\\" : 75, \\"count\\" : 11}"}	2082.39	5	8	85	t	2022-02-10 23:07:23
83	63	{"{\\"product_id\\" : 38, \\"count\\" : 4}","{\\"product_id\\" : 83, \\"count\\" : 18}","{\\"product_id\\" : 69, \\"count\\" : 14}"}	2151.84	6	5	28	f	2021-11-10 03:10:24
84	56	{"{\\"product_id\\" : 51, \\"count\\" : 11}","{\\"product_id\\" : 68, \\"count\\" : 12}","{\\"product_id\\" : 23, \\"count\\" : 7}"}	2037.8	2	5	73	f	2023-03-11 20:20:29
85	10	{"{\\"product_id\\" : 15, \\"count\\" : 1}","{\\"product_id\\" : 92, \\"count\\" : 13}","{\\"product_id\\" : 9, \\"count\\" : 11}"}	2007.92	3	1	43	f	2022-09-02 02:44:35
86	88	{"{\\"product_id\\" : 62, \\"count\\" : 19}","{\\"product_id\\" : 79, \\"count\\" : 13}","{\\"product_id\\" : 59, \\"count\\" : 16}"}	1869.65	2	6	91	t	2022-07-28 12:13:53
87	63	{"{\\"product_id\\" : 88, \\"count\\" : 7}","{\\"product_id\\" : 67, \\"count\\" : 5}","{\\"product_id\\" : 51, \\"count\\" : 6}"}	2203.34	2	4	91	f	2023-09-10 21:49:59
88	21	{"{\\"product_id\\" : 74, \\"count\\" : 3}","{\\"product_id\\" : 76, \\"count\\" : 1}","{\\"product_id\\" : 23, \\"count\\" : 17}"}	2195.92	7	2	5	f	2022-04-20 14:41:18
89	20	{"{\\"product_id\\" : 6, \\"count\\" : 8}","{\\"product_id\\" : 50, \\"count\\" : 11}","{\\"product_id\\" : 9, \\"count\\" : 7}"}	2063.39	1	1	52	t	2022-12-16 10:11:02
90	54	{"{\\"product_id\\" : 56, \\"count\\" : 16}","{\\"product_id\\" : 28, \\"count\\" : 3}","{\\"product_id\\" : 5, \\"count\\" : 16}"}	1913.66	3	2	32	f	2023-04-09 20:00:28
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.payment_methods (id, name, description, requisites) FROM stdin;
1	Ut PC	placerat velit. Quisque varius. Nam porttitor scelerisque	DK1955871054467068
2	Ante Inc.	vitae purus gravida sagittis. Duis gravida. Praesent	CR3072862735441328678
3	Eget Metus Consulting	convallis in, cursus et, eros. Proin ultrices.	AZ67158325534457145206935937
4	Ut LLC	magnis dis parturient montes, nascetur ridiculus mus.	GT71181676298574475371133457
5	Elit Corporation	Curabitur dictum. Phasellus in felis. Nulla tempor	MT09AJRY26347212294010964690238
6	Aliquet Libero Ltd	tincidunt, neque vitae semper egestas, urna justo	RO31QYXB7672075834248059
7	Commodo At Institute	ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing	FR7550983227023389568122351
8	Ultrices Inc.	pellentesque, tellus sem mollis dui, in sodales	DE96548788712962695404
9	Taciti Sociosqu Corporation	eu, accumsan sed, facilisis vitae, orci. Phasellus	PL89673765668590825752418648
10	Egestas Company	orci sem eget massa. Suspendisse eleifend. Cras	ES5750841214874345436783
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.products (id, name, category_id, description, count, images_id, average_rating, added_at) FROM stdin;
1	Nunc Mauris Morbi Corp.	20	sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim	86	1	1.8	2022-12-19 06:07:11
2	Eu Turpis Industries	11	primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor	98	2	4.1	2023-08-14 12:29:10
3	Ultrices Posuere Incorporated	19	nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor	98	3	4.1	2022-10-15 00:38:39
4	Suscipit Est Institute	24	euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim	21	4	2.9	2022-08-14 04:45:39
5	Nunc Sollicitudin LLC	5	Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.	79	5	4.3	2022-08-31 14:03:27
6	Quisque Varius Inc.	4	justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in	18	6	4.2	2022-10-19 09:04:53
7	Morbi Tristique Ltd	21	lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet	99	7	1.4	2022-01-19 22:50:43
8	Mattis LLC	15	quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.	40	8	3.6	2023-07-15 06:33:40
9	In Condimentum Donec Inc.	21	Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique	29	9	3.4	2023-08-20 20:27:10
10	Lectus Pede Foundation	25	egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis	70	10	3	2022-01-27 02:36:27
11	Non Corporation	9	leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu	11	11	3.2	2023-10-03 20:26:00
12	Tincidunt Aliquam Arcu Incorporated	12	in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing	9	12	0.3	2023-04-16 06:53:20
13	Placerat Orci Lacus PC	21	Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,	67	13	2.2	2022-12-30 12:01:49
14	Augue Porttitor PC	11	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor.	33	14	0.9	2022-02-08 16:58:20
15	Nec Enim Nunc Corporation	1	Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis	97	15	4.8	2022-05-22 12:20:55
16	Justo Eu Associates	15	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam	75	16	1.1	2023-07-19 23:23:21
17	Luctus Aliquet Odio Institute	18	magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et,	57	17	2.4	2023-02-25 08:55:32
18	Lectus Sit Corp.	9	sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem,	81	18	4.8	2022-09-02 08:21:48
19	Aliquam Erat Volutpat LLC	24	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet	27	19	3.7	2023-01-31 03:31:39
20	Egestas Blandit Incorporated home	24	sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit	2	20	2.3	2022-03-06 20:03:40
21	Sed Dui Fusce Institute	15	vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis	59	21	2.9	2022-09-19 11:45:47
22	Nunc In Ltd	16	urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,	68	22	2.4	2022-06-09 06:20:39
23	A Auctor PC	22	dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.	53	23	5.6	2023-09-20 05:21:18
24	Pellentesque A Facilisis LLP	20	Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.	62	24	4.1	2022-02-13 18:32:31
25	In LLC	19	est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae	77	25	3.3	2023-07-01 03:26:08
26	Fermentum Convallis Ligula Corp.	23	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis	19	26	3.2	2022-03-01 21:37:06
27	Egestas Blandit Incorporated	12	nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc	34	27	2.7	2022-12-29 08:20:02
28	Risus LLP	18	sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac	93	28	2.8	2022-01-15 00:50:18
29	Erat Eget Ipsum Institute	7	sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec	83	29	-1.2	2022-01-09 06:03:32
30	Libero Lacus Inc.	8	ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate,	52	30	1.7	2022-02-17 08:55:54
31	Mollis Duis LLC	9	molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos	48	31	4.6	2023-03-08 04:13:46
32	Dignissim Lacus Foundation	15	nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus	97	32	1.9	2023-08-26 12:09:26
33	Sed Pharetra Foundation	22	non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget	27	33	0.9	2023-07-02 02:35:40
34	Tristique Pharetra LLC	7	neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor	40	34	3.9	2023-02-21 23:34:58
35	In Corp.	10	ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad	30	35	3.4	2021-12-21 14:46:39
36	Ante Bibendum PC	23	et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula	83	36	2.3	2022-05-03 18:48:18
37	Ligula Nullam Industries	20	nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu	61	37	1.4	2022-05-05 03:36:15
38	Proin Dolor LLC	24	netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla	88	38	2.4	2023-04-22 10:59:13
39	Fusce Mollis Institute	8	lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper,	20	39	2.5	2022-11-01 23:06:38
40	Dapibus Id Blandit Foundation	9	nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu	39	40	2.8	2021-11-14 17:29:04
41	Odio Vel Est Limited	20	ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis	75	41	1.7	2023-08-06 23:59:07
42	Arcu PC	16	imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate	42	42	0.8	2023-07-16 21:58:54
43	Arcu Sed Corporation	24	Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum.	86	43	1.6	2021-12-19 06:18:33
44	Magna A Tortor LLP	20	magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem	75	44	3.2	2022-09-30 23:19:00
45	Odio Vel Est PC	15	sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit	74	45	2.2	2022-08-22 03:33:04
46	Sed Diam PC	3	cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis	30	46	3.8	2022-08-07 16:06:10
47	Varius Orci Associates	5	metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget	14	47	2.3	2023-02-07 21:07:42
48	Morbi Vehicula Company	14	sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis	37	48	4.1	2023-05-18 03:07:25
49	Fringilla Est Incorporated	4	molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet	51	49	1.9	2022-12-04 15:50:44
50	Cursus Et Ltd	9	dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes,	25	50	1.5	2023-06-23 19:05:19
51	Quisque Varius Corp.	13	neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat,	74	51	3.6	2022-09-20 20:20:03
52	Integer LLC	24	vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare	10	52	2.7	2022-12-13 09:58:02
53	Ornare Libero LLC	24	vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris	81	53	2.3	2022-02-25 10:44:34
54	Vestibulum Accumsan Foundation	16	Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec	98	54	2.4	2022-02-24 05:59:57
55	Libero Foundation	5	Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.	86	55	3.7	2022-03-07 21:41:15
56	Est LLC	2	Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	67	56	2.4	2023-05-03 02:27:41
57	Nunc In Corporation	17	adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo	30	57	3.3	2022-02-24 22:23:53
58	Elit Foundation	14	Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper.	50	58	3.2	2023-05-02 09:24:37
59	Nullam Ut Institute	3	aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et	95	59	4.7	2021-11-28 09:34:40
60	Bibendum Fermentum Metus Ltd	17	a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae	54	60	3	2021-11-29 04:29:48
61	Auctor Vitae Consulting	3	diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis	63	61	2.1	2022-08-09 02:17:22
62	Accumsan Convallis Ante Limited	23	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum	67	62	2	2022-11-20 09:47:53
63	Massa Quisque PC	2	diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut,	53	63	2.8	2022-02-26 20:37:10
64	Ullamcorper Eu Euismod Corporation	8	Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi	71	64	2.1	2023-06-30 12:38:34
65	Lectus A Corporation	3	eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a	73	65	2.5	2022-04-18 07:17:27
66	Est Ac Corp.	25	Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel	79	66	0.3	2023-09-16 00:12:35
67	Integer Vulputate Inc.	9	nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum,	14	67	3.2	2023-05-11 11:52:58
68	Molestie Dapibus Ligula Industries	6	mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis	25	68	2.5	2022-06-12 06:35:41
69	Ultrices Mauris Industries	4	vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis	64	69	6	2022-05-14 08:34:08
70	Aliquam Industries	4	libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum	53	70	1.6	2023-01-08 09:37:07
71	Cras Vulputate LLC	20	Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue	15	71	4.8	2023-03-18 08:36:29
72	Ac Associates	21	eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque	79	72	0.8	2022-04-28 08:02:06
73	Commodo Auctor Velit Foundation	3	consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.	62	73	2.4	2023-08-09 23:26:43
74	Mi Felis Associates	16	consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.	81	74	4.3	2022-12-06 17:47:07
75	Odio Semper Ltd	20	vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue	45	75	2.7	2022-07-25 23:19:29
76	Semper Auctor Consulting	16	mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis	97	76	0.8	2023-02-14 21:51:31
77	Aliquam Nec Inc.	15	non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam	42	77	2.7	2022-05-08 07:16:13
78	Lobortis Foundation	10	velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem	48	78	-0.9	2022-05-21 06:42:22
79	Vulputate Ullamcorper Incorporated	2	quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in	71	79	3.4	2023-10-01 09:06:39
80	Neque Morbi Foundation	4	ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	31	80	1.9	2023-05-06 09:11:20
81	Dui Semper Industries	5	facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis	78	81	5.3	2023-07-21 04:37:32
82	Pede Inc.	10	Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed	2	82	2.9	2022-08-28 04:50:44
83	Purus Accumsan Interdum Industries	20	ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent	65	83	2	2022-09-14 13:38:57
84	Vivamus Molestie Dapibus Inc.	6	Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae	59	84	3	2022-10-03 11:13:36
85	Diam Luctus Ltd	15	Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat,	47	85	4.1	2023-05-01 15:31:45
86	Congue In Limited	21	eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.	23	86	3.5	2023-05-29 16:29:38
87	Urna Justo Corp.	12	natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam	5	87	1.5	2022-07-04 09:35:36
88	Commodo Industries	2	dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis.	94	88	2.9	2021-11-22 14:58:15
89	Nullam Nisl Maecenas Institute	20	amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu,	52	89	2.9	2022-08-22 06:09:24
90	Ac Mattis Inc.	18	egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu	99	90	5.6	2023-06-09 08:27:30
91	Non Egestas Inc.	5	Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum	8	91	0.4	2022-02-07 04:02:32
92	Fringilla Purus Mauris Limited	24	ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	70	92	2.3	2022-05-03 09:22:25
93	Tempus Eu Corp.	10	quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla	18	93	3.1	2023-01-07 21:38:03
94	Cras LLC	1	turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.	60	94	4.7	2022-07-19 19:38:58
95	Cras Convallis Industries	3	nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut	33	95	3	2023-05-21 16:54:00
96	Dui Cras Ltd	2	quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus.	94	96	4.1	2022-01-25 21:30:47
97	At Pede Cras Corporation	20	Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem,	64	97	4.2	2022-07-26 04:44:27
98	Etiam Ligula Tortor Ltd	10	ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras	59	98	1.2	2022-12-26 22:20:22
99	Parturient Montes Corporation	8	lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti	5	99	1.1	2022-09-20 12:19:32
100	Lectus Convallis Est Industries	15	sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque	25	100	3.2	2022-01-24 11:52:21
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.reviews (id, user_id, product_id, order_id, text, rating, images_id, added_at) FROM stdin;
1	67	86	80	eget	4	39	2022-03-22 06:37:44
2	50	57	69	Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus	5	42	2022-10-02 09:47:13
3	62	73	89	vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque	2	70	2023-03-30 06:30:04
4	70	98	93	adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed	3	2	2022-04-13 22:02:21
5	90	28	7	erat, in consectetuer ipsum nunc	1	73	2022-01-11 05:24:11
6	3	58	41	erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque.	1	63	2022-04-14 21:46:51
7	47	4	81	nostra, per inceptos hymenaeos.	2	98	2023-01-23 15:46:21
8	13	90	94	dapibus ligula. Aliquam erat volutpat. Nulla	3	3	2022-09-05 04:25:45
9	20	4	94	Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus.	3	66	2022-04-06 00:27:53
10	69	55	53	Aliquam auctor, velit eget laoreet	4	37	2023-05-28 17:33:02
11	79	32	34	viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus	4	6	2022-08-16 13:07:24
12	81	87	35	pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim	1	71	2023-02-13 08:08:15
13	46	45	77	mi. Duis risus odio, auctor vitae, aliquet nec,	3	25	2022-12-11 15:39:46
14	97	55	3	id,	3	58	2022-06-13 09:11:51
15	46	29	72	malesuada fames ac turpis egestas. Fusce aliquet magna a neque.	2	15	2022-01-01 15:16:13
16	25	10	83	Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies	3	39	2023-09-25 12:46:20
17	92	52	39	mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.	3	65	2022-02-28 08:54:57
18	35	40	43	nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum	2	25	2023-05-06 17:31:19
19	78	36	44	a sollicitudin orci sem eget	3	24	2022-08-25 20:01:44
20	58	24	18	ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim	3	6	2022-12-02 09:56:14
21	22	36	49	Aliquam auctor, velit eget laoreet	2	45	2023-02-04 07:11:34
22	51	58	67	dictum eu, eleifend nec, malesuada ut, sem.	3	17	2023-02-14 19:14:09
23	16	43	81	aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,	1	33	2022-04-28 05:53:50
24	1	67	20	risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at	3	55	2023-01-30 10:15:05
25	16	71	23	inceptos hymenaeos. Mauris ut quam	4	19	2022-02-04 22:58:33
26	73	35	65	Duis at lacus. Quisque purus sapien, gravida non, sollicitudin	3	17	2021-11-08 18:05:24
27	82	75	84	velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget	3	15	2023-01-18 16:37:50
28	72	58	28	vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue	4	48	2022-03-23 01:40:04
29	70	20	28	et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi	4	85	2022-12-13 10:25:27
30	69	25	47	erat eget	3	85	2021-11-24 02:59:40
31	17	92	16	lacus vestibulum lorem, sit amet ultricies sem magna	3	48	2021-12-11 16:16:45
32	98	65	64	orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero.	3	19	2022-08-03 12:58:23
33	86	60	54	Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare	5	69	2023-06-29 05:24:42
34	11	67	51	ullamcorper, nisl arcu iaculis	1	88	2022-04-16 22:31:19
35	31	27	27	enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem	4	25	2022-11-22 16:54:32
36	17	100	95	vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,	5	49	2021-12-15 21:27:44
37	95	87	67	lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend	2	56	2022-01-17 14:20:45
38	72	21	20	tristique senectus et netus et	4	56	2022-04-07 22:20:57
39	54	44	12	luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus	4	92	2023-04-20 11:53:48
40	31	89	47	leo. Morbi neque	4	7	2023-01-31 18:26:57
41	18	91	61	sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede,	4	67	2023-04-27 17:32:21
42	81	12	42	ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in	4	18	2023-04-01 19:57:04
43	34	48	5	Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,	3	11	2023-08-13 16:15:55
44	34	32	79	Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor	2	43	2023-06-26 03:27:33
45	62	12	89	eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate	4	11	2022-07-22 14:50:02
46	24	40	4	nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus	1	22	2023-05-23 19:55:27
47	92	47	19	erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,	4	72	2022-12-08 10:06:39
48	14	27	74	Vivamus euismod urna. Nullam lobortis quam a felis	3	8	2022-06-02 05:58:45
49	23	75	71	malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis	2	56	2021-12-29 18:50:39
50	14	92	34	nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.	2	19	2023-06-02 15:55:33
51	94	53	95	blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum	5	83	2023-03-31 07:09:39
52	24	100	2	eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis	3	96	2022-08-26 22:59:20
53	98	74	46	blandit congue.	2	99	2021-12-26 17:37:20
54	35	55	94	Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec	4	6	2023-07-20 12:01:11
55	9	71	39	at, libero. Morbi accumsan laoreet ipsum.	4	91	2022-12-16 13:06:44
56	84	94	27	et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.	5	53	2023-01-12 09:14:40
57	31	76	12	ullamcorper. Duis cursus, diam	2	93	2023-06-05 05:44:12
58	80	96	73	accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.	4	98	2022-04-23 09:36:10
59	52	26	63	euismod in, dolor. Fusce feugiat.	4	74	2023-07-10 04:41:55
60	68	70	2	sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris	2	80	2023-03-08 15:03:23
61	83	25	8	lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere	4	23	2023-07-18 16:40:44
62	27	48	78	ut quam vel	3	56	2022-09-08 23:41:58
63	91	79	43	Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum.	4	37	2023-07-01 19:43:14
64	63	42	76	pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	1	41	2021-11-14 01:55:37
65	87	42	14	id, libero. Donec consectetuer mauris id sapien. Cras	3	32	2023-04-13 13:00:51
66	57	56	22	semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.	4	98	2023-04-06 04:28:21
67	58	2	27	auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin	3	1	2022-08-20 08:16:44
68	100	69	60	dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus	4	96	2022-10-19 05:45:55
69	80	85	95	nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam	1	65	2022-09-02 00:28:38
70	33	51	7	faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.	1	61	2022-09-15 11:05:45
71	15	14	35	vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum.	3	97	2021-10-30 11:20:04
72	25	75	50	Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam	2	74	2021-12-18 06:22:14
73	60	95	74	tincidunt	4	6	2022-05-06 20:08:02
74	54	30	85	condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	3	31	2022-03-31 03:24:39
75	3	43	78	dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et	2	90	2023-02-22 16:25:37
76	33	27	33	consequat, lectus	4	49	2022-09-03 16:29:39
77	89	17	64	elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut	4	53	2022-12-21 08:48:57
78	10	45	67	malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor	2	91	2022-09-05 20:05:06
79	79	84	47	Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,	3	72	2022-05-11 19:27:58
80	90	15	29	mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec	3	75	2023-09-11 10:11:50
81	45	51	41	nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.	4	82	2022-06-26 03:47:55
82	22	3	71	tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non	3	84	2021-12-19 16:40:49
83	97	42	80	pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor	5	34	2022-12-26 19:30:19
84	12	48	4	arcu iaculis enim, sit	2	52	2023-10-25 04:27:19
85	10	99	24	amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies	4	53	2023-02-09 21:00:33
86	83	2	82	vel, faucibus id, libero. Donec consectetuer mauris	2	40	2023-03-13 07:43:34
87	30	26	24	dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum.	3	64	2023-07-22 21:03:02
88	59	81	48	diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit	1	58	2023-04-30 13:54:40
89	83	17	23	et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis	5	90	2023-09-21 13:47:28
90	8	79	73	cursus et,	3	30	2022-11-03 22:18:30
91	29	45	81	sit amet,	2	8	2022-01-10 23:25:04
92	39	17	51	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique	2	66	2022-09-26 11:40:12
93	84	34	41	ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie	3	49	2023-05-12 22:58:50
94	82	41	10	gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras	4	96	2022-06-06 16:44:10
95	19	34	96	purus mauris a nunc. In at pede. Cras vulputate velit	2	30	2022-09-06 17:49:23
96	46	82	51	tristique neque venenatis	5	22	2021-11-21 23:34:01
97	64	77	92	nec luctus felis purus ac tellus. Suspendisse sed	3	27	2022-04-10 16:43:14
98	88	18	15	adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada	3	8	2022-02-06 03:35:37
99	82	4	13	odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer	2	85	2021-11-22 17:26:42
100	87	68	35	orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in	2	53	2022-09-03 21:12:43
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.shops (id, name, address, opening_hors) FROM stdin;
1	Auctor Velit Eget Consulting	P.O. Box 258, 7316 Egestas. Avenue	2022-02-21 09:42:27
2	Eu Lacus Company	P.O. Box 731, 6328 Donec St.	2023-01-05 12:35:06
3	Ut Dolor LLP	290-2063 Elementum Ave	2023-09-17 04:43:25
4	Nunc LLC	P.O. Box 282, 4936 Curabitur Road	2023-01-17 17:14:36
5	Donec Nibh Limited	668-2509 Integer St.	2022-11-06 12:01:34
6	Mauris Suspendisse LLP	P.O. Box 903, 8770 Lacus. Rd.	2023-01-07 16:44:07
7	Tellus LLC	511-721 Aliquam Rd.	2022-04-29 13:21:32
8	Lobortis Quis Corp.	649-4695 Non Avenue	2022-02-25 11:32:47
9	Conubia Nostra Per Associates	Ap #527-6307 Lorem St.	2023-10-25 12:18:04
10	Sociis Natoque LLP	P.O. Box 276, 9011 Tortor, Ave	2023-08-30 03:00:15
11	Dictum Eu Placerat Ltd	P.O. Box 167, 4608 Tincidunt, Av.	2022-05-13 10:33:39
12	Non Enim Institute	Ap #439-809 Ut Av.	2022-12-31 16:53:20
13	Sociis Natoque LLC	330-2388 Eu, Rd.	2022-02-14 05:34:45
14	Velit Justo Institute	Ap #207-7163 Pellentesque St.	2023-06-29 03:43:37
15	Dis Parturient Montes Industries	P.O. Box 770, 582 Augue Rd.	2023-01-07 07:33:23
16	Nunc Mauris LLC	P.O. Box 642, 2527 Mauris Rd.	2022-10-18 20:03:29
17	Risus LLC	P.O. Box 285, 3931 Posuere St.	2022-05-29 10:32:15
18	Id Ante Dictum Associates	Ap #161-1844 A, Rd.	2022-10-28 02:57:03
19	Nullam Suscipit Incorporated	Ap #500-7260 Integer Avenue	2023-03-09 00:56:32
20	Aliquam Iaculis Lacus Consulting	Ap #890-8122 Mi. Av.	2022-06-25 17:37:18
21	Cras Lorem LLP	Ap #732-6404 Vitae St.	2022-02-03 08:23:11
22	Arcu Sed Eu LLP	Ap #395-3456 Venenatis St.	2022-10-28 01:45:16
23	Enim Incorporated	742-1102 Mauris Road	2023-05-21 17:36:56
24	Inceptos Hymenaeos Mauris PC	519-9654 Sit Road	2023-08-08 09:02:59
25	Ac LLC	904-559 Nunc Rd.	2023-09-24 19:10:20
26	Egestas Nunc Sed Company	1573 Sagittis. St.	2023-01-25 11:31:05
27	Egestas Hendrerit Corporation	9316 Augue Street	2022-05-29 04:08:33
28	Fusce Mollis Corporation	Ap #590-3248 Iaculis Avenue	2022-12-31 10:24:31
29	Fringilla Mi LLP	Ap #437-5796 Blandit St.	2022-10-08 16:33:43
30	Eget Institute	Ap #177-7367 At Rd.	2022-08-16 10:06:29
31	Sit Amet Limited	771 Diam. Rd.	2023-01-27 00:11:10
32	Dapibus Id Blandit Company	Ap #873-2539 Elit. Avenue	2022-05-21 06:46:09
33	Pharetra Ut Inc.	P.O. Box 924, 7570 Pellentesque Rd.	2022-03-22 07:03:22
34	Mollis Vitae Posuere LLC	Ap #789-7630 Suspendisse Road	2022-01-08 14:49:46
35	Vestibulum Lorem LLC	209 Accumsan Ave	2023-06-27 21:29:29
36	Nisi Inc.	714-5877 Et, Road	2023-07-06 07:09:55
37	Libero Donec LLC	970-9237 Scelerisque Rd.	2022-09-13 09:24:00
38	Eget Nisi Dictum Inc.	P.O. Box 800, 6562 Pellentesque Road	2022-05-20 00:21:45
39	Phasellus Fermentum Incorporated	Ap #610-425 Cras Ave	2023-08-09 05:31:27
40	Leo Vivamus LLC	Ap #753-1160 Facilisis Road	2023-09-08 13:19:12
41	Non Egestas A Associates	3754 Cras St.	2022-03-11 02:57:47
42	Vulputate Foundation	952-4101 Mauris Ave	2022-01-14 11:46:34
43	Semper Rutrum Institute	160-1904 Elit, Rd.	2021-11-15 22:39:07
44	Quisque Varius Limited	627-489 Blandit. Ave	2022-05-17 19:25:27
45	Lobortis Quis Institute	123-4960 Dignissim Ave	2023-07-20 06:21:07
46	Sem Elit Industries	125-2580 Ut Road	2022-03-07 13:33:04
47	Curabitur Ut LLP	529-4163 In St.	2022-12-15 11:40:08
48	Eget Volutpat Incorporated	303-9478 Mus. Avenue	2023-01-08 16:14:14
49	Tristique Neque Venenatis Inc.	Ap #410-1278 Ac Rd.	2023-10-11 11:34:04
50	Consequat Institute	Ap #113-7338 Scelerisque, Ave	2022-01-13 02:54:58
51	Netus Et Institute	659-6387 Augue Road	2022-08-05 04:58:18
52	Cursus Foundation	Ap #220-6379 Sed St.	2022-11-10 17:35:06
53	Et PC	Ap #664-391 Ligula. Road	2023-07-09 18:36:58
54	Magna A Neque LLP	754-9499 Erat Rd.	2022-08-13 03:10:14
55	Pellentesque Habitant Morbi LLP	P.O. Box 101, 6894 Volutpat Road	2022-01-14 08:08:26
56	Justo Proin Non PC	Ap #856-9429 Natoque St.	2022-12-26 23:56:54
57	Natoque Penatibus Et Associates	Ap #994-3691 Tellus Rd.	2022-10-03 21:41:36
58	Tempor Arcu Incorporated	Ap #350-9967 In Street	2021-11-08 00:09:07
59	Nulla Facilisi Sed Limited	480-1388 Etiam Rd.	2023-02-10 06:39:04
60	Semper Auctor Mauris Consulting	P.O. Box 491, 4805 Eget Street	2023-09-07 19:38:14
61	Lobortis Augue Associates	841-429 Mus. Ave	2023-04-26 05:42:04
62	Vivamus Nibh Dolor Incorporated	Ap #388-8358 Ultrices St.	2022-03-12 04:40:27
63	Ipsum Donec Corp.	606-7316 Pede Road	2022-04-04 14:34:40
64	Donec Consectetuer Mauris Corporation	314-900 Enim. Ave	2023-08-14 22:55:01
65	Nec LLP	Ap #827-4387 Elit, Rd.	2022-06-11 16:15:22
66	Commodo Auctor Ltd	215-6213 Urna Av.	2023-09-15 21:00:24
67	Non Enim Commodo Industries	4688 Venenatis Street	2022-07-09 03:17:47
68	Ultrices Ltd	993-6227 Sed Rd.	2022-03-18 20:20:27
69	Egestas Aliquam Corp.	Ap #262-5334 Arcu. St.	2022-11-02 08:38:45
70	Morbi Sit PC	Ap #749-7054 Sagittis Street	2022-10-19 10:33:31
71	Quisque Varius Nam LLC	601-5204 Velit. Road	2023-09-13 13:19:54
72	Egestas Limited	106-1105 Fringilla, Rd.	2023-09-27 21:45:46
73	Vivamus Corp.	Ap #139-102 Eget Rd.	2022-11-26 08:58:35
74	Tincidunt Ltd	426-8879 Nulla Road	2023-07-11 03:19:47
75	Pretium Neque Ltd	8479 Aliquet, Rd.	2023-01-10 14:32:52
76	Libero Proin Mi Corporation	7249 Elementum Street	2023-08-31 09:15:12
77	Adipiscing Mauris Corporation	Ap #488-6247 Mauris Ave	2022-05-29 14:33:27
78	Aenean Industries	P.O. Box 866, 6648 Metus Road	2022-05-27 18:27:35
79	Sagittis Felis Limited	7223 Etiam Av.	2022-03-31 20:55:28
80	Aliquam Tincidunt Corporation	829-4994 Leo, St.	2022-04-17 08:24:25
81	Gravida Sagittis Corporation	3184 Penatibus St.	2022-12-19 15:12:32
82	Metus In Incorporated	525-5709 Erat Ave	2023-08-05 18:12:18
83	In Institute	Ap #660-4619 Pede Avenue	2022-07-01 10:21:07
84	Consectetuer Adipiscing Ltd	P.O. Box 783, 1627 Est, Ave	2022-05-30 19:04:50
85	Eget Varius LLC	Ap #205-6498 Amet, Av.	2023-03-13 06:52:19
86	Magnis Dis Ltd	P.O. Box 988, 6302 Vitae St.	2021-11-26 23:54:24
87	Aliquam Institute	572-7476 Neque Ave	2023-03-17 08:29:23
88	Ipsum PC	Ap #818-8427 Eget St.	2023-06-29 22:49:36
89	Sed Dictum Corporation	861-8492 Est Rd.	2022-07-23 06:51:12
90	Eget Industries	P.O. Box 652, 5045 Tellus. Rd.	2022-11-29 09:11:47
91	Nunc Ac Corporation	1775 Varius. Avenue	2023-01-20 10:36:34
92	Facilisis Consulting	1427 Dis St.	2023-06-13 13:11:47
93	Aliquam Ornare Incorporated	558-2891 Vulputate, Road	2023-02-15 09:38:42
94	Fringilla Ornare Corp.	P.O. Box 627, 6960 Neque St.	2021-12-25 17:18:20
95	Semper Industries	Ap #750-431 Egestas Road	2022-11-28 18:30:49
96	Class Aptent Taciti Institute	Ap #729-4341 A, Road	2023-05-04 16:03:04
97	Arcu Aliquam Corp.	Ap #589-6566 Luctus Rd.	2021-12-02 01:27:19
98	Nibh Donec Est Corporation	Ap #756-2534 Quisque Street	2023-07-23 11:24:10
99	Praesent Eu LLC	172-2950 Varius Rd.	2022-11-22 13:28:43
100	Nisi Magna Corporation	P.O. Box 694, 185 Hendrerit St.	2022-05-03 05:41:05
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, address, email, phone, created_at) FROM stdin;
1	Alexander	Boone	Ap #168-4043 A, Avenue	feugiat.nec@hotmail.com	1-839-284-4023	2023-05-05 13:41:00
2	Lev	Davidson	P.O. Box 731, 6517 Rutrum Ave	quisque.libero.lacus@google.couk	1-811-506-6903	2021-10-29 17:03:30
3	Kadeem	Key	Ap #459-4900 Amet Ave	facilisis.vitae@icloud.com	1-121-504-7904	2022-06-20 16:02:37
4	Maris	Hurst	Ap #785-2495 Est Street	nec@protonmail.ca	1-421-885-6222	2022-07-09 12:46:17
5	Ezekiel	Erickson	708-3613 Fringilla. St.	lacus.cras.interdum@aol.net	1-338-826-6739	2022-07-06 04:36:12
6	Griffith	Osborn	Ap #342-4705 Hendrerit Avenue	convallis.convallis@yahoo.couk	1-768-387-7177	2022-03-11 17:38:28
7	Nolan	Dixon	637-6218 Sagittis Av.	phasellus.vitae.mauris@outlook.ca	1-834-531-7419	2022-07-22 02:48:03
8	Lacy	Anderson	126-2904 Habitant St.	morbi@outlook.org	1-330-848-8825	2023-01-20 05:34:56
9	Knox	Stanton	148-9852 In Ave	amet.metus@hotmail.edu	1-949-587-2658	2022-12-09 14:13:37
10	Vincent	Thornton	3524 Volutpat. St.	pellentesque.ut.ipsum@google.com	1-491-453-3606	2022-11-01 01:35:48
11	Nevada	Conley	241-4438 Urna. Rd.	tellus.eu.augue@protonmail.org	1-876-544-8417	2022-12-07 10:36:02
12	Tate	Donaldson	Ap #296-6129 Lorem Ave	quis@icloud.org	1-372-651-5455	2022-04-01 15:59:59
13	Mira	Whitfield	112-855 Nec Rd.	suspendisse.commodo.tincidunt@aol.com	1-968-330-4864	2022-03-17 16:31:27
14	Cailin	Murphy	791-5417 Velit. Av.	consectetuer.euismod.est@yahoo.edu	1-838-746-5462	2022-08-13 14:58:19
15	Lars	Gonzales	8430 Cursus Road	sit.amet@hotmail.couk	1-651-220-8741	2022-04-30 14:58:30
16	Hayden	Cain	Ap #256-1711 Ut, Rd.	congue.turpis@aol.couk	1-935-717-6670	2021-12-08 23:02:21
17	Imani	Gilmore	3159 Aliquam Rd.	vulputate.posuere@protonmail.edu	1-367-827-7370	2022-08-11 15:44:33
18	Arsenio	Henderson	518-4708 Semper Road	fringilla@icloud.edu	1-977-745-3738	2023-05-30 23:34:40
19	Callum	Vance	3033 Nunc Rd.	magnis.dis.parturient@outlook.com	1-462-489-6483	2023-01-18 11:37:14
20	Octavia	Nicholson	1040 Velit St.	nunc.mauris.sapien@icloud.ca	1-454-851-9754	2022-05-02 17:41:12
21	Dane	Good	1112 Rhoncus. Avenue	elementum.purus.accumsan@aol.org	1-743-351-3237	2023-09-02 22:02:57
22	Darryl	Knox	5913 Nisl Road	nisi.nibh.lacinia@icloud.edu	1-586-968-1539	2023-02-26 18:29:51
23	Heather	Daniels	Ap #427-9610 Aliquet Av.	elit.pretium.et@google.couk	1-367-500-1512	2022-07-11 08:51:26
24	Mannix	Burt	162-5119 Etiam Av.	porttitor.vulputate.posuere@protonmail.net	1-554-390-8490	2021-12-22 18:17:15
25	Rhona	Townsend	Ap #143-3679 Mauris. Rd.	suspendisse.non@google.ca	1-759-856-3787	2022-05-23 02:34:32
26	Uma	Collier	Ap #989-3538 Non, Ave	magnis@outlook.com	1-751-878-3705	2023-10-02 15:28:03
27	Isadora	Vazquez	3933 Suspendisse Road	cursus.in@hotmail.couk	1-361-485-7219	2023-05-21 08:39:02
28	Justin	England	4902 Mattis St.	nibh@icloud.edu	1-558-372-0271	2022-12-18 15:59:53
29	Armand	Battle	7740 Quisque Street	morbi.sit@icloud.ca	1-727-613-7684	2023-03-06 09:39:48
30	Hammett	Evans	P.O. Box 593, 7672 Vel, Road	mollis.phasellus.libero@aol.couk	1-988-393-9584	2023-03-20 00:40:03
31	Marsden	Jordan	P.O. Box 691, 9021 Nunc St.	elit.fermentum@yahoo.ca	1-871-516-3170	2023-02-04 02:22:18
32	Wayne	Paul	Ap #738-3168 Cras Av.	non@outlook.net	1-343-279-8352	2021-11-16 10:37:22
33	Maxwell	Grant	Ap #104-5334 Vel, Av.	lorem.eu@yahoo.edu	1-183-425-1547	2022-09-01 04:15:51
34	Raymond	Morrow	Ap #858-2198 Eros St.	magna.praesent.interdum@protonmail.org	1-151-353-7793	2022-05-10 02:09:20
35	Keiko	Malone	P.O. Box 983, 2794 Tortor. St.	venenatis.vel@icloud.ca	1-258-411-9518	2023-08-05 10:43:59
36	Macaulay	Hatfield	Ap #398-6792 Commodo Street	natoque.penatibus@icloud.org	1-721-233-3915	2023-06-17 15:36:52
37	Hillary	Mccarthy	542-5627 Cum Ave	luctus.lobortis.class@outlook.com	1-742-517-3871	2022-04-14 09:33:45
38	Martha	Holder	661-2922 Varius St.	lectus.pede.ultrices@aol.net	1-698-346-3731	2022-03-05 17:02:31
39	Kelsey	Nguyen	P.O. Box 633, 3179 Scelerisque Road	orci.luctus@hotmail.org	1-556-363-3237	2023-04-10 09:48:21
40	Gil	Mckee	6203 Nibh. St.	feugiat.placerat@protonmail.edu	1-825-466-2779	2023-06-02 06:55:32
41	Ori	Greer	P.O. Box 942, 4180 Ut St.	duis.a@yahoo.com	1-426-525-2627	2022-06-19 07:30:21
42	Ursula	Raymond	Ap #242-3276 Ipsum. Rd.	eleifend@outlook.ca	1-216-835-3523	2023-10-20 23:51:37
43	Zephania	Duran	893-7301 Nunc Rd.	duis.gravida@aol.com	1-213-687-8258	2023-04-15 17:23:44
44	Jillian	Navarro	619 Eu, Av.	sed.eget@aol.com	1-320-535-2759	2022-08-09 10:14:26
45	Randall	Meadows	1861 Turpis. Road	curae.phasellus@yahoo.ca	1-362-410-2182	2022-02-21 01:33:26
46	Dolan	Lamb	773-8124 Vivamus Rd.	eget.lacus@hotmail.com	1-487-749-7138	2023-09-08 16:55:23
47	Julian	Valencia	5549 Turpis Street	elementum.dui@outlook.net	1-326-890-6417	2022-10-15 06:51:47
48	Stacey	Hansen	Ap #345-9781 Auctor Rd.	tortor.nunc.commodo@protonmail.couk	1-480-131-0411	2023-01-21 15:56:27
49	Slade	Estrada	Ap #377-3890 Ultrices Avenue	nibh.sit@protonmail.com	1-741-127-5418	2022-04-02 00:58:51
50	Roth	Reid	781-308 Amet, Rd.	nunc.ac@aol.ca	1-932-241-4299	2021-12-01 12:45:23
51	Otto	O'connor	Ap #550-2302 Lectus Road	nisl.elementum@yahoo.edu	1-505-454-4782	2023-04-24 18:41:43
52	Cadman	Herman	Ap #446-3334 Pretium St.	diam.proin@hotmail.net	1-431-356-5801	2022-06-24 21:19:38
53	Rajah	Romero	832-4292 A St.	erat.sed@protonmail.edu	1-757-308-8330	2022-11-09 00:54:08
54	Shad	Berger	196-1673 Accumsan Street	dolor@hotmail.couk	1-924-302-7731	2022-03-10 20:37:23
55	Rajah	Ellison	7059 Lacinia Road	feugiat.placerat@hotmail.com	1-585-382-6769	2022-01-30 09:33:57
56	Melodie	Chang	P.O. Box 324, 9966 Montes, St.	accumsan.neque.et@protonmail.net	1-633-634-7523	2023-08-06 02:37:01
57	Brent	Hunt	P.O. Box 433, 7340 Eros Rd.	lorem.donec.elementum@protonmail.edu	1-846-962-4447	2023-10-21 13:07:36
58	Unity	Mcintosh	P.O. Box 603, 8507 Sollicitudin Avenue	porttitor.eros@google.net	1-310-581-4366	2022-01-16 09:05:12
59	Grant	Bennett	859-350 Feugiat Ave	dictum@outlook.couk	1-885-465-8814	2023-03-05 12:06:33
60	September	Parsons	Ap #804-3367 Curabitur Street	porttitor.eros@hotmail.com	1-536-311-2760	2023-04-08 16:45:30
61	Joy	Wright	P.O. Box 804, 7436 Amet Ave	diam.nunc.ullamcorper@google.ca	1-557-972-2493	2022-03-16 20:02:17
62	Merrill	Chapman	634-1798 Aliquet Avenue	mollis.vitae.posuere@protonmail.edu	1-465-708-5463	2022-04-12 23:09:43
63	Murphy	Cote	Ap #864-885 Vitae Ave	at@google.org	1-248-521-2482	2022-08-12 07:37:26
64	Daria	Figueroa	Ap #376-2912 Elementum Avenue	elit.erat@yahoo.edu	1-974-538-6160	2022-10-24 09:00:26
65	Acton	Rich	880-6580 Lorem, Ave	nibh.aliquam@icloud.com	1-466-611-4261	2022-04-23 09:34:35
66	Constance	Campbell	P.O. Box 402, 252 Proin St.	aliquam.nec@aol.couk	1-828-463-0384	2022-06-29 20:51:37
67	Iliana	Park	Ap #257-324 Arcu Av.	penatibus.et@aol.com	1-570-295-4865	2023-04-16 11:36:22
68	Stacy	Mcdowell	Ap #232-5663 Ut Road	a.purus@outlook.org	1-970-451-5378	2022-02-08 21:46:19
69	Grady	Jacobs	Ap #675-1370 Nisl Street	sed@google.net	1-405-511-8765	2022-10-08 08:32:58
70	Flavia	William	692-9295 Mollis Rd.	eros.non.enim@aol.edu	1-839-343-7631	2022-12-14 22:57:24
71	Brynne	Rosario	9204 Lorem Ave	dictum.sapien.aenean@yahoo.ca	1-553-871-3477	2023-10-05 20:24:13
72	Candace	Rivers	P.O. Box 993, 6334 Malesuada Rd.	diam.sed@outlook.edu	1-539-518-2974	2023-07-02 11:36:47
73	Isabella	Knight	415-9870 Odio, St.	lacus.vestibulum@icloud.com	1-463-637-6785	2023-07-01 02:06:22
74	Price	Guzman	Ap #991-5177 Purus Ave	sit@yahoo.edu	1-686-867-3142	2023-07-26 08:02:14
75	Rashad	Barton	607-443 Nunc Road	nibh.sit@icloud.couk	1-645-297-6585	2023-03-25 05:01:09
76	Oliver	Gilliam	746-303 Elementum, Rd.	sollicitudin.commodo@icloud.com	1-344-443-4166	2022-09-14 23:10:30
77	Emily	Wilson	5402 Cras Av.	aliquam@yahoo.com	1-154-361-2496	2022-04-19 06:03:31
78	Dieter	Hughes	336-4552 Sed Rd.	ultrices.vivamus@yahoo.edu	1-361-834-1260	2022-12-08 15:12:13
79	Sophia	Wheeler	1153 Eu, St.	nisl.elementum@aol.couk	1-633-323-5114	2023-03-19 12:59:24
80	Jenna	Burch	Ap #471-3164 Ipsum St.	ante.nunc.mauris@outlook.com	1-469-391-2553	2023-06-09 04:50:35
81	Amanda	Livingston	Ap #726-6253 Semper St.	duis.sit@protonmail.ca	1-529-113-3383	2023-03-03 04:38:50
82	Valentine	Clements	Ap #317-280 Est Road	sed@aol.com	1-848-223-3675	2022-12-14 08:15:24
83	Petra	Kramer	424-7564 Hendrerit Ave	mus.proin@hotmail.ca	1-151-627-6553	2023-06-29 23:22:38
84	Ezekiel	Rodgers	7108 Integer Ave	a.nunc.in@google.com	1-555-959-7674	2022-01-11 16:34:48
85	Martin	Bruce	P.O. Box 827, 2776 Luctus Road	vestibulum.accumsan@yahoo.org	1-337-473-2865	2023-10-22 13:55:12
86	Maya	Burch	806-2842 Massa. Rd.	nulla.eu@hotmail.edu	1-743-367-9833	2023-05-18 15:28:51
87	Acton	Love	5336 Ut Street	hymenaeos.mauris@google.couk	1-362-889-3414	2022-02-03 20:35:00
88	Damon	Kelly	Ap #131-9437 Nulla. Road	eget.dictum@outlook.edu	1-247-212-7124	2021-12-15 07:04:37
89	Destiny	Hubbard	P.O. Box 683, 2207 Lorem St.	nam.porttitor@google.com	1-449-513-8220	2022-08-01 12:32:28
90	Velma	Dickson	Ap #450-8374 Integer Rd.	suscipit.nonummy.fusce@yahoo.org	1-223-515-2350	2023-09-25 09:02:46
91	Joshua	Morrow	364-7795 Convallis St.	cras@google.couk	1-356-115-1581	2021-12-08 22:44:02
92	Ruth	Doyle	Ap #182-5047 Consequat Street	odio@outlook.ca	1-524-721-1884	2022-10-26 22:01:37
93	Amy	Lowe	726-8178 At, Ave	mi.fringilla@google.net	1-523-118-7559	2022-03-30 12:34:07
94	Marny	Sloan	469-7184 Libero St.	nulla.tincidunt@outlook.net	1-854-285-7546	2022-06-29 10:18:06
95	Burton	Kim	Ap #197-548 Lacus Street	egestas@outlook.ca	1-429-514-3371	2023-01-19 02:03:07
96	Alyssa	Irwin	964-5904 Nec, Rd.	justo.proin.non@yahoo.couk	1-657-160-4992	2021-11-14 20:41:27
97	Cheyenne	Knight	213-2584 Posuere St.	ante.iaculis.nec@hotmail.com	1-647-420-6457	2022-08-14 13:10:11
98	Hamish	Pate	P.O. Box 353, 5635 Sem. St.	etiam@aol.org	1-244-520-5208	2022-03-23 23:59:08
99	Tatyana	Navarro	P.O. Box 524, 255 Vel, Ave	ac@google.net	1-735-221-8341	2022-10-12 00:56:13
100	Hannah	Noel	628 Fringilla St.	magna.a.tortor@hotmail.org	1-710-732-8949	2023-08-05 19:50:22
\.


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.baskets_id_seq', 100, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 25, true);


--
-- Name: delivery_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.delivery_methods_id_seq', 10, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.images_id_seq', 100, true);


--
-- Name: images_of_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.images_of_reviews_id_seq', 100, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 100, true);


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 10, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.products_id_seq', 100, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 100, true);


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.shops_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: delivery_methods delivery_methods_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.delivery_methods
    ADD CONSTRAINT delivery_methods_name_key UNIQUE (name);


--
-- Name: delivery_methods delivery_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.delivery_methods
    ADD CONSTRAINT delivery_methods_pkey PRIMARY KEY (id);


--
-- Name: images_of_reviews images_of_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images_of_reviews
    ADD CONSTRAINT images_of_reviews_pkey PRIMARY KEY (id);


--
-- Name: images_of_reviews images_of_reviews_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images_of_reviews
    ADD CONSTRAINT images_of_reviews_url_key UNIQUE (url);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: images images_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_url_key UNIQUE (url);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_name_key UNIQUE (name);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: shops shops_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_name_key UNIQUE (name);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


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
-- Name: products check_product_on_update; Type: TRIGGER; Schema: public; Owner: gb_user
--

CREATE TRIGGER check_product_on_update BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_product_description_trigger();


--
-- Name: baskets baskets_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: images_of_reviews images_of_reviews_owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.images_of_reviews
    ADD CONSTRAINT images_of_reviews_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: orders orders_delivery_method_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_delivery_method_id_fk FOREIGN KEY (delivery_method_id) REFERENCES public.delivery_methods(id);


--
-- Name: orders orders_payment_method_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payment_method_id_fk FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id);


--
-- Name: orders orders_shop_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shop_id_fk FOREIGN KEY (shop_id) REFERENCES public.shops(id);


--
-- Name: orders orders_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products products_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: products products_images_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_images_id_fk FOREIGN KEY (images_id) REFERENCES public.images(id);


--
-- Name: reviews reviews_images_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_images_id_fk FOREIGN KEY (images_id) REFERENCES public.images_of_reviews(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_order_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: reviews reviews_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

