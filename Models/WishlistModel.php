<?php

namespace App\Models;

class WishListModel extends Model{
    protected $id;
    protected $idUsers;
    protected $idOffresDeStage;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }

    //Getters
    /**
     * get id
     */
    function getId(){
        return $this->id;
    }
    /**
     * get idUsers
     */
    function getIdUsers(){
        return $this->idUsers;
    }
    /**
     * get idOffresDeStage
     */
    function getIdOffresDeStage(){
        return $this->idOffresDeStage;
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
     * set idUsers
     */
    function setIdUsers($idUsers){
        $this->idUsers = $idUsers;
        return $this;
    }
    /**
     * set idOffresDeStage
     */
    function setIdOffresDeStage($idOffresDeStage){
        $this->idOffresDeStage = $idOffresDeStage;
        return $this;
    }
     //Registers
     /**
      * like
      */
     function like() {
        if(!$this->findBy(['idUsers'=>$this->idUsers, 'idOffresDeStage'=>$this->idOffresDeStage])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
     /**
      * unlike
      */
     function unLike() {
        if($this->findBy(['idUsers'=>$this->idUsers, 'idOffresDeStage'=>$this->idOffresDeStage])){
            $this->q("DELETE FROM {$this->table} WHERE idUsers={$this->idUsers} AND idOffresDeStage={$this->idOffresDeStage}");
            return true;
        }else{
            return false;
        }        
    }
    /**
     * find 
     */
    function findSelfWishlist() {
        if($this->findBy(['idUsers'=>$this->idUsers, 'idOffresDeStage'=>$this->idOffresDeStage])){
            return true;
        }else{
            return false;
        }
    }  
}