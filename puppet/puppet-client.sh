# Version:cybendywauto-puppet-client-1.0
# By cybend
# Title:自动化部署puppet-client环境


echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术游戏服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

sudo apt-get -y update
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m apt-get update finish! \033[0m"


apt-get -y install ruby

apt-get -y install puppet facter

echo  "\033[44;37m     puppet客户端安装完毕！ \033[0m"
sleep 10

puppet agent --no-daemonize --onetime --verbose --debug --server=server.tqkyunwei.com
echo  "\033[44;37m     puppet客户端向服务端提交验证！ \033[0m"
sleep 10


