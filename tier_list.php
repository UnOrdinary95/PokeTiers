<?php
// Inclure le fichier de connexion à la DB
include('config/init_db.php');

$db = getDbConnection();

// Requête pour obtenir le nombre de pokemon groupé par tier
// Tier 4 = les pokemon qui ne sont pas OverUsed donc pas pris en compte dans cette tier list
$query_counttier = "SELECT tier, count(tier) AS nbr_pkmn_tier FROM pokemon
WHERE tier < 4
GROUP BY tier
ORDER BY tier";

$prepared_query = pg_prepare($db, "query_counttier", $query_counttier);
$execute_query_counttier = pg_execute($db, "query_counttier", []);

if($execute_query_counttier){
    $nombre_pkmn_tier = pg_fetch_all($execute_query_counttier);
}
else{
    die("Erreur lors de l'exécution de la requête.");
}

// Requête pour obtenir le nom, l'image, les deux types, le lien
// la dimension et la description de chaque pokemon
// trié par son tier et son classement
$query_pokemon = "SELECT tier, nom_pokemon_fr, gif, dimension_gif,
img_type1, img_type2, description, lien
FROM pokemon
WHERE tier < 4
ORDER BY tier, classement";

$prepared_query = pg_prepare($db, "query_pokemon", $query_pokemon);
$execute_query_pokemon = pg_execute($db, "query_pokemon", []);

if($execute_query_pokemon){
    $info_pkmn = pg_fetch_all($execute_query_pokemon);
}
else{
    die("Erreur lors de l'exécution de la requête.");
}

pg_close($db);
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!--Spécifie l'encodage des caractères utilisé dans la page web-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Garantit que la page s'affiche correctement sur les appareils mobiles-->
    <title>PokéTiers - Tier List</title>
    <link rel="stylesheet" href="styles/style-red.css" id="stylesheet">
    <link rel="icon" type="image/png" href="images/pokeball.png">
    <script src="https://kit.fontawesome.com/755060982a.js" crossorigin="anonymous"></script>
</head>

<body>
    <header class="sticky_header">
        <div id="header_container1">
            <div class="inner_header_container1" id="ihc1_left">
                <a href="index.html">
                    <img id="header_icon" class="pokeball" src="images/pokeball.png" alt="Icone PokéTiers">
                </a>

                <a href="index.html">
                    <h1 id="header_title1" class="title">PokéTiers</h1>
                </a>
            </div>

            <div class="inner_header_container1" id="ihc1_right">
                <div>
                    <nav id="header_nav">
                        <ul id="header_ul">
                            <li id="header_nav_li"><a href="tier_list.php">Tier List</a></li>
                            <li id="header_nav_li"><a href="equipes.php">Équipes</a></li>
                        </ul>
                    </nav>
                </div>

                <a href="https://play.pokemonshowdown.com/" target="_blank">
                    <button class="button_shape" id="header_button_play">Jouer</button>
                </a>
            </div>
        </div>
    </header>

    <main id="main-flexbox">
        <div id="main_div_h1">
            <a href="index.html" id="button_return">
                <span id="style_arrow-left">
                    <i class="fa-solid fa-arrow-left fa-xl"></i>
                </span>
            </a>
            
            <h1>Tier List</h1>
        </div>

        <hr id="main_div_hr">

        <section id="section_tier_list">
            <table id="tier_list_styles" class="box_shadow">
                <?php
                // 4 tiers donc on aura besoin de 4 itérations
                $char_tiers = ['S', 'A', 'B', 'C'];

                for($i = 0, $index_pkmn = 0; $i < 4; $i++){
                    
                    print("<tr>
                                <th id='tier' rowspan='".($nombre_pkmn_tier[$i]['nbr_pkmn_tier'] * 4 + 1)."'>
                                    ".$char_tiers[$i]."
                                </th>
                            </tr>
                        ");
                    
                    for($j = 0; $j < $nombre_pkmn_tier[$i]['nbr_pkmn_tier']; $j++, $index_pkmn++){
                        print("
                            <tr>
                                <th colspan='2' class='pokemon_name'>
                                    ".$info_pkmn[$index_pkmn]['nom_pokemon_fr']."
                                </th>

                                <td rowspan='4' class='td_paddings' id='description_width'>
                                    ".$info_pkmn[$index_pkmn]['description']."
                                </td>
                            <tr>

                            <tr>
                                <th colspan='2' class='pokemon_gif'>
                                    <a href='".$info_pkmn[$index_pkmn]['lien']."'>
                                        <img src='".$info_pkmn[$index_pkmn]['gif']."' class='".$info_pkmn[$index_pkmn]['dimension_gif']."'>
                                    </a>
                                </th>
                            </tr>

                            <tr>
                                <td align='center' class='types_paddings'>
                                    <img src='".$info_pkmn[$index_pkmn]['img_type1']."'>
                                </td>
                                
                                <td align='center' class='types_paddings'>
                                    <img src='".$info_pkmn[$index_pkmn]['img_type2']."'>
                                </td>
                            </tr>
                        ");
                    }
                }
                ?>    
            </table>
        </section>
    </main>

    <footer id="footer">
        <div id="footer_container1">
            <img class="pokeball_gray" id="img_pokeball1" src="images/pokeball_gray.png" alt="Pokeball Gris"> 
            
            <div id="inner_footer_container1">
                <div>
                    <a href="index.html">
                        <img id="footer_icon" class="pokeball" src="images/pokeball.png" alt="Icone PokéTiers">
                    </a>
                </div>

                <div>
                    <a href="index.html">
                        <h1 id="footer_title" class="title">PokéTiers</h1>
                    </a>
                </div> 
            </div>
        </div>
        
        <div id="footer_container2">
            <div id="inner_footer_container_top">
                <div id="inner_footer_container2-1">
                    <div class="footer_nav_container">
                        <nav id="f_nav_left">
                            <ul class="ul_flexbox">
                                <a href="tier_list.php">
                                    <li>Tier List</li>
                                </a>
    
                                <a href="equipes.php">
                                    <li>Équipes</li>
                                </a>
                                
                                <a href="https://play.pokemonshowdown.com/" target="_blank">
                                    <li>Jouer</li>
                                </a>
                            </ul>
                        </nav>
                    </div>
                    
                    <div class="footer_nav_container">
                        <nav id="f_nav_right">
                            <ul class="ul_flexbox">
                                <a href="https://www.smogon.com/forums/" target="_blank">
                                    <li>Forum</li>
                                </a>
    
                                <a href="https://calc.pokemonshowdown.com/" target="_blank">
                                    <li>Calculateur de dégats</li>
                                </a>
                                
                                <a href="https://www.smogon.com/dex/sv/pokemon/" target="_blank">
                                    <li>Pokedex</li>
                                </a>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <div id="inner_footer_container2-2">
                    <div id="theme">
                        <h3 id="theme_title">Thème :</h3>

                        <div id="theme_flexbox">
                            <div class="theme_containers">
                                <div class="theme_circle" id="red_color"></div>
                                <div class="theme_circle" id="blue_color"></div>
                            </div>

                            <div class="theme_containers">
                                <div class="theme_circle" id="yellow_color"></div>
                                <div class="theme_circle" id="purple_color"></div>
                            </div>
                        </div>
                    </div>
                    
                    <img id="img_artist" src="images/artist.png" alt="Sprite Artist Pokemon">
                    <img class="pokeball_gray" id="img_pokeball2" src="images/pokeball_gray.png" alt="Pokeball Gris">
                    
                    <div id="liens_utiles">
                        <nav>
                            <ul>
                                <a href="contact.html">
                                    <li>Contact</li>
                                </a>
                                
                                <a href="mentions_legales.html">
                                    <li>Mentions Légales</li>
                                </a>

                                <a href="https://molard.alwaysdata.net/" target="_blank">
                                    <li>Site Partenaire</li>
                                </a>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <div id="inner_footer_container_bottom">
                <p id="copyright">&copy; PokéTiers. Tous droits réservés. Ce site est un projet étudiant et n'est en aucun cas affilié ou soutenu par Nintendo, Game Freak ou The Pokémon Company.</p>
            </div>
        </div>
    </footer>
    
    <script src="scripts/script.js"></script>
</body>
</html>