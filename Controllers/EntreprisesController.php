<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\EntreprisesModel;
use App\Models\EntreprisesXLocalitesModel;

class EntreprisesController extends Controller{
    public function index(){
        $entreprises = new EntreprisesModel;
        $lstEnt = $entreprises->findAll();
        $this->render('entreprises/index.tpl', compact('lstEnt'));
    }

    public function register(){
        if(Form::validate($_POST, ['entreprise_nom','entreprise_secteur','entreprise_localite'])){
            $nom = strip_tags($_POST['entreprise_nom']);
            $idSecteur = strip_tags($_POST['entreprise_secteur']);
            $idLocalites = strip_tags($_POST['entreprise_localite']);
            $model = new EntreprisesModel;
            $entreprise = $model->hydrate(compact('nom','idSecteur'));
            $idEntreprises = $model->register();
            if($idEntreprises){
                $exl = new EntreprisesXLocalitesModel;
                $exl->hydrate(compact('idLocalites','idEntreprises'));
                $exl->create();
                $_SESSION['state']['type'] = 'entreprise';
                $_SESSION['state']['status'] = true;
                $_SESSION['state']['nom'] = $nom;
                header("Location:/create/register");
            }else{
                $_SESSION['state']['type'] = 'entreprise';
                $_SESSION['state']['status'] = false;
                $_SESSION['state']['nom'] = $nom;
                header("Location:/create/register");
            }
        }
        $this->render('entreprises/register.tpl');
    }
}