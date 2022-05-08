<?php
  define("RULE", "mysql:host=localhost;dbname=projet_db");
  
  define("USER", "root");
  define("PASS", "");
  try{
    $cnx = new PDO(RULE, USER, PASS);
  }catch(PDOException $e){
    echo "erreur".$e->getMessage();
    die();
  }
 ?>
