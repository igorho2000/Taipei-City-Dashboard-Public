--
-- PostgreSQL database cluster dump
--

-- Started on 2024-06-27 05:04:32 UTC

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:FqW+rZkIKBVJHEbkY6oF9w==$gn7XQrOwThZ1auGRPtr2i7YveN2xAbPNt7RljY/47is=:jalS179ybuBHuD4/k3mC36g6BQbmDf6gnkGDd4ekb20=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-27 05:04:32 UTC

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

-- Completed on 2024-06-27 05:04:32 UTC

--
-- PostgreSQL database dump complete
--

--
-- Database "dashboardmanager" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-27 05:04:32 UTC

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

--
-- TOC entry 4798 (class 1262 OID 16384)
-- Name: dashboardmanager; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dashboardmanager WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE dashboardmanager OWNER TO postgres;

\connect dashboardmanager

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

--
-- TOC entry 4799 (class 0 OID 0)
-- Name: dashboardmanager; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE dashboardmanager SET search_path TO '$user', 'public', 'topology', 'tiger';


\connect dashboardmanager

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

--
-- TOC entry 11 (class 2615 OID 19300)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 19556)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 19121)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 4 (class 3079 OID 19288)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 2 (class 3079 OID 18043)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 5 (class 3079 OID 19301)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 3 (class 3079 OID 19122)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 290 (class 1259 OID 19760)
-- Name: auth_user_group_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_group_roles (
    auth_user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.auth_user_group_roles OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 19713)
-- Name: auth_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password character varying,
    idno character varying,
    uuid character varying,
    tp_account character varying,
    member_type character varying,
    verify_level character varying,
    is_admin boolean DEFAULT false,
    is_active boolean DEFAULT true,
    is_whitelist boolean DEFAULT false,
    is_blacked boolean DEFAULT false,
    expired_at timestamp with time zone,
    created_at timestamp with time zone,
    login_at timestamp with time zone,
    mode character varying DEFAULT 'light'::character varying,
    CONSTRAINT chk_auth_users_email CHECK (((email)::text ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'::text))
);


ALTER TABLE public.auth_users OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 19712)
-- Name: auth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_users_id_seq OWNER TO postgres;

--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 284
-- Name: auth_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_users_id_seq OWNED BY public.auth_users.id;


--
-- TOC entry 293 (class 1259 OID 19791)
-- Name: component_charts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_charts (
    index character varying NOT NULL,
    color character varying[],
    types character varying[],
    unit character varying
);


ALTER TABLE public.component_charts OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 19799)
-- Name: component_maps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_maps (
    id bigint NOT NULL,
    index character varying NOT NULL,
    title character varying NOT NULL,
    type character varying NOT NULL,
    source character varying NOT NULL,
    size character varying,
    icon character varying,
    paint json,
    property json
);


ALTER TABLE public.component_maps OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19798)
-- Name: component_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.component_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.component_maps_id_seq OWNER TO postgres;

--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 294
-- Name: component_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.component_maps_id_seq OWNED BY public.component_maps.id;


--
-- TOC entry 292 (class 1259 OID 19781)
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components (
    id bigint NOT NULL,
    index character varying NOT NULL,
    name character varying NOT NULL,
    history_config json,
    map_config_ids integer[],
    map_config json,
    chart_config json,
    map_filter json,
    time_from character varying,
    time_to character varying,
    update_freq integer,
    update_freq_unit character varying,
    source character varying,
    short_desc text,
    long_desc text,
    use_case text,
    links text[],
    contributors text[],
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    query_type character varying,
    query_chart text,
    query_history text
);


ALTER TABLE public.components OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 19780)
-- Name: components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_id_seq OWNER TO postgres;

--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 291
-- Name: components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_id_seq OWNED BY public.components.id;


--
-- TOC entry 297 (class 1259 OID 19808)
-- Name: contributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contributors (
    id bigint NOT NULL,
    user_id character varying NOT NULL,
    user_name character varying NOT NULL,
    image text,
    link text NOT NULL,
    identity character varying,
    description text,
    include boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contributors OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19807)
-- Name: contributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contributors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contributors_id_seq OWNER TO postgres;

--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 296
-- Name: contributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contributors_id_seq OWNED BY public.contributors.id;


--
-- TOC entry 300 (class 1259 OID 19828)
-- Name: dashboard_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_groups (
    dashboard_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.dashboard_groups OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 19818)
-- Name: dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboards (
    id bigint NOT NULL,
    index character varying NOT NULL,
    name character varying NOT NULL,
    components integer[],
    icon text,
    updated_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dashboards OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19817)
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboards_id_seq OWNER TO postgres;

--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 298
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- TOC entry 289 (class 1259 OID 19746)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying,
    is_personal boolean DEFAULT false,
    create_by bigint
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 19745)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 288
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 306 (class 1259 OID 19867)
-- Name: incidents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidents (
    id bigint NOT NULL,
    type text,
    description text,
    distance numeric,
    latitude numeric,
    longitude numeric,
    place text,
    "time" timestamp with time zone,
    status text
);


ALTER TABLE public.incidents OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 19866)
-- Name: incidents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidents_id_seq OWNER TO postgres;

--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 305
-- Name: incidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidents_id_seq OWNED BY public.incidents.id;


--
-- TOC entry 302 (class 1259 OID 19844)
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    id bigint NOT NULL,
    title character varying NOT NULL,
    user_name character varying NOT NULL,
    user_id character varying NOT NULL,
    context text,
    description text NOT NULL,
    decision_desc text,
    status character varying NOT NULL,
    updated_by character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 19843)
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issues_id_seq OWNER TO postgres;

--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 301
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- TOC entry 287 (class 1259 OID 19734)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    access_control boolean DEFAULT false,
    modify boolean DEFAULT false,
    read boolean DEFAULT false
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 19733)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 286
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 304 (class 1259 OID 19853)
-- Name: view_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.view_points (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    center_x numeric,
    center_y numeric,
    zoom numeric,
    pitch numeric,
    bearing numeric,
    name text,
    point_type text
);


ALTER TABLE public.view_points OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 19852)
-- Name: view_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.view_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.view_points_id_seq OWNER TO postgres;

--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 303
-- Name: view_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.view_points_id_seq OWNED BY public.view_points.id;


--
-- TOC entry 4539 (class 2604 OID 19891)
-- Name: auth_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users ALTER COLUMN id SET DEFAULT nextval('public.auth_users_id_seq'::regclass);


--
-- TOC entry 4552 (class 2604 OID 19892)
-- Name: component_maps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_maps ALTER COLUMN id SET DEFAULT nextval('public.component_maps_id_seq'::regclass);


--
-- TOC entry 4551 (class 2604 OID 19893)
-- Name: components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.components_id_seq'::regclass);


--
-- TOC entry 4553 (class 2604 OID 19894)
-- Name: contributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributors ALTER COLUMN id SET DEFAULT nextval('public.contributors_id_seq'::regclass);


--
-- TOC entry 4555 (class 2604 OID 19895)
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- TOC entry 4549 (class 2604 OID 19896)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 4558 (class 2604 OID 19897)
-- Name: incidents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidents ALTER COLUMN id SET DEFAULT nextval('public.incidents_id_seq'::regclass);


--
-- TOC entry 4556 (class 2604 OID 19898)
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- TOC entry 4545 (class 2604 OID 19899)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4557 (class 2604 OID 19900)
-- Name: view_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_points ALTER COLUMN id SET DEFAULT nextval('public.view_points_id_seq'::regclass);


--
-- TOC entry 4776 (class 0 OID 19760)
-- Dependencies: 290
-- Data for Name: auth_user_group_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_group_roles (auth_user_id, group_id, role_id) FROM stdin;
1	42	1
1	1	1
\.


--
-- TOC entry 4771 (class 0 OID 19713)
-- Dependencies: 285
-- Data for Name: auth_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_users (id, name, email, password, idno, uuid, tp_account, member_type, verify_level, is_admin, is_active, is_whitelist, is_blacked, expired_at, created_at, login_at, mode) FROM stdin;
1	abb00717	eric94528@gmail.com	453cde7064707ba47d48853a830aca05ba0cbf1fc48bd11721246f121c498479	\N	\N	\N	\N	\N	t	t	t	f	\N	2024-06-26 13:34:41.714245+00	2024-06-27 04:12:27.023344+00	light
\.


--
-- TOC entry 4779 (class 0 OID 19791)
-- Dependencies: 293
-- Data for Name: component_charts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_charts (index, color, types, unit) FROM stdin;
pump_status	{#ff9800}	{GuageChart,BarPercentChart}	站
welfare_institutions	{#F65658,#F49F36,#F5C860,#9AC17C,#4CB495,#569C9A,#60819C,#2F8AB1}	{BarChart,DonutChart}	間
building_unsued	{#d16ae2,#655fad}	{MapLegend}	處
patrol_criminalcase	{#FD5696,#00A9E0}	{TimelineSeparateChart,TimelineStackedChart,ColumnLineChart}	件
welfare_population	{#2e999b,#80e3d4,#1f9b85,#a5ece0}	{ColumnChart,BarPercentChart,DistrictChart}	人
garbage_truck	{#E6DF44,#F4633C,#D63940,#9C2A4B}	{ColumnChart}	處
\.


--
-- TOC entry 4781 (class 0 OID 19799)
-- Dependencies: 295
-- Data for Name: component_maps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_maps (id, index, title, type, source, size, icon, paint, property) FROM stdin;
50	patrol_rain_floodgate	抽水站	circle	geojson	big	\N	{"circle-color":["match",["get","all_pumb_lights"],"+","#ff9800","#00B2FF"]}	[{"key":"station_name","name":"站名"},{"key":"all_pumb_lights","name":"總抽水狀態"},{"key":"warning_level","name":"目前警戒值"},{"key":"start_pumping_level","name":"抽水起始值"},{"key":"door_num","name":"水門數目"},{"key":"pumb_num","name":"抽水機數目"},{"key":"river_basin","name":"流域"},{"key":"rec_time","name":"記錄時間"}]
42	building_unsued_land	閒置市有公有地	fill	geojson	\N	\N	{"fill-color":"#d16ae2","fill-opacity":0.7}	[{"key":"10712土地_1_土地權屬情形","name":"土地權屬情形"},{"key":"10712土地_1_管理機關","name":"管理機關"}]
60	patrol_rain_sewer	下水道	circle	geojson	big	\N	{"circle-color": ["interpolate", ["linear"], ["to-number", ["get", "ground_far"]], -100, "#F92623", 0.51, "#81bcf5"]}	[{"key": "station_no", "name": "NO"}, {"key": "station_name", "name": "站名"}, {"key": "ground_far", "name": "距地面高[公尺]"}, {"key": "level_out", "name": "水位高[公尺]"}, {"key": "rec_time", "name": "紀錄時間"}]
64	socl_welfare_organization_plc	社福機構	circle	geojson	big	\N	{"circle-color": ["match", ["get", "main_type"], "銀髮族服務", "#F49F36", "身障機構", "#F65658", "兒童與少年服務", "#F5C860", "社區服務、NPO", "#9AC17C", "婦女服務", "#4CB495", "貧困危機家庭服務", "#569C9A", "保護性服務", "#60819C", "#2F8AB1"]}	[{"key": "main_type", "name": "主要類別"}, {"key": "sub_type", "name": "次要分類"}, {"key": "name", "name": "名稱"}, {"key": "address", "name": "地址"}]
43	building_unsued_public	閒置市有(公用)建物	circle	geojson	big	\N	{"circle-color":"#655fad"}	[{"key":"門牌","name":"門牌"},{"key":"房屋現況","name":"房屋現況"},{"key":"目前執行情形","name":"目前執行情形"},{"key":"閒置樓層_閒置樓層/該建物總樓層","name":"閒置樓層/總樓層"},{"key":"閒置面積㎡","name":"閒置面積㎡"},{"key":"基地管理機關","name":"基地管理機關"},{"key":"建物管理機關","name":"建物管理機關"},{"key":"原使用用途","name":"原使用用途"},{"key":"基地所有權人","name":"基地所有權人"},{"key":"建物標示","name":"建物標示"},{"key":"建築完成日期","name":"建築完成日期"}]
91	garbage_truck	垃圾車收運點位	circle	geojson	\N	\N	{\r\n    "circle-color": [\r\n        "case",\r\n        ["<", ["get", "抵達時間"], 1700], "#E6DF44",\r\n        ["<", ["get", "抵達時間"], 1900], "#F4633C",\r\n        ["<", ["get", "抵達時間"], 2100], "#D63940",\r\n        "#9C2A4B"\r\n    ]\r\n}\r\n	[\r\n    {"key": "行政區", "name": "行政區"},\r\n    {"key": "抵達時間", "name": "抵達時間"},\r\n    {"key": "離開時間", "name": "離開時間"},\r\n    {"key": "地點", "name": "地址"}\r\n]\r\n
\.


--
-- TOC entry 4778 (class 0 OID 19781)
-- Dependencies: 292
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components (id, index, name, history_config, map_config_ids, map_config, chart_config, map_filter, time_from, time_to, update_freq, update_freq_unit, source, short_desc, long_desc, use_case, links, contributors, created_at, updated_at, query_type, query_chart, query_history) FROM stdin;
90	welfare_population	社福人口	\N	{}	\N	\N	\N	static	\N	\N	\N	社會局	顯示社會福利人口（身障、低收、中低收、低收身障）的比例	顯示社會福利人口（身障、低收、中低收、低收身障）的比例，資料來源為台北市社會局內部資料，每月15號更新。	社福人口比例的資料能讓我們了解台北市社會福利的需求變化，從而規劃更貼近民眾需求的社會福利措施。	{}	{tuic}	2023-12-20 05:56:00+00	2024-01-09 03:32:59.233032+00	three_d	SELECT x_axis, y_axis, data FROM (SELECT district AS x_axis, '低收' AS y_axis, is_low_income AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, '中低收' AS y_axis, is_low_middle_income AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, '身障補助' AS y_axis, is_disabled_allowance AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, '身障' AS y_axis, is_disabled AS data FROM app_calcu_monthly_socl_welfare_people_ppl) AS combined_data WHERE x_axis != 'e' ORDER BY ARRAY_POSITION(ARRAY['北投區', '士林區', '內湖區', '南港區', '松山區', '信義區', '中山區', '大同區', '中正區', '萬華區', '大安區', '文山區']::varchar[], combined_data.x_axis), ARRAY_POSITION(ARRAY['低收', '中低收', '身障補助', '身障'], combined_data.y_axis);	\N
82	welfare_institutions	社福機構	\N	{64}	\N	\N	{"mode": "byParam", "byParam": {"xParam": "main_type"}}	static	\N	\N	\N	社會局	顯示社會福利機構點位及機構類型	顯示社會福利機構點位及機構類型，資料來源為台北市社會局內部資料，每月15日更新。	根據機構空間的分佈情況，檢視社會福利機構是否均勻分布，同時整合市有土地、社會住宅等潛在可使用之空間，以研擬增設位置與類型的方案。	{https://data.taipei/dataset/detail?id=cabdf272-e0ec-4e4e-9136-f4b8596f35d9}	{tuic}	2023-12-20 05:56:00+00	2023-12-20 05:56:00+00	two_d	select main_type as x_axis,count(*) as data from socl_welfare_organization_plc group by main_type order by data desc	\N
7	patrol_criminalcase	刑事統計	\N	{}	\N	\N	\N	year_ago	now	1	month	警察局	顯示近兩年每月的刑案統計資訊	顯示近兩年每月的刑案統計資訊，資料來源為台北市主計處開放資料，每月更新。	藉由掌握台北市刑事案件近2年的統計資訊，我們可以瞭解案件的增減趨勢及相關特徵，有助於制定更有效的治安策略。	{https://data.taipei/dataset/detail?id=dc7e246a-a88e-42f8-8cd6-9739209af774}	{tuic}	2023-12-20 05:56:00+00	2024-01-17 06:53:41.810511+00	time	WITH date_range AS (\n  SELECT\n    '%s'::timestamp with time zone AS start_time,\n    '%s'::timestamp with time zone AS end_time\n)\nSELECT "年月別" as x_axis, '發生件數' as y_axis, "發生件數[件]" as data FROM public.patrol_criminal_case \nWHERE 年月別 BETWEEN  (SELECT start_time FROM date_range) AND (SELECT end_time FROM date_range)\nUNION ALL\nSELECT "年月別" as x_axis, '破獲件數' as y_axis, "破獲件數/總計[件]" as data FROM public.patrol_criminal_case\nWHERE 年月別 BETWEEN  (SELECT start_time FROM date_range) AND (SELECT end_time FROM date_range)	\N
30	building_unsued	閒置市有財產	\N	{42,43}	\N	\N	{"mode":"byLayer"}	static	\N	\N	\N	財政局	\N	\N	\N	{}	{tuic}	2023-12-20 05:56:00+00	2024-01-11 06:01:02.392686+00	map_legend	select '閒置市有公有地' as name, count(*) as value, 'fill' as type from building_unsued_land\nunion all\nselect '閒置市有(公用)建物' as name, count(*) as value, 'circle' as type from building_unsued_public	\N
43	pump_status	抽水站狀態	\N	{50}	\N	\N	{"mode":"byParam","byParam":{"yParam":"all_pumb_lights"}}	current	\N	10	minute	工務局水利處	顯示當前全市開啟的抽水站數量	顯示當前全市開啟的抽水站數量，資料來源為工務局水利處內部資料，每十分鐘更新。	考慮當日天氣及「水位監測」組件的資料，來探討抽水站的運作狀況與水位異常之間的關聯性。	{}	{tuic}	2023-12-20 05:56:00+00	2024-01-25 09:36:14.565347+00	percent	select '啟動抽水站' as x_axis, y_axis, data from \n(\nselect '啟動中' as y_axis, count(*) as data from patrol_rain_floodgate where all_pumb_lights = '+'\nunion all\nselect '未啟動' as y_axis, count(*) as data from patrol_rain_floodgate where all_pumb_lights != '+'\n) as parsed_data	\N
69	garbage_truck	垃圾車收運點位	null	{91}	\N	\N	{"mode": "byParam", "byParam": {"xParam": "行政區"}}	static	\N	\N	\N	環保局	\N	\N	\N	{https://data.taipei/dataset/detail?id=6bb3304b-4f46-4bb0-8cd1-60c66dcd1cae}	{tuic}	2024-06-27 12:40:00+00	2024-06-27 04:42:33.487344+00	three_d	SELECT * FROM (\n    SELECT\n        行政區 as x_axis,\n        CASE\n            WHEN 抵達時間 BETWEEN 0 AND 1659 THEN '1700前'\n            WHEN 抵達時間 BETWEEN 1700 AND 1859 THEN '1700-1900'\n            WHEN 抵達時間 BETWEEN 1900 AND 2059 THEN '1900-2100'\n            ELSE '2100後'\n        END AS y_axis,\n        COUNT(*) AS data\n    FROM garbage_truck\n    GROUP BY\n        行政區,\n        CASE\n            WHEN 抵達時間 BETWEEN 0 AND 1659 THEN '1700前'\n            WHEN 抵達時間 BETWEEN 1700 AND 1859 THEN '1700-1900'\n            WHEN 抵達時間 BETWEEN 1900 AND 2059 THEN '1900-2100'\n            ELSE '2100後'\n        END\n) as t\nORDER BY\n    CASE x_axis\n        WHEN '北投區' THEN 1\n        WHEN '士林區' THEN 2\n        WHEN '內湖區' THEN 3\n        WHEN '南港區' THEN 4\n        WHEN '松山區' THEN 5\n        WHEN '信義區' THEN 6\n        WHEN '中山區' THEN 7\n        WHEN '大同區' THEN 8\n        WHEN '中正區' THEN 9\n        WHEN '萬華區' THEN 10\n        WHEN '大安區' THEN 11\n        WHEN '文山區' THEN 12\n    END,\n    CASE y_axis\n        WHEN '1700前' THEN 1\n        WHEN '1700-1900' THEN 2\n        WHEN '1900-2100' THEN 3\n        WHEN '2100後' THEN 4\n    END;\n	\N
\.


--
-- TOC entry 4783 (class 0 OID 19808)
-- Dependencies: 297
-- Data for Name: contributors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contributors (id, user_id, user_name, image, link, identity, description, include, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 19828)
-- Dependencies: 300
-- Data for Name: dashboard_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_groups (dashboard_id, group_id) FROM stdin;
1	1
2	1
72	42
\.


--
-- TOC entry 4785 (class 0 OID 19818)
-- Dependencies: 299
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboards (id, index, name, components, icon, updated_at, created_at) FROM stdin;
2	map-layers	圖資資訊	{30}	public	2024-01-11 09:32:32.465099+00	2024-01-11 09:32:32.465099+00
72	2553c8cc28b8	收藏組件	\N	favorite	2024-06-26 13:34:41.720633+00	2024-06-26 13:34:41.720633+00
1	demo-components	範例組件	{7,43,82,90,69}	bug_report	2024-06-27 04:42:45.514989+00	2023-12-27 06:11:56.841132+00
\.


--
-- TOC entry 4775 (class 0 OID 19746)
-- Dependencies: 289
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, is_personal, create_by) FROM stdin;
1	public	f	\N
42	user: 1's personal group	t	1
\.


--
-- TOC entry 4792 (class 0 OID 19867)
-- Dependencies: 306
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidents (id, type, description, distance, latitude, longitude, place, "time", status) FROM stdin;
\.


--
-- TOC entry 4788 (class 0 OID 19844)
-- Dependencies: 302
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (id, title, user_name, user_id, context, description, decision_desc, status, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4773 (class 0 OID 19734)
-- Dependencies: 287
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, access_control, modify, read) FROM stdin;
1	admin	t	t	t
2	editor	f	t	t
3	viewer	f	f	t
4	admin	t	t	t
5	editor	f	t	t
6	viewer	f	f	t
7	admin	t	t	t
8	editor	f	t	t
9	viewer	f	f	t
10	admin	t	t	t
11	editor	f	t	t
12	viewer	f	f	t
\.


--
-- TOC entry 4522 (class 0 OID 18361)
-- Dependencies: 223
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 19853)
-- Dependencies: 304
-- Data for Name: view_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.view_points (id, user_id, center_x, center_y, zoom, pitch, bearing, name, point_type) FROM stdin;
\.


--
-- TOC entry 4526 (class 0 OID 19307)
-- Dependencies: 234
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 4527 (class 0 OID 19639)
-- Dependencies: 279
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 4528 (class 0 OID 19649)
-- Dependencies: 281
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 4529 (class 0 OID 19659)
-- Dependencies: 283
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 4524 (class 0 OID 19124)
-- Dependencies: 228
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 4525 (class 0 OID 19136)
-- Dependencies: 229
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 284
-- Name: auth_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_users_id_seq', 4, true);


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 294
-- Name: component_maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.component_maps_id_seq', 91, true);


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 291
-- Name: components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_id_seq', 69, true);


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 296
-- Name: contributors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contributors_id_seq', 1, false);


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 298
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 71, true);


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 288
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 41, true);


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 305
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidents_id_seq', 1, false);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 301
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_id_seq', 1, false);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 286
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 12, true);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 303
-- Name: view_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.view_points_id_seq', 1, false);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 227
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 4592 (class 2606 OID 19764)
-- Name: auth_user_group_roles auth_user_group_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_group_roles
    ADD CONSTRAINT auth_user_group_roles_pkey PRIMARY KEY (auth_user_id, group_id, role_id);


--
-- TOC entry 4580 (class 2606 OID 19728)
-- Name: auth_users auth_users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users
    ADD CONSTRAINT auth_users_email_key UNIQUE (email);


--
-- TOC entry 4582 (class 2606 OID 19730)
-- Name: auth_users auth_users_idno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users
    ADD CONSTRAINT auth_users_idno_key UNIQUE (idno);


--
-- TOC entry 4584 (class 2606 OID 19726)
-- Name: auth_users auth_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users
    ADD CONSTRAINT auth_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4586 (class 2606 OID 19732)
-- Name: auth_users auth_users_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users
    ADD CONSTRAINT auth_users_uuid_key UNIQUE (uuid);


--
-- TOC entry 4598 (class 2606 OID 19797)
-- Name: component_charts component_charts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_charts
    ADD CONSTRAINT component_charts_pkey PRIMARY KEY (index);


--
-- TOC entry 4600 (class 2606 OID 19806)
-- Name: component_maps component_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_maps
    ADD CONSTRAINT component_maps_pkey PRIMARY KEY (id);


--
-- TOC entry 4594 (class 2606 OID 19790)
-- Name: components components_index_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_index_key UNIQUE (index);


--
-- TOC entry 4596 (class 2606 OID 19788)
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- TOC entry 4602 (class 2606 OID 19816)
-- Name: contributors contributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contributors
    ADD CONSTRAINT contributors_pkey PRIMARY KEY (id);


--
-- TOC entry 4608 (class 2606 OID 19832)
-- Name: dashboard_groups dashboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT dashboard_groups_pkey PRIMARY KEY (dashboard_id, group_id);


--
-- TOC entry 4604 (class 2606 OID 19827)
-- Name: dashboards dashboards_index_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_index_key UNIQUE (index);


--
-- TOC entry 4606 (class 2606 OID 19825)
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- TOC entry 4590 (class 2606 OID 19754)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4614 (class 2606 OID 19874)
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- TOC entry 4610 (class 2606 OID 19851)
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- TOC entry 4588 (class 2606 OID 19744)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4612 (class 2606 OID 19860)
-- Name: view_points view_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_points
    ADD CONSTRAINT view_points_pkey PRIMARY KEY (id);


--
-- TOC entry 4616 (class 2606 OID 19765)
-- Name: auth_user_group_roles fk_auth_user_group_roles_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_group_roles
    ADD CONSTRAINT fk_auth_user_group_roles_auth_user FOREIGN KEY (auth_user_id) REFERENCES public.auth_users(id);


--
-- TOC entry 4617 (class 2606 OID 19770)
-- Name: auth_user_group_roles fk_auth_user_group_roles_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_group_roles
    ADD CONSTRAINT fk_auth_user_group_roles_group FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 4618 (class 2606 OID 19775)
-- Name: auth_user_group_roles fk_auth_user_group_roles_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_group_roles
    ADD CONSTRAINT fk_auth_user_group_roles_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4619 (class 2606 OID 19833)
-- Name: dashboard_groups fk_dashboard_groups_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_dashboard FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- TOC entry 4620 (class 2606 OID 19838)
-- Name: dashboard_groups fk_dashboard_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_group FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 4615 (class 2606 OID 19755)
-- Name: groups fk_groups_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_groups_auth_user FOREIGN KEY (create_by) REFERENCES public.auth_users(id);


--
-- TOC entry 4621 (class 2606 OID 19861)
-- Name: view_points fk_view_points_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_points
    ADD CONSTRAINT fk_view_points_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_users(id);


-- Completed on 2024-06-27 05:04:33 UTC

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-27 05:04:33 UTC

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

-- Completed on 2024-06-27 05:04:33 UTC

--
-- PostgreSQL database dump complete
--

--
-- Database "template_postgis" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg110+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-27 05:04:33 UTC

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

--
-- TOC entry 4649 (class 1262 OID 16385)
-- Name: template_postgis; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template_postgis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template_postgis OWNER TO postgres;

\connect template_postgis

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

--
-- TOC entry 4650 (class 0 OID 0)
-- Name: template_postgis; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template_postgis IS_TEMPLATE = true;
ALTER DATABASE template_postgis SET search_path TO '$user', 'public', 'topology', 'tiger';


\connect template_postgis

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

--
-- TOC entry 11 (class 2615 OID 17643)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 17899)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 17464)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 4651 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 4 (class 3079 OID 17631)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 4652 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 2 (class 3079 OID 16386)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4653 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 5 (class 3079 OID 17644)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 4654 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 3 (class 3079 OID 17465)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 4655 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- TOC entry 4460 (class 0 OID 16704)
-- Dependencies: 223
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4464 (class 0 OID 17650)
-- Dependencies: 234
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 4465 (class 0 OID 17982)
-- Dependencies: 279
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 4466 (class 0 OID 17992)
-- Dependencies: 281
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 4467 (class 0 OID 18002)
-- Dependencies: 283
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 4462 (class 0 OID 17467)
-- Dependencies: 228
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 4463 (class 0 OID 17479)
-- Dependencies: 229
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 4656 (class 0 OID 0)
-- Dependencies: 227
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


-- Completed on 2024-06-27 05:04:33 UTC

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-06-27 05:04:33 UTC

--
-- PostgreSQL database cluster dump complete
--

