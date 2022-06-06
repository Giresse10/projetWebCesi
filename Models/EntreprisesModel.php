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

}