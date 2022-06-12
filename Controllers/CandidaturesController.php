<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\CandidaturesModel;
use App\Models\OffresDeStageModel;

class CandidaturesController extends Controller{

    public function index(){
        $candidature = new CandidaturesModel;
        $offresModel = new OffresDeStageModel;
        $offres = $offresModel->findEntiere();
        //liste des offres dans wishlist
        if(isset($_SESSION['user'])){
            foreach($offres as $o){
                $c = $candidature->hydrate(['idOffresDeStage'=>$o->id, 'idUser'=>$_SESSION['user']['id']]);
                $c = $candidature->findSelfApply();
                $o->is_apply = $c;
            }
        }
        $this->render('candidatures/index.tpl', compact('offres'));
    }
}