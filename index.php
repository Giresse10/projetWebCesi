<?php
  session_start();
  require_once "configs/ini.config.php";
  require_once "./models/model.php";
  require_once "./controllers/controller.php";
  $smarty->display("views/view.tpl");
