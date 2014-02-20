#!/usr/bin/env bash

apt-packages-ppa 'chris-lea/redis-server'
apt-packages-update
apt-packages-install redis-server

