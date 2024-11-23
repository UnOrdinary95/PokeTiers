<?php
// Inclure le fichier de connexion à la DB
include('config/init_db.php');

$db = getDbConnection();

// On récupère l'ID de l'équipe passé dans l'URL
$idEquipe = $_GET['id'];

// Requête pour obtenir le nom de l'équipe
$query_nomEquipe = "SELECT nom_equipe FROM equipes WHERE id_equipe = $1";
// Préparer la requête pour sécuriser cette entrée contre l'injection SQL
$prepared_query = pg_prepare($db, "query_nomEquipe", $query_nomEquipe);
// Exécution de la requête
$parametres = array($idEquipe); // pg_execute() attend un tableau de paramètre en paramètre
$execute_query_nomEquipe = pg_execute($db, "query_nomEquipe", $parametres);

if($execute_query_nomEquipe){
    $nom_equipe = pg_fetch_result($execute_query_nomEquipe, 0, "nom_equipe");
}
else{
    die("Erreur lors de l'exécution de la requête.");
}

// Requête pour obtenir tout les pokemon de l'équipe
$query_pokemon = "SELECT * FROM pokemon, equipe_de_pokemon 
WHERE pokemon.id_pokemon = equipe_de_pokemon.id_pokemon
AND id_equipe = $1
ORDER BY ordre";
$prepared_query = pg_prepare($db, "query_pokemon", $query_pokemon);
$execute_query_pokemon = pg_execute($db, "query_pokemon", $parametres);

if($execute_query_pokemon){
    $pokemon = pg_fetch_all($execute_query_pokemon);
}
else{
    die("Erreur lors de l'exécution de la requête.");
}

// Requête pour obtenir tout les sets des pokemon de l'équipe
$query_sets = "SELECT s.id_set, nom_pokemon_en, 
genre, talent, type_tera, evs,
nature, objet, array_to_json(moveset) AS moveset 
FROM pokemon_set AS s, pokemon AS p, equipe_de_pokemon AS ep 
WHERE s.id_set = ep.id_set 
AND p.id_pokemon = ep.id_pokemon
AND ep.id_equipe = $1
ORDER BY ordre";
$prepared_query = pg_prepare($db, "query_sets", $query_sets);
$execute_query_sets = pg_execute($db, "query_sets", $parametres);

if($execute_query_sets){
    $sets = pg_fetch_all($execute_query_sets);
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
    <title>PokéTiers - <?php print($nom_equipe)?></title>
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
                            <li id="header_nav_li"><a href="tier_list.html">Tier List</a></li>
                            <li id="header_nav_li"><a href="equipes.html">Équipes</a></li>
                        </ul>
                    </nav>
                </div>

                <a href="https://play.pokemonshowdown.com/">
                    <button class="button_shape" id="header_button_play">Jouer</button>
                </a>
            </div>
        </div>
    </header>

    <main id="main-flexbox">
        <div id="main_div_h1">
            <a href="equipes.php" id="button_return">
                <span id="style_arrow-left">
                    <i class="fa-solid fa-arrow-left fa-xl"></i>
                </span>
            </a>
            
            <h1><?php print($nom_equipe)?></h1>
        </div>

        <hr id="main_div_hr">

        <section class="section_sample_team1">
            <?php
            for($i = 0, $index = 0; $i < 3; $i++) {
                print("
                <div class='table_flexbox_row'>
                ");
                for($j = 0; $j < 2; $j++, $index++) {
                    // On recupère le moveset du pokemon en JSON et on le converti en array 'php' pour pouvoir l'utiliser
                    $array = json_decode($sets[$index]['moveset']);

                    print("
                    <table class='table_styles'>
                    <tr>
                        <th colspan='2' class='pokemon_name'>" . $pokemon[$index]['nom_pokemon_fr'] . " (".$sets[$index]['nom_pokemon_en'].")</th>  
                        <td rowspan='3' class='td_paddings'>
                            ".$sets[$index]['nom_pokemon_en']." @ ".$sets[$index]['objet']."<br>
                            Ability: ".$sets[$index]['talent']."<br>
                            Tera Type: ".$sets[$index]['type_tera']."<br>
                            EVs: ".$sets[$index]['evs']."<br>
                            ".$sets[$index]['nature']." Nature<br>
                            - ".$array[0]."<br>
                            - ".$array[1]."<br>
                            - ".$array[2]."<br>
                            - ".$array[3]."
                        </td>  
                    </tr>
        
                    <tr rowspan='4'>
                        <th colspan='2' class='pokemon_gif'>
                            <a href='".$pokemon[$index]['lien']."'>
                                <img src='" . $pokemon[$index]['gif'] . "' class='" . $pokemon[$index]['dimension_gif'] . "'>
                            </a>
                        </th>
                    </tr>

                    <tr>
                        <td align='center' class='types_paddings'>
                            <img src='" . $pokemon[$index]['img_type1'] . "'>
                        </td>

                        <td align='center' class='types_paddings'>
                            <img src='" . $pokemon[$index]['img_type2'] . "'>
                        </td>
                    </tr>
                    </table>");
                }
                print('</div>');
            }
        ?>
        </section>
        

 

        <section id="section_sample_team2">
            <h2 class="h2_format">Importation :</h2>
            
            <textarea readonly rows="10" cols="40" id="copy">
                <?php
                for($index = 0; $index < 6; $index++){
                    $array = json_decode($sets[$index]['moveset']);
                    // Le <textarea> prend en compte les espaces et les sauts de ligne dans son contenu.
                    print("
".$sets[$index]['nom_pokemon_en']." @ ".$sets[$index]['objet']."
Ability: ".$sets[$index]['talent']."
Tera Type: ".$sets[$index]['type_tera']."
EVs: ".$sets[$index]['evs']."
".$sets[$index]['nature']." Nature
- ".$array[0]."
- ".$array[1]."
- ".$array[2]."
- ".$array[3]."
                    ");
                }
                ?>
            </textarea><br>
                
            <div id="button_copy">
                <button class="button_shape" onclick="copier_texte()">Copier dans le presse-papier</button>
            </div>
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
                                <a href="tier_list.html">
                                    <li>Tier List</li>
                                </a>
    
                                <a href="equipes.html">
                                    <li>Équipes</li>
                                </a>
                                
                                <a href="https://play.pokemonshowdown.com/">
                                    <li>Jouer</li>
                                </a>
                            </ul>
                        </nav>
                    </div>
                    
                    <div class="footer_nav_container">
                        <nav id="f_nav_right">
                            <ul class="ul_flexbox">
                                <a href="https://www.smogon.com/forums/">
                                    <li>Forum</li>
                                </a>
    
                                <a href="https://calc.pokemonshowdown.com/">
                                    <li>Calculateur de dégats</li>
                                </a>
                                
                                <a href="https://www.smogon.com/dex/sv/pokemon/">
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
    
    <script src="scripts/copy.js"></script>
    <script src="scripts/script.js"></script>
</body>
</html>