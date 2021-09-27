#!/bin/bash
loadmain () {
  clear
  echo -e "\n\a\e[31;m[+]loading social engineering attacks..."
  echo -e "\n\e[1;31mselect an attack:\e[0m  \n"
  echo -e "[1]SEToolKit "
  echo -e "[2]pnwed passwords search"
  echo -e "[3]main menu"
  echo -e "[4]exit"
  read -p "enter your choice: " opt
  if [[ $opt -eq 1 ]]; then
    setoolkit
  fi
  if [[ $opt -eq 2 ]]; then
    #statements
    echo -e "\n"
    read -p "[+]enter a mailid or password for searching:" usrn
    xterm -e "xdg-open https://haveibeenpwned.com/account/$usrn"
  fi
  if [[ $opt -eq 3 ]]; then
    bash ./main.sh
  fi
  if [[ $opt -eq 4 ]]; then
    exit
  fi
}
loadmain
