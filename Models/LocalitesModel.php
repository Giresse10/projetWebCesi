<?php

namespace App\Models;

class LocalitesModel extends Model{
    protected $id;
    protected $nom;
    protected $cp;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
    //Setters
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
    function setNom($nom){
        $this->nom = $nom;
        return $this;
    }
    /**
     * set cp
     */
    function setCp($cp){
        $this->cp = $cp;
        return $this;
    }
    //Getters
    /**
     * id
     */
    function getId() {
        return $this->id;
    }
    /**
      * insert
      */
    function insert() {
        if(!$this->findBy(['nom'=>$this->nom, 'cp'=>$this->cp])){
            $this->create();
            return true;
        }else{
            return false;
        }
    }
    /**
     * remove
     */
    function remove() {
        if($this->findBy(['id'=>$this->id])){
            $this->delete(['id'=>$this->id]);
            $this->q("DELETE FROM offresdestage WHERE idLocalite = $this->id");
            return true;
        }else{
            return false;
        }        
    }
}