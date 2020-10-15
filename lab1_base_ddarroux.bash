#!/bin/bash
#This is a script created by D.Darroux
#Intended to display & save information from Linux Systems
#9/27/2020
# - Host Info:
echo ""
echo -e "\e[31;43m****** Host Info *****\e[0m"
hostnamectl
echo ""
echo -e "\e[44m Is SE Linux Enabled\e[0m"
sestatus | grep "SELinux status"
echo ""
echo -e "\e[44m OS Install Date\e[0m"
rpm -qi basesystem | grep "Install Date"
echo ""
echo -e "\e[44m Current Active Users\e[0m"
cat /etc/passwd | grep home
echo ""
echo ""

#- Hardware Details:
echo -e "\e[31;43m***** Hardware Info *****\e[0m"
echo ""
echo -e "\e[44m*** CPU Details ***\e[0m"
lscpu
echo ""
echo -e "\e[44m*** Device Details ***\e[0m"
lspci
echo ""
echo -e "\e[44m*** USB Details ***\e[0m"
lsusb
echo ""
echo -e "\e[44m*** Free and Used Space ***\e[0m"
df -h
echo ""
echo -e "\e[44m*** Free and Used Memory ***\e[0m"
free
echo ""

#- Software Details:
#Packages,Services,Repo

echo -e "\e[31;43m***** Software Info *****\e[0m"
echo ""
echo -e "\e[44m*** Current Active Repo's ***\e[0m"
yum repolist enabled
echo ""
echo -e "\e[44m*** Packages installed ***\e[0m"
rpm -qa | wc -l
echo ""
echo -e "\e[44m*** Names ***\e[0m"
yum list installed
echo ""
echo -e "\e[44m*** Services Installed ***\e[0m"
systemctl --type=service
echo ""
echo -e "\e[44m*** Services Currently Active ***\e[0m"
systemctl --type=service --state=active
echo ""

#Network Information
#IP,Devices,Firewall,etc
echo -e "\e[31;43m***** Network Info *****\e[0m"
echo ""
echo -e "\e[44m*** Network devices ***\e[0m"
ip link show
echo ""
echo ""
echo -e "\e[44m*** IP Info ***\e[0m"
ip -4 a
echo ""
echo ""
echo -e "\e[44m*** Firewall Info ***\e[0m"
firewall-cmd --list-all
echo ""
echo ""
echo -e "\e[44m*** DNS Info ***\e[0m"
cat /etc/resolv.conf
echo""
echo""
echo -e "\e[44m*** Routing Table ***\e[0m"
ip r
echo""
echo""
echo -e "\e[44m*** HTTP Server Port ***\e[0m"
systemctl status httpd
echo""
echo""

#Log Files
echo -e "\e[31;43m***** Logs Info *****\e[0m"
echo""
echo -e "\e[44m*** Log sizes ***\e[0m"
ls -l /var/log/boot.log
ls -l /var/log/messages
ls -l /var/log/lastlog
ls -l /var/log/secure
ls -l /var/log/maillog
ls -l /var/log/dnf.log
ls -l /var/log/wtmp
ls -l /var/log/btmp

