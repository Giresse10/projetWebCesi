<?php

namespace App\Models;

class AvisEntreprisesModel extends Model{
    protected $id;
    protected $idUsers;
    protected $idEntreprises;
    protected $note;
    protected $commentaire;

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
    function setIdUsers($id){
        $this->idUsers = $id;
        return $this;
    }
    /**
     * set note
     */
    function setNote($note){
        $this->note = $note;
        return $this;
    }
    /**
     * set commentaire
     */
    function setCommentaire($commentaire){
        $this->commentaire = $commentaire;
        return $this;
    }
    //Getters
    /**
     * id
     */
    function getId() {
        return $this->id;
    }

    function findNotice($id){
        return $this->q("SELECT * FROM {$this->table} WHERE idEntreprises = ?", [$id])->fetchAll();
    }

    function findHow($id){
        $nb = $this->q("SELECT count(*) as nb FROM {$this->table} WHERE idEntreprises = ?", [$id])->fetch();
        return $nb->nb;
    }

    /**
      * noter
      */
      function rate() {
        if(!$this->findBy(['idUsers'=>$this->idUsers, 'idEntreprises'=>$this->idEntreprises])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
     /**
      * supprimmer
      */
     function delRate() {
        if($this->findBy(['idUsers'=>$this->idUsers, 'idEntreprises'=>$this->idEntreprises])){
            $this->q("DELETE FROM {$this->table} WHERE idUsers={$this->idUsers} AND idEntreprises={$this->idEntreprises}");
            return true;
        }else{
            return false;
        }        
    }
    /**
     * moyenne
     */
    function mean($id) {
        $sql = "SELECT ROUND(AVG(note)) as rd, AVG(note) as mean, COUNT(id) as nb FROM $this->table  WHERE idEntreprises={$id} GROUP BY idEntreprises";
        $result = $this->q($sql)->fetch();
        return $result;
    }

}