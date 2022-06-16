<?php

namespace App\Models;

class EntreprisesModel extends Model{
    protected $id;
    protected $nom;
    protected $idSecteur;
    protected $nbStagiaires;
    protected $createdAt;

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
    //Setters
    /**
     * set nom
     */
    function setnom($nom){
        $this->nom = $nom;
        return $this;
    }
    /**
     * set secteur
     */
    function setIdSecteur($secteur){
        $this->idSecteur = $secteur;
        return $this;
    }
    /**
     * set stagiaire
     */
    function setNbStagiaires($nbStagiaires){ 
        $this->nbStagiaires = $nbStagiaires;
        return $this;
    }
    /**
     * set createAt
     */
    function setCreateAt($create){
        $this->password = $create;
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
     * nom
     */
    function getNom() {
        return $this->nom;
    }
    /**
     * nombre de stagiaires
     */
    function getNbStagiaires() {
        return $this->NbStagiaires;
    }
    /**
     * secteur d'activité
     */
    function getIdSecteur() {
        return $this->IdSecteur;
    }
    /**
     * created at
     */
    function getCreatedAt() {
        return $this->createdAt;
    }
    //Registers
    function register() {
        if(!$this->findBy(['nom'=>$this->nom])){
            $this->create();
            $m = $this->findBy(['nom'=>$this->nom]);
            return $m[0]->id;
        }else{
            return false;
        } 
    }
    /**
     * entiere 
     */
    function findEntiere() {
        return $this->q("SELECT e.*, s.nom AS secteur FROM {$this->table} e INNER JOIN `secteurs` s ON e.idSecteur = s.id")->fetchAll();
    }
    /**
     * One
     */
    function findOne() {
        $sql = "SELECT e.*, s.nom AS secteur FROM {$this->table} e INNER JOIN `secteurs` s ON e.idSecteur = s.id WHERE e.id = {$this->id}";
        return $this->q($sql)->fetch();
    }
    /**
     * find one items
     */
    public function findItems() {
        return $this->q("SELECT o.*, l.nom as localite, l.cp FROM {$this->table} e
        INNER JOIN `OffresDeStage` o ON o.idEntreprise=e.id INNER JOIN `localites` l ON o.idLocalite = l.id WHERE e.id = {$this->id}")->fetchAll();
    }
    /**
     * remove
     */
    function remove() {
        if($this->findBy(['id'=>$this->id])){
            $this->delete(['id'=>$this->id]);
            $this->q("DELETE FROM entreprisesXlocalites WHERE idEntreprises = $this->id");
            $this->q("DELETE FROM offresdestage WHERE idEntreprise = $this->id");
            return true;
        }else{
            return false;
        }        
    }

}