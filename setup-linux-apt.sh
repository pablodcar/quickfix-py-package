#!/usr/bin/env bash

sudo apt update -y
sudo apt install libssl-dev swig -y

echo "Config libs: ${pkg-config --libs openssl}"
