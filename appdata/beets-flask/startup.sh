#!/bin/sh

apk update
apk add \
    build-base \
    ffmpeg-dev \
    cairo \
    cairo-dev \
    pkgconf \
    python3-dev \
    curl \
    mpg123-dev
echo "**** compile mp3gain ****"
mkdir -p /tmp/mp3gain-src 
curl -o /tmp/mp3gain-src/mp3gain.zip -sL 'https://sourceforge.net/projects/mp3gain/files/mp3gain/1.6.2/mp3gain-1_6_2-src.zip'
cd /tmp/mp3gain-src
unzip -qq /tmp/mp3gain-src/mp3gain.zip
sed -i "s#/usr/local/bin#/usr/bin#g" /tmp/mp3gain-src/Makefile
make
make install 
