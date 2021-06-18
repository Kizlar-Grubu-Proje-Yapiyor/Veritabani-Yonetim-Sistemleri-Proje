<?php



$db = new PDO('mysql:host=localhost;dbname=kutuphanedb;charset=UTF8;', 'kgpy', 'sifresiz.Zor97');



    
    
    
$sorgu2 = $db->prepare('SELECT * FROM uyeler WHERE uye_eposta = :pemail AND uye_sifre = :ppassword');


$sorgu2 -> execute([':pemail' => $_POST['email'], ':ppassword' => $_POST['password']]);

$uye = $sorgu2->fetchAll(PDO::FETCH_ASSOC);


session_start();



 $_SESSION['AD'] = $uye[0]['uye_adi'];
 $_SESSION['SOYAD'] = $uye[0]['uye_soyadi']; 
$_SESSION['EMAIL'] = $uye[0]['uye_eposta'];
$_SESSION['NO'] = $uye[0]['uye_no'];



if(isset($_SESSION['AD'])){
  
   header("Location: ../uye_panel/index.php");
   die();

}
else if (isset($_POST['email']) || isset($_POST['password']) ){
   
    
    header("Location: index.php");
   die();
    
}

echo'<hr />';

   
 //echo $_SESSION['AD']; 
    









?>
