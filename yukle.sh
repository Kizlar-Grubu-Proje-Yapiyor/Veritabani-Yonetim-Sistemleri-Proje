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

apt update
apt install -y firewalld apache2 mysql-server mysql-client php phpmyadmin libapache2-mod-php php-mysql

ufw app list
ufw allow in "Apache"
ufw enable
ufw status

mysql_secure_installation
