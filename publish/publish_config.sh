#!/bin/sh
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术游戏服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

Init_File="/etc/init.d/cybnednodejs"
Backup_Dir="/backup"
Now=$(date +%Y%m%d)

if [ -d "$Backup_Dir" ] ; then

	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m backup文件夹已经存在，不需要创建! \033[0m"
	sleep 10



else

	mkdir /backup
	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m /backup文件夹创建成功! \033[0m"
	sleep 10

fi

mkdir /backup/ver$Now
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 备份目录建立成功! \033[0m"
sleep 10

tar zcvf /backup/ver$Now/server.bak.ver$Now.tar.gz  /soserver
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 备份旧文件成功! \033[0m"
sleep 10

rm -rf /server
tar zxvf /Release/server.ver$Now.tar.gz -C  /
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 解压成功! \033[0m"
sleep 10


if [ -f "$Init_File" ] ; then

	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m 自动启动脚本已存在! \033[0m"
	sleep 10

else

	wget -P /etc/init.d/  http://cybend.com/bushu/initd/cybendnodejs
	chmod 777 /etc/init.d/tqknodejs
	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m 自动启动脚本制作成功! \033[0m"
	sleep 10

fi
 
/etc/init.d/cybendnodejs start
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 启动成功! \033[0m"
sleep 10


ps -ef |grep node

