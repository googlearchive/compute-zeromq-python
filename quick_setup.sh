#!/bin/bash
# Usage:
#  gcutil --project <project> ssh <instance-name> < quick_setup.sh

ZEROMQ_VER=3.2.2

sudo apt-get -y install gcc g++
wget http://download.zeromq.org/zeromq-${ZEROMQ_VER}.tar.gz
tar xzvf zeromq-${ZEROMQ_VER}.tar.gz
cd zeromq-${ZEROMQ_VER}
./configure
make
sudo make install
sudo ldconfig
