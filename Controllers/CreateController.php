<?php
namespace App\Controllers;

use App\Models\CentreModel;
use App\Models\FiliereModel;
use App\Models\StatusModel;

class CreateController extends Controller {

    public function index() { 
        $centreModel = new CentreModel;
        $filiereModel = new FiliereModel;
        $statusModel = new StatusModel;
        //
        $centre = $centreModel->findAll();
        $filiere = $filiereModel->findAll();
        $status = $statusModel->findAll();
        return $this->render('create/index.tpl', compact('centre','filiere','status'));
    }
}