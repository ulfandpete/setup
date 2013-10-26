!/bin/bash
# Installs my branch of the bitstarter app

cd ~
git clone https://github.com/ulfandpete/bitstarter-leaderboard.git
cd bitstarter-leaderboard
./setup-ssjs.sh

# Finally check whether the user wants to install derby or meteor
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

rm --force setup.sh
rm --force setup2.sh
