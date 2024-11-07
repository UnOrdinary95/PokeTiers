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
}

// Ajoute un écouteur d'évènement au clic
bouton_rouge.addEventListener('click', changerStylesheet);
bouton_bleu.addEventListener('click', changerStylesheet);
bouton_jaune.addEventListener('click', changerStylesheet);
bouton_violet.addEventListener('click', changerStylesheet);