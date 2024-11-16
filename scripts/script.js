// Sélectionne les boutons et la balise de style (CONSTANTE)
const bouton_rouge = document.getElementById("red_color");
const bouton_bleu = document.getElementById("blue_color");
const bouton_jaune = document.getElementById("yellow_color");
const bouton_violet = document.getElementById("purple_color");
const stylesheet = document.getElementById("stylesheet");

// Fonction pour changer le style
function changerStylesheet(anEvent){
    switch(anEvent.target.id){
        case "red_color":
            stylesheet.href = "styles/style-red.css";
            break;
        case "blue_color":
            stylesheet.href = "styles/style-blue.css";
            break;
        case "yellow_color":
            stylesheet.href = "styles/style-yellow.css";
            break;
        case "purple_color":
            stylesheet.href = "styles/style-purple.css";
    }
    // Sauvegarde le choix de style dans le localStorage
    localStorage.setItem("href_backup", stylesheet.href);
}

// On récupère la sauvegarde si elle existe
let backup_href = localStorage.getItem("href_backup");
// backup_href renvoie "null" si elle n'est pas défini donc on va s'en servir pour comparer avec "null" avec '!==' (Comparaison de type & valeur)

// Si backup_href est bien défini alors on va le récupérer afin d'appliquer le bon CSS
if(backup_href !== null){
    stylesheet.href = backup_href; 
}

// Ajoute un écouteur d'évènement au clic
bouton_rouge.addEventListener('click', changerStylesheet);
bouton_bleu.addEventListener('click', changerStylesheet);
bouton_jaune.addEventListener('click', changerStylesheet);
bouton_violet.addEventListener('click', changerStylesheet);