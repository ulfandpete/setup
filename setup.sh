#!/bin/bash
# More advanced files for ubuntu server setup

# Install software packages for development (if they are not already)
sudo apt-get install -y gcc binutils python-software-properties python g++ tcl build-essential software-properties-common

# Install nodejs
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install additional nodejs packages
npm install -g cheerio commander restler csv

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Configure basic github settings
export USERNAME=ulfandpete
export EMAIL=mail@ulfpetersen.com
git config --global user.name $USERNAME
git config --global user.email $EMAIL
git config --global credential.helper cache
git config credential.helper 'cache --timeout=3600'

# create a key for heroku and install it
ssh-keygen -t rsa
ssh-keygen -t rsa -C $EMAIL
cat ~/.ssh/id_rsa.pub
heroku login
heroku keys:add
