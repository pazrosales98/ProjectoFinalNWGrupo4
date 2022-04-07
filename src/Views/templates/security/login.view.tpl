<body background="https://www.10wallpaper.com/wallpaper/1920x1200/1606/Coffee_cup_saucer_close-up-High_Quality_HD_Wallpaper_1920x1200.jpg">


<section class="form-register">
  <form class=" ccuenta " method="post" action="index.php?page=sec_login">
    <section class="cc1">
      <h1 class="cc11">Iniciar Sesión</h1>
    </section>
  


    <section class="cc1">
      
      <div class="cc11">
        
        <label class="cc11" for="txtEmail">Correo Electrónico</label>
        
         <div class="cc11">
          <input class="cctexto" type="email" id="txtEmail" name="txtEmail" placeholder="Ingrese su Correo Electrónico" value="{{txtEmail}}" />
        </div>
        
        {{if errorEmail}}
        <div class="error col-14 py-2 col-m-7 offset-m-2">{{errorEmail}}</div>
        {{endif errorEmail}}

      </div>

      <div class="cc11">

        <label class="cc11" for="txtPswd">Contraseña</label>
        
        <div class="cc11">
          <input class="cctexto" type="password" id="txtPswd" name="txtPswd" placeholder="Ingrese su Contraseña" value="{{txtPswd}}" />
        </div>

        {{if errorPswd}}
        <div class="cc11">{{errorPswd}}</div>
        {{endif errorPswd}}

      </div>

      <div class="cc11">
        <button class="ccbtn" id="btnLogin" type="submit">Iniciar Sesión</button>
      </div>
      
    </section>
  </form>
</section>



	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <script src="https://kit.fontawesome.com/2c36e9b7b1.js"></script>