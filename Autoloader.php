<?php

namespace App;

class Autoloader{
    static function register(){
        spl_autoload_register([
            __CLASS__,
            'autoload',
        ]);
    }
    static function autoload($class){
        // on recuprere dans class la totalité du namespace de la class concernée
        //(App/client/compte)
        //on retire App/ (Client/Compte)
        $class = str_replace(__NAMESPACE__.'\\','', $class);
        // on remplace les \ par des /
        $class = str_replace('\\', '/', $class);
        //on recupere le fichier associer a la classe
        $fichier = __DIR__.'/'.$class.'.php';
        //on verifie si le fichier existe
        if(file_exists($fichier)){
            require_once $fichier;
        }
    }
}