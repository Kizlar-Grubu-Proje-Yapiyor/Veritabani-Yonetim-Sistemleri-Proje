<?php 
session_start();

$db4 = new PDO('mysql:host=localhost;dbname=kutuphanedb;charset=UTF8;','kgpy','sifresiz.Zor97');




$sorgu4 = $db4 -> prepare('SELECT * FROM uyeler WHERE uye_eposta = :pKayitEmail');

$sorgu4 -> execute([':pKayitEmail' => $_POST['email']]);

$kayitUye = $sorgu4->fetchAll(PDO::FETCH_ASSOC);

if(!isset($kayitUye['uye_eposta']))
{
 $kayit_ekle = $db4 -> prepare('INSERT INTO uyeler (uye_adi, uye_soyadi,uye_tel_no, uye_eposta, uye_sifre) VALUES (:pKayitAd,:pKayitSoyad,:pKayitTel,:pKayitEmail,:pKayitSifre)');
    
$kayit_ekle -> execute([':pKayitEmail' => $_POST['email'],':pKayitAd' =>$_POST['name'] ,':pKayitSoyad' => $_POST['lastname'], ':pKayitSifre' => $_POST['password'],':pKayitTel' => $_POST['phone']]);
    
    header("Location: ../giris/index.php");
   die();
    
    
}








?>
