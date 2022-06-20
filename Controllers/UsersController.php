<?php
namespace App\Controllers;
use App\Core\Form;
use App\Models\CandidaturesModel;
use App\Models\OffresDeStageModel;
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
        $candidature = new CandidaturesModel;
        $offresModel = new OffresDeStageModel;
        //liste des offres dans wishlist
        if(isset($_SESSION['user'])){
            $candidature->hydrate(array('idUser'=>$_SESSION['user']['id']));
            $apply = $candidature->findHalf();
        }
        $this->render('users/notif.tpl', ['apply'=>$apply??'']);
    }
    /**
     * page de parametre du compte
     */
    public function profil() {
        $usersModel = new UsersModel;
        $user = $usersModel->findSomeOne($_SESSION['user']['email']??0);
        $this->render('users/profil.tpl',compact('user'));
    }
    /**
     * delete
     */
    public function delete(){
        if(isset($_SESSION['user'])&&$_SESSION['user']['status'] == 1){
            if(Form::validate($_POST, ['user'])){
                $id = strip_tags($_POST['user']);
                $model = new UsersModel;
                $model->hydrate(compact('id'));
                $model->remove();
            }
        }else{
            http_response_code(404);
        }
    }
    public function edit($id){
        $umodel = new UsersModel;
        $users = $umodel->findOne($id);
        var_dump($users);
        
        if(Form::validate($_POST,array('edit'))){
            $nom = strip_tags($_POST['nom']??$users->nom);
            $prenom = strip_tags($_POST['prenom']??$users->prenom);
            $email = strip_tags($_POST['email']??$users->email);
            $emailPerso = strip_tags($_POST['emailPerso']??$users->emailPerso);
            $pseudo = strip_tags($_POST['pseudo']??$users->pseudo);
            $niveau = strip_tags($_POST['niveau']??$users->niveau);
            $idStatus = strip_tags($_POST['idStatus']??$users->idStatus);
            $idFiliere = strip_tags($_POST['idFiliere']??$users->idFiliere);
            $idCentre = strip_tags($_POST['idCentre']??$users->idCentre);
            $model = new usersModel;
            $model = $model->hydrate(compact('nom', 'email', 'pseudo', 'niveau', 'prenom', 'idStatus','idFiliere','idCentre','emailPerso'));
            $umodel->update($id,$model);
            http_response_code(301);
            header("Location:".$_SERVER['HTTP_REFERER']);
        }

        $this->render('users/edit.tpl', compact('users'));
    }
}