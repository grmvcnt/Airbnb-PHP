<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Airbnb</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <?php 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "airbnb";

    //Connexion Serveur SQL
    $conn = new mysqli($servername, $username, $password, $dbname);

    //Verification connexion
    if($conn->connect_error){
        die('Erreur : ' .$conn->connect_error);
    }

    mysqli_query($conn,"set names utf8");

    //Boucle resultats
    $request = "SELECT * FROM logement";
    $select = mysqli_query($conn, $request);
    while($result = mysqli_fetch_array($select)){
        echo '';
    }

    //Select Meilleures notes
    $request_best_note = "SELECT * FROM logement ORDER BY logement_note DESC";
    $select_best_note = mysqli_query($conn, $request_best_note);

    //Select Plus d'avis
    $request_number_note = "SELECT * FROM logement ORDER BY logement_nombre_note DESC";
    $select_number_note = mysqli_query($conn, $request_number_note);

    $select = mysqli_query($conn, $request);
    
    //Select en fonction du critère
if(!empty($_GET["orderby" ])){
   if($_GET["orderby"] === "best_note"){
        $select = mysqli_query($conn, $request_best_note);
    }elseif($_GET["orderby"] === "number_note"){
        $select = mysqli_query($conn, $request_number_note);
    }else{
        $select = mysqli_query($conn, $request);
    }
}
    ?>
        <header>
            <div class="logo"><img src="img/airbnb-logo.png" alt="logo Airbnb"></div>
        </header>
        <main>
            <div class="main_header">
                <div class="title">Villas à Albufeira</div>
                <form method="get" action="">
                    <div class="dropdown_container">
                        <select name="orderby" id="order-by" class="dropdown">
                            <option value="" selected>Trier par ...</option>
                            <option value="best_note">Meilleures Notes</option>
                            <option value="number_note">Nombre d'avis</option>
                        </select>
                        <input type="submit" class="valid" value="">
                    </div>
                </form>
            </div>
            <div class="results">
                <?php
                    while($result = mysqli_fetch_array($select)){
                        //Boucle Superhôte
                        $superh = $result['logement_superhote'];
                        if ($superh>0){
                            $show_superh = '<div class="superh">Superhôte</div>';
                        } else {
                            $show_superh = '';
                        }
                        echo '  <div class="result">
                                <div class="cadre">'.$show_superh.'
                                <img class="photo" src="img/'.$result["logement_photo"].'" alt="Photo de la '.$result["logement_titre"].'">
                                </div>
                                <div class="description">
                                    <div class="note">
                                        <img class="star" src="img/etoile.png" alt="étoile">'.$result["logement_note"].' ('.$result["logement_nombre_note"].')
                                    </div>
                                    <div class="result_title">'.$result["logement_titre"].'</div>
                                </div>
                            </div>';}
                ?>
            </div>
        </main>
    </body>
</html>