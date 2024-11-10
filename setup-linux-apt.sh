#!/usr/bin/env bash

apt update -y
apt install libssl-dev swig -y

echo "Config libs: ${pkg-config --libs openssl}"
