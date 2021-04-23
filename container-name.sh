#!/bin/bash

old=`cat "/etc/hostname"`
# saves current container name as a variable

echo "Your current container name is $old."
# prints current container name (e.g "penguin")

echo "What would you like to change the container name to?"
read name 
# gets user input for new container name
 
sed -i "s/$old$/$name/g" /etc/hostname
sed -i "s/$old$/$name/g" /etc/hosts
# changes the container name by editing the files in /etc/hostname and /etc/hosts

echo "Okay, your container is now called $name"
# confirms name change
echo " "
echo "In order to save your changes, you will have to restart your container."

read -r -p "Would you like to proceed? [Y/n] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo "Mock reboot comfirmed."
        ;;
    *)
        sed -i "s/$name$/$old/g" /etc/hostname
        sed -i "s/$name$/$old/g" /etc/hosts
        
        echo "The operation has been aborted."
        ;;
esac
# reboots the container to save the changes. If a negative input is given it reverts to the previous name. 
