#!/bin/bash

clear=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`


echo "$yellow Enter User Name $clear"
read  user_name

echo "$yellow Enter SSH Keys $clear"
read  ssh_key

echo ""
echo -e "$white Check if user name is $clear $yellow $user_name $clear $white \n Check if Public Key is $yellow $ssh_key $clear \n $magenta Press Y/y/Yes/Enter to Confirm $clear"
read response
response=${response,,} # tolower
 if [[ $response =~ ^(y| ) ]] || [[ -z $response ]]; then
    echo "$cyan Adding User $clear"
    useradd -d /home/$user_name -s /bin/bash $user_name

    echo "$cyan Creating .ssh $clear"
    mkdir -p /home/$user_name/.ssh

    echo "$cyan Adding SSH Key under Auth. Keys $clear"
    echo $ssh_key >> /home/$user_name/.ssh/authorized_keys

    echo "$cyan Changing Permissions for .ssh folder for $user_name $clear"
    chown -R $user_name:$user_name /home/$user_name/.ssh

    echo "$green The user $user_name is succesfully added and his home path is /home/$user_name and his default shell is /bin/bash $clear"
 fi
