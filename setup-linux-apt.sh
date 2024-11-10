#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install libssl-dev swig -y

echo "Config libs: ${pkg-config --libs openssl}"
