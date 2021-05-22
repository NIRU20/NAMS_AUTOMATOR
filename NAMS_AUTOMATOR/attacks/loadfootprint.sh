#!/bin/bash
clear
loadphoneinfo(){
  clear
  echo -e "\n"
  read -p "[+]is PhoneInfoga installed(y/n):" ans
  if [[ "$ans" == 'y' ]]
  then
    echo -e "\nloading PhoneInfoga"
    FILE=./PhoneInfoga
    if [ ! -d "$FILE" ]; then
      echo -e "\nPhoneInfoga directory is not present in the main script directory."
      echo -e "\nplease make sure that PhoneInfoga directory is present in the main script directory."
      echo -e "Loading main file....*"
      sleep 15
      bash ./main.sh
    fi
    sleep 2
    echo -e "\n"
    echo -e "\e[1;31m"
    read -p  "[+]enter number for searching with country code(ex:+91XXXX):" phno
    echo -e "\e[0m"
    xterm -e "python3 PhoneInfoga/phoneinfoga.py -n $phno; read"
    loadmain
  else
    echo -e "\n"
    read -p "[+]do you want to install it(y/n):" opt
    if [[ "$opt" == 'y' ]]
    then
      #install sherlock
      echo -e "\n\e[1;33minstalling PhoneInfoga\e[0m"
      xterm  -e "git clone https://github.com/Wes974/PhoneInfoga.git ;cd ./PhoneInfoga;python3 -m pip install -r requirements.txt ;sleep 5"
      loadphoneinfo
    else
      ./attacks/loadfootprint.sh
    fi
  fi

}
loadsherlock() {
  clear
  echo -e "\n"
  read -p "[+]is sherlock installed(y/n):" ans
  if [[ "$ans" == 'y' ]]
  then
    echo -e "\nloading sherlock"
    FILE=./sherlock
    if [ ! -d "$FILE" ]; then
      echo -e "\nsherlock is not present in the main script directory."
      echo -e "\nplease make sure that sherlock directory is present in the main script directory."
      sleep 15
      bash ./main.sh
    fi
    sleep 2
    echo -e "\n"
    echo -e "\e[1;31m"
    read -p  "[+]enter name for searching:" name
    echo -e "\e[0m"
    echo -e "\e[1;34m"
    read -p "[+]check connections over a tor ciruit(y/n):" opn
    echo -e "\e[0m"
    if [[ $opn -eq "y" ]]; then
      dpkg -s tor &> /dev/null
      if [[ $? -eq 0 ]]; then
        #statements
        xterm -e "python3 ./sherlock/sherlock/sherlock.py --tor --timeout 6 --print-found $name ; sleep 5"
      else
        echo -e "\n[+]tor is not present in your machine.tyring to Installing.. "
        xterm -e "apt-get install tor"
        loadsherlock
      fi
    else
      xterm -e "python3 ./sherlock/sherlock/sherlock.py --timeout 6 --print-found $name ; sleep 5"
    fi
    echo -e "\noutput file is saved at $PWD\n"
    read -p "press any key to continue:" op
    if [[ $op -ne '1' ]]; then
      loadmain
    fi
  else
    echo -e "\n"
    read -p "[+]do you want to install it(y/n):" opt
    if [[ "$opt" == 'y' ]]
    then
      #install sherlock
      echo -e "\n\e[1;33minstalling sherlock\e[0m"
      xterm  -e "git clone https://github.com/sherlock-project/sherlock.git ;cd ./sherlock;python3 -m pip install -r requirements.txt ;sleep 5"
      loadsherlock
    else
      ./attacks/loadfootprint.sh
    fi
  fi

}
loadmain(){
clear
echo -e "\n\e[1;31mselect an attack:\e[0m  \n"
echo -e "[1]Nmap Scan "
echo -e "[2]nslookup"
echo -e "[3]whoislookup"
echo -e "[4]PhoneInfoga Search"
echo -e "[5]Sherlock social network investigation"
echo -e "[6]Shodan Search engine"
echo -e "[7]main menu"
echo -e "[8]exit"
read -p "enter your choice: " opt
if [[ $opt -eq 1 ]]; then
  echo -e "\nupdating "
  loadmain
fi
if [[ $opt -eq 2 ]]; then
  echo -e "\nupdating "
  loadmain
fi
if [[ $opt -eq 3 ]]; then
  echo -e "\nupdating "
  loadmain
fi
if [[ $opt -eq 4 ]]; then
  echo -e "\nupdating "
  #phoneinfoga
  loadphoneinfo
fi
if [[ $opt -eq 5 ]]; then
  #load sherlock
  loadsherlock
fi
if [[ $opt -eq 6 ]]; then
  echo -n "\nupdating "
  loadmain
fi
if [[ $opt -eq 7 ]]; then
  bash ./main.sh
fi
if [[ $opt -eq 8 ]]; then
  exit
fi
}

loadmain
