--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: sqitch; Type: SCHEMA; Schema: -; Owner: spedata
--

CREATE SCHEMA sqitch;


ALTER SCHEMA sqitch OWNER TO spedata;

--
-- Name: SCHEMA sqitch; Type: COMMENT; Schema: -; Owner: spedata
--

COMMENT ON SCHEMA sqitch IS 'Sqitch database deployment metadata v1.1.';


--
-- Name: detailed_recipe; Type: VIEW; Schema: public; Owner: spedata
--

CREATE VIEW public.detailed_recipe AS
SELECT
    NULL::integer AS id,
    NULL::text AS title,
    NULL::text AS reference,
    NULL::text AS img_name,
    NULL::text AS text,
    NULL::real AS meal_qty,
    NULL::interval AS cooking_time,
    NULL::interval AS preparation_time,
    NULL::integer AS type_id,
    NULL::boolean AS basket,
    NULL::text AS type_name,
    NULL::json AS ingredients;


ALTER TABLE public.detailed_recipe OWNER TO spedata;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: spedata
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name text NOT NULL,
    main_unit_id integer NOT NULL
);


ALTER TABLE public.ingredient OWNER TO spedata;

--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: spedata
--

ALTER TABLE public.ingredient ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: spedata
--

CREATE TABLE public.recipe (
    id integer NOT NULL,
    title text NOT NULL,
    reference text,
    img_name text DEFAULT 'noimage.jpg'::text NOT NULL,
    text text,
    meal_qty real NOT NULL,
    cooking_time interval NOT NULL,
    preparation_time interval NOT NULL,
    type_id integer NOT NULL,
    basket boolean DEFAULT false
);


ALTER TABLE public.recipe OWNER TO spedata;

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: spedata
--

ALTER TABLE public.recipe ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recipe_ingredient; Type: TABLE; Schema: public; Owner: spedata
--

CREATE TABLE public.recipe_ingredient (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    qty real NOT NULL,
    unit_id integer NOT NULL
);


ALTER TABLE public.recipe_ingredient OWNER TO spedata;

--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: spedata
--

ALTER TABLE public.recipe_ingredient ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.recipe_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: type; Type: TABLE; Schema: public; Owner: spedata
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.type OWNER TO spedata;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: spedata
--

ALTER TABLE public.type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: unit; Type: TABLE; Schema: public; Owner: spedata
--

CREATE TABLE public.unit (
    id integer NOT NULL,
    short_name text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.unit OWNER TO spedata;

--
-- Name: unit_id_seq; Type: SEQUENCE; Schema: public; Owner: spedata
--

ALTER TABLE public.unit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: changes; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.changes (
    change_id text NOT NULL,
    script_hash text,
    change text NOT NULL,
    project text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL
);


ALTER TABLE sqitch.changes OWNER TO spedata;

--
-- Name: TABLE changes; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.changes IS 'Tracks the changes currently deployed to the database.';


--
-- Name: COLUMN changes.change_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.change_id IS 'Change primary key.';


--
-- Name: COLUMN changes.script_hash; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.script_hash IS 'Deploy script SHA-1 hash.';


--
-- Name: COLUMN changes.change; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.change IS 'Name of a deployed change.';


--
-- Name: COLUMN changes.project; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.project IS 'Name of the Sqitch project to which the change belongs.';


--
-- Name: COLUMN changes.note; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.note IS 'Description of the change.';


--
-- Name: COLUMN changes.committed_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.committed_at IS 'Date the change was deployed.';


--
-- Name: COLUMN changes.committer_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.committer_name IS 'Name of the user who deployed the change.';


--
-- Name: COLUMN changes.committer_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.committer_email IS 'Email address of the user who deployed the change.';


--
-- Name: COLUMN changes.planned_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.planned_at IS 'Date the change was added to the plan.';


--
-- Name: COLUMN changes.planner_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.planner_name IS 'Name of the user who planed the change.';


--
-- Name: COLUMN changes.planner_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.changes.planner_email IS 'Email address of the user who planned the change.';


--
-- Name: dependencies; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.dependencies (
    change_id text NOT NULL,
    type text NOT NULL,
    dependency text NOT NULL,
    dependency_id text,
    CONSTRAINT dependencies_check CHECK ((((type = 'require'::text) AND (dependency_id IS NOT NULL)) OR ((type = 'conflict'::text) AND (dependency_id IS NULL))))
);


ALTER TABLE sqitch.dependencies OWNER TO spedata;

--
-- Name: TABLE dependencies; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.dependencies IS 'Tracks the currently satisfied dependencies.';


--
-- Name: COLUMN dependencies.change_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.dependencies.change_id IS 'ID of the depending change.';


--
-- Name: COLUMN dependencies.type; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.dependencies.type IS 'Type of dependency.';


--
-- Name: COLUMN dependencies.dependency; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.dependencies.dependency IS 'Dependency name.';


--
-- Name: COLUMN dependencies.dependency_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.dependencies.dependency_id IS 'Change ID the dependency resolves to.';


--
-- Name: events; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.events (
    event text NOT NULL,
    change_id text NOT NULL,
    change text NOT NULL,
    project text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    requires text[] DEFAULT '{}'::text[] NOT NULL,
    conflicts text[] DEFAULT '{}'::text[] NOT NULL,
    tags text[] DEFAULT '{}'::text[] NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL,
    CONSTRAINT events_event_check CHECK ((event = ANY (ARRAY['deploy'::text, 'revert'::text, 'fail'::text, 'merge'::text])))
);


ALTER TABLE sqitch.events OWNER TO spedata;

--
-- Name: TABLE events; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.events IS 'Contains full history of all deployment events.';


--
-- Name: COLUMN events.event; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.event IS 'Type of event.';


--
-- Name: COLUMN events.change_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.change_id IS 'Change ID.';


--
-- Name: COLUMN events.change; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.change IS 'Change name.';


--
-- Name: COLUMN events.project; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.project IS 'Name of the Sqitch project to which the change belongs.';


--
-- Name: COLUMN events.note; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.note IS 'Description of the change.';


--
-- Name: COLUMN events.requires; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.requires IS 'Array of the names of required changes.';


--
-- Name: COLUMN events.conflicts; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.conflicts IS 'Array of the names of conflicting changes.';


--
-- Name: COLUMN events.tags; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.tags IS 'Tags associated with the change.';


--
-- Name: COLUMN events.committed_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.committed_at IS 'Date the event was committed.';


--
-- Name: COLUMN events.committer_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.committer_name IS 'Name of the user who committed the event.';


--
-- Name: COLUMN events.committer_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.committer_email IS 'Email address of the user who committed the event.';


--
-- Name: COLUMN events.planned_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.planned_at IS 'Date the event was added to the plan.';


--
-- Name: COLUMN events.planner_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.planner_name IS 'Name of the user who planed the change.';


--
-- Name: COLUMN events.planner_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.events.planner_email IS 'Email address of the user who plan planned the change.';


--
-- Name: projects; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.projects (
    project text NOT NULL,
    uri text,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    creator_name text NOT NULL,
    creator_email text NOT NULL
);


ALTER TABLE sqitch.projects OWNER TO spedata;

--
-- Name: TABLE projects; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.projects IS 'Sqitch projects deployed to this database.';


--
-- Name: COLUMN projects.project; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.projects.project IS 'Unique Name of a project.';


--
-- Name: COLUMN projects.uri; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.projects.uri IS 'Optional project URI';


--
-- Name: COLUMN projects.created_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.projects.created_at IS 'Date the project was added to the database.';


--
-- Name: COLUMN projects.creator_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.projects.creator_name IS 'Name of the user who added the project.';


--
-- Name: COLUMN projects.creator_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.projects.creator_email IS 'Email address of the user who added the project.';


--
-- Name: releases; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.releases (
    version real NOT NULL,
    installed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    installer_name text NOT NULL,
    installer_email text NOT NULL
);


ALTER TABLE sqitch.releases OWNER TO spedata;

--
-- Name: TABLE releases; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.releases IS 'Sqitch registry releases.';


--
-- Name: COLUMN releases.version; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.releases.version IS 'Version of the Sqitch registry.';


--
-- Name: COLUMN releases.installed_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.releases.installed_at IS 'Date the registry release was installed.';


--
-- Name: COLUMN releases.installer_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.releases.installer_name IS 'Name of the user who installed the registry release.';


--
-- Name: COLUMN releases.installer_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.releases.installer_email IS 'Email address of the user who installed the registry release.';


--
-- Name: tags; Type: TABLE; Schema: sqitch; Owner: spedata
--

CREATE TABLE sqitch.tags (
    tag_id text NOT NULL,
    tag text NOT NULL,
    project text NOT NULL,
    change_id text NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    committed_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    committer_name text NOT NULL,
    committer_email text NOT NULL,
    planned_at timestamp with time zone NOT NULL,
    planner_name text NOT NULL,
    planner_email text NOT NULL
);


ALTER TABLE sqitch.tags OWNER TO spedata;

--
-- Name: TABLE tags; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON TABLE sqitch.tags IS 'Tracks the tags currently applied to the database.';


--
-- Name: COLUMN tags.tag_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.tag_id IS 'Tag primary key.';


--
-- Name: COLUMN tags.tag; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.tag IS 'Project-unique tag name.';


--
-- Name: COLUMN tags.project; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.project IS 'Name of the Sqitch project to which the tag belongs.';


--
-- Name: COLUMN tags.change_id; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.change_id IS 'ID of last change deployed before the tag was applied.';


--
-- Name: COLUMN tags.note; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.note IS 'Description of the tag.';


--
-- Name: COLUMN tags.committed_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.committed_at IS 'Date the tag was applied to the database.';


--
-- Name: COLUMN tags.committer_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.committer_name IS 'Name of the user who applied the tag.';


--
-- Name: COLUMN tags.committer_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.committer_email IS 'Email address of the user who applied the tag.';


--
-- Name: COLUMN tags.planned_at; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.planned_at IS 'Date the tag was added to the plan.';


--
-- Name: COLUMN tags.planner_name; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.planner_name IS 'Name of the user who planed the tag.';


--
-- Name: COLUMN tags.planner_email; Type: COMMENT; Schema: sqitch; Owner: spedata
--

COMMENT ON COLUMN sqitch.tags.planner_email IS 'Email address of the user who planned the tag.';


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.ingredient (id, name, main_unit_id) FROM stdin;
1	Crevette	1
3	Riz	5
4	Chorizo	1
6	Farine	3
9	Oeuf	1
8	Lait	2
7	Huile	3
2	Tomate	1
5	Poireau	1
19	Poire	1
20	Poulet	8
21	Boeuf	8
22	Cacahuète	8
23	Pesto	4
24	Pâtes	8
26	Jambon blanc	1
27	Tartine de pain	1
29	Gruyère rapé	8
28	Beurre	2
30	Choux fleur	1
18	Ananas	3
31	Epinard	8
32	Persil	14
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe (id, title, reference, img_name, text, meal_qty, cooking_time, preparation_time, type_id, basket) FROM stdin;
57	recette longue	très longue	chilli.jpg	long!\nfasitideux!	1	01:00:00	01:00:00	1	t
44	gndggh,f	hj;hj;jk:jk	lentilles.jpg	fshsrtdtjty	6	00:06:00	00:06:00	1	f
2	Galettes de poireaux	Marmitton:  https://www.marmiton.org/recettes/recette_galettes-de-poireaux_29838.aspx	poireaux.jpg	Laver et hacher les poireaux finement.\nFaire une pâte à crêpe avec les oeufs, 1 cuillère soupe d'huile, sel, poivre, la farine, le lait et un peu de muscade.\n\nAjouter les poireaux et mélanger, rajouter du lait si nécessaire.\nFaire cuire des petites crêpes de 5 mm dépaisseur dans une poêle chaude huilée, environ 5 min par face à feu doux.\n\nServir avec une vinaigrette, une sauce au fromage blanc ou de la sauce soja.	4	00:10:00	00:10:00	2	f
28	Cuisses de poulet au barbecue	Livre Recettes faciles P5 ...	poulet_barbecue.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat ante est, et finibus ipsum porttitor sed. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed neque arcu, lobortis id tempus sit amet, consectetur vel mi. Ut posuere feugiat leo, ac mollis nisi lobortis vel. Suspendisse potenti. Fusce vel mauris nec turpis placerat sodales quis ac ipsum. Sed fringilla nisi ultricies porttitor ultricies. Aliquam ac posuere nisi, non iaculis orci.Pellentesque aliquam gravida facilisis. Fusce accumsan suscipit mattis. Aenean dui justo, mollis vitae eros mollis, hendrerit blandit ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras non velit blandit, volutpat massa eget, rutrum lorem. Fusce auctor mauris non sem gravida gravida.Praesent hendrerit ultricies magna sed elementum. Duis gravida nec nibh eget egestas. Nullam id nunc facilisis, pharetra metus quis, lacinia ante. Donec vitae condimentum erat. Morbi sit amet magna magna. Curabitur eu rutrum felis. Suspendisse pharetra nibh risus, eu lobortis lectus luctus commodo.Aenean pharetra aliquam risus non rhoncus. Curabitur vel mi viverra, euismod ex ac, porttitor tellus. Quisque a augue non libero egestas volutpat. Nam eget consectetur massa. Aenean sollicitudin maximus euismod. Ut varius elementum efficitur. Pellentesque dignissim quis odio interdum tempus. Nunc tincidunt dui ut iaculis iaculis. Integer sagittis odio a justo dignissim, non efficitur risus vestibulum. Etiam urabitur faucibus porttitor nulla sed eleifend. Pellentesque et sagittis purus. Vivamus mauris mauris, interdum eget ex eu, tempus scelerisque justo. Praesent eget magna quis mi imperdiet consectetur. Duis in pretium nisi. Pellentesque habitant morbi .	6	00:25:00	00:10:00	2	f
40	nouveau test	kjdgfkajerg	error404.jpg	zaegzerhrtrzth	5	00:06:00	01:00:00	1	t
46	Croc Monsieur	Maison	chilli.jpg	Croc monsieur très bon	3	00:15:00	00:15:00	1	f
8	poulet_braisé	La mer Jesta3	poulet_braisé.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
5	Lentilles et viande hachée!	La mer Jesta ...	lentilles.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
55	nouvelle recette poisson	test poisson	noimage.jpg	-(ue(-u	4	00:12:00	01:15:00	1	f
41	ergezg	rjetyjtyj	paella.jpg	fxgndghngh,hj,	4	00:05:00	00:05:00	1	f
1	Shrimp and Chorizo Paella	Livre Cyril Lignac ...	paella.jpg	Heat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes.\nHeat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a\nAdd rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	2	00:25:00	00:15:00	2	f
29	Ma première Recette de Pomme de terre	Mon imagination	pate_carbo.jpg	Ceci est juste un testuuuu	4	00:15:00	00:10:00	1	t
30	Carpaccio de boeuf	Pour tester upload image à la création	carpaccio.jpg	Un très bon carpaccio de boeuf	6	00:15:00	00:15:00	3	f
10	boeuf bourguignon	La mer Jesta5	boeuf_bourguignon.jpg	titi va à la mer	4	00:30:00	00:20:00	2	f
39	nouvelle recette2	un livre imaginaire	tourte_saumon2.jpg	vHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	4	00:05:00	00:05:00	1	f
54	Nouvelle recette test	toto et titi	lentilles.jpg	Faux carpacio	8	00:35:00	00:15:00	2	f
47	test	démo	imagetest.jpg	zfergzerhrth	5	00:05:00	00:05:00	1	t
56	nouvelle recette VEGAN	vegaaaaaaaaaaaan	noimage.jpg	iiii	1	00:10:00	00:10:00	3	t
37	nouvelle recette	un livre imaginaire	imagetest.jpg	Recette pour tester les message de validation	4	00:05:00	00:05:00	1	f
45	eytjtyjdrk	jdtyk,yryu	poulet_barbecue.jpg	rdghrthgh,fh,ghj	7	00:06:00	00:06:00	1	f
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe_ingredient (id, recipe_id, ingredient_id, qty, unit_id) FROM stdin;
100	56	28	10	2
91	30	3	1000	8
93	30	30	3	1
89	47	4	3	1
85	46	26	4	1
88	46	28	10	8
86	46	29	10	8
102	47	21	15	8
54	28	6	40	4
53	28	3	10	5
52	28	8	30	6
75	40	3	2	5
103	40	32	1	14
74	39	3	2	5
27	8	1	20	1
64	8	3	10	5
55	8	2	5	1
101	57	1	20	1
4	1	4	1	1
26	5	1	20	1
25	5	3	10	5
73	37	3	2	5
76	41	3	2	5
77	41	2	3	1
78	44	5	5	1
79	45	3	2	5
82	2	2	5	1
94	2	28	10	8
83	2	4	5	1
61	10	4	3	1
95	10	18	1	1
96	10	21	100	8
65	29	5	1	1
92	29	22	150	8
98	54	21	1	8
99	55	28	10	2
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.type (id, name) FROM stdin;
2	VIANDE
1	POISSON
3	VEGAN
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.unit (id, short_name, name) FROM stdin;
2	L	Litre
3	CS	Cuillère à soupe
4	CC	Cuillère à café
5	Kg	Kilos
6	CL	Centilitre
8	Gr	Grammes
1	UN	Unité
10	PI	Pincée
14	NO	---
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.changes (change_id, script_hash, change, project, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
38b07ff45a969521ca1ef1f0756a904bcd3204fa	36c13505b56c7faa91b57ec538bfa044ad3c4fc4	initdb	recipesApp	crÃ©ation des tables	2022-09-06 12:03:11.729524+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
d2f2b5326e52d6252881391dec60d8b166b2e71b	7e3937815c0800212b5e9b0ede8f124cde4635cb	detailed_recipe	recipesApp	detailed recipes with ingredients and units	2022-09-06 12:03:11.838905+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
2ab8d775fd1607e1c56e9e2247516aa879456163	6eee1b5a7982648c42b30885c74187127f93a12a	alter_img_name	recipesApp	alter column recipe img_name	2022-09-09 10:44:04.242078+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
446f9ddebda012b5156edc56750c03a17500af63	b189de0d0f4baabadf46c808656d3bc40a61d0f0	basket_field	recipesApp	ajout du champs basket	2022-09-15 15:41:30.008095+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 15:38:49+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
3545440320746d8630fe0893a3ff131b14d0f353	7c40f3fb65eaf8ad53b66556cfc4d411d976a59b	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	2022-09-19 12:56:00.27944+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.dependencies (change_id, type, dependency, dependency_id) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.events (event, change_id, change, project, note, requires, conflicts, tags, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:15:58.590632+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:16:48.876235+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:17:29.197419+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:17:49.717463+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:18:11.528107+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:19:10.348776+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:20:45.972765+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:21:33.627553+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:22:13.344565+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:30:12.405605+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:30:38.865568+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:32:11.447814+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 10:32:39.382034+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 11:46:50.9838+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 11:47:05.220341+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 11:47:05.339582+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 11:47:12.331691+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 11:47:12.517431+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-06 12:02:48.686194+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 12:02:48.829311+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 12:02:55.312052+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 12:03:11.7309+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 15:30:35+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-06 12:03:11.839794+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 11:44:44+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:34:11.240831+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:34:22.535796+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:39:28.405616+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:40:30.361809+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:41:05.984244+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:43:57.930243+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 10:44:04.245571+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 10:28:14+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 15:40:45.723068+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 15:38:49+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 15:41:02.620955+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 15:38:49+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 15:41:25.003906+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 15:38:49+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 15:41:30.01142+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 15:38:49+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:43:47.555203+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:47:19.573465+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:48:02.789378+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:53:21.714026+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:54:27.48422+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:55:51.441431+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:55:54.869658+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:55:57.990362+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 12:56:00.282469+02	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 12:41:36+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
recipesApp	\N	2022-09-05 10:15:58.456775+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.releases (version, installed_at, installer_name, installer_email) FROM stdin;
1.1	2022-09-05 10:15:58.452432+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.tags (tag_id, tag, project, change_id, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 32, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.recipe_id_seq', 57, true);


--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.recipe_ingredient_id_seq', 103, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.type_id_seq', 4, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.unit_id_seq', 14, true);


--
-- Name: ingredient ingredient_name_key; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_name_key UNIQUE (name);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: recipe_ingredient recipe_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_pkey PRIMARY KEY (id);


--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: recipe recipe_title_key; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_title_key UNIQUE (title);


--
-- Name: type type_name_key; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_name_key UNIQUE (name);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: unit unit_name_key; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_name_key UNIQUE (name);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: unit unit_short_name_key; Type: CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_short_name_key UNIQUE (short_name);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (change_id);


--
-- Name: changes changes_project_script_hash_key; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_project_script_hash_key UNIQUE (project, script_hash);


--
-- Name: dependencies dependencies_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_pkey PRIMARY KEY (change_id, dependency);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (change_id, committed_at);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project);


--
-- Name: projects projects_uri_key; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.projects
    ADD CONSTRAINT projects_uri_key UNIQUE (uri);


--
-- Name: releases releases_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.releases
    ADD CONSTRAINT releases_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: tags tags_project_tag_key; Type: CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_project_tag_key UNIQUE (project, tag);


--
-- Name: detailed_recipe _RETURN; Type: RULE; Schema: public; Owner: spedata
--

CREATE OR REPLACE VIEW public.detailed_recipe AS
 SELECT recipe.id,
    recipe.title,
    recipe.reference,
    recipe.img_name,
    recipe.text,
    recipe.meal_qty,
    recipe.cooking_time,
    recipe.preparation_time,
    recipe.type_id,
    recipe.basket,
    type.name AS type_name,
    json_agg(jsonb_build_object('id', ingredient.id, 'name', ingredient.name, 'qty', recipe_ingredient.qty, 'unitId', unit.id, 'unitName', unit.name, 'unitShortName', unit.short_name)) AS ingredients
   FROM ((((public.recipe
     LEFT JOIN public.type ON ((recipe.type_id = type.id)))
     LEFT JOIN public.recipe_ingredient ON ((recipe.id = recipe_ingredient.recipe_id)))
     LEFT JOIN public.ingredient ON ((recipe_ingredient.ingredient_id = ingredient.id)))
     LEFT JOIN public.unit ON ((unit.id = recipe_ingredient.unit_id)))
  GROUP BY recipe.id, type.name;


--
-- Name: ingredient ingredient_main_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_main_unit_id_fkey FOREIGN KEY (main_unit_id) REFERENCES public.unit(id);


--
-- Name: recipe_ingredient recipe_ingredient_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- Name: recipe_ingredient recipe_ingredient_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(id) ON DELETE CASCADE;


--
-- Name: recipe_ingredient recipe_ingredient_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: recipe recipe_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: spedata
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id);


--
-- Name: changes changes_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.changes
    ADD CONSTRAINT changes_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- Name: dependencies dependencies_change_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_change_id_fkey FOREIGN KEY (change_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dependencies dependencies_dependency_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.dependencies
    ADD CONSTRAINT dependencies_dependency_id_fkey FOREIGN KEY (dependency_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE;


--
-- Name: events events_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.events
    ADD CONSTRAINT events_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- Name: tags tags_change_id_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_change_id_fkey FOREIGN KEY (change_id) REFERENCES sqitch.changes(change_id) ON UPDATE CASCADE;


--
-- Name: tags tags_project_fkey; Type: FK CONSTRAINT; Schema: sqitch; Owner: spedata
--

ALTER TABLE ONLY sqitch.tags
    ADD CONSTRAINT tags_project_fkey FOREIGN KEY (project) REFERENCES sqitch.projects(project) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

