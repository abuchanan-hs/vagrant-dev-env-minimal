#!/usr/bin/env bash

#MY_DIR=$( cd "$( dirname "$0" )" >/dev/null && pwd )

set -e # Exit script immediately on first error.
#set -x # Print commands and their arguments as they are executed.

VAGRANT_DIR=/vagrant

# {{{ Ubuntu utilities

source "${VAGRANT_DIR}/vagrant-shell-scripts/ubuntu.sh"

# }}}

# Use Google Public DNS for resolving domain names.
# The default is host-only DNS which may not be installed.
nameservers-local-purge
nameservers-append '8.8.8.8'
nameservers-append '8.8.4.4'

# Use a local Ubuntu mirror, results in faster downloads.
apt-mirror-pick 'us'

# Update packages cache.
apt-packages-update

# Install VM packages.
apt-packages-install     \
  git-core               \
  imagemagick            \
  curl                   \
  ack-grep               \
  chrpath                \
  inotify-tools          \
  build-essential        \
  openssl                \
  automake               \
  autoconf               \
  libtool                \
  pkg-config             \
  bison                  \
  libreadline6           \
  libreadline6-dev       \
  zlib1g                 \
  zlib1g-dev             \
  libssl-dev             \
  libyaml-dev            \
  libsqlite3-dev         \
  sqlite3                \
  libxml2-dev            \
  libxslt-dev            \
  libc6-dev              \
  ncurses-dev            \
  python-software-properties \
  python                 \
  g++                    \
  make                   \

if [ $? -ne 0 ]; then exit $?; fi

dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

echo "*** Installing Node & modules"
source "${VAGRANT_DIR}/bin/node.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** Installing mongodb"
source "${VAGRANT_DIR}/bin/mongo.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** Installing redisdb"
source "${VAGRANT_DIR}/bin/redis.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** Installing yeoman"
source "${VAGRANT_DIR}/bin/yeoman.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** Installing jsctags"
source "${VAGRANT_DIR}/bin/jsctags.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** Installing dotfiles"
source "${VAGRANT_DIR}/bin/dotfiles.sh"
if [ $? -ne 0 ]; then exit $?; fi

echo "*** DONE provisioning script"



