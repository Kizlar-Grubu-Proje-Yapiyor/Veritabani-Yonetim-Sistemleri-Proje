<?php
session_start();
$_SESSION['ALINAMAZ'];
$db2 = new PDO('mysql:host=localhost;dbname=kutuphanedb;charset=UTF8;', 'kgpy', 'sifresiz.Zor97');
$queryKutuphane = $db2->query('SELECT * FROM kutuphane');
$kutuphaneSorgu = $queryKutuphane->fetchAll(PDO::FETCH_ASSOC);


$queryKitap = $db2->query('SELECT * FROM kitaplar');
$kitapSorgu = $queryKitap->fetchAll(PDO::FETCH_ASSOC);


$queryKitapKutup = $db2->query('SELECT * FROM kutuphane_kitap');
$kitapKutupSorgu = $queryKitapKutup->fetchAll(PDO::FETCH_ASSOC);

$emanetBilgi = $db2->prepare('SELECT * FROM emanet WHERE uye_no = :pno ');
$emanetBilgi -> execute([':pno' => $_SESSION['NO']]);
$emanetBilgiPre = $emanetBilgi->fetchAll(PDO::FETCH_ASSOC);





?>
