<?php

namespace App\Models;

class LocalitesModel extends Model{
    protected $id;
    protected $nom;
    protected $cp;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
}