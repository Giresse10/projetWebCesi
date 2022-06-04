<?php
namespace App\Controllers;

use App\Models\EntreprisesModel;

class EntreprisesController extends Controller{
    public function index(){
        $entreprises = new EntreprisesModel;
        $lstEnt = $entreprises->findAll();
        $this->render('entreprises/index.tpl', compact('lstEnt'));
    }
}