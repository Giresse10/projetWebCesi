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
            $localite = strip_tags($_POST['entreprise_localite']);
            $model = new EntreprisesModel;
            $entreprise = $model->hydrate(compact('nom','idSecteur'));
            var_dump($entreprise);
        }
        $this->render('entreprises/register.tpl');
    }
}