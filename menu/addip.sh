#!/bin/bash
version=$(cat /home/ver)
# // Export Color & Information
export WH='\033[1;37m'                   
export RED='\033[0;31m'
export GRN='\033[0;32m'
export YLW='\033[0;33m'
export BLU='\033[0;34m'
export PLE='\033[0;35m'
export CYA='\033[0;36m'
export LHT='\033[0;37m'
export NC='\033[0m'
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  VLESS TCP XTLS
xtls=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trx " "/usr/local/etc/xray/tcp.json")
# TOTAL ACC CREATE  TROJAN WS TLS
trws=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
tokengit=$(cat /etc/adminip/access.conf)
MYIP=$(wget -qO- ipinfo.io/ip);
adminip=$( curl -sS https://raw.githubusercontent.com/cakill26/allow/main/accessmenu | grep $MYIP )
if [ $adminip = $MYIP ]; then
echo -e "${green}Permission Accepted...${NC}"
else
rm -rf addip.sh
clear
echo -e "${red}Permission Denied!${NC}";
echo "OWNER AREA ONLY"
exit 0
fi

setadmin() {
#isi link git
linkinstall="https://raw.githubusercontent.com/namagit/git-repo/main"
rm -rf /etc/adminip/
mkdir -p /etc/adminip
read -p "INPUT OWNER ACCESS TOKEN CODE " ans
echo -e "$ans" >> /etc/adminip/access.conf
wget -O /usr/bin/xp-ip ${linkinstall}/xp-ip.sh && chmod +x /usr/bin/xp-ip
clear
sed -i "/^# IPREGBEGIN_EXP/,/^# IPREGEND_EXPIP/d" /etc/crontab
cat << EOF >> /etc/crontab
# IPREGBEGIN_EXP
1 0 * * * root /usr/bin/xp-ip # delete expired IP VPS License
# IPREGEND_EXPIP
EOF
rm -f /root/.bash_history
sleep 2
echo " Setelah Selesai type menu-admin untuk access"
}

add-ip() {
if [ -z $tokengit]; then
echo -e "[ ${green}INFO${NC} ] Please Set IP ADMIN FIRST!!!"
sleep 3
clear
exit 0
fi
clear
rm -rf /root/allow
read -p " - IP VPS      : " daftar
echo -e "[ ${Lyellow}INFO${NC} ] Checking the IPVPS if Already Registered"
sleep 1
cek=$( curl -sS https://raw.githubusercontent.com/cakill26/allow/main/ipvps.conf | awk '{print $5}' | grep $daftar )
if [[ $daftar = $cek ]]; then
echo -e "\e[1;31m The IP VPS Has Been Registered\e[0m"
sleep 2
exit
else
echo -e "IP VPS is not Registered, Permission Accepted.."
fi
clear
echo -e "1) Lifetime ID" 
echo -e "2) Sewa / Had Masa"
read -p "Sila Pilih : " jawab
if [ "$jawab" = "1" ]; then
read -p " - Client Name: " client 
read -p " - Client ID : " id
exp=LIFETIME
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo "### $client $id $exp $daftar" >> /root/data
elif [ "$jawab" = "2" ]; then
read -p " - Client Name: " client 
read -p " - Client ID : " id
read -p " - masa aktif : " exp
exp=`date -d "$exp days" +"%Y-%m-%d"`
hariini=`date -d "0 days" +"%Y-%m-%d"`
echo "### $client $id $exp $daftar" >> /root/data
else
clear
echo "PLEASE INPUT OPTION NUMBER!!!!"
add-ip
fi

daftarip=$(cat /root/data)
rm -rf /root/allow
git config --global user.email "alifgaming9546@gmail.com"
git config --global user.name "Internetvps"
git clone https://github.com/Internetvps/allow.git
mkdir /root/allow
cd /root/allow/
rm -rf .git
git init
touch ipvps.conf
echo "$daftarip" >> /root/allow/ipvps.conf
echo -e "Client IP VPS Add Successfully"
git init >/dev/null 2>&1
git add .
git commit -m register
git branch -M main
git remote add origin https://github.com/Internetvps/allow.git
git push -f https://${tokengit}@github.com/Internetvps/allow.git
echo -e "IPVPS Registration Completed"
sleep 1
links1="apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot"
links2="apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && sleep 2 && reboot"
links3="sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/cakill26/lanjut/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh"
clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "            ${WH} Client IP VPS Add ${GRN}Successfully\033[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo "  Ip VPS        : $daftar"
echo "  Order ID      : $id"
echo "  Register Date : $hariini"
echo "  Expired Date  : $exp"
echo "  Client Name   : $client"
echo "  Script Ver    : $version"
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
echo " Update & Upgrade First Your VPS for Debian 10 & 11: "
echo ""
echo -e '' ${links1}''
echo ""
echo " Update & Upgrade First Your VPS for Ubuntu 18.04 & 20.04:"
echo ""
echo -e '' ${links2}''
echo ""
echo "  Link Script 	: "
echo ""
echo -e '' ${links3}''
echo ""
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "            ${WH}     Nota BY JSphantom\033[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo -e " [ Info ] Siapkan email cloud flare untuk cert xray  "
echo -e " [ Info ] Pastikan domain anda sudah pointing di CF "
echo -e "          sblm install  "
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
echo ""
read -n 1 -s -r -p "Press any key to back on menu-addip"
addip
}

del-ip() {
if [ -z $tokengit]; then
echo -e "[ ${green}INFO${NC} ] Please Set IP ADMIN FIRST!!!"
sleep 3
clear
exit 0
fi
clear
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
git config --global user.email "alifgaming9546@gmail.com"
git config --global user.name "Internetvps"
git clone https://github.com/Internetvps/allow.git
mkdir /root/allow
cd /root/allow/
rm -rf .git
git init
touch ipvps.conf
echo -e "[ ${Lyellow}INFO${NC} ] Checking list.."
clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "          ${WH} Delete User IP VPS Registered     \033[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
echo -e "    No.     USER      EXP DATE    IPVPS"
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 2-5 | nl -s '. '
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
read -rp " Please Input Number : " nombor 
client=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 2 | sed -n "${nombor}"p)
id=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 3 | sed -n "${nombor}"p)
exp=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 4 | sed -n "${nombor}"p)
daftar=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 5 | sed -n "${nombor}"p)
sed -i '/^### '$client' '$id' '$exp' '$daftar'/d' /root/allow/ipvps.conf
git init >/dev/null 2>&1
git add .
git commit -m delete
git branch -M main
git remote add origin https://github.com/Internetvps/allow.git
git push -f https://${tokengit}@github.com/Internetvps/allow.git
clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo " ${WH} Client IP Deleted Successfully"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo " Ip VPS       : $daftar"
echo " Order ID     : $id"
echo " Expired Date : $exp"
echo " Client Name  : $client"
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
echo ""
read -n 1 -s -r -p "Press any key to back on menu-addip"
addip
}

renew-ip() {
if [ -z $tokengit]; then
echo -e "[ ${green}INFO${NC} ] Please Set IP ADMIN FIRST!!!"
sleep 3
clear
exit 0
fi
clear
rm -rf /root/allow
git config --global user.email "alifgaming9546@gmail.com"
git config --global user.name "Internetvps"
git clone https://github.com/Internetvps/allow.git
  mkdir /root/allow
  cd /root/allow/
  rm -rf .git
git init
  touch ipvps.conf
echo -e "[ ${Lyellow}INFO${NC} ] Checking list.."
clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${WH}          Renew User IP VPS Registered      \E[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/allow/ipvps.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
		exit 1
	fi
	clear
	echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
	echo -e "${WH}          Renew User IP VPS Registered      \E[0m"
	echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
	echo ""
  echo "   Select the existing client you want to renew"
	echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
 grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 2-5 | nl -s '. '
  	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
client=$(grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /root/allow/ipvps.conf
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/Internetvps/allow.git
git push -f https://${tokengit}@github.com/Internetvps/allow.git
echo -e "IPVPS Registration Completed"
  clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${WH}        Client IP VPS Renew Successfully    \E[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo "  Ip VPS        : $user"
echo "  Order ID      : $id"
echo "  Renew Date    : $now"
echo "  Expired Date  : $exp4"
echo "  Client Name   : $client"
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
echo ""
read -n 1 -s -r -p "Press any key to back on menu-addip"
addip
}

cek-ip() {
if [ -z $tokengit]; then
echo -e "[ ${green}INFO${NC} ] Please Set IP ADMIN FIRST!!!"
sleep 3
clear
exit 0
fi
clear
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
git config --global user.email "alifgaming9546@gmail.com"
git config --global user.name "Internetvps"
git clone https://github.com/Internetvps/allow.git
cd /root/allow/
rm -rf .git
git init
touch ipvps.conf
echo -e "[ ${Lyellow}INFO${NC} ] Checking list.."
clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${WH}           List User IP VPS Registered      \E[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
### USER  ID  VALIDITY  IPVPS
echo -e "    No.   CLIENT NAME   EXP DATE   IPVPS"
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
grep -E "^### " "/root/allow/ipvps.conf" | cut -d ' ' -f 2-5 | awk '{print $4,$3,$1}' | nl -s '. ' 
echo -e "\e[$line•─────────────────────────────────────────────────•\033[0m"
rm -rf /root/allow
rm -rf /root/data
rm -rf /root/ipvps.conf
echo ""
read -n 1 -s -r -p "Press any key to back on menu-addip"
addip
}

clear
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${WH}        MENU ADD IP MULTIPORT WS JSphantom  \E[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo ""
echo -e " [\e[36m 01 \e[0m] Add IP"
echo -e " [\e[36m 02 \e[0m] Delete IP"
echo -e " [\e[36m 03 \e[0m] Renew IP"
echo -e " [\e[36m 04 \e[0m] Check User IP"
echo -e " [\e[36m 05 \e[0m] Set Admin IP VPS"
echo ""
echo -e "Press x or [ Ctrl+C ]   To-Exit"
echo -e ""
echo -e "\e[$line┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${WH}          SCRIPT MULTIPORT WS JSphantom     \E[0m"
echo -e "\e[$line└─────────────────────────────────────────────────┘\033[0m"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ip ;;
2) clear ; del-ip ;;
3) clear ; renew-ip ;;
4) clear ; cek-ip ;;
5) clear ; setadmin ;;
x) clear ; menu ;;
*)   
echo -e "\e[1;31mPlease enter an correct number\e[0m"
    sleep 1
    addip
    ;;
esac
