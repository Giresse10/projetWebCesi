<?php
namespace App\Controllers;

use App\Models\AvisEntreprisesModel;

class AvisEntreprisesController extends Controller{
    function index(){
        $model = new AvisEntreprisesModel;
        $avis = $model->findEntiere();
        $this->render('entreprises/entrepriseavis.tpl', compact('avis'));
    }
}