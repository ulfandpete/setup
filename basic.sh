#!/bin/bash
# This a file contains installation commans of some basic software for ubuntu server
# Execute this on a fresh ubuntu vm-installation

# First run an update on all installed software
sudo apt-get update
sudo apt-get upgrade

# Then install the most basic software packages
sudo apt-get install -y curl ssh apt-file make git python-software-properties software-properties-common

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Ask whether to continue with the next setup-files or not
read -p "Basic setup complete. Do you want to continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
then
    curl https://raw.github.com/ulfandpete/setup/master/setup.sh | bash
    
    read -p "Install startup-class files? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
    then
      curl https://raw.github.com/ulfandpete/setup/master/startup-class.sh | bash
    fi
    read -p "Install derby? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
    then
      curl https://raw.github.com/ulfandpete/setup/master/derby.sh | bash
    fi
    read -p "Install meteor? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
    then
      curl https://raw.github.com/ulfandpete/setup/master/meteor.sh | bash
    fi
fi
