#!/usr/bin/env bash

V=2.25   # Binutils Version
ARCH=i386 # Target architecture

MAKE=gmake
hash gmake || MAKE=make
export AR=ar
export AS=as

cd /tmp

sudo rm -rf binutils-*
wget -nc https://ftp.gnu.org/gnu/binutils/binutils-${V}.tar.gz

mkdir -p binutils-build
cd binutils-build

tar zxf ../binutils-${V}.tar.gz 

cd ./binutils-$V

./configure \
    --prefix=/usr/local \
    --target=$ARCH-unknown-linux-gnu \
    --disable-static \
    --disable-multilib \
    --disable-werror \
    --disable-nls

$MAKE -j
sudo $MAKE install
