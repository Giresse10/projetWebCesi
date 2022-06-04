<?php
namespace App\Controllers;

use App\Models\OffresDeStageModel;

class OffresDeStageController extends Controller {

    public function index() {
        $offresModel = new OffresDeStageModel;
        $offres = $offresModel->findAll();
        $this->render('offres/index.tpl', compact('offres'));
    }

    public function lire() {
        $this->render('offres/lire.tpl');
    }
}