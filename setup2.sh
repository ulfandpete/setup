#!/bin/bash
# Installs my branch of the bitstarter app
read -p "Install bitstarter app? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
then
  cd ~
  git clone https://github.com/ulfandpete/bitstarter-leaderboard.git
  cd bitstarter-leaderboard
  sudo ./setup-ssjs.sh
fi

# Installs derby
read -p "Install derby? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
then
  curl https://raw.github.com/ulfandpete/setup/master/derby.sh | bash
fi

# Installs meteor
read -p "Install meteor? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]|[Yy]es$ ]]
then
  curl https://raw.github.com/ulfandpete/setup/master/meteor.sh | bash
fi

rm --force setup.sh
rm --force setup2.sh
