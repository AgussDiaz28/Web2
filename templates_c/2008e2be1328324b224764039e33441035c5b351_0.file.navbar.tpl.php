<?php
/* Smarty version 3.1.30, created on 2017-09-04 23:58:44
  from "/Applications/MAMP/htdocs/projects/web2-P1/templates/navbar.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59adcc944115e6_92954565',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2008e2be1328324b224764039e33441035c5b351' => 
    array (
      0 => '/Applications/MAMP/htdocs/projects/web2-P1/templates/navbar.tpl',
      1 => 1504559545,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_59adcc944115e6_92954565 (Smarty_Internal_Template $_smarty_tpl) {
?>
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
            <li id="paquetes"><a>Paquetes</a></li>
            <li id="experiencias"><a>Experiencias</a></li>
            <li id="contacto"><a>Contacto</a></li>
         </ul>
      </div>
   </div>
</nav>
<?php }
}
