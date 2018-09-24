#!/usr/bin/env bash

BUILD_PACKAGES="build-essential python python-dev virtualenv git libdb-dev"
RUNTIME_PACKAGES="python2.7 libpython2.7 virtualenv lib32z1 lib32ncurses5 libdb-dev"

sudo chown -R oioioi:oioioi /sio2

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get --no-install-recommends -y install $BUILD_PACKAGES

virtualenv venv
. venv/bin/activate

git clone https://github.com/sio2project/sioworkers.git build

cd build
pip install .

deactivate

# remove build directory
cd ..
rm -rf build

# purge pip cache
rm -rf ~/.cache

mkdir sioworkers
cd sioworkers
mkdir logs pidfiles

sudo apt-get --purge -y remove $BUILD_PACKAGES
sudo apt-get --purge -y autoremove

sudo apt-get --no-install-recommends -y install $RUNTIME_PACKAGES

sudo rm -rf /var/lib/apt/lists/*

sudo rm /tmp/build.sh
