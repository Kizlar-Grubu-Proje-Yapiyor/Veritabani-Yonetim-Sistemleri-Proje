CREATE DATABASE IF NOT EXISTS kutuphanedb;

CREATE TABLE IF NOT EXISTS kutuphanedb.adresler (
	adres_no INT,
	adres VARCHAR(45),
	PRIMARY KEY (adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kutuphane (
	kutuphane_no INT,
	kutuphane_adi VARCHAR(45),
	kutuphane_adres_no INT,
	adres_no INT,
	PRIMARY KEY (kutuphane_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.uyeler (
	uye_no INT,
	uye_adi VARCHAR(45),
	uye_soyadi VARCHAR(45),
	uye_tel_no INT,
	uye_eposta VARCHAR(45),
	adres_no INT,
	PRIMARY KEY (uye_no),
	FOREIGN KEY (adres_no) REFERENCES kutuphanedb.adresler(adres_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitaplar (
	isbn_no INT,
	kitap_adi VARCHAR(45),
	yayin_evi VARCHAR(45),
	kitap_kategori_no INT,
	PRIMARY KEY (isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.yazarlar (
	yazar_no INT,
	yazar_adi VARCHAR(45),
	yazar_soyadi VARCHAR(45),
	PRIMARY KEY (yazar_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kategoriler (
	kategori_no INT,
	kategori_ismi VARCHAR(45),
	PRIMARY KEY (kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.emanet (
	emanet_no INT,
	kutuphane_no INT,
	uye_no INT,
	isbn_no INT,
	alim_tarihi DATETIME,
	teslim_tarihi DATETIME,
	PRIMARY KEY (emanet_no),
	FOREIGN KEY (kutuphane_no) REFERENCES kutuphanedb.kutuphane(kutuphane_no),
	FOREIGN KEY (uye_no) REFERENCES kutuphanedb.uyeler(uye_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_kategori (
	kitap_kategori_no INT,
	isbn_no INT,
	kategori_no INT,
	PRIMARY KEY (kitap_kategori_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (kategori_no) REFERENCES kutuphanedb.kategoriler(kategori_no)
);

CREATE TABLE IF NOT EXISTS kutuphanedb.kitap_yazar (
	kitap_yazar_no INT,
	isbn_no INT,
	yazar_no INT,
	PRIMARY KEY (kitap_yazar_no),
	FOREIGN KEY (isbn_no) REFERENCES kutuphanedb.kitaplar(isbn_no),
	FOREIGN KEY (yazar_no) REFERENCES kutuphanedb.yazarlar(yazar_no)
);
