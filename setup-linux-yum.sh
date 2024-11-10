#!/usr/bin/env bash

# https://serverfault.com/questions/1161816/mirrorlist-centos-org-no-longer-resolve/1161847#1161847
sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS-*.repo
sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS-*.repo
sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS-*.repo

yum update -y
yum install openssl-devel swig -y

echo "Config libs: ${pkg-config --libs openssl}"
