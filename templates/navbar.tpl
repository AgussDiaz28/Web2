<ul class="nav navbar-nav">
   <li class="active" id="home"><a>Home</a></li>
   <li id="vuelos"><a>Vuelos</a></li>
       {if ( isset($Usser)) && ($Usser != FALSE)}
           <li id="ciudades" class="admin"><a>Ciudades</a></li>
           <li id="aerolineas" class="admin"><a>Aerolineas</a></li>
           <li><a href="LogOut">Log Out</a></li>
       {else}
         <li id="LogIn"><a>Log In</a></li>
       {/if}
</ul>
