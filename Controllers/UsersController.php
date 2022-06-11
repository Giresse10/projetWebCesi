<?php
namespace App\Controllers;
use App\Core\Form;
use App\Models\usersModel;
use App\Models\StatusModel;

class UsersController extends Controller{
    
    public function index(){
        $this->render('users/index.tpl');
    }

    public function login(){
        $user = new UsersModel;
        if(Form::validate($_POST,['login_user_pass', 'login_user_login'])){
            $log = strip_tags($_POST['user']);
            $pass = strip_tags($_POST['pass']);
            $user->setPassword($pass);
            $user->setEmail($log);
            $user->setSession();
        }
        $this->render('main/index.tpl');
    }

    public function register(){
        if(Form::validate($_POST,['user_nom', 'user_prenom', 'user_email', 'user_centre', 'user_status', 'user_niveau', 'user_filiere'])){
            //
            $nom = strip_tags($_POST['user_nom']);
            $prenom = strip_tags($_POST['user_prenom']);
            $emailPerso = strip_tags($_POST['user_email']);
            $pseudo = '';
            $idCentre = strip_tags($_POST['user_centre']);
            $idStatus = strip_tags($_POST['user_status']);
            $niveau = strip_tags($_POST['user_niveau']);
            $idFiliere = strip_tags($_POST['user_filiere']);
            $pass = usersModel::genererPass();
            $password = password_hash($pass, PASSWORD_ARGON2I);
            //var_dump($)
            $model = new usersModel;
            $model->hydrate(compact('nom','prenom', 'emailPerso','idCentre', 'idStatus', 'niveau', 'idFiliere', 'password', 'pseudo'));
            $model->setEmail($model->genererEmail($idStatus));
            var_dump($model);
            echo $pass;
            $is_created = $model->register();
            var_dump($is_created);
            $status = new StatusModel;
            $st = $status->findBy(['id'=>$model->getIdStatus()]);
            if($is_created){
                $_SESSION['state']['type'] = 'user';
                $_SESSION['state']['status'] = true;
                $_SESSION['state']['statut'] = $st[0];
                $_SESSION['state']['nom'] = $nom;
                $_SESSION['state']['email'] = $model->getEmail();
                $_SESSION['state']['prenom'] = $prenom;
                $_SESSION['state']['password'] = $pass;
                header("Location:/create/register");
            }else{
                $_SESSION['state']['type'] = 'user';
                $_SESSION['state']['status'] = true;
                $_SESSION['state']['statut'] = $st[0];
                $_SESSION['state']['nom'] = $nom;
                $_SESSION['state']['prenom'] = $prenom;
                $_SESSION['state']['email'] = $model->getEmail();
                $_SESSION['state']['password'] = $pass;
                header("Location:/create/register");
            }

        }
        $form = new Form();
        $form->startForm('post','/user/register')
            ->addLabel('nom : ', 'nomId',['class' => 'form-label'])
            ->addInput( 'text', '',['id' => 'nomId', 'class' => 'form-control mb-2', 'name'=>'nom'])
            ->addLabel('email :','emailId',['class' => 'form-label'])
            ->addInput( 'email', '',['class' => 'form-control mb-2', 'name' => 'email', 'id' => 'emailId'])
            ->addLabel('mot de passe :','passwordId',['class' => 'form-label'])
            ->addInput( 'password', '',['class' => 'form-control mb-2', 'name' => 'password', 'id' => 'passwordId'])
            ->addInput( 'submit', 'valider',['class' => 'btn btn-primary', 'name' => 'sub', 'id' => 'subId'])
            ->endForm();

        $this->render('users/register.tpl',['f' => $form->create(),'s'=>$status??null]);
    }
    /**
     * page de notifications
     */
    public function notif() {
        $this->render('users/notif.tpl');
    }
    /**
     * page de parametre du compte
     */
    public function profil() {
        $usersModel = new UsersModel;
        $user = $usersModel->findSomeOne($_SESSION['user']['email']);
        $this->render('users/profil.tpl',compact('user'));
    }
    /**
     * page de parametre du compte
     */
    public function manage() {
        $usersModel = new UsersModel;
        $user = $usersModel->findAll();
        $this->json(compact('user'));
    }
}