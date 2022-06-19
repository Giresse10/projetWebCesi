<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\AvisEntreprisesModel;
use App\Models\EntreprisesModel;
use App\Models\EntreprisesXLocalitesModel;
use App\Models\OffresDeStageModel;

class EntreprisesController extends Controller{
    public function index(){
        $entreprises = new EntreprisesModel;
        $exl = new EntreprisesXLocalitesModel;
        $avisModel = new AvisEntreprisesModel;
        $lstEnt = $entreprises->findEntiere();
        foreach ($lstEnt as $l){
            $l->moyenne = $avisModel->mean($l->id);
            $l->nb_etablissements = $exl->findHow($l->id)->nb;
        }
        $this->render('entreprises/index.tpl', compact('lstEnt'));
    }
    /**
     * register
     */
    public function register(){
        if(Form::validate($_POST, ['entreprise_nom','entreprise_secteur','entreprise_localite'])){
            $nom = strip_tags($_POST['entreprise_nom']);
            $idSecteur = strip_tags($_POST['entreprise_secteur']);
            $idLocalites = strip_tags($_POST['entreprise_localite']);
            $model = new EntreprisesModel;
            $entreprise = $model->hydrate(compact('nom','idSecteur'));
            $idEntreprises = $model->register();
            if($idEntreprises){
                $exl = new EntreprisesXLocalitesModel;
                $exl->hydrate(compact('idLocalites','idEntreprises'));
                $exl->create();
                $_SESSION['state']['type'] = 'entreprise';
                $_SESSION['state']['status'] = true;
                $_SESSION['state']['nom'] = $nom;
                header("Location:/create/register");
            }else{
                $_SESSION['state']['type'] = 'entreprise';
                $_SESSION['state']['status'] = false;
                $_SESSION['state']['nom'] = $nom;
                header("Location:/create/register");
            }
        }
        $this->render('entreprises/register.tpl');
    }
    /**
     * lire
     */
    public function lire($id = 0) {
        $model = new EntreprisesModel;
        $exl = new EntreprisesXLocalitesModel;
        $avisModel = new AvisEntreprisesModel;
        $offresModel = new OffresDeStageModel;
        $model->hydrate(compact('id'));
        $localites = $exl->findWhere($id);
        $entreprise = $model->findOne();
        $moyenne = $avisModel->mean($id);
        $avis = $avisModel->findNotice($id);
        $offres = $model->findItems();
        $this->render('entreprises/lire.tpl', compact('entreprise','localites','avis','moyenne','offres'));
    }

    /**
     * delete
     */
    public function delete(){
        if(Form::validate($_POST, ['entreprise'])){
            $id = strip_tags($_POST['entreprise']);
            $model = new EntreprisesModel;
            $model->hydrate(compact('id'));
            $model->remove();
        }
    }

    /**
     * evaler
     */
    public function evaluer(){
        if(Form::validate($_POST,['avis_note', 'eval_entreprise'])){
            $note = strip_tags($_POST['avis_note']);
            $commentaire = strip_tags($_POST['avis_text']??"");
            $idEntreprises = strip_tags($_POST['eval_entreprise']);
            $idUsers = $_SESSION['user']['id'];
            $model = new AvisEntreprisesModel;
            $model->hydrate(compact('note','commentaire','idEntreprises', 'idUsers'));
            var_dump($model);
            $model->rate();
        }
    }
    /**
     * edit gere la page de modification
     */
    public function edit($id){
        $entreprisesModel = new EntreprisesModel;
        $compet = new EntreprisesXlocalitesModel;
        $offre = $entreprisesModel->findOne($id);
        $competences = $competencesModel->findAll();
        $cp =$compet->findComp($id);
        $offre->competences = $cp;
        
        if(Form::validate($_POST,array('edit'))){
            $titre = strip_tags($_POST['titre']??$offre->titre);
            $description = strip_tags($_POST['description']??$offre->description);
            $comp = strip_tags($_POST['comp']??false);
            $nbPlaces = strip_tags($_POST['nbplaces']??$offre->nbPlaces);
            $date = strip_tags($_POST['date']??$offre->date);
            $duree = strip_tags($_POST['duree']??$offre->duree);
            $baseDeRemuneration = strip_tags($_POST['base']??$offre->baseDeRemuneration);
            $model = new OffresDeStageModel;
            $model = $model->hydrate(compact('titre','description','duree','baseDeRemuneration','date','nbPlaces'));
            $entreprisesModel->update($id,$model);
            //competences
            //conserver les competences
            $lstComptence = $comp?$comp:"";
            $lstComptence = explode(", ",$lstComptence);
            $competencesModel = new CompetencesModel;
            $offresXCompetencesModel = new OffresXCompetencesModel;
            if($comp){
                $offresXCompetencesModel->hydrate(['idOffresDeStage'=>$id]);
                $offresXCompetencesModel->remove();
            }
            foreach($lstComptence as $l){
                if($l!=""){
                $l = str_replace(',',"",$l);
                $competencesModel->hydrate(['nom' => $l]);
                $competencesModel->create();
                $idCompetences = $competencesModel->findBy(['nom' => $l])[0]->id;
                $idOffresDeStage = $id;
                $offresXCompetencesModel->hydrate(compact('idCompetences','idOffresDeStage'));
                $offresXCompetencesModel->create();}
            }
            http_response_code(301);
            header("Location:/offres-de-stage/lire/$id");
        }

        $this->render('entreprises/edit.tpl', compact('offre','competences'));
    }
}