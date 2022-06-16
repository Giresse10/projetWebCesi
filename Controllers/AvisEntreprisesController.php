<?php
namespace App\Controllers;

class AvisEntreprisesController extends Controller{
    function index(){
        $this->render('entreprises/entrepriseavis.tpl');
    }
}