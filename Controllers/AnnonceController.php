<?php

namespace App\Controllers;

use App\Models\AnnonceModel;

class AnnonceController extends Controller{

    public function index(){

        $model = new AnnonceModel;
        $annonces = $model->findAll();
        return $this->render('annonces/index.tpl',compact('annonces'));
    }

    public function create(){
        $data = array(
            'titre' => 'avion',
            'description' => 'un avion',
            'actif' => '1'
        );
        $model = new AnnonceModel;
        $annonce = $model->hydrate($data);
        var_dump($annonce);
        $model->create($annonce);
    }

    public function update(int $actif, $ttr, $desc){
        $data = array(
            'titre' => $ttr,
            'description' => $desc,
            'actif' => $actif
        );
        $model = new AnnonceModel;
        $annonce = $model->hydrate($data);
        var_dump($annonce);
        $model->update($actif,$annonce);
    }

    public function lire($id){
        $model = new AnnonceModel;
        $annonce = $model->find($id);
        $this->render('annonces/lire.tpl', compact('annonce'));
    }
}