# Version:cybendywauto-php-1.0
# By cybend
# Title:自动化部署php环境
# ver:1.0
# ubuntu 12.04


echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术游戏服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

cp /etc/apt/sources.list   /etc/apt/sources.list.bak
rm -rf /etc/apt/sources.list
wget -P  /etc/apt/   http://cybend.com/bushu/php/12.04/sources.list
echo  "\033[44;37m     sources.list 更新完毕 \033[0m"
sleep 10


sudo apt-get -y update
echo  "\033[44;37m     update完毕 \033[0m"
sleep 10
sudo apt-get -y install make
sudo apt-get -y install build-essential 
echo  "\033[44;37m     build-essential完毕 \033[0m"
sleep 10
sudo apt-get -y install openssl libssl-dev libperl-dev
echo  "\033[44;37m     openssl libssl-dev libperl-dev完毕 \033[0m"
sleep 10

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  准备包安装完成！ \033[0m"
sleep 10


if [ -s pcre-8.35.tar.gz ]; then  
		echo "\033[41;37m pcre-8.35.tar.gz文件已存在！ \033[0m"  
      else  
  		echo "pcre-8.35.tar.gz!!!下载中......"  
  		sudo wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.35.tar.gz
fi 


echo ed58bcbe54d3b1d59e9f5415ef45ce1c > pcre.1
md5sum pcre-8.35.tar.gz|cut -d ' ' -f1 >pcre.2

if [ -z "`diff pcre.1 pcre.2`" ] ;then
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	        echo "\033[41;37m 下载pcre文件MD5校验通过！ \033[0m"

	else
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        	echo "\033[41;37m pcre文件MD5校验不通过安装进程停止！ \033[0m"

	        exit 1
	fi

tar zxvf  pcre-8.35.tar.gz
cd  pcre-8.35
./configure  
make  
make install

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  pcre安装完成！ \033[0m"
sleep 10


if [ -s nginx-1.6.1.tar.gz ]; then  
		echo "\033[41;37m nginx-1.6.1.tar.gz文件已存在！ \033[0m"  
      else  
  		echo "nginx-1.6.1.tar.gz!!!下载中......"  
  		wget http://nginx.org/download/nginx-1.6.1.tar.gz
fi 


echo 45e5a11f48b001644676f7767980a2bf > nginx.1
md5sum nginx-1.6.1.tar.gz|cut -d ' ' -f1 >nginx.2

if [ -z "`diff nginx.1 nginx.2`" ] ;then
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	        echo "\033[41;37m 下载nginx文件MD5校验通过！ \033[0m"

	else
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        	echo "\033[41;37m nginx文件MD5校验不通过安装进程停止！ \033[0m"

	        exit 1
	fi


tar zxvf nginx-1.6.1.tar.gz
cd nginx-1.6.1
./configure
make 
make install

rm -rf /usr/local/nginx/conf/nginx.conf
wget -P /usr/local/nginx/conf/  http://cybend.com/bushu/php/nginx.conf

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  nginx安装完成！ \033[0m"
sleep 10

mkdir /opt/www
echo "<?php phpinfo (); ?>"  >> /opt/www/test.php
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  测试目录和文件test.php建立完成！ \033[0m"
sleep 10

apt-get -y install php5-fpm
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  php5-fpm安装完成！ \033[0m"
sleep 10

apt-get -y install php5-cgi php5-mysql php5-curl php5-gd php5-idn php-pear php5-imagick php5-imap php5-mcrypt  
apt-get -y install php5-memcache php5-mhash php5-ming php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-cli
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  php相关插件安装完成！ \033[0m"
sleep 10


/usr/local/nginx/sbin/nginx

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 开始修改rc.local启动文件！ \033[0m"

sleep 10
sed '/exit/d' /etc/rc.local >/etc/rc.local.2
echo "\033[41;37m 删除exit 0！ \033[0m"

sleep 10
> /etc/rc.local
echo "\033[41;37m 清空rc.local！ \033[0m"


sleep 10
cat /etc/rc.local.2 > /etc/rc.local
echo "\033[41;37m 还原rc.local！ \033[0m"


echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
sleep 10
rm -rf /etc/rc.local.2
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 修改rc.local文件完毕！ \033[0m"



echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  php环境部署完成！ \033[0m"
ps -ef |grep nginx
