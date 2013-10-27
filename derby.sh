#!/bin/bash
# Install all the files necessary for derby.js

# Install Redis
wget http://redis.googlecode.com/files/redis-2.6.14.tar.gz
tar -xzf redis-2.6.14.tar.gz
cd redis-2.6.14
sudo make

# Install mongoDB
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list
sudo apt-get update
sudo apt-get install mongodb-10gen

# Finally install derby
npm install -g derby
