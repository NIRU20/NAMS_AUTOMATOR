#!/bin/bash
#all functions declared here
checkRoot () {
if [[ $EUID -ne 0 ]]; then
  echo -e "\e[1;31mscript must be run as root\e[0m"
  exit 1
fi
}
checkFiglet () {

  dpkg -s figlet &> /dev/null
  if [[ $? -eq 0 ]]; then
    echo -e "\a\e\n[1;34m[+]figlet package present.."
  else
    echo -e "\n[+]figlet package is required for font.please install..."
    sleep 5
    xterm -e "apt-get install figlet"
  fi
}
checkInternet () {
  ping -c 1 -q google.com >&/dev/null
  if [[ $? -eq '0' ]]; then
    echo -e "\n\a\e[1;35m[+]Internet connection successfull\e[0m"
    sleep 5
    checkFiglet
  else
    echo -e "\n\n\a\e[1;33m[+]please make sure you are connected to the internet..\e[0m"
    sleep 5
    exit
  fi
}

printName () {
  clear
  dpkg -s figlet &> /dev/null
  if [[ $? -eq 0 ]]; then
    #statements
    echo -e "    \a\e[31mW3LC0M3 TO AUT0MAT3R\e[0m\n"
    figlet "N_C_AUT)MAT#R"
  else
    echo "        _____        ___    ________________ "
    echo "       /  // /      /  /   |                |"
    echo "      /  / / /     /  /    |   _____________|"
    echo "     /  /  / /    /  /     |   |             "
    echo "    /  /   / /   /  /      |   |             "
    echo "   /  /    / /  /  /       |   |             "
    echo "  /  /     / / /  /        |   |____________ "
    echo " /  /      / //  /         |                |"
    echo "/__/       /____/          |________________|"
  fi
  echo -e "\n\n\e[1;34m[+]developed by cRaZySuDo..\e[0m"
  sleep 3
  echo -e "\n\n\a\e[31m[+]script loading please wait....*\e[0m"
  sleep 3
}

loadScript (){
  echo -e "\n\n\tplease select a method:\n"
  echo -e "   [1] footprinting & reconnaissance"
  echo -e "   [2] scanning attacks"
  echo -e "   [3] payload generators"
  echo -e "   [4] social engineering attacks"
  echo -e "   [5] penetration testing"
  echo -e "   [6] exit"
  read -p "choose your attack:" opt
  if [[ $opt -eq "1" ]]; then
    ./attacks/loadfootprint.sh
  fi

  if [[ $opt -eq "2" ]];then
    ./attacks/loadscanning.sh
  fi

  if [[ $opt -eq "3" ]];then
    ./attacks/loadpayloadgen.sh
  fi

  if [[ $opt -eq "4" ]];then
    ./attacks/loadset.sh
  fi

  if [[ $opt -eq "5" ]];then
     ./attacks/loadpentest.sh
   fi

  if [[ $opt -eq "6" ]]; then
    echo -e "\n\n \a\e[31mthank you for choosing our automater\e[0m"
    exit 1
  fi
}

#main body starts from here
checkRoot
checkInternet
printName
loadScript
