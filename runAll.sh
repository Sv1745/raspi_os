#!/bin/sh
# setup_and_start.sh
# Script to set up directory, copy files, create launcher scripts, and make necessary changes

# Step 1: Create the directory
mkdir -p /home/pi/Desktop/raspi/iiotpython_main/

# Step 2: Clone files from GIT (You need to replace 'https://github.com/Sv1745/raspi_os' with the actual URL)
git clone https://github.com/Sv1745/raspi_os /home/pi/Desktop/raspi/iiotpython_main/

# Step 3: Make necessary changes to DB if needed
# (Add your specific commands here, e.g., copying or editing database files)
# Example: cp /path/to/new/db /home/pi/Desktop/raspi/iiotpython_main/

# Step 4: Create launcherMain.sh if it doesn't exist
if [ ! -f /home/pi/Desktop/raspi/iiotpython_main/launcherMain.sh ]; then
    echo "#!/bin/sh
# launcher.sh
# navigate to home directory, then to this directory, then execute python \$

cd /
cd /home/pi/Desktop/raspi/iiotpython_main
sudo python3 main.py
cd /" > /home/pi/Desktop/raspi/iiotpython_main/launcherMain.sh
    chmod +x /home/pi/Desktop/raspi/iiotpython_main/launcherMain.sh
fi

# Step 5: Create launcherReact.sh if it doesn't exist
if [ ! -f /home/pi/Desktop/raspi/iiotpython_main/launcherReact.sh ]; then
    echo "#!/bin/sh
# launcher1.sh
# navigate to home directory, then to this directory, then execute python \$

cd /
cd /home/pi/Desktop/raspi/iiotpython_main
sudo serve -s build -l 4200
cd /" > /home/pi/Desktop/raspi/iiotpython_main/launcherReact.sh
    chmod +x /home/pi/Desktop/raspi/iiotpython_main/launcherReact.sh
fi

# Step 6: Create launcherGsm1.sh if it doesn't exist
if [ ! -f /home/pi/Desktop/raspi/iiotpython_main/launcherGsm1.sh ]; then
    echo "#!/bin/sh
# launcher2.sh
# navigate to home directory, then to this directory, then execute python \$

cd /
cd /home/pi/Desktop/raspi/iiotpython_main
python gsm.py
cd /" > /home/pi/Desktop/raspi/iiotpython_main/launcherGsm1.sh
    chmod +x /home/pi/Desktop/raspi/iiotpython_main/launcherGsm1.sh
fi

# Step 7: Create launcherGsm.sh if it doesn't exist
if [ ! -f /home/pi/Desktop/raspi/iiotpython_main/launcherGsm.sh ]; then
    echo "#!/bin/sh
# launcher3.sh
# navigate to home directory, then to this directory, then execute python \$

cd /
cd /home/pi/Desktop/raspi/iiotpython_main/linux-ppp-scripts
sudo sh quectel-pppd.sh
cd /" > /home/pi/Desktop/raspi/iiotpython_main/launcherGsm.sh
    chmod +x /home/pi/Desktop/raspi/iiotpython_main/launcherGsm.sh
fi

echo "Setup complete. You can now use the launcher scripts."
