#!/bin/bash
loadMain () {
clear
echo -e "\n\a\e[1;32mLoading Basic Nmaps scans\e[0;m"
echo -e "\n[+]By default we will be using quick scans\n"
echo -e "[+]displaying your IP address"
sleep 2
echo -e "\n\a\e[1;32mselect an Nmap scan:\e[0;m"
echo -e "[1]Scan my network for all hosts"
echo -e "[2]scan for webservers in my network"
echo -e "[3]Scan a given Domain"
echo -e "[4]perform OS detections in my network"
echo -e "[5]scan single IP address"
echo -e "[6]use nmap scripts"
echo -e "[7]exit"
echo -e "\a\e[1;33m"
read -p "enter your choice: " nmapopt
echo -e "\e[0;m"
if [[ $nmapopt -eq "1" ]]; then
  echo -e "\n"
  xterm -e "ifconfig;sleep 10"
  read -p "enter the IPaddress for scanning:" ipadd
  echo -e "\n[+]performing normal ping scan"
  echo -e "\n[+]port scan is disabled"
  echo -e "\n[+]No decoys for firewall used\n"
  nmap -sP -sn --unprivileged --verbose $ipadd/24
  read -p "press any key to continue:" op
  if [[ $op -ne '1' ]]; then
    loadMain
  fi
fi
if [[ $nmapopt -eq "2" ]]; then
  #statements
  echo -e "\n[1]scan complete network"
  echo -e "[2]scan a single Ip address"
  echo -e "\a\e[1;33m"
  read -p "enter choice: " chc
  echo -e "\e[0;m"
  echo -e "\n"
  xterm -e "ifconfig;sleep 10"
  read -p "[+]enter the IPaddress for scanning:" ipadd
  echo -e "\n[+]performing full Tcp scan"
  echo -e "\n"
  sleep 3
  read -p "[+]use decoys to avoid firewall(y/n): " fwopt
  if [[ $chc -eq "1" ]]; then
    #statements
    if [[ $fwopt == "y" ]]; then
      #statements
      echo -e "\n"
      read -p "[+]enter the decoy ip addresses(comma sep if multiple): " fwip
      echo -e "\n[+]starting scan.."
      echo -e "\n[+]using $fwip as decoys in scan.."
      echo -e "\n[+]scanning 443 ,80 ports.."
      echo -e "\n[+]warning! this might generate lot of traffic which can be detected by firewalls..."
      echo -e "\n[+]using fast scan with T4"
      sleep 5
      nmap -sT -D $fwip -p 443,80 -T4 $ipadd/24
    else
      echo -e "\n[+]starting scan.."
      echo -e "\n[+]scanning 443 ,80 ports.."
      echo -e "\n[+]using fast scan with T4"
      sleep 5
      nmap -sT -p 443,80 $ipadd/24
    fi
  fi
  if [[ $chc -eq "2" ]];then
    if [[ $fwopt == "y" ]]; then
      #statements
      read -p "enter the decoy ip addresses(comma sep if multiple): " fwip
      echo -e "\n[+]starting scan.."
      echo -e "\n[+]using $fwip as decoys in scan.."
      echo -e "\n[+]scanning 443 ,80 ports.."
      echo -e "\n[+]warning! this might generate lot of traffic which can be detected by firewalls..."
      echo -e "\n[+]using fast scan with T4"
      sleep 5
      nmap -sT -D $fwip -p 443,80 -T4 $ipadd
    else
      echo -e "\n[+]starting scan.."
      echo -e "\n[+]scanning 443 ,80 ports.."
      echo -e "\n[+]using fast scan with T4"
      sleep 5
      nmap -sT -p 443,80 $ipadd
    fi
  fi
  read -p "press any key to continue:" op
  if [[ $op -ne '1' ]]; then
    loadMain
  fi
fi
if [[ $nmapopt -eq 3 ]]; then
  #statements
  read -p "enter the domain address: " dnmname
  nmap -sT $dnmname
  read -p "press any key to continue:" op
  if [[ $op -ne '1' ]]; then
    loadMain
  fi
fi
if [[ $nmapopt -eq 5 ]]; then
  #statements
  echo -e "\n"
  xterm -e "ifconfig;sleep 10"
  read -p "enter the IPaddress for scanning:" ipadd
  echo -e "\n[+]performing half Tcp scan"
  echo -e "\n"
  sleep 3
  read -p "[+]use decoys to avoid firewall(y/n): " fwopt
  if [[ $fwopt == "y" ]]; then
    #statements
    read -p "enter the decoy ip addresses(comma sep if multiple): " fwip
    echo -e "\n[+]starting scan.."
    echo -e "\n[+]using $fwip as decoys in scan.."
    echo -e "\n[+]scanning for open ports.."
    echo -e "\n[+]warning! this might generate lot of traffic which can be detected by firewalls..."
    echo -e "\n[+]using fast scan with T4"
    sleep 5
    nmap -sS -D $fwip -T4 --verbose $ipadd
    read -p "press any key to continue:" op
    if [[ $op -ne '1' ]]; then
      loadMain
    fi
  else
    echo -e "\n[+]starting scan.."
    echo -e "\n[+]scanning for open ports.."
    echo -e "\n[+]using fast scan with T4"
    sleep 5
    nmap -sS -T4 --verbose $ipadd
    read -p "press any key to continue:" op
    if [[ $op -ne '1' ]]; then
      loadMain
    fi
  fi
fi
if [[ $nmapopt -eq 7 ]]; then
  #statements
  ./attacks/loadfootprint.sh
fi
}
loadMain
