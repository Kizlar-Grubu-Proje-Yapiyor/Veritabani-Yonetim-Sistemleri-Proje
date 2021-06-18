<?php

require'kutuphane-veri-cekme.php'
 

?>


<!DOCTYPE>
<html>

<head>
    <meta charset="UTF-8">
    <title>

    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    
    <script>
        $(function() {
            $("#accordion").accordion();
        });
        
      $( function() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
            
          $( this ).dialog( "close" );
            
        }
      }
    });
  } );
        
    
  

    </script>
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
        
        
     <?php 
      if($_SESSION['ALINAMAZ']==1)
      {
          echo '<div style="background-color:#ff1b4f" id="dialog-message" title="Size ödünç kitap veremiyoruz ">
  <p>
    <span style="background-color:#f5ff04" class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
    Ödünç Almış olduğunuz kitap sayısı belirlenen sınırı geçmiştir.
  </p>
  <p>
    Ödünç alma hakkı <b>3 kitap ile sınırlıdır </b>.
  </p>
</div>';
         $_SESSION['ALINAMAZ']=0 ;
      }
    elseif($_SESSION['ALINAMAZ']==0){
        
    }
?>


    <h1 style="text-align:center;color:white">Kütühaneler ve Kitapları</h1>

    <div style="margin:50px;" id="accordion">

        <?php 
    $lenght = count($kutuphaneSorgu);
    $i=0;
    /////////////////////  WHİLE 
    while ($lenght)
    {
        
    echo '<h3>'; 
    echo  $kutuphaneSorgu[$i]['kutuphane_adi'];
     echo ' </h3>';
          echo '<div>';
        echo '<p>Kitap Seçin Lütfen</p>';
        echo '<ul>';
         $prepareKitapKutup = $db2->prepare('SELECT isbn_no FROM kutuphane_kitap WHERE kutuphane_no = :kutuphane_no AND adet>0');
    $prepareKitapKutup -> execute([':kutuphane_no' => $kutuphaneSorgu[$i]['kutuphane_no']]);
    $kitapKutupSorgu = $prepareKitapKutup->fetchAll(PDO::FETCH_ASSOC);
        
       echo ' <div class="container mt-3">';
        
        echo'<form action="kutuphane-veri-ekleme.php" method="POST" >';
        /*echo '<select name="kutuphaneBilgi" class="custom-select-lg">';
        echo '<option value="';
        echo $kutuphaneSorgu[$i]['kutuphane_no'];
        echo 'selected></option></select>';*/
      
    echo '<select class="custom-select custom-select-sm mb-3" name="kitap">';
        //echo '<option selected >Kitapları görmek için tıklayınız</option>';
        /////////////////////// FOREACH 
    foreach($kitapKutupSorgu as $isbn_no)
    {
    
    $baslik_kitap_ismi = $db2->prepare('SELECT kitap_adi FROM kitaplar WHERE isbn_no = :isbn_no');
    $baslik_kitap_ismi -> execute([':isbn_no' => $isbn_no['isbn_no']]);
    $baslik_kitap_ismi_sorgu = $baslik_kitap_ismi->fetchAll(PDO::FETCH_ASSOC);
    
        //echo '<form action="kutuphane-veri-ekleme.php" method="post">';
        //////////////////////////////// FOREACH
        foreach($baslik_kitap_ismi_sorgu as $sirali_kitap_ismi)
        {
          
            echo '<option value="';
            echo $isbn_no['isbn_no'];
            echo '">';
            echo $sirali_kitap_ismi['kitap_adi'];
            echo '</option>';
            
           
            
           /* echo '<li>';
            
            echo '<input type="checkbox" id="';
             echo $sirali_kitap_ismi['kitap_adi'];
            echo '" name="';
            echo $sirali_kitap_ismi['kitap_adi'];
            echo '" value="">';
            echo '<label for="';
            echo $sirali_kitap_ismi['kitap_adi'];
            echo '">';
            echo $sirali_kitap_ismi['kitap_adi'];
            echo '</label><br>';*/
        
         /*echo ' </p><button style="width:250px;height:25px;" onclick="">';
         echo $sirali_kitap_ismi['kitap_adi'];*/
            
            
            
            
         //echo '</li>';
            
        /*echo '<li>';
        
         echo ' </p><button style="width:250px;height:25px;" onclick="">';
         echo $sirali_kitap_ismi['kitap_adi'];
         echo '</button></li>';*/
    
 
        }
          //echo '<input type="submit" value="Emanet Al"></form>';
    }
        
        echo '</select>';
        echo '<select style="display:none;" name="kutuphaneBilgi" class="custom-select-sm">';
        echo '<option value="';
        echo $kutuphaneSorgu[$i]['kutuphane_no'];
        echo '"selected></option></select>';
       
        echo ' <input type="submit" value="Ödünç Al">';
        echo '</form>';
        
        $lenght -= 1;
      $i += 1; 
        //echo '<input type="submit" value="Ödünç Al"></form>';
        echo '</ul>';
        echo '</div>';
    }
    
    
                  
    ?>


    </div>










</body>
<script>
    function insert_Data(var isbn_no,
        var kutuphane_no) {

        <?php
        
        $alinan_gun = date("m.d.y");
        $no = $_SESSION['NO'];
        $db2->query('INSERT INTO emanet (kutuphane_no, uye_no, isbn_no, alim_tarihi) VALUES (kutuphane_no,$no,isbn_no,$alinan_gun)');
        ?>
    }

</script>

</html>
