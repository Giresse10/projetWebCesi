<?php

namespace App\Models;

class AnnonceModel extends Model{

    protected $id;
    protected $titre;
    protected $description;
    protected $createdAt;
    protected $actif;
    /**
     * constructeur
     */
    public function __construct(){
        $class = str_replace(__NAMESPACE__.'\\' ,'',__CLASS__);
        $this->table = strtolower(str_replace('Model', '', $class));
    }

    function getId(){
        return $this->id;
    }

    function getTitre()
    {
        return $this->titre;
    }

    function getDescription()
    {
        return $this->description;
    }

    function getCreatedAt(){
        return $this->createdAt;
    }

    public function getActif(){
        return $this->actif;
    }

    function setTitre($titre):self
    {
        $this->titre = $titre;
        return $this;
    }

    function setDescription($description):self
    {
        $this->description = $description;
        return $this;
    }

    function setActif($actif):self
    {
        $this->actif = $actif;
        return $this;
    }
}