#!/bin/bash

# Overview: This script installs IIOT dependencies, sets up launcher scripts, and configures system settings.

# Update and Upgrade System
echo "Updating and upgrading the system..."
sudo apt update
sudo apt-get upgrade -y
sudo apt-get update -y

# Install Python Packages
echo "Installing Python packages..."
sudo pip3 install flask
sudo pip3 install sqlalchemy==1.3.23
sudo pip install flask_sqlalchemy==2.5.1
sudo pip3 install flask-cors
sudo pip3 install -U pymodbus==2.5.3
sudo pip3 install schedule
sudo pip3 install aiohttp

# Install Node.js and Global npm Packages
echo "Installing Node.js and npm packages..."
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g serve

# Check npm and node versions
echo "Checking npm and node versions..."
npm -v
node -v

# Install SQLite and Apache2
echo "Installing SQLite and Apache2..."
sudo apt-get install sqlite3 -y
sudo apt-get install sqlitebrowser -y
sudo apt install apache2 -y

# Create Directories and Copy Files
echo "Setting up directories and copying files..."
mkdir -p /home/pi/Desktop/raspi/iiotpython_main
# Assuming files are to be cloned from a Git repository, uncomment and modify the following line if needed
# git clone <repository-url> /home/pi/Desktop/raspi/iiotpython_main

# Create and Configure Launcher Scripts
echo "Creating and configuring launcher scripts..."

create_launcher_script() {
    local script_name="$1"
    local script_content="$2"
    
    if [ ! -f "/home/pi/Desktop/raspi/iiotpython_main/$script_name" ]; then
        echo "$script_content" | sudo tee /home/pi/Desktop/raspi/iiotpython_main/$script_name > /dev/null
        sudo chmod 755 /home/pi/Desktop/raspi/iiotpython_main/$script_name
    fi
}

create_launcher_script "launcherMain.sh" '#!/bin/sh\ncd /home/pi/Desktop/raspi/iiotpython_main\nsudo python3 main.py\n'
create_launcher_script "launcherReact.sh" '#!/bin/sh\ncd /home/pi/Desktop/raspi/iiotpython_main\nsudo serve -s build -l 4200\n'
create_launcher_script "launcherGsm1.sh" '#!/bin/sh\ncd /home/pi/Desktop/raspi/iiotpython_main\npython gsm.py\n'
create_launcher_script "launcherGsm.sh" '#!/bin/sh\ncd /home/pi/Desktop/raspi/iiotpython_main/linux-ppp-scripts\nsudo sh quectel-pppd.sh\n'

# Update crontab
echo "Updating crontab for auto-start scripts..."
(
    crontab -l 2>/dev/null
    echo "@reboot sh /home/pi/Desktop/raspi/iiotpython_main/launcherMain.sh"
    echo "@reboot sh /home/pi/Desktop/raspi/iiotpython_main/launcherReact.sh"
    echo "@reboot sh /home/pi/Desktop/raspi/iiotpython_main/launcherGsm1.sh"
    echo "@reboot sh /home/pi/Desktop/raspi/iiotpython_main/launcherGsm.sh"
) | sudo crontab -

# Disable UART
echo "Disabling UART..."
sudo systemctl stop serial-getty@ttyS0.service
sudo systemctl disable serial-getty@ttyS0.service
sudo sed -i '/console=115200/d' /boot/cmdline.txt

# Configure Electron to Start on Boot
echo "Configuring Electron to start on boot..."
sudo sh -c 'echo "@/usr/bin/chromium-browser --kiosk http://localhost:4200" >> /etc/xdg/lxsession/LXDE-pi/autostart'

# Install Screen Resolution Settings Dependencies
echo "Installing screen resolution settings dependencies..."
sudo apt-get install xserver-xorg-input-libinput -y
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
sudo sed -i '/InputClass/a \    Option "CalibrationMatrix" "0 1 0 -1 0 1 0 0 1"' /etc/X11/xorg.conf.d/40-libinput.conf

echo "Setup complete. Please restart your Raspberry Pi to apply all changes."
