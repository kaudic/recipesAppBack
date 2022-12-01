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
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.unit (id, short_name, name) FROM stdin;
1	L	Litre
2	CS	Cuillère à soupe
3	CC	Cuillère à café
4	Kg	Kilos
5	CL	Centilitre
6	Gr	Grammes
7	UN	Unité
8	PI	Pincée
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.ingredient (id, name, main_unit_id) FROM stdin;
1	Crevette	1
2	Riz	5
3	Chorizo	1
4	Farine	3
5	Oeuf	1
6	Lait	2
7	Huile	3
8	Tomate	1
9	Poireau	1
10	Poire	1
11	Poulet	8
12	Boeuf	8
13	Cacahuète	8
14	Pesto	4
15	Pâtes	8
16	Jambon blanc	1
17	Tartine de pain	1
18	Gruyère rapé	8
19	Beurre	2
20	Choux fleur	1
21	Ananas	3
22	Epinard	8
23	Persil	14
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.type (id, name) FROM stdin;
1	VIANDE
2	POISSON
3	VEGAN
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe (id, title, reference, img_name, text, meal_qty, cooking_time, preparation_time, type_id, basket) FROM stdin;
1	recette longue	très longue	chilli.jpg	long!\nfasitideux!	1	01:00:00	01:00:00	1	t
2	gndggh,f	hj;hj;jk:jk	lentilles.jpg	fshsrtdtjty	6	00:06:00	00:06:00	1	f
3	Galettes de poireaux	Marmitton:  https://www.marmiton.org/recettes/recette_galettes-de-poireaux_29838.aspx	poireaux.jpg	Laver et hacher les poireaux finement.\nFaire une pâte à crêpe avec les oeufs, 1 cuillère soupe d''huile, sel, poivre, la farine, le lait et un peu de muscade.\n\nAjouter les poireaux et mélanger, rajouter du lait si nécessaire.\nFaire cuire des petites crêpes de 5 mm dépaisseur dans une poêle chaude huilée, environ 5 min par face à feu doux.\n\nServir avec une vinaigrette, une sauce au fromage blanc ou de la sauce soja.	4	00:10:00	00:10:00	2	f
4	Cuisses de poulet au barbecue	Livre Recettes faciles P5 ...	poulet_barbecue.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat ante est, et finibus ipsum porttitor sed. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed neque arcu, lobortis id tempus sit amet, consectetur vel mi. Ut posuere feugiat leo, ac mollis nisi lobortis vel. Suspendisse potenti. Fusce vel mauris nec turpis placerat sodales quis ac ipsum. Sed fringilla nisi ultricies porttitor ultricies. Aliquam ac posuere nisi, non iaculis orci.Pellentesque aliquam gravida facilisis. Fusce accumsan suscipit mattis. Aenean dui justo, mollis vitae eros mollis, hendrerit blandit ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras non velit blandit, volutpat massa eget, rutrum lorem. Fusce auctor mauris non sem gravida gravida.Praesent hendrerit ultricies magna sed elementum. Duis gravida nec nibh eget egestas. Nullam id nunc facilisis, pharetra metus quis, lacinia ante. Donec vitae condimentum erat. Morbi sit amet magna magna. Curabitur eu rutrum felis. Suspendisse pharetra nibh risus, eu lobortis lectus luctus commodo.Aenean pharetra aliquam risus non rhoncus. Curabitur vel mi viverra, euismod ex ac, porttitor tellus. Quisque a augue non libero egestas volutpat. Nam eget consectetur massa. Aenean sollicitudin maximus euismod. Ut varius elementum efficitur. Pellentesque dignissim quis odio interdum tempus. Nunc tincidunt dui ut iaculis iaculis. Integer sagittis odio a justo dignissim, non efficitur risus vestibulum. Etiam urabitur faucibus porttitor nulla sed eleifend. Pellentesque et sagittis purus. Vivamus mauris mauris, interdum eget ex eu, tempus scelerisque justo. Praesent eget magna quis mi imperdiet consectetur. Duis in pretium nisi. Pellentesque habitant morbi .	6	00:25:00	00:10:00	2	f
5	nouveau test	kjdgfkajerg	error404.jpg	zaegzerhrtrzth	5	00:06:00	01:00:00	1	t
6	Croc Monsieur	Maison	chilli.jpg	Croc monsieur très bon	3	00:15:00	00:15:00	1	f
7	poulet_braisé	La mer Jesta3	poulet_braisé.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
8	Lentilles et viande hachée!	La mer Jesta ...	lentilles.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
9	nouvelle recette poisson	test poisson	noimage.jpg	-(ue(-u	4	00:12:00	01:15:00	1	f
10	ergezg	rjetyjtyj	paella.jpg	fxgndghngh,hj,	4	00:05:00	00:05:00	1	f
11	Shrimp and Chorizo Paella	Livre Cyril Lignac ...	paella.jpg	Heat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes.\nHeat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a\nAdd rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	2	00:25:00	00:15:00	2	f
12	Ma première Recette de Pomme de terre	Mon imagination	pate_carbo.jpg	Ceci est juste un testuuuu	4	00:15:00	00:10:00	1	t
13	Carpaccio de boeuf	Pour tester upload image à la création	carpaccio.jpg	Un très bon carpaccio de boeuf	6	00:15:00	00:15:00	3	f
14	boeuf bourguignon	La mer Jesta5	boeuf_bourguignon.jpg	titi va à la mer	4	00:30:00	00:20:00	2	f
15	nouvelle recette2	un livre imaginaire	tourte_saumon2.jpg	vHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	4	00:05:00	00:05:00	1	f
16	Nouvelle recette test	toto et titi	lentilles.jpg	Faux carpacio	8	00:35:00	00:15:00	2	f
17	test	démo	imagetest.jpg	zfergzerhrth	5	00:05:00	00:05:00	1	t
18	nouvelle recette VEGAN	vegaaaaaaaaaaaan	noimage.jpg	iiii	1	00:10:00	00:10:00	3	t
19	nouvelle recette	un livre imaginaire	imagetest.jpg	Recette pour tester les message de validation	4	00:05:00	00:05:00	1	f
20	eytjtyjdrk	jdtyk,yryu	poulet_barbecue.jpg	rdghrthgh,fh,ghj	7	00:06:00	00:06:00	1	f
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe_ingredient (id, recipe_id, ingredient_id, qty, unit_id) FROM stdin;
1	1	23	10	2
2	2	3	1000	8
3	3	20	3	1
4	4	4	3	1
5	5	19	4	1
6	6	21	10	8
7	7	22	10	8
8	8	21	15	8
9	9	6	40	4
10	10	3	10	5
11	11	8	30	6
12	12	3	2	5
13	13	20	1	7
14	14	3	2	5
15	15	1	20	1
16	16	3	10	5
17	17	2	5	1
18	18	1	20	1
19	19	4	1	1
20	20	1	20	1
21	1	3	10	5
22	2	3	2	5
23	3	3	2	5
24	4	2	3	1
25	5	5	5	1
26	6	3	2	5
27	7	2	5	1
28	8	18	10	8
29	9	4	5	1
30	10	4	3	1
31	11	18	1	1
32	12	21	100	8
33	13	5	1	1
34	14	22	150	8
35	15	21	1	8
36	16	15	10	2
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
recipesApp	\N	2022-09-05 10:15:58.456775+02	Killian AUDIC	killi@LAPTOP-5GJ086M6
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
-- PostgreSQL database dump complete
--

