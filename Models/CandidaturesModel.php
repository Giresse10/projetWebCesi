<?php

namespace App\Models;

class CandidaturesModel extends Model{
    protected $id;
    protected $idUser;
    protected $idOffresDeStage;
    protected $cvTitre;
    protected $cvData;
    protected $lmTitre;
    protected $lmData;
    protected $lmText;
    protected $createdAt;

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
     * get idUser
     */
    function getIdUser(){
        return $this->idUser;
    }
    /**
     * get idOffresDeStage
     */
    function getIdOffresDeStage(){
        return $this->idOffresDeStage;
    }
    /**
     * get cv
     */
    public function getCvTitre(){
		return $this->cvTitre;
	}
    /**
     * 
     */
    public function getCvData(){
		return $this->cvData;
	}
    /**
     * 
     */
    public function getLmTitre(){
		return $this->lmTitre;
	}
    /**
     * 
     */
    public function getLmData(){
		return $this->lmData;
	}
    /**
     * 
     */
    public function getLmText(){
		return $this->lmText;
	}
    /**
     * created at
     */
    function getCreatedAt() {
        return $this->createdAt;
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
     * set idUser
     */
    function setIdUser($idUser){
        $this->idUser = $idUser;
        return $this;
    }
    /**
     * set idOffresDeStage
     */
    function setIdOffresDeStage($idOffresDeStage){
        $this->idOffresDeStage = $idOffresDeStage;
        return $this;
    }
    /**
     * set cvTitre
     */
    public function setCvTitre($cvTitre){
        $this->cvTitre = $cvTitre;
        return $this;
    }
    /**
     * set cvData
     */
    public function setCvData($cvData){
        $this->cvData = $cvData;
        return $this;
    }
    /**
     * set lmTitre
     */
    public function setLmTitre($lmTitre){
        $this->lmTitre = $lmTitre;
        return $this;
    }
    /**
     * set lmData
     */
    public function setLmData($lmData){
        $this->lmData = $lmData;
        return $this;
    }
    /**
     * set lmText
     */
    public function setLmText($lmText){
        $this->lmText = $lmText;
        return $this;
    }
    /**
     * set createAt
     */
    function setCreateAt($create){
        $this->password = $create;
        return $this;
    }
     //Registers
    function save() {
        if(!$this->findBy(['idOffresDeStage'=>$this->idOffresDeStage,'idUser'=>$this->idUser])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
    /**
     * find 
     */
    function findSelfApply() {
        if($this->findBy(['idUser'=>$this->idUser, 'idOffresDeStage'=>$this->idOffresDeStage])){
            return true;
        }else{
            return false;
        }
    }  
    /**
     * 
     */
    function setSession($status){
        $_SESSION['candidature']['idOffre'] = $this->idOffresDeStage;
        $_SESSION['candidature']['idUser'] = $this->idUser;
        $_SESSION['candidature']['status'] = $status;
    }
    
}