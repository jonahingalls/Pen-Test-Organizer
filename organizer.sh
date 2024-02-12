#!/usr/bin/bash

############################################################
# Overview                                                 #
############################################################
# Goal is to organize the initial scanning and enumeration #
# in a penetration test. We will use Nmap to scan and then #
# check the output for certain services.                   #
############################################################
# Help                                                     #
############################################################
help() {
   # Display Help
   echo "###############################################"
   echo "|A Script to organize the enumeration process.|"
   echo "|                                             |"
   echo "|Syntax: scriptname [target IP address]       |"
   echo "|                                             |"
   echo "|See the todo.txt file for your to do list    |"
   echo "###############################################"
   echo 
   echo
   echo
	}

############################################################
# Main Program                                             #
############################################################
help
# set ip address as variable
ip=$1
# run initial nmap scan 
sudo nmap -sVC $ip -oN output.txt
touch "./todo.txt"
echo -e "To Do List for Target "$ip":\n" >> "./todo.txt"
# run for FTP
if grep -q "FTP" "./output.txt"; then
	echo -e "FTP" >> "./todo.txt"
	echo -e "* Check Out FTP Files" >> "./todo.txt"
fi

if grep -q -i "Anonymous FTP login allowed" "./output.txt"; then
	echo -e "  + Anon Login Allowed\n" >> "./todo.txt"
fi

# run for SSH
if grep -q -i "SSH" "./output.txt"; then
	echo -e "SSH" >> "./todo.txt"
	echo -e "* Brute Force SSH\n" >> "./todo.txt"
fi
 
# run for HTTP
if grep -q -i "HTTP" "./output.txt"; then
        echo -e "HTTP" >> "./todo.txt"
	echo -e "* Visit Web Page\n" >> "./todo.txt"
fi

# run for SMB
if grep -q -i "SMB" "./output.txt"; then
        echo -e "SMB" >> "./todo.txt"
	echo -e "* Check Out SMB Files\n" >> "./todo.txt"
fi

# run for MYSQL
if grep -q -i "MYSQL" "./output.txt"; then
        echo -e "MYSQL" >> "./todo.txt"
	echo -e "* Check Out MySQL Database\n" >> "./todo.txt"
fi

# run for RDP
if grep -q -i "RDP" "./output.txt"; then
        echo -e "RDP" >> "./todo.txt"
	echo -e "* Brute Force RDP Login\n" >> "./todo.txt"
fi

exit
