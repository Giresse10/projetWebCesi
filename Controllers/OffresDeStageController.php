<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\EntreprisesXLocalitesModel;
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

    public function register(){
        if(Form::validate($_POST,
        ['offre_titre', 'offre_description','offre_entreprise', 'offre_duree','offre_date','offre_baseDeRemuneration','offre_nbPlaces']))
        {
            //recuperer les donnees
            $titre = strip_tags($_POST['offre_titre']);
            $description = strip_tags($_POST['offre_description']);
            $idLocalite = 0;
            $idEntreprises = strip_tags($_POST['offre_entreprise']);
            $duree = strip_tags($_POST['offre_duree']);
            $baseDeRemuneration = strip_tags($_POST['offre_baseDeRemuneration']);
            $date = strip_tags($_POST['offre_date']);
            $nbPlaces = strip_tags($_POST['offre_nbPlaces']);
            //inserer les donnees dans un model
            $model = new OffresDeStageModel;
            $model->hydrate(compact('titre','description','idLocalite','idEntreprises','duree','baseDeRemuneration','date','nbPlaces'));
            //$model->create();
            //obtenire la/les localite(s)
            $modelLocalite = new EntreprisesXLocalitesModel;
            $localites = $modelLocalite->findWhere($idEntreprises);
            // formulaire de choix de la localite
            $form = new Form;
            $form->startForm('POST','entreprises/register');
            $form->addLabel("Choisir une localité de l'entreprise",'',['class' => 'form-label']);
            var_dump($localites);
            foreach ($localites as $l){
                $form->beginBlock(['class'=>"form-check mx-5"]);
                $form->addInput('radio',"$l->idLocalites",['name'=>'offre_localite','class'=>'form-check-input','id'=>"idLocalite-$l->idLocalites"]);
                $form->addLabel("$l->nom","idLocalite-$l->idLocalites", ['class'=>'form-check-label']);
                $form->endBlock();
            }
            $form->endForm();
            $f = $form->create();
        }else{
            $f = "";
        }
        $this->render('offres/register.tpl',compact('f','model'));
    }
}