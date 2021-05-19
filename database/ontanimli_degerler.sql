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
