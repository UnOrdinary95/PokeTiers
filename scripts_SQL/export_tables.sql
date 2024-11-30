-- public.equipes definition

-- Drop table

-- DROP TABLE public.equipes;

CREATE TABLE public.equipes (
	id_equipe serial4 NOT NULL,
	nom_equipe varchar(20) NOT NULL,
	lien_equipe varchar(255) NULL,
	CONSTRAINT equipes_pkey PRIMARY KEY (id_equipe)
);


-- public.pokemon definition

-- Drop table

-- DROP TABLE public.pokemon;

CREATE TABLE public.pokemon (
	id_pokemon serial4 NOT NULL,
	nom_pokemon_fr varchar(40) NOT NULL,
	gif varchar(255) NOT NULL,
	img_type1 varchar(255) NOT NULL,
	img_type2 varchar(255) NOT NULL,
	dimension_gif varchar(20) NOT NULL,
	sprite varchar(50) NULL,
	lien varchar(255) NULL,
	est_ou bool DEFAULT true NULL, -- Si le pokemon est de la catégorie 'OverUsed' ou non
	description varchar(2048) NULL,
	tier int4 NULL,
	classement int4 NULL,
	CONSTRAINT pokemon_pkey PRIMARY KEY (id_pokemon)
);


-- public.pokemon_set definition

-- Drop table

-- DROP TABLE public.pokemon_set;

CREATE TABLE public.pokemon_set (
	id_set serial4 NOT NULL,
	nom_pokemon_en varchar(20) NOT NULL,
	genre varchar(3) NULL,
	talent varchar(20) NOT NULL,
	type_tera varchar(20) NOT NULL,
	evs varchar(255) NOT NULL,
	nature varchar(20) NOT NULL,
	moveset _varchar NOT NULL,
	objet varchar(20) NOT NULL,
	id_pokemon int4 NOT NULL,
	CONSTRAINT attaques_4 CHECK ((array_length(moveset, 4) <= 4)),
	CONSTRAINT pokemon_set_pkey PRIMARY KEY (id_set)
);


-- public.equipe_de_pokemon definition

-- Drop table

-- DROP TABLE public.equipe_de_pokemon;

CREATE TABLE public.equipe_de_pokemon (
	ordre serial4 NOT NULL,
	id_equipe int4 NOT NULL,
	id_pokemon int4 NOT NULL,
	id_set int4 NULL,
	CONSTRAINT pk_ids PRIMARY KEY (id_equipe, id_pokemon),
	CONSTRAINT fk_id_e FOREIGN KEY (id_equipe) REFERENCES public.equipes(id_equipe),
	CONSTRAINT fk_id_p FOREIGN KEY (id_pokemon) REFERENCES public.pokemon(id_pokemon)
);