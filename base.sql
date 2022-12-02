--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: recipesapp
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
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: recipesapp
--

COPY public.ingredient (id, name, main_unit_id) FROM stdin;
56	Crevette	1
57	Riz	5
58	Chorizo	1
59	Farine	3
60	Oeuf	1
61	Lait	2
62	Huile	3
63	Tomate	1
64	Poireau	1
65	Poire	1
66	Poulet	8
67	Boeuf	8
68	Cacahuète	8
69	Pesto	4
70	Pâtes	8
71	Jambon blanc	1
72	Tartine de pain	1
73	Gruyère rapé	8
74	Beurre	2
75	Choux fleur	1
76	Ananas	3
77	Epinard	8
78	Persil	7
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: recipesapp
--

COPY public.type (id, name) FROM stdin;
3	VEGAN
1	POISSON
2	VIANDE
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: recipesapp
--

COPY public.recipe (id, title, reference, img_name, text, meal_qty, cooking_time, preparation_time, type_id, basket) FROM stdin;
2	gndggh,f	hj;hj;jk:jk	lentilles.jpg	fshsrtdtjty	6	00:06:00	00:06:00	1	f
3	Galettes de poireaux	Marmitton:  https://www.marmiton.org/recettes/recette_galettes-de-poireaux_29838.aspx	poireaux.jpg	Laver et hacher les poireaux finement.\nFaire une pâte à crêpe avec les oeufs, 1 cuillère soupe d''huile, sel, poivre, la farine, le lait et un peu de muscade.\n\nAjouter les poireaux et mélanger, rajouter du lait si nécessaire.\nFaire cuire des petites crêpes de 5 mm dépaisseur dans une poêle chaude huilée, environ 5 min par face à feu doux.\n\nServir avec une vinaigrette, une sauce au fromage blanc ou de la sauce soja.	4	00:10:00	00:10:00	2	f
6	Croc Monsieur	Maison	chilli.jpg	Croc monsieur très bon	3	00:15:00	00:15:00	1	f
7	poulet_braisé	La mer Jesta3	poulet_braisé.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
8	Lentilles et viande hachée!	La mer Jesta ...	lentilles.jpg	toto va à la mer	4	00:30:00	00:20:00	2	f
9	nouvelle recette poisson	test poisson	noimage.jpg	-(ue(-u	4	00:12:00	01:15:00	1	f
13	Carpaccio de boeuf	Pour tester upload image à la création	carpaccio.jpg	Un très bon carpaccio de boeuf	6	00:15:00	00:15:00	3	f
14	boeuf bourguignon	La mer Jesta5	boeuf_bourguignon.jpg	titi va à la mer	4	00:30:00	00:20:00	2	f
5	nouveau test	kjdgfkajerg	error404.jpg	zaegzerhrtrzth	5	00:06:00	01:00:00	1	f
11	Shrimp and Chorizo Paella	Livre Cyril Lignac ...	paella.jpg	Heat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes.\nHeat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a\nAdd rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	2	00:25:00	00:15:00	2	f
1	recette longue	très longue	chilli.jpg	long!\nfasitideux!	1	01:00:00	01:00:00	1	t
12	Ma première Recette de Pomme de terre	Mon imagination	pate_carbo.jpg	Ceci est juste un testuuuu	4	00:15:00	00:10:00	1	t
10	ergezg	rjetyjtyj	paella.jpg	fxgndghngh,hj,	4	00:05:00	00:05:00	1	f
15	nouvelle recette2	un livre imaginaire	tourte_saumon2.jpg	vHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)testHeat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes. Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)test	4	00:05:00	00:05:00	1	f
19	nouvelle recette	un livre imaginaire	imagetest.jpg	Recette pour tester les message de validation	4	00:05:00	00:05:00	1	f
20	eytjtyjdrk	jdtyk,yryu	poulet_barbecue.jpg	rdghrthgh,fh,ghj	7	00:06:00	00:06:00	1	f
16	Nouvelle recette test	toto et titi	lentilles.jpg	Faux carpacio	8	00:35:00	00:15:00	2	f
17	test	démo	imagetest.jpg	zfergzerhrth	5	00:05:00	00:05:00	1	f
18	nouvelle recette VEGAN	vegaaaaaaaaaaaan	noimage.jpg	iiii	1	00:10:00	00:10:00	3	t
4	Cuisses de poulet au barbecue	Livre Recettes faciles P5 ...	poulet_barbecue.jpg	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat ante est, et finibus ipsum porttitor sed. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed neque arcu, lobortis id tempus sit amet, consectetur vel mi. Ut posuere feugiat leo, ac mollis nisi lobortis vel. Suspendisse potenti. Fusce vel mauris nec turpis placerat sodales quis ac ipsum. Sed fringilla nisi ultricies porttitor ultricies. Aliquam ac posuere nisi, non iaculis orci.Pellentesque aliquam gravida facilisis. Fusce accumsan suscipit mattis. Aenean dui justo, mollis vitae eros mollis, hendrerit blandit ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras non velit blandit, volutpat massa eget, rutrum lorem. Fusce auctor mauris non sem gravida gravida.Praesent hendrerit ultricies magna sed elementum. Duis gravida nec nibh eget egestas. Nullam id nunc facilisis, pharetra metus quis, lacinia ante. Donec vitae condimentum erat. Morbi sit amet magna magna. Curabitur eu rutrum felis. Suspendisse pharetra nibh risus, eu lobortis lectus luctus commodo.Aenean pharetra aliquam risus non rhoncus. Curabitur vel mi viverra, euismod ex ac, porttitor tellus. Quisque a augue non libero egestas volutpat. Nam eget consectetur massa. Aenean sollicitudin maximus euismod. Ut varius elementum efficitur. Pellentesque dignissim quis odio interdum tempus. Nunc tincidunt dui ut iaculis iaculis. Integer sagittis odio a justo dignissim, non efficitur risus vestibulum. Etiam urabitur faucibus porttitor nulla sed eleifend. Pellentesque et sagittis purus. Vivamus mauris mauris, interdum eget ex eu, tempus scelerisque justo. Praesent eget magna quis mi imperdiet consectetur. Duis in pretium nisi. Pellentesque habitant morbi .	6	00:25:00	00:10:00	2	f
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: recipesapp
--

COPY public.recipe_ingredient (id, recipe_id, ingredient_id, qty, unit_id) FROM stdin;
175	16	68	10	2
176	16	74	10	6
155	16	71	10	5
163	4	56	3	7
143	4	59	30	6
140	1	56	10	2
141	2	57	100	8
142	3	58	3	1
144	5	60	4	1
145	6	61	10	8
146	7	62	10	8
147	8	63	15	8
148	9	64	40	4
149	10	65	10	5
150	11	66	30	6
151	12	67	2	5
152	13	68	1	7
153	14	69	2	5
154	15	70	20	1
156	17	72	5	1
157	18	73	20	1
158	19	74	1	1
159	20	75	20	1
160	1	76	10	5
161	2	77	2	5
162	3	78	2	5
164	5	57	5	1
165	6	58	2	5
166	7	59	5	1
167	8	60	10	8
168	9	61	5	1
169	10	62	3	1
170	11	63	1	1
171	12	64	100	8
172	13	65	1	1
173	14	66	150	8
174	15	67	1	8
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
recipesApp	\N	2022-11-29 14:02:59.117875+00	Ubuntu	ubuntu@S008371
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.changes (change_id, script_hash, change, project, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
38b07ff45a969521ca1ef1f0756a904bcd3204fa	5b869f8b062aec7d1e3f65f015ebca12df4ba183	initdb	recipesApp	crÃ©ation des tables	2022-11-29 14:02:59.295187+00	Ubuntu	ubuntu@S008371	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
d2f2b5326e52d6252881391dec60d8b166b2e71b	fa9dfa45789d54f5af716cc368688aa41f912e3b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	2022-11-29 14:02:59.383421+00	Ubuntu	ubuntu@S008371	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
2ab8d775fd1607e1c56e9e2247516aa879456163	15c2b91a3affeeab62944fbd93bdbd40ffae8d22	alter_img_name	recipesApp	alter column recipe img_name	2022-11-29 14:02:59.459372+00	Ubuntu	ubuntu@S008371	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
446f9ddebda012b5156edc56750c03a17500af63	3c4c7227194cdde185cdb7875c9334306f8de4c5	basket_field	recipesApp	ajout du champs basket	2022-11-29 14:02:59.543355+00	Ubuntu	ubuntu@S008371	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
3545440320746d8630fe0893a3ff131b14d0f353	d285cf2d71c412cadb871274bc5595fdbb86bad7	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	2022-11-29 14:02:59.630882+00	Ubuntu	ubuntu@S008371	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.dependencies (change_id, type, dependency, dependency_id) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.events (event, change_id, change, project, note, requires, conflicts, tags, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-11-29 14:02:59.296475+00	Ubuntu	ubuntu@S008371	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-11-29 14:02:59.384425+00	Ubuntu	ubuntu@S008371	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-11-29 14:02:59.460236+00	Ubuntu	ubuntu@S008371	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-11-29 14:02:59.544169+00	Ubuntu	ubuntu@S008371	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-11-29 14:02:59.631855+00	Ubuntu	ubuntu@S008371	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:15:58.590632+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:16:48.876235+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:17:29.197419+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:17:49.717463+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:18:11.528107+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:19:10.348776+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:20:45.972765+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:21:33.627553+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:22:13.344565+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:30:12.405605+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:30:38.865568+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:32:11.447814+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 08:32:39.382034+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 09:46:50.9838+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 09:47:05.220341+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 09:47:05.339582+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-05 09:47:12.331691+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-05 09:47:12.517431+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-06 10:02:48.686194+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 10:02:48.829311+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 10:02:55.312052+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-06 10:03:11.7309+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-06 10:03:11.839794+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:34:11.240831+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:34:22.535796+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:39:28.405616+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:40:30.361809+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:41:05.984244+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:43:57.930243+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-09 08:44:04.245571+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 13:40:45.723068+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 13:41:02.620955+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 13:41:25.003906+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-15 13:41:30.01142+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:43:47.555203+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
fail	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:47:19.573465+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:48:02.789378+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:53:21.714026+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:54:27.48422+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:55:51.441431+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:55:54.869658+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
revert	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:55:57.990362+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-19 10:56:00.282469+00	Killian AUDIC	killi@LAPTOP-5GJ086M6	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-21 14:27:34.690878+00	killian audic	kaudic@audicserver	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-21 14:27:34.791485+00	killian audic	kaudic@audicserver	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-21 14:27:34.875242+00	killian audic	kaudic@audicserver	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-21 14:27:34.957991+00	killian audic	kaudic@audicserver	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-21 14:27:35.049982+00	killian audic	kaudic@audicserver	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.releases (version, installed_at, installer_name, installer_email) FROM stdin;
1.1	2022-11-29 14:02:59.114547+00	Ubuntu	ubuntu@S008371
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: sqitch; Owner: recipesapp
--

COPY sqitch.tags (tag_id, tag, project, change_id, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipesapp
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 78, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipesapp
--

SELECT pg_catalog.setval('public.recipe_id_seq', 57, true);


--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipesapp
--

SELECT pg_catalog.setval('public.recipe_ingredient_id_seq', 176, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipesapp
--

SELECT pg_catalog.setval('public.type_id_seq', 4, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipesapp
--

SELECT pg_catalog.setval('public.unit_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

