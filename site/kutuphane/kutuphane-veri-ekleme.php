<?php
session_start();
$_SESSION['ALINAMAZ'] = 0;
$db3 = new PDO('mysql:host=localhost;dbname=kutuphanedb;charset=UTF8;', 'kgpy', 'sifresiz.Zor97');
/*echo $_POST['kitap'];
echo $_POST['kutuphaneBilgi'];*/
$emanetKitapAdet = $db3->prepare('SELECT uye_no FROM emanet WHERE uye_no = :pno  ');
$emanetKitapAdet -> execute([':pno' => $_SESSION['NO']] );
$kitapEmanetSorgu = $emanetKitapAdet->fetchAll(PDO::FETCH_ASSOC);

if(count($kitapEmanetSorgu)<3)
{
$alinan_gun = date("Y-m-d");
$teslim_tarihi = strtotime("+15 Day");
$teslim_tarihi=date("Y-m-d",$teslim_tarihi);


$veri_ekle = $db3->prepare('INSERT INTO emanet (kutuphane_no, uye_no, isbn_no, alim_tarihi,teslim_tarihi) VALUES (:pkutuphaneBilgi,:pno,:pkitap,:palimTarihi,:pteslimTarihi)');

$veri_ekle -> execute([':pkutuphaneBilgi' => $_POST['kutuphaneBilgi'], ':pkitap' => $_POST['kitap'], ':pno' => $_SESSION['NO'] , ':palimTarihi' => $alinan_gun, ':pteslimTarihi' => $teslim_tarihi]);

$prepareKitapKutup = $db3->prepare('SELECT adet FROM kutuphane_kitap WHERE isbn_no = :isbn AND kutuphane_no = :pkutuphaneBilgi  ');
$prepareKitapKutup -> execute([':isbn' => $_POST['kitap'] ,':pkutuphaneBilgi' => $_POST['kutuphaneBilgi']] );
$kitapKutupSorgu = $prepareKitapKutup->fetchAll(PDO::FETCH_ASSOC);

$kitapUpdateAdet = $kitapKutupSorgu[0]['adet']-1;
$updateKitapAdet = $db3-> prepare ('UPDATE kutuphane_kitap SET adet = :padetUpdate WHERE isbn_no = :pisbn AND kutuphane_no = :pkutuphaneBilgi');
$updateKitapAdet -> execute([':pisbn' => $_POST['kitap'] ,':pkutuphaneBilgi' => $_POST['kutuphaneBilgi'], ':padetUpdate' =>$kitapUpdateAdet ]);
    
    header("Location: ../uye_panel/index.php");
   die();
}
else
    $_SESSION['ALINAMAZ'] = 1;
    header("Location: kutuphane.php");
   die();

    

?>
