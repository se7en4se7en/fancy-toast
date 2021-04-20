#!/bin/bash

old=`cat "/etc/hostname"
# saves current container name as a variable

echo "Your current container name is $old."
# prints current container name (e.g "penguin")

echo "What would you like to change the container name to?"
read name 
# gets user input for new container name
 
sed -i "$old$ */$name/" /etc/hostname
sed -i "$old$ */$name/" /etc/hosts
# changes the container name by editing the files in /etc/hostname and /etc/hosts

echo "Okay, your container is now called $name"
# confirms name change

echo "In order to save your changes, you will have to restart your device."

read -r -p "Are you sure? [Y/n] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        reboot
        ;;
    *)
        sed -i "$name$ */$old/" /etc/hostname
        sed -i "$name$ */$old/" /etc/hosts
        
        echo "The operation has been aborted."
        ;;
esac
# reboots the container to save the changes. If a negative input is given it reverts to the previous name. 
