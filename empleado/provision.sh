#!/bin/sh

# El script se detiene si hay errores
set -e
echo "########################################"
echo " Aprovisionando cliente "
echo "########################################"
echo "-----------------"
echo "Actualizando repositorios"
apt update
apt install -y curl nmap tcpdump wget bash iputils-ping
echo "------ FIN ------"