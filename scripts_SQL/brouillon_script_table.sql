CREATE TABLE equipes(
    id_equipe SERIAL PRIMARY KEY,
    nom_equipe VARCHAR(20) NOT NULL
);

SELECT s.id_set, nom_pokemon_en, 
genre, talent, type_tera, evs, nature, moveset
FROM pokemon_set AS s, pokemon AS p, equipe_de_pokemon AS e
WHERE s.id_set = p.id_set
AND p.id_pokemon = e.id_pokemon
AND id_equipe = 1
ORDER BY ordre;


CREATE TABLE pokemon_set(
    id_set SERIAL PRIMARY KEY,
    nom_pokemon_en VARCHAR(20) NOT NULL,
    genre VARCHAR(3), -- Facultatif
    talent VARCHAR(20) NOT NULL,
    type_tera VARCHAR(20) NOT NULL,
    evs VARCHAR(255) NOT NULL,
    nature VARCHAR(20) NOT NULL,
    moveset VARCHAR(20)[] NOT NULL, -- Array
    objet VARCHAR(20) NOT NULL,
    id_pokemon INT NOT NULL,
    CONSTRAINT attaques_4 CHECK (array_length(moveset, 4) <= 4) -- Un moveset ce sont les 4 attaques d'un pokemon    
);

CREATE TABLE pokemon(
    id_pokemon SERIAL PRIMARY KEY,
    nom_pokemon_fr VARCHAR(20) NOT NULL,
    gif VARCHAR(255) NOT NULL, -- Le chemin vers l'image gif
    img_type1 VARCHAR(255) NOT NULL, -- Le chemin vers l'image représentant un des deux types du pokemon
    img_type2 VARCHAR(255) NOT NULL,
    dimension_gif VARCHAR(20) NOT NULL, -- Le nom de la classe CSS pour modifier ses dimensions
    id_set INT, -- Facultatif
    CONSTRAINT fk_id_set FOREIGN KEY (id_set) REFERENCES pokemon_set (id_set)
);

CREATE TABLE equipe_de_pokemon(
    ordre SERIAL,
    id_equipe SERIAL,
    id_pokemon SERIAL,
    CONSTRAINT pk_ids PRIMARY KEY (id_equipe, id_pokemon),
    CONSTRAINT fk_id_e FOREIGN KEY (id_equipe) REFERENCES equipes (id_equipe),
    CONSTRAINT fk_id_p FOREIGN KEY (id_pokemon) REFERENCES pokemon (id_pokemon)
);

-- J'ai oublié de rajouter 'objet' dans la table pokemon_set
ALTER TABLE pokemon_set
ADD COLUMN objet VARCHAR(20) NOT NULL;

-- On préférera un type INT pour id_set (FK)
DELETE FROM pokemon;
DELETE FROM equipe_de_pokemon;

ALTER TABLE pokemon
ALTER COLUMN id_set DROP DEFAULT;

ALTER TABLE pokemon
ALTER COLUMN id_set TYPE INTEGER;

DROP SEQUENCE IF EXISTS pokemon_id_set_seq;
ALTER SEQUENCE equipe_de_pokemon_ordre_seq RESTART WITH 1;
-- Puis j'INSERT sans rien changer

-- Je souhaite ajouter des sprites à certains pokemon pour la page equipes.php
ALTER TABLE pokemon
ADD COLUMN sprite VARCHAR(50);

-- Ajout de lien vers un site externe pour en apprendre davantage
ALTER TABLE pokemon
ADD COLUMN lien VARCHAR(255);

-- Pour savoir si le pokemon est en OverUsed ou non car la tier list concerne que les pokemon OU
ALTER TABLE pokemon
ADD COLUMN est_ou BOOLEAN DEFAULT TRUE;

-- Enlever FK dans pokemon et ajouter FK dans pokemon_set
ALTER TABLE pokemon
DROP CONSTRAINT fk_id_set,
DROP COLUMN id_set;

ALTER TABLE pokemon_set
ADD COLUMN id_pokemon,
ADD CONSTRAINT fk_id_pokemon FOREIGN KEY (id_pokemon) REFERENCES pokemon (id_pokemon);

-- Ajout de id_set dans equipe_de_pokemon
ALTER TABLE equipe_de_pokemon
ADD COLUMN id_set INT;

-- Ajout d'une description dans pokemon
ALTER TABLE pokemon
ADD COLUMN description VARCHAR(512);

-- Ajout d'un tier dans pokemon
ALTER TABLE pokemon
ADD COLUMN tier VARCHAR(2);

-- VARCHAR(20) trop petit
ALTER TABLE pokemon
ALTER COLUMN nom_pokemon_fr TYPE VARCHAR(40);

-- C'est mieux un INT pour le tri
ALTER TABLE pokemon
ALTER COLUMN tier TYPE INT;

-- Le nombre de pokemon dans chaque tier 
SELECT tier, count(tier) FROM pokemon
WHERE tier < 4
GROUP BY tier
ORDER BY tier;

-- Pour classer les pokemons de la tier list
ALTER TABLE pokemon
ADD column classement INT;

-- Pour obtenir le nom, l'image, les deux types, le lien, la dimension et la description de chaque pokemon trié 
-- par son tier et son classement
SELECT tier, nom_pokemon_fr, gif, dimension_gif,
img_type1, img_type2, description, lien
FROM pokemon
WHERE tier < 4
ORDER BY tier, classement;