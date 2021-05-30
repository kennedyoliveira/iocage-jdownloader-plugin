#!/bin/sh

# Create folder structure
echo "Creating the folder structure"
mkdir -p /usr/local/jdownloader

# download the installer
echo "Downloading the installer"
curl http://installer.jdownloader.org/JDownloader.jar --silent -o /usr/local/jdownloader/JDownloader.jar

# Add a new user
echo "Adding new user"
pw useradd jdownloader -u 333 -c "JDownloader daemon user" -d /nonexistent -s /sbin/nologin

# update the folder permissions
echo "Updating permission"
chown -R jdownloader:nogroup /usr/local/jdownloader

# enable JDownloader on start
sysrc jdownloader_enable=YES

# set the user to the one we just created
sysrc jdownloader_user=jdownloader

# start the service
echo "Starting the service"
service jdownloader start

# wait a bit because the installer will download everything before starting it up
# if we don't wait it will show that the service is NOT running
sleep 10
