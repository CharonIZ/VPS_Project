#!/bin/bash

#This scripts validates user anonymity

read -p "Enter Your ip: "  myip

myip=$(proxychains curl www.ipchicken.com)

country=$(whois $myip | grep country | awk '{print $2}')

if [ '$country' == 'IL' ]; then
		echo "You are not anonymous!"
	exit
	else
		echo "You are anonymous"
fi

read -p "Plsease enter your username: " usrname

#Anonymously connecting to the server

#proxychains ssh $usrname@141.136.44.227