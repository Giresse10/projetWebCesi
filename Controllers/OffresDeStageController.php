<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\AvisEntreprisesModel;
use App\Models\CandidaturesModel;
use App\Models\CompetencesModel;
use App\Models\EntreprisesXLocalitesModel;
use App\Models\OffresDeStageModel;
use App\Models\OffresXCompetencesModel;
use App\Models\WishListModel;

class OffresDeStageController extends Controller {

    public function index($p = 0) {
        //get pour la Pagination
        $_GET['page'] = $p;
        $wishlist = new WishListModel;
        $candidature = new CandidaturesModel;
        $offresModel = new OffresDeStageModel;
        $avisModel = new AvisEntreprisesModel;
        $offres = $offresModel->findFrom($p*5);
        $nbOffres = $offresModel->lines();
        //liste des offres dans wishlist
        if(isset($_SESSION['user'])){
            foreach($offres as $o){
                $w = $wishlist->hydrate(['idOffresDeStage'=>$o->id, 'idUsers'=>$_SESSION['user']['id']]);
                $w = $wishlist->findSelfWishlist();
                $c = $candidature->hydrate(['idOffresDeStage'=>$o->id, 'idUser'=>$_SESSION['user']['id']]);
                $c = $candidature->findSelfApply();
                $moyenne = $avisModel->mean($o->idEntreprise);
                $o->is_wishlist = $w;
                $o->is_apply = $c;
                $o->moyenne = $moyenne;
            }
        }
        $this->render('offres/index.tpl', compact('offres','nbOffres'));
    }

    public function lire($id = 0) {
        $offresModel = new OffresDeStageModel;
        $candidature = new CandidaturesModel;
        $compet = new OffresXCompetencesModel;
        $avisModel = new AvisEntreprisesModel;
        $offre = $offresModel->findOne($id);
        $avis = $avisModel->findNotice($offre->idEntreprise);
        $moyenne = $avisModel->mean($offre->idEntreprise);
        $c = $candidature->hydrate(['idOffresDeStage'=>$offre->id, 'idUser'=>$_SESSION['user']['id']]);
        $c = $candidature->findSelfApply();
        $cp =$compet->findComp($id);
        $offre->is_apply = $c;
        $offre->competences = $cp;
        $this->render('offres/lire.tpl', compact('offre', 'moyenne', 'avis'));
    }
    /**
     * Register
     */
    public function register(){

        $f = '';

        if(Form::validate($_POST,
        ['offre_titre', 'offre_description','offre_entreprise', 'offre_duree','offre_date','offre_baseDeRemuneration','offre_nbPlaces']))
        {
            //recuperer les donnees
            $titre = strip_tags($_POST['offre_titre']);
            $description = strip_tags($_POST['offre_description']);
            $idEntreprise = strip_tags($_POST['offre_entreprise']);
            $duree = strip_tags($_POST['offre_duree']);
            $baseDeRemuneration = strip_tags($_POST['offre_baseDeRemuneration']);
            $date = strip_tags($_POST['offre_date']);
            $nbPlaces = strip_tags($_POST['offre_nbPlaces']);
            //recuperer competences (trop compliquer)
            $lstComptence = strip_tags($_POST['offre_comp']);
            $lstComptence = explode(", ",$lstComptence);
            //inserer les donnees dans un model
            $model = new OffresDeStageModel;
            $model->hydrate(compact('titre','description','idEntreprise','duree','baseDeRemuneration','date','nbPlaces'));
            //obtenire la/les localite(s)
            $modelLocalite = new EntreprisesXLocalitesModel;
            $localites = $modelLocalite->findWhere($idEntreprise);
            // formulaire de choix de la localite
            $form = new Form;
            $form->startForm('POST','');
            if(count($localites)>=2){
                $form->addLabel("Choisir une localité de l'entreprise",'',['class' => 'form-label']);
                $data = compact('titre','description','idEntreprise','duree','baseDeRemuneration','date','nbPlaces');
                foreach($data as $k => $v){
                    $form->addInput('hidden',"$v",['name' => $k]);
                }
                foreach ($localites as $l){
                    $form->beginBlock(['class'=>"form-check"]);
                    $form->addInput('radio',"$l->idLocalites",['name'=>'offre_localite','class'=>'form-check-input','id'=>"idLocalite-$l->idLocalites"]);
                    $form->addLabel("$l->nom","idLocalite-$l->idLocalites", ['class'=>'form-check-label']);
                    $form->endBlock();
                }
                $form->addInput('submit','valider',['class'=>'btn btn-primary mt-2']);
                $form->endForm();
                $f = $form->create();
            }else{
                $idLocalite = $localites[0]->idLocalites;
                $model->hydrate(compact('titre','description','idLocalite','idEntreprise','duree','baseDeRemuneration','date','nbPlaces'));
                if($model->register()){
                    $_SESSION['state']['type'] = 'offre';
                    $_SESSION['state']['titre'] = $titre;
                    $_SESSION['state']['description'] = $description;
                    $_SESSION['state']['status'] = true;
                    header('Location:/create/register');
                    //conserver les competences
                    $competencesModel = new CompetencesModel;
                    $offresXCompetencesModel = new OffresXCompetencesModel;
                    foreach($lstComptence as $l){
                        $competencesModel->hydrate(['nom' => $l]);
                        $competencesModel->create();
                        $idCompetences = $competencesModel->findBy(['nom' => $l])[0]->id;
                        $idOffresDeStage = $model->findBy(compact('titre','description','idLocalite','idEntreprise','duree','baseDeRemuneration','date','nbPlaces'))[0]->id;
                        $offresXCompetencesModel->hydrate(compact('idCompetences','idOffresDeStage'));
                        $offresXCompetencesModel->create();
                    }
                }else{
                    $_SESSION['state']['type'] = 'offre';
                    $_SESSION['state']['titre'] = $titre;
                    $_SESSION['state']['description'] = $description;
                    $_SESSION['state']['status'] = false;
                    header('Location:/create/register');
                }
            }
        }
        if(Form::validate($_POST, ['titre','description','idEntreprise','duree','baseDeRemuneration','date','nbPlaces','offre_localite'])){
             //recuperer les donnees
             $idLocalite = strip_tags($_POST['offre_localite']);
             $titre = ucfirst(strip_tags($_POST['titre']));
             $description = ucfirst(strip_tags($_POST['description']));
             $idEntreprise = strip_tags($_POST['idEntreprise']);
             $duree = strip_tags($_POST['duree']);
             $baseDeRemuneration = strip_tags($_POST['baseDeRemuneration']);
             $date = strip_tags($_POST['date']);
             $nbPlaces = strip_tags($_POST['nbPlaces']);
            //inserer les donnees dans un model
            $model = new OffresDeStageModel;
            $model->hydrate(compact('titre','description','idLocalite','idEntreprise','duree','baseDeRemuneration','date','nbPlaces'));
            if($model->register()){
                $_SESSION['state']['type'] = 'offre';
                $_SESSION['state']['titre'] = $titre;
                $_SESSION['state']['description'] = $description;
                $_SESSION['state']['status'] = true;
                header('Location:/create/register');
                //conserver les competences
                $competencesModel = new CompetencesModel;
                foreach($lstComptence as $l){
                    $competencesModel->hydrate(['nom' => $l]);
                    $competencesModel->create();
                    $idCompetences = $competencesModel->findBy(['nom' => $l])[0]->id;
                    $idOffresDeStage = $model->findBy(compact('titre','description','idLocalite','idEntreprise','duree','baseDeRemuneration','date','nbPlaces'))[0]->id;
                    $offresXCompetencesModel->hydrate(compact('idCompetences','idOffresDeStage'));
                    $offresXCompetencesModel->create();
                }
            }else{
                $_SESSION['state']['type'] = 'offre';
                $_SESSION['state']['titre'] = $titre;
                $_SESSION['state']['description'] = $description;
                $_SESSION['state']['status'] = false;
                header('Location:/create/register');
            }
        }
        
        $this->render('offres/register.tpl',compact('f'));
    }
    /**
     * edit
     */
    public function edit($id){
        $offresModel = new OffresDeStageModel;
        $competencesModel = new CompetencesModel;
        $compet = new OffresXCompetencesModel;
        $offre = $offresModel->findOne($id);
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
            $offresModel->update($id,$model);
            http_response_code(301);
            header("Location:/offres-de-stage/lire/$id");
        }

        $this->render('offres/edit.tpl', compact('offre','competences'));
    }
    /**
     * apply
     */
    public function apply($id){
        $offresModel = new OffresDeStageModel;
        $offre = $offresModel->findOne($id);

        if(Form::validate($_POST,['postuler_offre', 'postuler_cv', 'postuler_lm'])){
            var_dump($_POST);
            $idUser = $_SESSION['user']['id'];
            $idOffresDeStage = strip_tags($_POST['postuler_offre']);
            $cvData = file_get_contents($_FILES['postuler_cv']['tmp_name']);
            
            $cvTitre = $_FILES['postuler_cv']['name'];
            $lm = strip_tags($_POST['postuler_lm']);

            $candidature = new CandidaturesModel;
            $candidature->hydrate(compact('idOffresDeStage', 'cvData', 'cvTitre', 'idUser'));
            if($lm == 1)
                $done = $candidature->save();
            if($lm == 2){
                $lmData = file_get_contents($_FILES['postuler_lm_fichier']['tmp_name']);
                $lmTitre = $_FILES['postuler_lm_fichier']['name'];
                $candidature->hydrate(compact('lmData', 'lmTitre'));
                $done = $candidature->save();
                var_dump($done);
            }
            if($lm == 3){
                $lmText = strip_tags($_POST['postuler_lm_rediger']);
                $candidature->hydrate(compact('lmText'));
                $done = $candidature->save();
            }
            $_POST = array();
            //var_dump($candidature);
            header("Location:/offres-de-stage/lire/$id");
        }

        $this->render('offres/apply.tpl', compact('offre'));
    }
    /**
     * delete
     */
    public function delete(){
        if(Form::validate($_POST, ['offre'])){
            $id = strip_tags($_POST['offre']);
            $model = new OffresDeStageModel;
            $model->hydrate(compact('id'));
            $model->remove();
        }
    }
}