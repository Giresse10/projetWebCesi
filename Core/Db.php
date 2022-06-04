<?php

namespace App\Core;

use PDO;
use PDOException;
class Db extends PDO{
    /** 
    *instance unique de la classe 
    */
    private static $instance;
    //info de connexion
    private const DBHOST = 'localhost';
    private const DBUSER = 'root';
    private const DBPASSWORD = '';
    private const DBNAME = 'projetWeb';

    /**
     * constructeur
     */
    private function __construct(){
        $_dsn = 'mysql:host='.self::DBHOST.';dbname='.self::DBNAME;
        try{
            parent::__construct($_dsn, self::DBUSER, self::DBPASSWORD);
            $this->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "self NAMES utf8");
            $this->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
        }catch(PDOException $e) {
            die($e->getMessage());
        }

    }

    static function getInstance():self
    {
        if(self::$instance === null){
            self::$instance = new self();
        }
        return self::$instance;
    }
}