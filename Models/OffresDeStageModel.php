<?php
namespace App\Models;

class OffresDeStageModel extends Model{
    protected $id;
    protected $idCompetences;
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


}