<?php

namespace App\Controllers;

use App\Core\Form;

class SearchController extends Controller{

    public function index(){
        if(Form::validate($_GET, ['q'])){
            
        }
        return $this->render('search/index.tpl', ['q'=>$_GET['q'] ?? ""]);
    }
}