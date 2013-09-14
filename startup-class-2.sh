!/bin/bash
# Installs a basic bitcoin app based on nodejs and the mean-stack without mongoDB
# for a headless setup (whatever this means)

cd ~
git clone https://github.com/startup-class/bitstarter-leaderboard.git
cd bitstarter-leaderboard
./setup-ssjs.sh
