#!/bin/bash

# Update and Upgrade the system
sudo apt update
sudo apt-get upgrade -y

# Install Python packages
sudo pip3 install flask
sudo pip3 install sqlalchemy==1.3.23
sudo pip install flask_sqlalchemy==2.5.1
sudo pip3 install flask-cors
sudo pip3 install -U pymodbus==2.5.3
sudo pip3 install schedule
sudo pip3 install aiohttp

# Install Node.js and global npm packages
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g serve

# Check versions of npm and node
npm -v
node -v

# Install SQLite and Apache2
sudo apt-get install sqlite3 -y
sudo apt-get install sqlitebrowser -y
sudo apt install apache2 -y

# Screen resolution settings dependencies
sudo apt-get install xserver-xorg-input-libinput -y
sudo mkdir /etc/X11/xorg.conf.d 
sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
sudo nano /etc/X11/xorg.conf.d/40-libinput.conf
