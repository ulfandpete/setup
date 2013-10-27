#!/bin/bash
# Continues basic.sh setup file

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

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

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

wget https://raw.github.com/ulfandpete/setup/master/setup2.sh
sudo chmod 777 setup2.sh
rm --force setup.sh
read -p "The system needs to restart. Reconnect and execute setup2.sh to continue."
sudo shutdown -r now
