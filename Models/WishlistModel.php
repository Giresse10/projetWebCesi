<?php

namespace App\Models;

class StatusModel extends Model{
    protected $idUsers;
    protected $idOffresDeStage;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
}