# Version:cybendywauto-redis-1.0
# By cybend
# Title:自动化部署Redis环境

echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

sudo apt-get update
sudo apt-get -y install   tcl build-essential
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m apt-get install tcl build-essential  finish! \033[0m"


wget -P /etc  http://cybend.com/bushu/redis/redis.conf
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m download redis config文件! \033[0m"


if [ -s redis-2.8.13.tar.gz ]; then  
		echo "\033[41;37m redis-2.8.13.tar.gz文件已存在！ \033[0m"  
      else  
  		echo "redis-2.8.13.tar.gz!!!下载中......"  
  		wget http://download.redis.io/releases/redis-2.8.13.tar.gz
fi

mkdir /var/lib/redis
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m download redis finish! \033[0m"

echo  ea92053cbb6f4eb8a4347dbaac7d7dff > md5redis.1

md5sum redis-2.8.13.tar.gz|cut -d ' ' -f1 >md5redis.2


if [ -z "`diff md5redis.1 md5redis.2`" ] ;then
        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m 下载文件MD5校验通过！ \033[0m"

else
        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m 文件MD5校验不通过,或下载不成功，安装进程停止！ \033[0m"

        exit 1
fi

sleep 10

tar  zxvf  redis-2.8.13.tar.gz
mv redis-2.8.13   /opt
cd /opt/redis-2.8.13
make MALLOC=libc
/opt/redis-2.8.13/src/redis-server   /etc/redis.conf
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 启动redis服务器！ \033[0m"


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


echo "/opt/redis-2.8.13/src/redis-server   /etc/redis.conf" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local
sleep 10
rm -rf /etc/rc.local.2
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 修改rc.local文件完毕！ \033[0m"


ps -ef |grep redis
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m            部署完毕！ \033[0m"

