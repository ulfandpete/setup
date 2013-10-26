#!/bin/bash
# More advanced files for ubuntu server setup

# Install software packages for development (if they are not already)
sudo apt-get install -y gcc binutils python g++ tcl build-essential

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
sudo npm install -g jshint

# Install additional nodejs packages
sudo npm install -g cheerio commander restler csv

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

# install python and configure it in emacs (which is hopefully installed)
sudo apt-get install -y ipython-notebook
cd ~
wget https://launchpad.net/python-mode/trunk/6.1.2/+download/python-mode.el-6.1.2.tar.gz
tar xzvf python-mode.el-6.1.2.tar.gz
sudo mv python-mode.el-6.1.2 ~/.emacs.d
rm -v python-mode.el-6.1.2.tar.gz
sudo tee -a ~/.emacs.d/init.el <<EOF
;; ---------------------------------
;; -- Python mode voconfiguration --
;; ---------------------------------
;; not really sure what I am doing here

; python-mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.2")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)
(when (featurep 'python) (unload-feature 'python t))

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)
EOF
