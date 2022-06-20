<?php

namespace App\Models;

class EntreprisesXLocalitesModel extends Model{
    protected $id;
    protected $idEntreprises;
    protected $idLocalites;

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
     * set idEntreprises
     */
    function setIdEntreprises($id){
        $this->idEntreprises = $id;
        return $this;
    }
    /**
     * set idLocalites
     */
    function setIdLocalites($id){
        $this->idLocalites = $id;
        return $this;
    }
    //Getters
    /**
     * id
     */
    function getId() {
        return $this->id;
    }

    function findWhere($id){
        return $this->q("SELECT x.idLocalites, l.nom FROM {$this->table} x JOIN Localites l ON x.idLocalites = l.id WHERE x.idEntreprises = ?", [$id])->fetchAll();
    }

    function findHow($id){
        return $this->q("SELECT count(*) as nb FROM {$this->table} WHERE idEntreprises = ?", [$id])->fetch();
    }
    /**
      * insert
      */
      function insert() {
        if(!$this->findBy(['idEntreprises'=>$this->idEntreprises, 'idLocalites'=>$this->idLocalites])){
            $this->create();
            return true;
        }else{
            return false;
        }
    }
     /**
     * Competences
     */
    function findCrossed($id){
        return $this->q("SELECT l.id FROM {$this->table} x JOIN localites l ON x.idLocalites = l.id WHERE x.idEntreprises = ?", [$id])->fetchAll();
    }

}