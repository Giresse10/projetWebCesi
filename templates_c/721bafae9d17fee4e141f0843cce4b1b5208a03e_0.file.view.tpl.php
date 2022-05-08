<?php
/* Smarty version 3.1.39, created on 2022-05-08 16:35:35
  from 'C:\wamp64\www\Web\projet\views\view.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.39',
  'unifunc' => 'content_6277f1573c9f28_55016539',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '721bafae9d17fee4e141f0843cce4b1b5208a03e' => 
    array (
      0 => 'C:\\wamp64\\www\\Web\\projet\\views\\view.tpl',
      1 => 1652027727,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6277f1573c9f28_55016539 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body> 
    <?php ob_start();
if (!(isset($_SESSION['status']))) {
$_prefixVariable1 = ob_get_clean();
echo $_prefixVariable1;?>

    <div class="login">
        <p>connexion</p>
    </div>
    <?php ob_start();
} else {
$_prefixVariable2 = ob_get_clean();
echo $_prefixVariable2;?>

    <?php ob_start();
}
$_prefixVariable3 = ob_get_clean();
echo $_prefixVariable3;?>

</body>
</html><?php }
}
