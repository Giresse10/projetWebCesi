<?php

namespace App\Models;

class SecteursModel extends Model{
    protected $id;
    protected $nom;

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
        if(!$this->findBy(['nom'=>$this->nom])){
            $this->create();
            return true;
        }else{
            return false;
        }
    }
    function remove() {
        if($this->findBy(['id'=>$this->id])){
            $this->delete(['id'=>$this->id]);
            $this->q("DELETE FROM entreprise WHERE idSecteur = $this->id");
            return true;
        }else{
            return false;
        }        
    }
}