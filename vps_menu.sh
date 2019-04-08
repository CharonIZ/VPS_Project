#!/bin/bash

clear;

echo "Welcome to VPS Controller";
PS3='Please enter your choice: '
options=("Stealth Scan" "Range Scan" "Website Scan" "ARP Scan" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Stealth Scan")
            echo "you chose Stealth Scan"
			echo "Please enter the IP address you want to scan:"
			read stealth
			proxychains nmap -sV $stealth
		break
            ;;
        "Range Scan")
            echo "you chose Range Scan"
			echo "Please enter the IP range you want to scan:"
			echo "Notice range scans should look like this '192.168.2.0/24' or '192.168.2.1-200' "
			read rangevar
			proxychains nmap -sP $rangevar
		break
            ;;
        "Website Scan")
            echo "you chose Website Scan"
			echo "Please enter the website you wish to scan:"
			read webvar
			proxychains nmap $webvar
		break
            ;;
        "ARP Scan")
            echo "you chose ARP Scan"
            echo "please enter the IP you wish to do ARP scan on:"
            read arpvar
            proxychains nmap -n -sn -PR --packet-trace --send-eth $arpvar
		break
            ;;
        "Quit")
		echo " See you soon..."
            exit
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
