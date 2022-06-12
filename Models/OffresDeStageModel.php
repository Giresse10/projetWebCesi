<?php
namespace App\Models;

class OffresDeStageModel extends Model{
    protected $id;
    protected $titre;
    protected $description;
    protected $idLocalite;
    protected $idEntreprise;
    protected $duree;
    protected $baseDeRemuneration;
    protected $date;
    protected $nbPlaces;
    protected $createAt;

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
     * set titre
     */
    function setTitre($titre){
        $this->titre = $titre;
        return $this;
    }
    /**
     * set description
     */
    function setDescription($description){
        $this->description = $description;
        return $this;
    }
    /**
     * set idLocalite
     */
    function setIdLocalite($idLocalite){
        $this->idLocalite = $idLocalite;
        return $this;
    }
    /**
     * set idEntreprise
     */
    function setIdEntreprise($id){
        $this->idEntreprise = $id;
        return $this;
    }
    /**
     * set duree
     */
    function setDuree($duree){
        $this->duree = $duree;
        return $this;
    }
    /**
     * set BaseDeRemuneration
     */
    function setBaseDeRemuneration($base){
        $this->baseDeRemuneration = $base;
        return $this;
    }
    /**
     *set date
     */
    function setDate($date){
        $this->date = $date;
        return $this;
    }
    /**
     * set nbPlaces
     */
    public function setNbPlaces($nb){
        $this->nbPlaces = $nb;
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
     * created at
     */
    function getCreatedAt() {
        return $this->createdAt;
    }

    
    //Registers
    function register() {
        if(!$this->findBy(['titre'=>$this->titre,'idEntreprise'=>$this->idEntreprise,'date'=>$this->date, 'duree'=>$this->duree, 'idLocalite'=>$this->idLocalite])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
    /**
     * 
     */
    function findOne($id) {
        return $this->q("SELECT o.*, e.nom AS entreprise, l.nom as localite, l.cp
        FROM {$this->table} o INNER JOIN `entreprises` e ON o.idEntreprise = e.id INNER JOIN `localites` l ON o.idLocalite = l.id WHERE o.id = {$id}")->fetch();
    }
    /**
     * 
     */
    function findEntiere() {
        return $this->q("SELECT o.*, e.nom AS entreprise, l.nom as localite, l.cp
        FROM {$this->table} o INNER JOIN `entreprises` e ON o.idEntreprise = e.id INNER JOIN `localites` l ON o.idLocalite = l.id")->fetchAll();
    }
     /**
     * 
     */
    function findFrom($start) {
        return $this->q("SELECT o.*, e.nom AS entreprise, l.nom as localite, l.cp
        FROM {$this->table} o INNER JOIN `entreprises` e ON o.idEntreprise = e.id INNER JOIN `localites` l ON o.idLocalite = l.id 
        ORDER BY o.id DESC LIMIT 5 OFFSET {$start}")->fetchAll();
    }
    /**
     * count
     */
    function lines() {
        return $this->q("SELECT COUNT(id) as n FROM {$this->table}")->fetch()->n;
    }
    /**
     * remove
     */
    function remove() {
        if($this->findBy(['id'=>$this->id])){
            $this->delete(['id'=>$this->id]);
            return true;
        }else{
            return false;
        }        
    }

}