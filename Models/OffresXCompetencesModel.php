<?php

namespace App\Models;

class OffresXCompetencesModel extends Model{
    protected $id;
    protected $idOffresDeStage;
    protected $idCompetences;

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
     * set idOffresDeStage
     */
    function setIdOffresDeStage($id){
        $this->idOffresDeStage = $id;
        return $this;
    }
    /**
     * set idCompetences
     */
    function setIdCompetences($id){
        $this->idCompetences = $id;
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
        if(!$this->findBy(['idOffresDeStage'=>$this->idOffresDeStage, 'idCompetences'=>$this->idCompetences])){
            $this->create();
            return true;
        }else{
            return false;
        }
    }
    /**
     * Competences
     */
    function findComp($id){
        return $this->q("SELECT c.nom FROM {$this->table} x JOIN competences c ON x.idCompetences = c.id WHERE x.idOffresDeStage = ?", [$id])->fetchAll();
    }

}