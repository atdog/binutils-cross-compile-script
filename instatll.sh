#!/usr/bin/env bash

V=2.25   # Binutils Version
ARCH=arm # Target architecture

MAKE=gmake
hash gmake || MAKE=make
export AR=ar
export AS=as

cd /tmp

rm -rf binutils-${V}.tar.gz
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
