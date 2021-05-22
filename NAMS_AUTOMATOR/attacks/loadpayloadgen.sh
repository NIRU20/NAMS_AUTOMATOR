#!/bin/bash
clear
figlet "WIR3LE55"
loadwireless () {
  
}
checkWIFI () {
  wifistat= iw dev | awk '$1=="Interface"{print $2}'
  if [[ $wifistat == "" ]];then
    xterm -e "ifconfig;echo available interfaces;sleep 5;echo wireless interface not present;sleep 10"
    echo -e "\n\a\e[1;31m[+]wifi interface not present to continue\e[0m"
    echo -e "\n"
    read -p "press any key to goback:" op
    if [[ $op -ne '1' ]]; then
      ./main.sh
    fi
  else
    xterm -e "ifconfig;echo available interfaces;sleep 5;echo wireless interface connection sucessfull;sleep 10"
    echo -e "\n\a\e[1;31m[+]wifi interface sucessfully verified\e[0m"
    sleep 2
    echo -e "\n[+]\a\e[1;33m[+]Loading wireless attacks"
    loadwireless
  fi
}
checkWIFI
