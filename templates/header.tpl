<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <title>{{$titulo}}</title>
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
                      {if ( isset($Admin)) && ($Admin != false)}
                          <li id="ciudades" class="admin"><a>Ciudades</a></li>
                          <li id="aerolineas" class="admin"><a>Aerolineas</a></li>
                          <li><a href="LogOut">Log Out</a></li>
                      {else}
                        <li id="LogIn"><a>Log In</a></li>
                      {/if}
               </ul>
            </div>
         </div>
      </nav>
