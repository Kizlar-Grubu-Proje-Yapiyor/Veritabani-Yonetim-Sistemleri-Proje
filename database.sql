-- Script daha onceden calistirildi ise kalintilarini temizler
DROP DATABASE IF EXISTS kutuphanedb;
DROP TABLE IF EXISTS kutuphanedb.adresler, kutuphanedb.kutuphane, kutuphanedb.uyeler, kutuphanedb.kitaplar, kutuphanedb.yazarlar, kutuphanedb.kategoriler, kutuphanedb.emanet, kutuphanedb.kitap_kategori, kutuphanedb.kitap_yazar, kutuphanedb.kutuphane_kitap;
DROP USER IF EXISTS kgpy;


-- Database'i olusturur
CREATE DATABASE IF NOT EXISTS kutuphanedb;


-- Database icindeki tablolari olusturur
CREATE TABLE IF NOT EXISTS kutuphanedb.adresler (
	adres_no INT NOT NULL AUTO_INCREMENT,
	adres VARCHAR(100),
	PRIMARY KEY (adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kutuphane (
	kutuphane_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_adi VARCHAR(100),
	adres_no INT,
	PRIMARY KEY (kutuphane_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.uyeler (
	uye_no INT NOT NULL AUTO_INCREMENT,
	uye_adi VARCHAR(20),
	uye_soyadi VARCHAR(20),
	uye_tel_no VARCHAR(13),
	uye_eposta VARCHAR(50),
	uye_sifre VARCHAR(20),
	adres_no INT,
	PRIMARY KEY (uye_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitaplar (
	isbn_no VARCHAR(17),
	kitap_adi VARCHAR(25),
	yayin_evi VARCHAR(25),
	kitap_kategori_no INT,
	PRIMARY KEY (isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.yazarlar (
	yazar_no INT NOT NULL AUTO_INCREMENT,
	yazar_adi VARCHAR(20),
	yazar_soyadi VARCHAR(20),
	PRIMARY KEY (yazar_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kategoriler (
	kategori_no INT NOT NULL AUTO_INCREMENT,
	kategori_ismi VARCHAR(30),
	PRIMARY KEY (kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.emanet (
	emanet_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_no INT,
	uye_no INT,
	isbn_no VARCHAR(17),
	alim_tarihi DATE,
	teslim_tarihi DATE,
	PRIMARY KEY (emanet_no),
	FOREIGN KEY (kutuphane_no) REFERENCES kutuphanedb.kutuphane(kutuphane_no),
	FOREIGN KEY (uye_no) REFERENCES kutuphanedb.uyeler(uye_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_kategori (
	kitap_kategori_no INT NOT NULL AUTO_INCREMENT,
	isbn_no VARCHAR(17),
	kategori_no INT,
	PRIMARY KEY (kitap_kategori_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (kategori_no) REFERENCES kutuphanedb.kategoriler(kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_yazar (
	kitap_yazar_no INT NOT NULL AUTO_INCREMENT,
	isbn_no VARCHAR(17),
	yazar_no INT,
	PRIMARY KEY (kitap_yazar_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (yazar_no) REFERENCES kutuphanedb.yazarlar(yazar_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kutuphane_kitap (
	kutuphane_kitap_no INT NOT NULL AUTO_INCREMENT,
	kutuphane_no INT,
	isbn_no VARCHAR(17),
	adet INT,
	PRIMARY KEY (kutuphane_kitap_no),
	FOREIGN KEY (kutuphane_no) REFERENCES kutuphanedb.kutuphane(kutuphane_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no)
);


-- Database'e ontanimli degerleri ekler
USE kutuphanedb;

-- Kutuphaneler
INSERT INTO kutuphanedb.adresler (adres) VALUES ("Atatürk Cad. Kurtoğlu Mah. No:1 16360 Yıldırım/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Şehir Kütüphanesi", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("Emniyet Cad. Mimarsinan Mh. No:2 Yıldırım/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("İbrahim Paşa Mah. Kız Okulu Cad. Osmangazi/Bursa");
INSERT INTO kutuphanedb.kutuphane (kutuphane_adi, adres_no) VALUES ("Şehbenderler Konağı Kütüphanesi", LAST_INSERT_ID());

-- Uyeler
INSERT INTO kutuphanedb.adresler (adres) VALUES ("Bir Mah. Birbir Cad. Osmangazi/Bursa");
INSERT INTO kutuphanedb.uyeler (uye_adi, uye_soyadi, uye_tel_no, uye_eposta, uye_sifre, adres_no) VALUES ("Ahmet", "Demir", "+905058559624", "ahmetdemir@email.com", "cokzorsifre", LAST_INSERT_ID());

INSERT INTO kutuphanedb.adresler (adres) VALUES ("İki Mah. İkiiki Cad. Yıldırım/Bursa");
INSERT INTO kutuphanedb.uyeler (uye_adi, uye_soyadi, uye_tel_no, uye_eposta, uye_sifre, adres_no) VALUES ("Mehmet", "Gümüş", "+905557889452", "mehmetgumus@email.com", "fantailekola", LAST_INSERT_ID());

-- Kitaplar
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi, kitap_kategori_no) VALUES ("978-975-08-0001-X", "Kuyucaklı Yusuf", "Yapı Kredi Yayınları", 1);
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi, kitap_kategori_no) VALUES ("978-975-363-802-7", "Kürk Mantolu Madonna", "Yapı Kredi Yayınları", 1);

-- Yazarlar
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Sabahattin", "Ali");

-- Kategoriler
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Türk ve Dünya Klasikleri");

-- Emanet
INSERT INTO kutuphanedb.emanet (kutuphane_no, uye_no, isbn_no, alim_tarihi) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş"), "978-975-363-802-7", "2021-05-13");
UPDATE kutuphanedb.emanet SET teslim_tarihi = "2021-05-14" WHERE uye_no = (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş");

-- Kitap - kategori
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-08-0001-X", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-363-802-7", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));

-- Kitap - yazar
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-08-0001-X", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-363-802-7", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));

-- Kutuphane - kitap
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-08-0001-X", 10);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-363-802-7", 2);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "978-975-08-0001-X", 30);


-- Kullanici olusturup tum haklari ona verir
CREATE USER 'kgpy'@'%' IDENTIFIED WITH mysql_native_password BY 'sifresiz.Zor97';
GRANT ALL ON kutuphanedb.* TO 'kgpy'@'%';
