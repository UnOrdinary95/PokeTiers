<?php
// Retoune la connexion à la base de données PostgreSQL
function getDbConnection() {
    // Accéder aux variables d'environnement définies sur AlwaysData en utilisant 'getenv()'
    $dbHost = getenv('DB_HOST');            // Adresse du serveur
    $dbName = getenv('DB_NAME');            // Nom de la DB
    $dbUser = getenv('DB_USERNAME');        // Utilisateur
    $dbPassword = getenv('DB_PASSWORD');    // Mot de passe
    
    // Construire un string permettant ainsi de se connecter à la DB PostgreSQL
    $dbStr = "host=$dbHost dbname=$dbName user=$dbUser password=$dbPassword";
    $connexion = pg_connect($dbStr);
    
    // Vérification de la connexion
    if (!$connexion) {
        // Interrompt l'exécution du script
        die("Erreur de connexion à la base de données.");
    }

    return $connexion;
}
?>
