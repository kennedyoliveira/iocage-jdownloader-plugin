#!/bin/sh

# Create folder structure
cd /usr/local
mkdir jdownloader

cd jdownloader

# download the installer
curl http://installer.jdownloader.org/JDownloader.jar -o JDownloader.jar

# Add a new user
pw useradd jdownloader -u 333 -c "JDownloader daemon user" -d /nonexistent -s /sbin/nologin

# update the folder permissions
cd ..
chown -R jdownloader:nogroup jdownloader

# enable JDownloader on start
sysrc jdownloader_enable=YES

# set the user to the one we just created
sysrc jdownloader_user=jdownloader

# start the service
service jdownloader start

