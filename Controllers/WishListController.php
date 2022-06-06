<?php
namespace App\Controllers;

use App\Core\Form;
use App\Models\OffresDeStageModel;
use App\Models\WishListModel;

class WishListController extends Controller{
    public function like(){
        if(Form::validate($_POST,['event', 'offre', 'user'])){
            $event = strip_tags($_POST['event']);
            $idOffresDeStage = strip_tags($_POST['offre']);
            $idUsers = strip_tags($_POST['user']);
            $model = new WishListModel;
            if($event == 'like'){
                $model->hydrate(compact('idUsers','idOffresDeStage'));
                $var = $model->like();
            }elseif($event == 'unlike'){
                $model->hydrate(compact('idUsers','idOffresDeStage'));
                $var = $model->unLike();
            }

        }
    }

    public function index(){
        $wishlist = new WishListModel;
        $offresModel = new OffresDeStageModel;
        $offres = $offresModel->findEntiere();
        //liste des offres dans wishlist
        if(isset($_SESSION['user'])){
            foreach($offres as $o){
                $w = $wishlist->hydrate(['idOffresDeStage'=>$o->id, 'idUsers'=>$_SESSION['user']['id']]);
                $w = $wishlist->findSelfWishlist();
                $o->is_wishlist = $w;
            }
        }
        $this->render('wishlist/index.tpl', compact('offres'));
    }
}