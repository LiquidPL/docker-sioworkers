#!/usr/bin/env bash

BUILD_PACKAGES="build-essential python python-dev virtualenv"
RUNTIME_PACKAGES="python virtualenv lib32z1 lib32ncurses5"

sudo chown -R oioioi:oioioi /sio2

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get --no-install-recommends -y install $BUILD_PACKAGES

virtualenv venv
. venv/bin/activate

cd build
python setup.py install

deactivate

# remove code after installing and purge pip cache
cd ..
rm -rf build ~/.cache

cd sioworkers
mkdir logs pidfiles

sudo apt-get --purge -y remove $BUILD_PACKAGES
sudo apt-get --purge -y autoremove

sudo apt-get --no-install-recommends -y install $RUNTIME_PACKAGES

sudo rm -rf /var/lib/apt/lists/*

sudo rm /tmp/build.sh
