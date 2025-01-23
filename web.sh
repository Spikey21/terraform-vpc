#!/bin/bash
apt update
apt install wget unzip apache2 -y
systemctl start apache2
systemctl enable apache2
wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip
unzip -o 2131_wedding_lite.zip
cp -r 2131_wedding_lite/* /var/www/html/
systemctl restart appache2
