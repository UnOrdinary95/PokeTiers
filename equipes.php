<?php
// Inclure le fichier de connexion à la DB
include('config/init_db.php');

$db = getDbConnection();

// Requête pour obtenir le nom des équipes
$query_nomEquipes = "SELECT nom_equipe FROM equipes";

$prepared_query = pg_prepare($db, "query_nomEquipes", $query_nomEquipes);
$execute_query_nomEquipes = pg_execute($db, "query_nomEquipes", []);

if($execute_query_nomEquipes){
    $nom_equipes = pg_fetch_all($execute_query_nomEquipes);
}
else{
    die("Erreur lors de l'exécution de la requête.");
}

// Requête pour obtenir les sprites des pokemon trié par équipe
$query_sprites = "SELECT e.id_equipe, sprite 
FROM equipes AS e , pokemon AS p , equipe_de_pokemon AS ep
WHERE e.id_equipe = ep.id_equipe 
AND p.id_pokemon = ep.id_pokemon 
ORDER BY e.id_equipe, ordre";

$prepared_query = pg_prepare($db, "query_sprites", $query_sprites);
$execute_query_sprites = pg_execute($db, "query_sprites", []);

if($execute_query_sprites){
    $sprites = pg_fetch_all($execute_query_sprites);
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
    <title>PokéTiers - Équipes</title>
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
            
            <h1>Équipes</h1>
        </div>

        <hr id="main_div_hr">

        <div class="flexbox_row">
            <section id="equipes_container" class="box_shadow">
                <div>
                    <p class="p_format">Bienvenue dans le fil des équipes typiques, où vous trouverez quelques équipes solides pour en apprendre plus sur le métagame OverUsed. 
                        Pour rendre l'équipe importable, il suffit de cliquer sur les mini-sprites !</p>
                </div>

                <?php
                    for($i = 1, $index=0; $i <= 5; $i++){
                        print("<div class='p_format'>
                                    <p>".$nom_equipes[$i-1]['nom_equipe']."</p>
                                    <a href='equipe.php?id=$i'>");
                        for($j = 0; $j < 6; $j++, $index++){
                            print("<img src='".$sprites[$index]['sprite']."'>");
                        }
                        print('</a>
                            </div>');
                    }
                ?>
            </section>
            
            <img src="images/oak.png" id="img_prof_oak">

            <img src="images/flutter_mane.png" id="img_flutter_mane">
        </div>

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