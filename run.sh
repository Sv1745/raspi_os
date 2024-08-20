#!/bin/bash

# Update system
sudo apt-get update -y
sudo apt-get upgrade -y

# Remove unnecessary packages
unnecessary_packages= ['gcc', 'g++', 'cpp', 'gdb', 'strace', 'valgrind', 'aarch64-linux-gnu-*', 'make', 'perl', 'lua', 'bash', 'awk', 'sed', 'vim', 'ed', 'bzip2', 'gzip', 'lzma', 'xz', 'zip', 'tar', 'bc', 'dc', 'man', 'less', 'whois', 'telnet', 'ftp', 'rsh-client', 'netcat', 'traceroute', 'rsync', 'libtool', 'pkg-config', 'libc-dev'
]

un_packages= unnecessary_packages.split()

for pkg in {un_packages}:
    if dpkg -l | grep -q "$pkg"; then
        sudo apt-get remove --purge -y "$pkg"
        sudo apt-get autoremove -y
    else
        echo "$pkg is not installed, skipping..."
    fi
done

# Install necessary packages
necessary_packages=(
    "sqlite3" "sqlitebrowser" "apache2" "nodejs"
)

for pkg in "${necessary_packages[@]}"; do
    if ! dpkg -l | grep -q "$pkg"; then
        sudo apt-get install -y "$pkg"
    else
        echo "$pkg is already installed, skipping..."
    fi
done

# Install Python packages
python_packages=(
    "flask" "sqlalchemy==1.3.23" "flask_sqlalchemy==2.5.1"
    "flask-cors" "pymodbus==2.5.3" "schedule" "aiohttp"
)

for pkg in "${python_packages[@]}"; do
    pip3 install "$pkg"
done

# Set up Node.js and NPM
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g serve

# Verify versions
npm -v
node -v

echo "System cleanup and setup complete!"
