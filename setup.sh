#!/bin/bash

sudo apt install fastfetch -y
sudo apt install aircrack-ng -y
sudo apt install lolcat -y

clear

COLUMNS=$(tput cols)
title="💀💀💀 Run the tool by using root permission...(sudo ./wifi-jammer.sh) 💀💀💀"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title" | lolcat
