#!/bin/bash

# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
UPDATELOG="update.log"

######
# functions go here


# Start update dotfiles
read -rep $'[\e[1;33mACTION\e[0m] - Now the script will download the repository update and update the .config/HyprV directory. The existing directory will be renamed HyprV-bak. Continue updating? (y,n) ' CONTINST
if [[ $CONTINST == "Y" || $CONTINST == "y" ]]; then
    echo -e "$CNT - Update starting..."
    git pull
    mv ~/Downloads/HyprV ~/Downloads/HyprV-bak &>> $UPDATELOG
    mv ~/.config/HyprV ~/.config/HyprV-bak &>> $UPDATELOG
    cp -R HyprV ~/.config/ &>> $UPDATELOG
    echo -e "\e[1A\e[K$COK - dotfiles updated."
else
    echo -e "$CNT - This script will now exit, no changes were made to your system."
    exit
fi
