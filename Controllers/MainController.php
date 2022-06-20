<?php

namespace App\Controllers;

use App\Core\Form;
use App\Models\CandidaturesModel;
use App\Models\LocalitesModel;
use App\Models\SecteursModel;
use App\Models\usersModel;

class MainController extends Controller{
    public function index(){
        $usersModel = new usersModel;
        //echo password_verify('$argon2i$v=19$m=65536,t=4,p=1$V0puVEdqTEwzeWdjLk82UQ$nvtDYCcTMyP33AL0ckGmP3Q0pUoYhEkrP6EnRGLJJ2E', 'admin');
        if(Form::validate($_POST,['login_user_pass', 'login_user_login'])){
            $log = strip_tags($_POST['login_user_login']);
            $pass = strip_tags($_POST['login_user_pass']);
            $userArray = $usersModel->findSomeOne($log);
            //$_SESSION['error'] = $userArray;
            if(!$userArray){
                $_SESSION['error'] = 'identifient invalide';
                header('Location:.');
                exit;
            }
            $user = $usersModel->hydrate($userArray);
            
            if(password_verify($pass, $user->getPassword())){
                $user->setSession();
                unset($_SESSION['error']);
                header('Location:.');
                exit;
            }else{
                $_SESSION['error'] = 'mot de passe incorrecte';
                header('Location:.');
                exit;
            }
            
        }
        $this->render('main/index.tpl');
    }


    /**
     * page pour se deconnecter
     */
    public function logout() {
        unset($_SESSION['user']);
        header('Location:.');
    }
    
    /**
     * page de parametre du compte
     */
    public function manage() {
        if(isset($_SESSION['user'])&&$_SESSION['user']['status'] == 1){
        $usersModel = new UsersModel;
        $localitesModel = new LocalitesModel;
        $secteursModel = new SecteursModel;
        $candidaturesModel = new CandidaturesModel;
        $users = $usersModel->findEntiere();
        $candidatures = $candidaturesModel->findEntiere();
        $localites = $localitesModel->findAll();
        $secteurs = $secteursModel->findAll();
        $this->render("main/manage.tpl", compact('users','localites','secteurs', 'candidatures'));


        if(Form::validate($_POST,['loc_nom','loc_cp'])){
            $nom = strip_tags($_POST['loc_nom']);
            $cp = strip_tags($_POST['loc_cp']);
            $model = new LocalitesModel;
            $model->hydrate(compact('nom','cp'));
            $model->insert();
        }
        if(Form::validate($_POST,['sec_nom'])){
            $nom = strip_tags($_POST['sec_nom']);
            $model = new SecteursModel;
            $model->hydrate(compact('nom'));
            $model->insert();
        }
    }else{
        http_response_code(403);
    }}

    /**
     * cv
     */
    function cv($id){
        $candidature = new CandidaturesModel;
        $c = $candidature->find($id);
        if($candidature->findBy(['hasChecked'=>0])){
            $model = new CandidaturesModel;
            $model->setHasChecked(1);
            $candidature->update($c->id, $model);
        }
        $cv = $c->cvData;
        header("Content-type:application/pdf");
        echo $cv;
    }

    /**
     * delete
     */
    public function deloc($id){
        if(isset($_SESSION['user'])&&$_SESSION['user']['status'] == 1){
            $model = new LocalitesModel;
            $model->hydrate(compact('id'));
            $model->remove();
        }else{
            http_response_code(403);
        }
    }
    /**
     * delete
     */
    public function delsec($id){
        if(isset($_SESSION['user'])&&$_SESSION['user']['status'] == 1){
            $model = new SecteursModel;
            $model->hydrate(compact('id'));
            $model->remove();
        }else{
            http_response_code(403);
        }
    }
}
