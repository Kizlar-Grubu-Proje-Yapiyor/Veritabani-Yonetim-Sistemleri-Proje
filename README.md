# Veritabani Yonetim Sistemleri Proje Ödevi

Bu proje `BLM0224 Veritabanı Yönetim Sistemleri` dersi için hazırlanmıştır. Proje özetle: `php`, `HTML`, `CSS`, `JavaScript` ve `mySQL` kullanılarak yapılmış bir kütüphane-otomasyonu sitesi olarak tanımlanabilir.

## Proje Grubu

* [Ali Cüneyt Çağlar](https://github.com/CuneytCaglar)
* [Ali Furkan Demir](https://github.com/AliFurkanDemir)
* [Ceyhun Şen](https://github.com/ceyhunsen)
* [Halil Karataş](https://github.com/hll-krts)
* [İbrahim Yahya Aydınlı](https://github.com/ibrahimyahyaaydinli)

## Kurulum

Gereksinimler:

* Ubuntu 20.04
* İnternet (Gerekli paketlerin kurulması için)

**Dikkat!**  
Sisteminize bazı değişiklikler yapılacaktır. Bu değişiklikler:

* `firewalld`, `apache2`, `mysql-server`, `mysql-client`, `php`, `phpmyadmin`, `libapache2-mod-php`, `php-mysql` paketleri yüklenecektir.
* Sisteminiz güncellenecektir.
* `mysql` ayarlarınız değiştirilip, yeni kullanıcı eklenecektir.
* Sisteminiz bir sunucu olacaktır.

Eğer bilgisayarınızda bu değişikliklerin gerçekleşmesini istemiyorsanız sanal makine kullanabilirsiniz. Eğer bu seçeneklerden hiçbiri sizi memnum etmiyorsa kurulumu gerçekleştirmeyiniz.  

[yukle.sh](yukle.sh) adlı kurulum dosyası bütün işlemleri otomatize etmeye çalışsa da, `mysql` için `root` şifresi oluşturmanızı isteyecektir. Buraya gireceğiniz şifre programın çalışmasını etkilemeyecektir.  

Kurulum:

```bash
sudo apt install -y git
git clone https://github.com/Kizlar-Grubu-Proje-Yapiyor/Veritabani-Yonetim-Sistemleri-Projesi.git
cd Veritabani-Yonetim-Sistemleri-Projesi/
sudo ./yukle.sh
```

## Kaynaklar

* https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04

## Lisans
[MIT License](LICENSE)
