<?php

namespace App\Models;

class SecteursModel extends Model{
    protected $id;
    protected $nom;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
}