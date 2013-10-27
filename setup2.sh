#!/bin/bash
# Installs my branch of the bitstarter app
read -p "Install bitstarter app? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cd ~
  git clone https://github.com/ulfandpete/bitstarter-leaderboard.git
  cd bitstarter-leaderboard
  echo -e "\n\nNOW ENTER YOUR HEROKU PASSWORD"

  # Set up heroku.
  # - devcenter.heroku.com/articles/config-vars
  # - devcenter.heroku.com/articles/heroku-postgresql
  heroku login
  heroku create
  heroku addons:add heroku-postgresql:dev
  heroku pg:promote `heroku config  | grep HEROKU_POSTGRESQL | cut -f1 -d':'`
  heroku plugins:install git://github.com/ddollar/heroku-config.git
  
  # Setup the postgresql database
  sudo ./pgsetup.sh
fi

# Installs derby
read -p "Install derby? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo curl https://raw.github.com/ulfandpete/setup/master/derby.sh | bash
fi

# Installs meteor
read -p "Install meteor? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo curl https://raw.github.com/ulfandpete/setup/master/meteor.sh | bash
fi

rm --force setup2.sh
