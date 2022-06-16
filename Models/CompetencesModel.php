<?php

namespace App\Models;

class CompetencesModel extends Model{
    protected $id;
    protected $nom;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
     /**
     * set id
     */
    function setId($id){
        $this->id = $id;
        return $this;
    }
     /**
     * set nom
     */
    function setnom($nom){
        $this->nom = $nom;
        return $this;
    }
    /**
      * insert
      */
      function insert() {
        if(!$this->findBy(['nom'=>$this->nom])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
}