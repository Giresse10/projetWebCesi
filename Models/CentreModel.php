<?php

namespace App\Models;

class CentreModel extends Model{
    protected $id;
    protected $nom;
    private $instance;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
}