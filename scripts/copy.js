function copier_texte() {
    var zone_de_texte = document.getElementById("copy");
    
    zone_de_texte.select();
    zone_de_texte.setSelectionRange(0, 99999); // Pour les appareils mobiles

    navigator.clipboard.writeText(zone_de_texte.value);
    
    alert("Le script a été copié dans le presse-papier !");
    }