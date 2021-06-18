<?php

require'../kutuphane/kutuphane-veri-cekme.php'
?>


<!DOCTYPE>
<html>

<head>
    <meta charset="UTF-8">
    <title>

    </title>
    <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 85%;
 
}

td, th {
  border: 1px solid #a5a5a5;
  text-align: left;
  padding: 0px;
    
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<link rel="stylesheet" href="../nav/nav.css">
<link rel="stylesheet" href="../uye_panel/uye-index.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates&display=swap" rel="stylesheet">

<?php 
          require'../ortak_css/ortak-css.php'
        ?>

<body>

    <?php 
          require'../nav/nav.php'
        ?>

    <div id="uye-content">
        <div id="uye-bilgisi">
            <h1>Uye Bilgisi</h1>
            <div class="item">
               <p class="session-baslik">No: </p>

                 <?php echo $_SESSION['NO'] ?>
                 </div>
<div class="item">
                <p class="session-baslik">İsim: </p>

                 <?php echo $_SESSION['AD'] ?>

            </div>
            <div class="item">
                <p class="session-baslik">Soyisim:</p> <?php echo $_SESSION['SOYAD'] ?>
            </div>
            <div class="item">
                <p class="session-baslik">Email:</p> <?php echo $_SESSION['EMAIL'] ?>
            </div>


        </div>
        <div id="uye-islemleri">
          <table style="border:1px solid black;margin:50px;">
  <tr>
    <th><h3>Kitap ismi</h3></th>
    <th><h3>Kütüphane İsmi</h3></th>
    <th><h3>Teslim Tarihi</h3></th>
  </tr>
           <?php
     
    foreach( $emanetBilgiPre as $emanet)
    {
        
        $isbn = $emanet['isbn_no'];
        $kutuphane_no = $emanet['kutuphane_no'];
        
    $baslik_kitap_ismi = $db2->prepare('SELECT kitap_adi FROM kitaplar WHERE isbn_no = :isbn_no');
    $baslik_kitap_ismi -> execute([':isbn_no' => $isbn]);
    $baslik_kitap_ismi_sorgu = $baslik_kitap_ismi->fetchAll(PDO::FETCH_ASSOC);
        
    $prepareKitapKutup = $db2->prepare('SELECT kutuphane_adi FROM kutuphane WHERE kutuphane_no = :kutuphane_no');
    $prepareKitapKutup -> execute([':kutuphane_no' => $kutuphane_no]);
    $kitapKutupSorgu = $prepareKitapKutup->fetchAll(PDO::FETCH_ASSOC);
       
        echo '<tr>';
        echo '<th>';
        echo $baslik_kitap_ismi_sorgu[0]['kitap_adi'];
        echo '</th>';
        echo '<th>';
        echo $kitapKutupSorgu[0]['kutuphane_adi'];
        echo '</th>';
        echo '<th>';
        echo $emanet['teslim_tarihi'];
        echo '</th>';
        echo '</tr>';
    }
    ?>
            </table>
        </div>

    </div>

</body>

</html>
