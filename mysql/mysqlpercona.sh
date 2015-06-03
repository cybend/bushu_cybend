# Version:cybendywauto-mysql-1.0
# By cybend
# Title:自动化部署mysql percona-server-5.6环境

echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术游戏服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"


apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m apt-key 设置完毕 \033[0m"
sleep 10


#echo deb http://repo.percona.com/apt precise main >> /etc/apt/sources.list
#echo deb-src http://repo.percona.com/apt precise main  >> /etc/apt/sources.list

echo deb http://repo.percona.com/apt trusty main >> /etc/apt/sources.list
echo deb-src http://repo.percona.com/apt trusty main  >> /etc/apt/sources.list
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m sources.list 添加完毕 \033[0m"
sleep 10

apt-get -y  update
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m apt-get update完毕 \033[0m"
sleep 10


apt-get -y  install percona-server-server-5.6 percona-server-client-5.6
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m mysql 安装完毕 \033[0m"

touch /etc/mysql/my.cnf
echo [mysqld] >> /etc/mysql/my.cnf
echo max_connections   = 1000  >> /etc/mysql/my.cnf
echo general_log=ON   >> /etc/mysql/my.cnf
echo low_query_log=ON  >> /etc/mysql/my.cnf
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m my.cnf 配置完毕 \033[0m"
