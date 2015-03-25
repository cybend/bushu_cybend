#!/bin/sh
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

Now=$(date +%Y%m%d)
Release_Dir="/Release"

if [ -d "$Release_Dir" ] ;then

        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m Release文件夹已经存在，不需要创建! \033[0m"
        sleep 10

else

        mkdir /Release
        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m /Release文件夹创建成功! \033[0m"
        sleep 10

fi

tar zcvf /Release/server.ver$Now.tar.gz  /soserver
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 打包成功! \033[0m"
sleep 10


scp /Release/server.ver$Now.tar.gz  root@ip:/Release/
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m 部署包成功传送到目标服务器! \033[0m"
sleep 10

