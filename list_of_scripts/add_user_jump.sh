#!/bin/bash

echo "Enter User Name"
read user_name

echo "Enter SSH Keys"
read ssh_key


echo "Adding User"
useradd -d /home/$user_name $user_name

echo "Creating .ssh"
mkdir -p /home/$user_name/.ssh

echo "Adding SSH Key under Auth. Keys"
echo $ssh_key >> /home/$user_name/.ssh/authorized_keys

echo "Changing Permissions for .ssh folder for $user_name"
chown -R $user_name:$user_name /home/$user_name/.ssh