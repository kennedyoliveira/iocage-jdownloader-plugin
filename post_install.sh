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

# wait for the service to have a chance to start
sleep 3

# get the pid
# at start it will download all the files and update, and will not create a pid file
# so we need to create one so the service can be seen as running
jdownloader_pid=$(pgrep java)

echo $jdownloader_pid > /usr/local/jdownloader/JDownloader.pid

# fix the permission so the user can actually remove and replace with the new one once update finishes
chown jdownloader:nogroup /usr/local/jdownloader/JDownloader.pid
