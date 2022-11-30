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
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.unit (id, short_name, name) FROM stdin;
3	CS	Cuillère à soupe
4	CC	Cuillère à café
5	Kg	Kilos
1	UN	Unité
6	CL	Centilitre
2	L	Litre
8	GR	Gramme
9	PG	Poignée
10	BR	Brin
11	ZE	----
13	TR	Tranche
14	CB	Cube
12	RL	Rouleaux
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.ingredient (id, name, main_unit_id) FROM stdin;
1	Crevette	1
2	Tomate	1
3	Riz	5
5	Poireau	1
7	Huile	3
8	Lait	6
9	Oeuf	1
4	Chorizo	5
12	Graine de Fenouil	3
13	Gros sel	5
14	Bar	5
15	Blanc d'oeuf	1
16	Champignon de Paris	8
17	Beurre	8
6	Farine	8
18	Gousse d'ail	1
19	Vin Blanc	6
20	Citron	1
23	Eau	2
24	Cèpes séchés	9
25	Morilles séchées	9
26	Oignon	1
27	Ail en poudre	4
28	Huile d'Olive	3
29	Curry	4
30	Filets de poulet	1
31	Sauce Soja	3
32	Ciboulette	10
33	Crème fraiche épaisse	6
34	Pomme de terre	1
35	Basilic	11
22	Sel	11
21	Poivre	11
37	Fromage râpé	11
38	Pâte feuilletée	12
39	Fromage à raclette	13
40	Macaroni	8
41	Bouillon de légumes	14
42	Jambon fumé	13
43	Crème liquide	2
44	Gruyère râpé	8
45	Persil	11
46	Romarin	11
47	Piment d'Espelette	1
48	Parmesan râpé	11
49	Linguine	8
50	Crème fraiche	6
51	Saumon fumé	13
52	Mascarpone	8
53	Gruyère	8
54	Jaune d'oeuf	1
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.type (id, name) FROM stdin;
1	POISSON
2	VIANDE
3	VEGAN
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe (id, title, reference, img_name, text, meal_qty, cooking_time, preparation_time, type_id, basket) FROM stdin;
5	Bar enveloppé de croûte de sel	https://www.marmiton.org/recettes/recette_bar-enveloppe-de-croute-de-sel_26867.aspx	bar_croute_sel.jpg	ÉTAPE 1\nPréchauffez le four à 210°C (thermostat 7).\n\nÉTAPE 2\nEventrez le poisson de la queue à la tête avec un couteau bien aiguisé et videz-le. Ne l'écaillez pas mais lavez-le et épongez-le très soigneusement. Dans la cavité ventrale, disposez quelques graines de fenouil ou de cumin.\n\nÉTAPE 3\nDéposez une couche de gros sel sur un grand plat à four - ou à défaut sur la lèchefrite - puis posez le poisson dessus bien à plat.\n\nÉTAPE 4\nMélangez le reste du sel avec le blanc d'oeuf et quelques graines de fenouil ou de cumin. Recouvrez-en le poisson en tassant bien pour l'enfermer hermétiquement.\n\nÉTAPE 5\nEnfournez pour 30-35 minutes de cuisson. Laissez reposer 10 minutes à la sortie du four avant de briser la gangue de sel à l'aide du rouleau à pâtisserie ou d'un petit marteau. La peau se retire très facilement lorsque le poisson est tout chaud.\n\nÉTAPE 6\nServez aussitôt.	4	00:30:00	00:20:00	1	f
7	Filet de poulet au curry	https://www.marmiton.org/recettes/recette_filet-de-poulet-au-curry_80990.aspx	poulet_curry.jpg	ÉTAPE 1\nCouper les filets de poulet en petits morceaux, les mettre dans un saladier avec la sauce soja, l'ail, l'huile d'olive, la ciboulette et le curry. Laissez reposer une heure.\n\nÉTAPE 2\nAprès, faire revenir l'oignon avec un peu d'huile d'olive, une fois légèrement caramélisé, mettre la viande.\n\nÉTAPE 3\nQuand la viande commence à cuire, mettre petit à petit la crème fraîche (épaisse ou liquide), ajouter du curry selon vos goûts sur la viande.\n\nÉTAPE 4\nMélanger bien le tout, saler et poivrer.\n\nÉTAPE 5\nBon appétit à vous.	4	00:15:00	00:10:00	2	t
17	Chili Con Carne	Livre 7	chilli.jpg	Recette du chili con carne	4	00:30:00	01:00:00	2	f
14	Tourte au saumon rapide	https://www.marmiton.org/recettes/recette_tourte-au-saumon-rapide_56983.aspx	tourte_saumon.jpg	ÉTAPE 1\nPréchauffer le four à 200°C (thermostat 6-7).\n\nÉTAPE 2\nEtaler la pâte feuilletée dans le moule à tarte.\n\nÉTAPE 3\nMettre les tranches de saumon puis le mascarpone, le gruyère et la crème fraîche.\n\nÉTAPE 4\nRecouvrir avec la deuxième pâte feuilletée, passer sur la pâte le jaune d'oeuf à l'aide d'un pinceau et faire cuire 30 minutes.	6	00:30:00	00:07:00	1	t
15	Paëlla à la catalane	Livre 4	paella.jpg	Recette de Paëlla à décrire	4	00:45:00	00:30:00	2	f
16	Poulet braisé au barbecue	Livre 6	poulet_braisã©.jpg	Recette du poulet au barbecue	6	01:15:00	00:15:00	2	f
6	Croûte forestière aux morilles	https://www.marmiton.org/recettes/recette_croute-forestiere-aux-morilles_52477.aspx	croute_forestiere.jpg	ÉTAPE 1\nSi vous utilisez des champignons sechés, les faire tremper séparément la veille dans une bonne quantité d'eau tiède afin de l'utiliser pour lier la sauce.\n\nÉTAPE 2\nAprès trempage, les sortir de l'eau et les rincer, surtout les morilles qui contiennent du sable à l'intérieur.\n\nÉTAPE 3\nCuire les champignons de Paris dans de l'eau citronnée et légèrement salée puis réserver le jus de cuisson.\n\nÉTAPE 4\nFaire revenir tous les champignons dans 50 g de beurre puis ajouter l'échalote, l'ail et le vin blanc.\n\nÉTAPE 5\nLaisser mijoter pendant que vous préparez la sauce.\n\nÉTAPE 6\nFaire le roux : faire fondre le reste du beurre puis ajouter la farine en mélangeant, laisser blondir sans trop.\n\nÉTAPE 7\nLe laisser refroidir.\n\nÉTAPE 8\nIl est important d'utiliser le roux froid pour lier la sauce avec le jus chaud afin de ne pas faire de grumeaux.\n\nÉTAPE 9\nDans une casserole, commencer à lier la sauce en mélangeant progressivement un peu de roux avec un peu de jus des champignons (attention laisser bien décanter le jus des morilles afin que le sable reste au fond du récipient!).\n\nÉTAPE 10\nAllez-y progressivement afin que la sauce ne soit pas trop liquide puis ajouter la crème, plus ou moins en fonction de la consistance voulue.\n\nÉTAPE 11\nNe pas hésiter pas à la rallonger avec de la crème ou de l'eau si elle semble trop épaisse.\n\nÉTAPE 12\nSi au contraire la sauce est trop liquide, ajouter un peu de maïzena diluée dans un peu d'eau froide et laisser épaissir sur feu doux en remuant.\n\nÉTAPE 13\nEnfin, mélanger les champignons à la sauce et assaisonner.\n\nÉTAPE 14\nOn peut éventuellement rajouter du jus de citron.\n\nÉTAPE 15\nLaissez mijoter pendant 1 heure à feux doux en remuant de temps en temps.\n\nÉTAPE 16\nDégustez avec du pain grillé ou des croûtes feuilletées.\n\n	6	01:00:00	01:00:00	3	t
13	Linguine à la toscane	https://www.marmiton.org/recettes/recette_linguine-a-la-toscane_21514.aspx	linguines.jpg	ÉTAPE 1\nDans une casserole, faire infuser 5 mn le piment - que vous aurez préalablement écrasé - dans de l'huile chaude (4 cuillerées à soupe). Ajouter l'ail. Puis les herbes hachées (ceci juste avant d'y jeter les linguines).\n\nÉTAPE 2\nParallèlement, faire cuire les linguines 'al dente'. Goûter l'eau lors de la cuisson pour vous assurer qu'elle est convenablement salée. Essorer les linguines (point trop), puis les jeter dans la casserole qui contient l'huile, le piment, l'ail et les herbes.\n\nÉTAPE 3\nMélanger délicatement. Servir avec du parmesan, un filet d'huile d'olive sur chaque assiette et un tour de moulin à poivre.\n\nÉTAPE 4\nE viva la Toscana!	4	00:10:00	00:10:00	3	t
9	Gratin de macaronis au gruyère et au jambon fumé	https://www.marmiton.org/recettes/recette_gratin-de-macaronis-au-gruyere-et-au-jambon-fume-de-ma-grand-mere_91888.aspx	macaroni2.jpg	ÉTAPE 1\nFaites préchauffer votre four à 220°C.\n\nÉTAPE 2\nPorter l'eau des pâtes à ébullition avec 1/2 cube de bouillon de légumes. Quant l'eau bout, y ajouter les macaronis. Les faire cuire 6 minutes.\n\nÉTAPE 3\nPendant ce temps, placer les 2 tranches de jambon fumé dans un saladier et les couper en petits bouts à l'aide d'une fourchette et d'un couteau.\n\nÉTAPE 4\nY ajouter les 2/3 du gruyère (50g) et bien mélanger.\n\nÉTAPE 5\nQuand les pâtes sont cuites, les égoutter. Faire fondre le beurre dans la même casserole qui aura servi à la cuisson des pâtes, y replacer les pâtes et bien mélanger le tout. Une fois le beurre fondu, verser les pâtes dans le saladier et mélangez les au jambon et au fromage.\n\nÉTAPE 6\nRajouter la crème liquide, saler et poivrer fortement. Remélanger le tout et verser dans un petit plat à gratin préalablement beurré.\n\nÉTAPE 7\nRajouter le reste de gruyère sur cette préparation et enfourner 15 minumes. Attendez que le dessus soit doré pour sortir le gratin du four.\n\nÉTAPE 8\nC'est prêt à déguster et tout le monde en raffole!!!	2	00:21:00	00:05:00	2	t
8	Tarte salée aux pommes de terre et aux oignons	https://www.marmiton.org/recettes/recette_tarte-salee-aux-pommes-de-terre-et-aux-oignons_51946.aspx	tarte_salee_pdt.jpg	ÉTAPE 1\nPréchauffer le four à 190°C (thermostat 6-7).\n\nÉTAPE 2\nFaire suer et revenir les oignons à la poêle.\n\nÉTAPE 3\nQuand ils sont dorés, ajouter les pommes de terre épluchées et coupées en lamelles épaisses.\n\nÉTAPE 4\nRéserver.\n\nÉTAPE 5\nDans un bol, mélanger les oeufs, le basilic et le lait (ou la crème fraîche), du sel et du poivre.\n\nÉTAPE 6\nFaites précuire la pâte dans le four avec des haricots secs (par exemple) sur du papier sulfurisé pendant 15 minutes.\n\nÉTAPE 7\nMélanger les pommes de terre juste cuites, les oignons et la préparation oeufs et lait.\n\nÉTAPE 8\nRecouvrir de fromage et enfourner.	4	01:00:00	00:15:00	3	t
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: spedata
--

COPY public.recipe_ingredient (id, recipe_id, ingredient_id, qty, unit_id) FROM stdin;
43	9	44	75	8
46	9	42	2	13
44	9	40	250	8
48	9	41	0.5	14
45	9	17	45	8
47	9	43	0.5	2
52	13	18	2	1
53	13	45	1	11
54	13	35	1	11
55	13	28	1	11
56	13	46	1	11
57	13	48	1	11
58	13	47	1	1
59	13	49	500	8
60	13	32	1	11
26	6	25	1	9
24	6	18	1	1
25	6	24	1	9
22	6	20	1	1
19	6	16	500	8
21	6	6	100	8
20	6	17	150	8
23	6	19	7	6
42	8	38	1	12
39	8	37	1	11
41	8	39	4	13
36	8	34	3	1
35	8	26	1	1
37	8	35	1	11
40	8	9	3	1
38	8	8	10	6
15	5	13	3	5
16	5	12	2	3
17	5	14	1.5	5
18	5	15	1	1
27	7	26	1	1
28	7	27	1	4
29	7	28	1	3
30	7	33	10	6
31	7	31	4	3
32	7	32	4	10
33	7	30	4	1
34	7	29	1	4
68	15	3	1	5
69	15	4	30	1
70	16	30	15	1
72	17	4	30	1
71	17	3	500	8
64	14	38	2	12
65	14	52	250	8
63	14	51	6	13
66	14	53	50	8
62	14	50	10	6
67	14	54	1	1
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.projects (project, uri, created_at, creator_name, creator_email) FROM stdin;
recipesApp	\N	2022-09-21 14:27:34.019949+00	killian audic	kaudic@audicserver
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.changes (change_id, script_hash, change, project, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
38b07ff45a969521ca1ef1f0756a904bcd3204fa	5b869f8b062aec7d1e3f65f015ebca12df4ba183	initdb	recipesApp	crÃ©ation des tables	2022-09-21 14:27:34.68951+00	killian audic	kaudic@audicserver	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
d2f2b5326e52d6252881391dec60d8b166b2e71b	fa9dfa45789d54f5af716cc368688aa41f912e3b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	2022-09-21 14:27:34.790642+00	killian audic	kaudic@audicserver	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
2ab8d775fd1607e1c56e9e2247516aa879456163	15c2b91a3affeeab62944fbd93bdbd40ffae8d22	alter_img_name	recipesApp	alter column recipe img_name	2022-09-21 14:27:34.874401+00	killian audic	kaudic@audicserver	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
446f9ddebda012b5156edc56750c03a17500af63	3c4c7227194cdde185cdb7875c9334306f8de4c5	basket_field	recipesApp	ajout du champs basket	2022-09-21 14:27:34.957099+00	killian audic	kaudic@audicserver	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
3545440320746d8630fe0893a3ff131b14d0f353	d285cf2d71c412cadb871274bc5595fdbb86bad7	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	2022-09-21 14:27:35.049222+00	killian audic	kaudic@audicserver	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
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
deploy	38b07ff45a969521ca1ef1f0756a904bcd3204fa	initdb	recipesApp	crÃ©ation des tables	{}	{}	{}	2022-09-21 14:27:34.690878+00	killian audic	kaudic@audicserver	2022-09-04 13:30:35+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	d2f2b5326e52d6252881391dec60d8b166b2e71b	detailed_recipe	recipesApp	detailed recipes with ingredients and units	{}	{}	{}	2022-09-21 14:27:34.791485+00	killian audic	kaudic@audicserver	2022-09-05 09:44:44+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	2ab8d775fd1607e1c56e9e2247516aa879456163	alter_img_name	recipesApp	alter column recipe img_name	{}	{}	{}	2022-09-21 14:27:34.875242+00	killian audic	kaudic@audicserver	2022-09-09 08:28:14+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	446f9ddebda012b5156edc56750c03a17500af63	basket_field	recipesApp	ajout du champs basket	{}	{}	{}	2022-09-21 14:27:34.957991+00	killian audic	kaudic@audicserver	2022-09-15 13:38:49+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
deploy	3545440320746d8630fe0893a3ff131b14d0f353	refresh_detailed_recipe_view	recipesApp	adding basket columns to the view	{}	{}	{}	2022-09-21 14:27:35.049982+00	killian audic	kaudic@audicserver	2022-09-19 10:41:36+00	Killian AUDIC	killi@LAPTOP-5GJ086M6
\.


--
-- Data for Name: releases; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.releases (version, installed_at, installer_name, installer_email) FROM stdin;
1.1	2022-09-21 14:27:34.010578+00	killian audic	kaudic@audicserver
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: sqitch; Owner: spedata
--

COPY sqitch.tags (tag_id, tag, project, change_id, note, committed_at, committer_name, committer_email, planned_at, planner_name, planner_email) FROM stdin;
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 54, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.recipe_id_seq', 17, true);


--
-- Name: recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.recipe_ingredient_id_seq', 72, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.type_id_seq', 3, true);


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spedata
--

SELECT pg_catalog.setval('public.unit_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

