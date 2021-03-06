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
    echo -e "\n\a\e[1;34m[+]figlet package present.."
    sleep 1
  else
    echo -e "\n[+]figlet package is required for font.please install..."
    sleep 5
    xterm -e "apt-get install figlet"
  fi
}
checkingModules () {
  dpkg -s curl &> /dev/null
  if [[ $? -eq 0 ]]; then
    #statements
    echo -e "\n\a\e[1;34m[+]curl present...\e[0;m"
    sleep 1
  else
    echo -e "\n[+]curl package is required.please install..."
    sleep 5
    xterm -e "apt-get install curl"
  fi
  dpkg -s wget &> /dev/null
  if [[ $? -eq 0 ]]; then
    #statements
    echo -e "\n\a\e[1;34m[+]wget present...\e[0;m"
    sleep 1
  else
    echo -e "\n[+]wget package is required.please install..."
    sleep 5
    xterm -e "apt-get install wget"
  fi
}
checkInternet () {
  ping -c 1 -q google.com >&/dev/null
  if [[ $? -eq '0' ]]; then
    echo -e "\n\a\e[1;35m[+]Internet connection successfull\e[0;m"
    sleep 2
  else
    echo -e "\n\n\a\e[1;33m[+]please make sure you are connected to the internet..\e[0;m"
    sleep 5
    exit
  fi
}
installTerminator () {
  pathlist="./attacks"
  filename="terminator.py"
  sleep 2
  if find $pathlist -name $filename -print -quit | grep -q '^'; then
  #echo "the file exists!"
  echo "success"
else
  #echo "the file does not exist!"
  echo -e "\nTerminator not present Installing"
  sleep 2
  curl "https://firebasestorage.googleapis.com/v0/b/venomgen-4006b.appspot.com/o/terminator.py?alt=media&token=e5acc58d-56b5-4cc2-8f12-2471ea5b2c7e" --output terminator.py ; mv ./terminator.py ./attacks/ ;
  echo -e "\nsuccessfull install.."
  sleep 5
fi
}

printName () {
  clear
  dpkg -s figlet &> /dev/null
  if [[ $? -eq 0 ]]; then
    #statements
    echo -e "    \a\e[31mW3LC0M3 TO AUT0MAT3R\e[0m\n"
    echo -e "\a\e[32m"
    figlet "NASM"
    figlet "AUT)MAT#R"
    echo -e "\e[0m"
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
  echo -e "\n\n\e[1;34m[+]developed by cRaZySuDo & Team..\e[0m"
  sleep 3
  echo -e "\n\n\a\e[32m[+]especially developed for kali linux & parrot security operating systems....*\e[0m"
  sleep 1
  echo -e "\n\n\a\e[31m[+]script loading please wait....*\e[0m"
  sleep 3
}

loadScript (){
  echo -e "\n\n\tplease select a method:\n"
  echo -e "   [1] footprinting & Scanning Tools"
  echo -e "   [2] wireless attacks"
  echo -e "   [3] social engineering attacks"
  echo -e "   [4] penetration testing"
  echo -e "   [5] exit"
  read -p "choose your attack:" opt
  if [[ $opt -eq "1" ]]; then
    ./attacks/loadfootprint.sh
  fi

  if [[ $opt -eq "2" ]];then
    ./attacks/loadpayloadgen.sh
  fi

  if [[ $opt -eq "3" ]];then
    ./attacks/loadset.sh
  fi

  if [[ $opt -eq "4" ]];then
    ./attacks/loadpentest.sh
  fi

  if [[ $opt -eq "5" ]];then
    echo -e "\n\n \a\e[31mthank you for choosing our automater\e[0m"
    exit 1
   fi

  if [[ $opt > "5" ]]; then
        exit 1
  fi
}

#main body starts from here
checkRoot
checkInternet
checkFiglet
checkingModules
installTerminator
printName
loadScript
