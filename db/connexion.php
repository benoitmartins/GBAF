<?php
// fichier "connexion.php"
try {
    $db = new PDO('mysql:host=localhost;dbname=gbaf;charset=utf8','gbaf','FYK9MiQOFulxg7UB', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
} catch (\Exception $e) {
    die('Erreur :' . $e->getMessage());
}
