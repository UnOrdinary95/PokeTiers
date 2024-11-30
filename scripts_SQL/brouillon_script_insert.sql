INSERT INTO equipes (nom_equipe) 
VALUES ('Equipe 1'), ('Equipe 2'), ('Equipe 3'), ('Equipe 4'), ('Equipe 5');

INSERT INTO pokemon_set (nom_pokemon_en, genre, objet, talent, type_tera, evs, nature, moveset, id_pokemon) VALUES
('Iron Valiant', null, 'Booster Energy', 'Quark Drive', 'Ghost', '252 SpA / 4 SpD / 252 Spe', 'Timid', ARRAY['Moonblast', 'Shadow Ball', 'Vacuum Wave', 'Calm Mind'], 1),
('Gholdengo', null, 'Air Balloon','Good as Gold', 'Fairy', '252 SpA / 4 SpD / 252 Spe', 'Timid', ARRAY['Nasty Plot', 'Shadow Ball', 'Dazzling Gleam', 'Psyshock'], 2),
('Glimmora', '(M)', 'Red Card', 'Toxic Debris', 'Ghost', '248 HP / 36 Def / 224 SpD', 'Bold', ARRAY['Stealth Rock', 'Mortal Spin', 'Earth Power', 'Sludge Wave'], 3),
('Dragonite', '(M)', 'Heavy-Duty Boots', 'Multiscale', 'Ground', '252 Atk / 4 SpD / 252 Spe', 'Jolly', ARRAY['Dragon Dance', 'Earthquake', 'Ice Spinner', 'Roost'], 4),
('Roaring Moon', null, 'Booster Energy', 'Protosynthesis', 'Ground', '252 Atk / 4 SpD / 252 Spe', 'Jolly', ARRAY['Dragon Dance', 'Earthquake', 'Knock Off', 'Acrobatics'], 5),
('Samurott-Hisui', '(M)', 'Choice Scarf', 'Sharpness', 'Ghost', '252 Atk / 4 Def / 252 Spe', 'Jolly', ARRAY['Ceaseless Edge', 'Sacred Sword', 'Aqua Cutter', 'Flip Turn'], 6)
;



INSERT INTO pokemon (nom_pokemon_fr, gif, img_type1, img_type2, dimension_gif, id_set) VALUES
('Garde-de-fer', 'images/pokemon/garde-de-fer.gif', 'images/types/Fée.png', 'images/types/Combat.png', 'longer_gif', 1),
('Gromago', 'images/pokemon/gromago.gif', 'images/types/Acier.png', 'images/types/Spectre.png', 'longer_gif', 2),
('Floréclat', 'images/pokemon/floréclat.gif', 'images/types/Roche.png', 'images/types/Poison.png', 'wider_longer_gif', 3),
('Dracolosse', 'images/pokemon/dracolosse.gif', 'images/types/Dragon.png', 'images/types/Vol.png', 'wider_longer_gif', 4),
('Rugit-lune', 'images/pokemon/rugit-lune.gif', 'images/types/Dragon.png', 'images/types/Ténèbre.png', 'wider_gif', 5),
('Clamiral-Hisui', 'images/pokemon/clamiral_forme_hisui.gif', 'images/types/Eau.png', 'images/types/Ténèbre.png', 'wider_longer_gif', 6)
;

-- Une équipe constitué de 6 pokemon 
INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(1, 1), (1, 2), (1, 3), (1,4), (1,5), (1,6);

-- Je me suis rendu compte que j'avais mis une majuscule sur chaque types
UPDATE pokemon 
SET img_type1 = LOWER(img_type1), img_type2 = LOWER(img_type2); 

-- Insertion des 4 autres équipes
INSERT INTO pokemon (nom_pokemon_fr, gif, img_type1, img_type2, dimension_gif, sprite, lien, est_ou) VALUES
('Mite-de-fer', 'images/pokemon/mite-de-fer.gif', 'images/types/feu.png', 'images/types/poison.png', 'wider_longer_gif', 'images/sprites/sprite-mite_de_fer.png', 'https://www.smogon.com/dex/sv/pokemon/iron-moth/', TRUE),
('Démétéros-Totémique', 'images/pokemon/demeteros-totemique.gif', 'images/types/sol.png', 'images/types/vol.png', 'wider_longer_gif', 'images/sprites/sprite-landorus-therian.png', 'https://www.smogon.com/dex/sv/pokemon/landorus-therian/', TRUE),
('Scalpereur', 'images/pokemon/scalpereur.gif', 'images/types/acier.png', 'images/types/tenebres.png', 'wider_longer_gif', 'images/sprites/sprite-kingambit.png', 'https://www.smogon.com/dex/sv/pokemon/kingambit/', TRUE),
('Zamazenta', 'images/pokemon/zamazenta.gif', 'images/types/combat.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-zamazenta.png', 'https://www.smogon.com/dex/sv/pokemon/zamazenta/', TRUE),
('Ire-Foudre', 'images/pokemon/ire-foudre.gif', 'images/types/electrik.png', 'images/types/dragon.png', 'longer_gif', 'images/sprites/sprite-raging_bolt.png', 'https://www.smogon.com/dex/sv/pokemon/raging-bolt/', TRUE),
('Darkrai', 'images/pokemon/darkrai.gif', 'images/types/tenebres.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-darkrai.png', 'https://www.smogon.com/dex/sv/pokemon/darkrai/', TRUE),
('Chartor', 'images/pokemon/chartor.gif', 'images/types/feu.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-torkoal.png', 'https://www.smogon.com/dex/sv/pokemon/torkoal/', FALSE),
('Fort-Ivoire', 'images/pokemon/fort-ivoire.gif', 'images/types/sol.png', 'images/types/combat.png', 'wider_longer_gif', 'images/sprites/sprite-great_tusk.png', 'https://www.smogon.com/dex/sv/pokemon/great-tusk/', TRUE),
('Rampe-Ailes', 'images/pokemon/rampe-ailes.gif', 'images/types/insecte.png', 'images/types/combat.png', 'wider_longer_gif', 'images/sprites/sprite-slither_wings.png', 'https://www.smogon.com/dex/sv/pokemon/slither-wing/', FALSE),
('Florizarre', 'images/pokemon/florizarre.gif', 'images/types/plante.png', 'images/types/poison.png', 'wider_longer_gif', 'images/sprites/sprite-venusaur.png', 'https://www.smogon.com/dex/sv/pokemon/venusaur/', FALSE),
('Serpente-Eau', 'images/pokemon/serpente-eau.gif', 'images/types/eau.png', 'images/types/dragon.png', 'wider_longer_gif', 'images/sprites/sprite-walking_wake.png', 'https://www.smogon.com/dex/sv/pokemon/walking-wake/', TRUE),
('Heatran', 'images/pokemon/heatran.gif', 'images/types/feu.png', 'images/types/acier.png', 'wider_longer_gif', 'images/sprites/sprite-heatran.png', 'https://www.smogon.com/dex/sv/pokemon/heatran/', TRUE),
('Kyurem', 'images/pokemon/kyurem.gif', 'images/types/glace.png', 'images/types/dragon.png', 'wider_longer_gif', 'images/sprites/sprite-kyurem.png', 'https://www.smogon.com/dex/sv/pokemon/kyurem/', TRUE),
('Électhor', 'images/pokemon/electhor.gif', 'images/types/electrik.png', 'images/types/vol.png', 'wider_longer_gif', 'images/sprites/sprite-zapdos.png', 'https://www.smogon.com/dex/sv/pokemon/zapdos/', TRUE),
('Pyrobut', 'images/pokemon/pyrobut.gif', 'images/types/feu.png', 'images/types/inconnu.png', 'longer_gif', 'images/sprites/sprite-cinderace.png', 'https://www.smogon.com/dex/sv/pokemon/cinderace/', TRUE),
('Forgelina', 'images/pokemon/forgelina.gif', 'images/types/fee.png', 'images/types/acier.png', 'wider_longer_gif', 'images/sprites/sprite-tinkaton.png', 'https://www.smogon.com/dex/sv/pokemon/tinkaton/', FALSE)
;


INSERT INTO pokemon_set (nom_pokemon_en, genre, objet, talent, type_tera, evs, nature, moveset, id_pokemon) VALUES
('Iron Moth', null, 'Booster Energy', 'Quark Drive', 'Ghost', '40 HP / 84 Def / 132 SpA / 252 Spe', 'Timid', ARRAY['Fiery Dance', 'Sludge Wave', 'Psychic', 'Substitute'], 7),
('Landorus-Therian', null, 'Earth Plate', 'Intimidate', 'Water', '24 HP / 232 Atk / 252 Spe', 'Jolly', ARRAY['Stealth Rock', 'Earthquake', 'Stone Edge', 'Taunt'], 8),
('Samurott-Hisui', null, 'Focus Sash', 'Sharpness', 'Ghost', '252 Atk / 4 SpD / 252 Spe', 'Adamant', ARRAY['Ceaseless Edge', 'Razor Shell', 'Sucker Punch', 'Knock Off'], 6),
('Kingambit', null, 'Air Balloon', 'Supreme Overlord', 'Fire', '80 HP / 252 Atk / 176 Spe', 'Adamant', ARRAY['Swords Dance', 'Iron Head', 'Low Kick', 'Sucker Punch'], 9),
('Roaring Moon', null, 'Booster Energy', 'Protosynthesis', 'Flying', '168 HP / 144 Atk / 52 Def / 144 Spe', 'Adamant', ARRAY['Dragon Dance', 'Knock Off', 'Earthquake', 'Acrobatics'], 5),
('Gholdengo', null, 'Rocky Helmet', 'Good as Gold', 'Fairy', '252 HP / 220 Def / 16 SpA / 20 Spe', 'Bold', ARRAY['Hex', 'Thunder Wave', 'Nasty Plot', 'Recover'], 2);


INSERT INTO pokemon_set (nom_pokemon_en, genre, objet, talent, type_tera, evs, nature, moveset, id_pokemon) VALUES
('Landorus-Therian', null, 'Rocky Helmet', 'Intimidate', 'Dragon', '252 HP / 4 SpA / 252 Spe', 'Timid', ARRAY['Earth Power', 'U-turn', 'Stealth Rock', 'Taunt'], 8),
('Zamazenta', null, 'Leftovers', 'Dauntless Shield', 'Fire', '252 HP / 80 Def / 176 Spe', 'Jolly', ARRAY['Iron Defense', 'Body Press', 'Roar', 'Crunch'], 10),
('Raging Bolt', null, 'Booster Energy', 'Protosynthesis', 'Fairy', '4 HP / 252 SpA / 252 Spe', 'Modest', ARRAY['Calm Mind', 'Thunderbolt', 'Thunderclap', 'Dragon Pulse'], 11),
('Darkrai', null, 'Heavy-Duty Boots', 'Bad Dreams', 'Poison', '252 SpA / 4 SpD / 252 Spe', 'Timid', ARRAY['Will-O-Wisp', 'Dark Pulse', 'Ice Beam', 'Sludge Bomb'], 12),
('Gholdengo', null, 'Air Balloon', 'Good as Gold', 'Fairy', '252 HP / 196 Def / 60 Spe', 'Bold', ARRAY['Hex', 'Thunder Wave', 'Recover', 'Make It Rain'], 2),
('Dragonite', null, 'Heavy-Duty Boots', 'Multiscale', 'Normal', '252 Atk / 4 SpD / 252 Spe', 'Adamant', ARRAY['Dragon Dance', 'Earthquake', 'Extreme Speed', 'Encore'], 4);


INSERT INTO pokemon_set (nom_pokemon_en, genre, objet, talent, type_tera, evs, nature, moveset, id_pokemon) VALUES
('Torkoal', '(F)', 'Heat Rock', 'Drought', 'Fairy', '104 HP / 236 SpA / 168 SpD', 'Quiet', ARRAY['Overheat', 'Rapid Spin', 'Stealth Rock', 'Earthquake'], 13),
('Great Tusk', null, 'Covert Cloak', 'Protosynthesis', 'Steel', '252 HP / 4 Atk / 252 Spe', 'Jolly', ARRAY['Earthquake', 'Ice Spinner', 'Bulk Up', 'Rapid Spin'], 14),
('Slither Wing', null, 'Assault Vest', 'Protosynthesis', 'Electric', '168 HP / 252 Atk / 88 Spe', 'Adamant', ARRAY['U-turn', 'First Impression', 'Earthquake', 'Low Kick'], 15),
('Venusaur', null, 'Life Orb', 'Chlorophyll', 'Fire', '4 Def / 252 SpA / 252 Spe', 'Timid', ARRAY['Growth', 'Giga Drain', 'Sludge Bomb', 'Weather Ball'], 16),
('Walking Wake', null, 'Choice Specs', 'Protosynthesis', 'Water', '8 HP / 4 Def / 244 SpA / 252 Spe', 'Timid', ARRAY['Hydro Steam', 'Draco Meteor', 'Flamethrower', 'Flip Turn'], 17),
('Heatran', null, 'Air Balloon', 'Flash Fire', 'Ghost', '224 HP / 40 SpA / 244 Spe', 'Modest', ARRAY['Magma Storm', 'Earth Power', 'Solar Beam', 'Taunt'], 18);


INSERT INTO pokemon_set (nom_pokemon_en, genre, objet, talent, type_tera, evs, nature, moveset, id_pokemon) VALUES
('Kyurem', null, 'Leftovers', 'Pressure', 'Ground', '56 HP / 252 SpA / 4 SpD / 180 Spe', 'Modest', ARRAY['Substitute', 'Freeze-Dry', 'Earth Power', 'Protect'], 19),
('Zapdos', null, 'Heavy-Duty Boots', 'Static', 'Fighting', '248 HP / 224 Def / 8 SpA / 28 SpD', 'Bold', ARRAY['Volt Switch', 'Thunder Wave', 'Roost', 'Hurricane'], 20),
('Cinderace', null, 'Heavy-Duty Boots', 'Libero', 'Fire', '252 Atk / 4 SpD / 252 Spe', 'Jolly', ARRAY['Pyro Ball', 'U-turn', 'Gunk Shot', 'Sucker Punch'], 21),
('Tinkaton', null, 'Leftovers', 'Mold Breaker', 'Ghost', '244 HP / 8 Atk / 48 Def / 4 SpD / 204 Spe', 'Jolly', ARRAY['Knock Off', 'Encore', 'Gigaton Hammer', 'Stealth Rock'], 22),
('Great Tusk', null, 'Heavy-Duty Boots', 'Protosynthesis', 'Fighting', '252 Atk / 4 SpD / 252 Spe', 'Jolly', ARRAY['Headlong Rush', 'Close Combat', 'Rapid Spin', 'Ice Spinner'], 14),
('Roaring Moon', null, 'Choice Scarf', 'Protosynthesis', 'Dragon', '24 HP / 228 Atk / 4 SpD / 252 Spe', 'Jolly', ARRAY['Outrage', 'U-turn', 'Knock Off', 'Earthquake'], 5);



INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(1, 1), (1, 2), (1, 3), (1,4), (1,5), (1,6);

INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(2, 7), (2, 8), (2, 6), (2,9), (2,5), (2,2);

INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(3, 8), (3, 10), (3, 11), (3,12), (3,2), (3,4);

INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(4, 13), (4, 14), (4, 15), (4,16), (4,17), (4,18);

INSERT INTO equipe_de_pokemon (id_equipe, id_pokemon) VALUES
(5, 19), (5, 20), (5, 21), (5,22), (5,14), (5,5);


-- Le reste des pokemons qu'on utilisera pour la tier list
INSERT INTO pokemon (nom_pokemon_fr, gif, img_type1, img_type2, dimension_gif, sprite, lien, est_ou) VALUES
('Mamanbo', 'images/pokemon/mamanbo.gif', 'images/types/eau.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-mamanbo.png', 'https://www.smogon.com/dex/sv/pokemon/alomomola/', TRUE),
('Corvaillus', 'images/pokemon/corvaillus.gif', 'images/types/acier.png', 'images/types/vol.png', 'wider_gif', 'images/sprites/sprite-corvaillus.png', 'https://www.smogon.com/dex/sv/pokemon/corviknight/', TRUE),
('Deoxys-Vitesse', 'images/pokemon/deoxys-vitesse.gif', 'images/types/psy.png', 'images/types/inconnu.png', 'wider_gif', 'images/sprites/sprite-deoxys-vitesse.png', 'https://www.smogon.com/dex/sv/pokemon/deoxys-speed/', TRUE),
('Oyacata', 'images/pokemon/oyacata.gif', 'images/types/eau.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-oyacata.png', 'https://www.smogon.com/dex/sv/pokemon/dondozo/', TRUE),
('Lanssorien', 'images/pokemon/lanssorien.gif', 'images/types/dragon.png', 'images/types/spectre.png', 'wider_longer_gif', 'images/sprites/sprite-lanssorien.png', 'https://www.smogon.com/dex/sv/pokemon/dragapult/', TRUE),
('Amovénus', 'images/pokemon/amovenus.gif', 'images/types/fee.png', 'images/types/vol.png', 'longer_gif', 'images/sprites/sprite-amovenus.png', 'https://www.smogon.com/dex/sv/pokemon/enamorus/', TRUE),
('Gigansel', 'images/pokemon/gigansel.gif', 'images/types/roche.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-gigansel.png', 'https://www.smogon.com/dex/sv/pokemon/garganacl/', TRUE),
('Scorvol', 'images/pokemon/scorvol.gif', 'images/types/sol.png', 'images/types/vol.png', 'wider_gif', 'images/sprites/sprite-scorvol.png', 'https://www.smogon.com/dex/sv/pokemon/gliscor/', TRUE),
('Sorcilence', 'images/pokemon/sorcilence.gif', 'images/types/psy.png', 'images/types/fee.png', 'longer_gif', 'images/sprites/sprite-sorcilence.png', 'https://www.smogon.com/dex/sv/pokemon/slowking/', TRUE),
('Chef-de-fer', 'images/pokemon/chef-de-fer.gif', 'images/types/acier.png', 'images/types/psy.png', 'longer_gif', 'images/sprites/sprite-chef-de-fer.png', 'https://www.smogon.com/dex/sv/pokemon/iron-hands/', TRUE),
('Roue-de-fer', 'images/pokemon/roue-de-fer.gif', 'images/types/sol.png', 'images/types/acier.png', 'wider_longer_gif', 'images/sprites/sprite-roue-de-fer.png', 'https://www.smogon.com/dex/sv/pokemon/iron-treads/', TRUE),
('Miascarade', 'images/pokemon/miascarade.gif', 'images/types/plante.png', 'images/types/tenebres.png', 'longer_gif', 'images/sprites/sprite-miascarade.png', 'https://www.smogon.com/dex/sv/pokemon/meowscarada/', TRUE),
('Sulfura', 'images/pokemon/sulfura.gif', 'images/types/feu.png', 'images/types/vol.png', 'wider_gif', 'images/sprites/sprite-sulfura.png', 'https://www.smogon.com/dex/sv/pokemon/moltres/', TRUE),
('Ogerpon-Masque-du-Puits', 'images/pokemon/ogerpon-masque_du_puits.gif', 'images/types/plante.png', 'images/types/eau.png', 'wider_longer_gif', 'images/sprites/sprite-ogerpon-masque-du-puits.png', 'https://www.smogon.com/dex/sv/pokemon/ogerpon-wellspring/', TRUE),
('Oratoria', 'images/pokemon/oratoria.gif', 'images/types/eau.png', 'images/types/fee.png', 'wider_longer_gif', 'images/sprites/sprite-oratoria.png', 'https://www.smogon.com/dex/sv/pokemon/primarina/', TRUE),
('Gorythmic', 'images/pokemon/gorythmic.gif', 'images/types/plante.png', 'images/types/inconnu.png', 'wider_longer_gif', 'images/sprites/sprite-gorythmic.png', 'https://www.smogon.com/dex/sv/pokemon/rillaboom/', TRUE),
('Roigada-de-Galar', 'images/pokemon/roigada-de-galar.gif', 'images/types/psy.png', 'images/types/poison.png', 'wider_longer_gif', 'images/sprites/sprite-roigada-de-galar.png', 'https://www.smogon.com/dex/sv/pokemon/slowking-galar/', TRUE),
('Dinglu', 'images/pokemon/dinglu.gif', 'images/types/tenebres.png', 'images/types/sol.png', 'wider_longer_gif', 'images/sprites/sprite-dinglu.png', 'https://www.smogon.com/dex/sv/pokemon/ting-lu/', TRUE)
;

