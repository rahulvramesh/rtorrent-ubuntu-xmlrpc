#!/bin/bash

#r torrent installer for ubuntu 16

#update the system
apt-get update -y

#rtorrent intall
sudo apt-get install rtorrent -y

#copy rtorrent file
cp .rtorrent.rc ~/

#create necessry folder
mkdir -p /rtorrent/{downloads,watch,.session}

#install apache
apt-get install apache2 -y
apt-get install screen -y

sudo rm /etc/apache2/sites-available/000-default.conf

#copy file
cp 000-default.conf  /etc/apache2/sites-available/

#reload apache
service apache2 restart

#setup rtorrent as service
sudo cp rtorrent.service /etc/systemd/system/rtorrent.service

#enable service
sudo systemctl enable rtorrent.service
systemctl daemon-reload
sudo systemctl starts rtorrent.service
