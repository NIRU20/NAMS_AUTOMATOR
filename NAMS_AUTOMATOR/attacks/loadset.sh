#!/bin/bash
loadmain () {
  clear
  echo -e "\n\a\e[31;m[+]loading social engineering attacks..."
  echo -e "\n\e[1;31mselect an attack:\e[0m  \n"
  echo -e "[1]SEToolKit "
  echo -e "[2]main menu"
  echo -e "[3]exit"
  read -p "enter your choice: " opt
  if [[ $opt -eq 1 ]]; then
    setoolkit
  fi
  if [[ $opt -eq 7 ]]; then
    bash ./main.sh
  fi
  if [[ $opt -eq 8 ]]; then
    exit
  fi
}
loadmain
