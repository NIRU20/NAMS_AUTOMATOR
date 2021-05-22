#!/bin/bash
clear
figlet "WIR3LE55"
loadwireless () {
    #hello
    echo -e "\a\e[1;32mselect an attack:\e[0;m"
    echo -e "[1]deauth all connected devices"
    echo -e "[2]WIFI crack using fluxion"
    echo -e "[3]enable monitor mode and start packet sniffing"
    read -p "\n select an attack: " opt
    case $opt in 1)
         echo "load a deauth attack"
      ;;
    2)
       echo "load fluxion"
    ;;
    3)
      echo "start monitor mode"
    ;;
    *)
      echo "choose right option"
      loadwireless
    ;;
   esac
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
