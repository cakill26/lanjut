#!/bin/bash
#wget https://gcakill26ithub.com/${GitUser}/
GitUser="cakill26"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│                     \e[$box SYSTEM MENU\e[30m                     \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "   [\e[$number 01${NC}]\e[$below • Add New Subdomain    ${NC}[\e[$number 10${NC}]\e[$below • Setup Speed VPS\e[m"
echo -e "   [\e[$number 02${NC}]\e[$below • Renew Cert Xray Core ${NC}[\e[$number 11${NC}]\e[$below • Restart VPN\e[m"
echo -e "   [\e[$number 03${NC}]\e[$below • Setup DNS NETFLIX    ${NC}[\e[$number 12${NC}]\e[$below • Speedtest VPS\e[m"
echo -e "   [\e[$number 04${NC}]\e[$below • Check DNS NETFLIX    ${NC}[\e[$number 13${NC}]\e[$below • Info All Port\e[m"
echo -e "   [\e[$number 05${NC}]\e[$below • Panel Domain         ${NC}[\e[$number 14${NC}]\e[$below • Install BBR\e[m"
echo -e "   [\e[$number 06${NC}]\e[$below • Backup Vps           ${NC}[\e[$number 15${NC}]\e[$below • ON/OF Auto Reboot\e[m"
echo -e "   [\e[$number 07${NC}]\e[$below • Autobackup Vps       ${NC}[\e[$number 16${NC}]\e[$below • Change Password VPS\e[m"
echo -e "   [\e[$number 08${NC}]\e[$below • Restore Vps          ${NC}[\e[$number 17${NC}]\e[$below • UPDATE SCRIPT\e[m"
echo -e "   [\e[$number 09${NC}]\e[$below • Install Webmin\e[m"   
echo -e "\e[$line"
echo -e "              Press [ x ] To Go Main Menu " | lolcat
echo -e "\e[$line"
read -p "    Please Input Number  [1-17 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
dns
;;
4)
nf
;;
5)
panel-domain
;;
6)
backup
;;
7)
autobackup
;;
8)
restore
;;
9)
wbmn
;;
10)
limit-speed
;;
11)
restart
;;
12)
speedtest
;;
13)
info
;;
14)
bbr
;;
15)
autoreboot
;;
16)
passwd
;;
17)
update
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
