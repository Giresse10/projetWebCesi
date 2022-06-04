<?php

namespace App\Controllers;

use App\Core\Form;
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
}
