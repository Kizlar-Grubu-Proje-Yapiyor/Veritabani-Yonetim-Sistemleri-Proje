<?php
session_start();

?>


<html>

<head>
    <title>

    </title>
</head>

<link rel="stylesheet" href="../giris/giris-css/giris-index.css">
<link rel="stylesheet" href="../nav/nav.css">



<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:wght@200&display=swap" rel="stylesheet">


<body>
    <?php 
          require'../nav/nav.php'
        ?>


    <div id="div-form2">
        <div id="form-baslik">
            <h3>Kayıt Ol</h3>
        </div>
        <form action="../kayit/kayit-ekle.php" method="POST">
           
            <label for="name" id="lname">İsim</label>
            <input type="name" name="name" id="name" placeholder="isim">
            
            
            <label for="lastname" id="llastname">Soyad</label>
            <input type="lastname" name="lastname" id="lastname" placeholder="Soyad">
            
            
            <label for="email" id="lemail">Email</label>
            <input type="email" name="email" id="email" placeholder="email">
            
            
            <label for="phone" id="lphone">Telefon Numarası</label>
            <input type="tel" id="phone" name="phone" placeholder="Telefon Numarası" pattern="[0-9]{4}-[0-9]{3}-[0-9]{4}">
           
            
            <label for="password" id="lpassword">Sifre</label>
            <input type="password" name="password" id="password" placeholder="şifre">
            
            <input type="submit" id="submit" value="Kayıt Ol">
            <?php

     ?>


        </form>





    </div>



</body>


</html>
