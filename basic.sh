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
read -p "Basic setup complete. Do you want to install node and heroku? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
then
  # Install software packages for development (if they are not already)
  sudo apt-get install -y gcc binutils python g++ tcl build-essential

  # Install nodejs
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs

  # Install nvm: node-version manager
  # https://github.com/creationix/nvm
  curl https://raw.github.com/creationix/nvm/master/install.sh | sh
  read -p "Press a button to exit the console and then relogon. You can execute setup.sh to continue."
  wget https://raw.github.com/ulfandpete/setup/master/setup.sh ~
  sudo chmod 777 setup.sh
  exit
fi
