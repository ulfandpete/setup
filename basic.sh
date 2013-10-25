#!/bin/bash
# This a file contains installation commans of some basic software for ubuntu server
# Execute this on a fresh ubuntu vm-installation

# First run an update on all installed software
sudo apt-get update
sudo apt-get upgrade

# Then install the most basic software packages
sudo apt-get install -y curl ssh apt-file make git python-software-properties

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

