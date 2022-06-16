<?php
namespace App\Controllers;

use App\Models\CentreModel;
use App\Models\CompetencesModel;
use App\Models\EntreprisesModel;
use App\Models\FiliereModel;
use App\Models\StatusModel;
use App\Models\SecteursModel;
use App\Models\LocalitesModel;

class CreateController extends Controller {

    public function index() { 
        $centreModel = new CentreModel;
        $filiereModel = new FiliereModel;
        $statusModel = new StatusModel;
        $secteursModel = new SecteursModel;
        $localitesModel = new LocalitesModel;
        $entreprisesModel = new EntreprisesModel;
        $competencesModel = new CompetencesModel;
        //
        $centre = $centreModel->findAll();
        $competences = $competencesModel->findAll();
        $filiere = $filiereModel->findAll();
        $status = $statusModel->findAll();
        $secteurs = $secteursModel->findAll();
        $localites = $localitesModel->findAll();
        $entreprises = $entreprisesModel->findAll();
        return $this->render('create/index.tpl', compact('centre','filiere','status', 'secteurs','localites','entreprises', 'competences'));
    }

    function register(){
        $type = $_SESSION['state']['type'] ?? "";
        $nom = $_SESSION['state']['nom'] ?? "";
        $prenom = $_SESSION['state']['prenom'] ?? "";
        $email = $_SESSION['state']['email'] ?? "";
        $statut = $_SESSION['state']['statut'] ?? "";
        $password = $_SESSION['state']['password'] ?? "";
        $titre = $_SESSION['state']['titre'] ?? "";
        $description = $_SESSION['state']['description'] ?? "";
        $status = $_SESSION['state']['status'] ?? "";
        unset($_SESSION['state']);
        $this->render('create/register.tpl',
        compact('nom','status','type','titre' ,'description', 'password', 'email', 'statut', 'prenom'));
    }
}