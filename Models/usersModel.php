<?php

namespace App\Models;

class usersModel extends Model{
    protected $id;
    protected $nom;
    protected $prenom;
    protected $email;
    protected $emailPerso;
    protected $pseudo;
    protected $niveau;
    protected $idStatus;
    protected $idFiliere;
    protected $idCentre;
    protected $password;
    protected $createAt;

    public function __construct(){
        $this->table = str_replace('Model', '', str_replace(__NAMESPACE__.'\\','',__CLASS__));
    }
    //Setters
    /**
     * set pseudo
     */
    function setPseudo($pseudo){
        $this->pseudo = $pseudo;
        return $this;
    }
    /**
     * set nom
     */
    function setnom($nom){
        $this->nom = $nom;
        return $this;
    }
    /**
     * set prenom
     */
    function setPrenom($prenom){
        $this->prenom = $prenom;
        return $this;
    }
    /**
     * set email
     */
    function setEmail($email){
        $this->email = $email;
        return $this;
    }
    /**
     * set email perso
     */
    function setEmailPerso($email){
        $this->emailPerso = $email;
        return $this;
    }
    /**
     * set id
     */
    function setId($id){
        $this->id = $id;
        return $this;
    }
    /**
     * set id status
     */
    function setIdStatus($id){
        $this->idStatus = $id;
        return $this;
    }
    /**
     * set id fil
     */
    function setIdFiliere($id){
        $this->idFiliere = $id;
        return $this;
    }
    /**
     * set id centre
     */
    function setIdCentre($id){
        $this->idCentre = $id;
        return $this;
    }
    /**
     * set id niveau
     */
    function setNiveau($id){
        $this->niveau = $id;
        return $this;
    }
    /**
     * set passeword
     */
    function setPassword($password){
        $this->password = $password;
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
     * prenom
     */
    function getPrenom() {
        return $this->prenom;
    }
    /**
     * email
     */
    function getEmail() {
        return $this->email;
    }
    /**
     * email perso
     */
    function getEmailPerso() {
        return $this->emailPerso;
    }
    /**
     * pseudo
     */
    function getPseudo() {
        return $this->pseudo;
    }
    /**
     * id niveau
     */
    function getNiveau() {
        return $this->niveau;
    }
    /**
     * id
     */
    function getIdCentre() {
        return $this->idCentre;
    }
    /**
     * id
     */
    function getIdFiliere() {
        return $this->idFiliere;
    }
    /**
     * password
     */
    function getPassword() {
        return $this->password;
    }
    /**
     * created at
     */
    function getCreatedAt() {
        return $this->createdAt;
    }


    //Registers
    function register() {
        if(!$this->findBy(['email'=>$this->email])){
            $this->create();
            return true;
        }else{
            return false;
        }        
    }
    /**
     * generer un mot de passe
     */
    static function genererPass($longueur = 8){
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $longueurMax = strlen($caracteres);
        $chaineAleatoire = '';
        for ($i = 0; $i < $longueur; $i++) {
            $chaineAleatoire .= $caracteres[rand(0, $longueurMax - 1)];
        }
        return $chaineAleatoire;
    }
    /**
     * generer un email
     */
    function genererEmail($status){
        $dn = ($status == 4) ? "viacesi" : "cesi";
        $preno = str_replace(' ', '', $this->prenom);
        $no = str_replace(' ', '', $this->nom);
        $preno = str_replace('-', '', $preno);
        $no = str_replace('-', '', $no);
        $ml = strtolower($preno) . "." . strtolower($no) . "@" . $dn . ".fr";
        return $ml;
    }
    //Login
    function findSomeOne($id){
        return $this->q("SELECT * FROM {$this->table} WHERE email=? OR pseudo=?", [$id, $id])->fetch();
    }
    function setSession(){
        //$_SESSION['user']['id'] = $this->id;
        $_SESSION['user']['email'] = $this->email;
        $_SESSION['user']['prenom'] = $this->prenom;
        $_SESSION['user']['nom'] = $this->nom;
        $_SESSION['user']['status'] = $this->id_status;
    }
}