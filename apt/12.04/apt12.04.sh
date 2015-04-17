# Version:cybendywauto-apt-1.0
# By cybend
# Title:自动化部署apt环境
# ver:1.0
# ubuntu 12.04

echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

cp /etc/apt/sources.list   /etc/apt/sources.list.cybendbak
rm -rf /etc/apt/sources.list
wget -P  /etc/apt/   http://bushu.cybend.com/php/12.04/sources.list
apt-get update
echo  "\033[44;37m     sources.list 更新完毕 \033[0m"
sleep 10
