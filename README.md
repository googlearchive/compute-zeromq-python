compute-zeromq-python
=====================

Instructions for using ZeroMQ on Google Compute Engine

Basic Setup
-----------

The following instructions assume that you have set up your instance with a GCEL image.  You may need to make adjustments for other images.

Update packages (optional):  

    sudo apt-get update && sudo apt-get upgrade

Install Required Dependencies:

    sudo apt-get install gcc g++

Download & Install ZeroMQ  
*Check for the latest software [here](http://www.zeromq.org/intro:get-the-software).*  
The following instructions are based on ZeroMQ 3.2.2:

    wget http://download.zeromq.org/zeromq-3.2.2.tar.gz
    tar xzvf zeromq-3.2.2.tar.gz
    cd zeromq-3.2.2
    ./configure
    make
    sudo make install
    sudo ldconfig

Setup Script
------------

The quick_setup.sh script can be used to automate the above steps.  To use, you need:
* [gcutil](https://developers.google.com/compute/docs/gcutil/) installed on your system and in your path.
* One or more instances with a GCEL image installed on them.
*Note that the script does not run apt-get update/upgrade*

Usage:
    gcutil --project <project> ssh <instance-name> < quick_setup.sh

Running Basic Tests
-------------------

Detailed instructions can be found [here](http://www.zeromq.org/results:perf-howto)

* Install ZeroMQ on 2 instances on the same network
* Note the network IP (internal) addresses of the instances
    gcutil --project <project> getinstance <instance-name> | grep " ip"
* SSH to each of the instances
* Test scripts are found in ~/zeromq-3.2.2/perf

Latency Test:  

    # On instance 1
    local_lat tcp://eth0:5555 1 10
    
    # On instance 2
    remote_lat tcp://<ip-of-instance-1>:5555 1 10

Throughput Test:  

    # On instance 1
    local_thr tcp://eth0:5555 1 10

    # On instance 2
    remote_thr tcp://<ip-of-instance-1>:5555 1 10

*Note that the "1 10" values can be changed to whatever you like.  The first number is the message size in bytes.  The second number is the number of messages/roundtrips that are run.  Low numbers are used here to minimize unnecessary resource usage.*
