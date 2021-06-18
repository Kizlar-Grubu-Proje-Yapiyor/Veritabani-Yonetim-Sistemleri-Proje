#!/bin/bash

BOLD_RED="\033[1;31m"
BOLD_BLUE="\033[1;34m"
BOLD_GREEN="\033[1;32m"
BOLD_BLACK="\033[1;30m"
BOLD_CYAN="\033[1;36m"
BOLD_PURPLE="\033[1;35m"
BOLD_WHITE="\033[1;37m"
BOLD_YELLOW="\033[1;33m"
NC="\033[00m"

if [ "$EUID" -ne 0 ]
then
	echo -e "${BOLD_RED}Superuser yetkisi ile calistirmaniz gerekli. Bunu deneyin:${NC}"
	echo -e "sudo $0"
	exit
fi

echo -e "${BOLD_BLUE}Kurulum seklini seciniz:${NC}"
echo -e "${BOLD_BLUE}1. Tam Kurulum${NC}"
echo -e "${BOLD_BLUE}2. Kismi Kurulum${NC}"
printf "${BOLD_BLUE}Seciminiz [1/2] (Varsayilan: kismi kurulum):${NC} "

read ans

if [[ $ans == "1" || $ans == "T" || $ans == "t" ]]
then
	echo -e "${BOLD_BLUE}Tam kurulum secildi${NC}"

	echo -e "${BOLD_BLUE}Sistem kaynaklari guncelleniyor${NC}"
	apt update

	echo -e "${BOLD_BLUE}Gerekli paketler yukleniyor${NC}"
	apt install -y apache2 mysql-server php libapache2-mod-php php-mysql

	echo -e "${BOLD_BLUE}Apache web sunucusu etkinlestiriliyor${NC}"
	ufw allow in "Apache"
	ufw enable

	echo -e "${BOLD_BLUE}MySQL kurulumu yapiliyor${NC}"
	echo -e "${BOLD_RED}Sizden root kullanicisi icin sifre sorabilir! Sectiginiz sifrenin bir onemi yoktur.${NC}"
	mysql_secure_installation --use-default
else
	echo -e "${BOLD_BLUE}Kismi kurulum secildi${NC}"
fi

echo -e "${BOLD_BLUE}Database icin tablolar olusturuluyor${NC}"
mysql < database/database.sql
echo -e "${BOLD_BLUE}Database'e ornek veriler ekleniyor${NC}"
mysql < database/ontanimli_degerler.sql

echo -e "${BOLD_BLUE}Web sitesi ayarlaniyor${NC}"
cp -r site/* /var/www/html/
rm /var/www/html/index.html

echo -e "${BOLD_GREEN}Kurulum tamamlandi!${NC}"
