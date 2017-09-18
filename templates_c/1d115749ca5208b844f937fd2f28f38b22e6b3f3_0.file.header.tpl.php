<?php
/* Smarty version 3.1.30, created on 2017-09-18 20:46:52
  from "/Applications/MAMP/htdocs/projects/web2-P1/templates/header.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59c0149cd9c6f2_50620435',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1d115749ca5208b844f937fd2f28f38b22e6b3f3' => 
    array (
      0 => '/Applications/MAMP/htdocs/projects/web2-P1/templates/header.tpl',
      1 => 1505599965,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59c0149cd9c6f2_50620435 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <title><?php ob_start();
echo $_smarty_tpl->tpl_vars['titulo']->value;
$_prefixVariable1=ob_get_clean();
echo $_prefixVariable1;?>
</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="css/style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
      <!-- Agustin Diaz Gargiulo  - Nicolas Strella 2017 -->
   </head>

   <body>

      <header class="container-fluid">
         <div class="row">
            <img class="cover" src="images/cover.jpg" alt="cover">
         </div>
      </header>

      <nav class="navbar navbar-inverse">
         <div class="container-fluid">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
               <a class="navbar-brand"></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
               <ul class="nav navbar-nav">
                  <li class="active" id="home"><a>Home</a></li>
                  <li id="vuelos"><a>Vuelos</a></li>
                  <li id="admin"><a>Admin</a></li>
               </ul>
            </div>
         </div>
      </nav>
<?php }
}
