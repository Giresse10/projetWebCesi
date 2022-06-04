<?php
namespace App\Core;

require_once(ROOT.'/Core/libs/Smarty.class.php');

use Smarty;

class SmartySingleton extends Smarty{
    static private $instance;

    function __construct(){
        
        parent::__construct();
        $this->setTemplateDir(ROOT.'/templates/');
        $this->setCompileDir(ROOT.'/templates_c/');
        $this->setConfigDir(ROOT.'/configs/');
        $this->setCacheDir(ROOT.'/cache/');
    }

    static function getInstance(){
        if(self::$instance === null){
            self::$instance = new self;
        }
        return self::$instance;
    }
}