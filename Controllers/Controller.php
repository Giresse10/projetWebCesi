<?php

namespace App\Controllers;

use App\Core\SmartySingleton;

class Controller{
    function render(string $fichier, array $data=[]) {
        /* instance e smarty pour effectuer le choix de rendu du template*/
        $smarty = SmartySingleton::getInstance();
        foreach($data as $key => $value)
            $smarty->assign("$key", $value);
        /* rendu */
        $smarty->display($fichier);

    }

    function json(array $data){
        header("Content-Type: application/json");
        echo json_encode($data);
    }
}