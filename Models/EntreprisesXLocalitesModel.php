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
}