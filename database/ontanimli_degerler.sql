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
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("878-955-373-802-2", "Bir İdam Mahkumunun Son Günü", "İş Bankası Kültür Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("178-978-363-882-9", "Bir Delinin Hatıra Defteri", "İndigo Kitap");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("278-175-368-802-4", "İnsan Ne İle Yaşar", "İndigo Kitap");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-363-808-5", "İçimizdeki Şeytan", "Yapı Kredi Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("278-675-383-822-2", "Hayvan Çiftliği", "Can Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("478-673-363-872-1", "Sineklerin Tanrısı", "İş Bankası Kültür Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("878-655-353-722-5", "Camdaki Kız", "Doğan Kitap");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("778-685-343-872-3", "Martı", "İndigo Kitap");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("277-676-384-822-4", "Cesur Yeni Dünya", "İthaki Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("207-606-389-888-5", "1984", "Can Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-08-0001-X", "Kuyucaklı Yusuf", "Yapı Kredi Yayınları");
INSERT INTO kutuphanedb.kitaplar (isbn_no, kitap_adi, yayin_evi) VALUES ("978-975-363-802-7", "Kürk Mantolu Madonna", "Yapı Kredi Yayınları");


-- Yazarlar
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Victor", "Hugo");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Nikolay", "Gogol");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Lev Nikolayeviç", "Tolstoy");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("George", "Orwell");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("William", "Golding");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Gülseren", "Budayıcıoğlu");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Anton", "Çehov");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Aldous", "Huxley");
INSERT INTO kutuphanedb.yazarlar (yazar_adi, yazar_soyadi) VALUES ("Sabahattin", "Ali");

-- Kategoriler
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Türk ve Dünya Klasikleri");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Bilim Kurgu");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Eğitim");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Dünya Edebiyatı");
INSERT INTO kutuphanedb.kategoriler (kategori_ismi) VALUES ("Roman");

-- Emanet
INSERT INTO kutuphanedb.emanet (kutuphane_no, uye_no, isbn_no, alim_tarihi) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş"), "978-975-363-802-7", "2021-05-13");
UPDATE kutuphanedb.emanet SET teslim_tarihi = "2021-05-14" WHERE uye_no = (SELECT uye_no FROM uyeler WHERE uye_adi = "Mehmet" AND uye_soyadi = "Gümüş");

-- Kitap - kategori
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-08-0001-X", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-363-802-7", (SELECT kategori_no FROM kategoriler WHERE kategori_ismi = "Türk ve Dünya Klasikleri"));
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("878-955-373-802-2", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("178-978-363-882-9", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("278-175-368-802-4", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("978-975-363-808-5", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("278-675-383-822-2", 4);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("278-675-383-822-2", 3);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("478-673-363-872-1", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("878-655-353-722-5", 5);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("778-685-343-872-3", 1);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("277-676-384-822-4", 5);
INSERT INTO kutuphanedb.kitap_kategori (isbn_no, kategori_no) VALUES ("207-606-389-888-5", 4);

-- Kitap - yazar
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-08-0001-X", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-363-802-7", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("878-955-373-802-2", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Victor" AND yazar_soyadi = "Hugo"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("178-978-363-882-9", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Nikolay" AND yazar_soyadi = "Gogol"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("278-175-368-802-4", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Lev Nikolayeviç" AND yazar_soyadi = "Tolstoy"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("978-975-363-808-5", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Sabahattin" AND yazar_soyadi = "Ali"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("278-675-383-822-2", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "George" AND yazar_soyadi = "Orwell"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("478-673-363-872-1", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "William" AND yazar_soyadi = "Golding"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("878-655-353-722-5", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Gülseren" AND yazar_soyadi = "Budayıcıoğlu"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("778-685-343-872-3", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Anton" AND yazar_soyadi = "Çehov"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("277-676-384-822-4", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "Aldous" AND yazar_soyadi = "Huxley"));
INSERT INTO kutuphanedb.kitap_yazar (isbn_no, yazar_no) VALUES ("207-606-389-888-5", (SELECT yazar_no FROM yazarlar WHERE yazar_adi = "George" AND yazar_soyadi = "Orwell"));

-- Kutuphane - kitap
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-08-0001-X", 10);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "978-975-363-802-7", 2);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "978-975-08-0001-X", 30);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "878-955-373-802-2", 21);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "178-978-363-882-9", 5);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "278-175-368-802-4", 56);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "978-975-363-808-5", 4);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "278-675-383-822-2", 1);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "478-673-363-872-1", 8);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Mimar Sinan Sosyal Yaşam Merkezi Kütüphanesi"), "878-655-353-722-5", 155);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehbenderler Konağı Kütüphanesi"), "778-685-343-872-3", 2);
INSERT INTO kutuphanedb.kutuphane_kitap (kutuphane_no, isbn_no, adet) VALUES ((SELECT kutuphane_no FROM kutuphane WHERE kutuphane_adi = "Şehir Kütüphanesi"), "277-676-384-822-4", 89);
