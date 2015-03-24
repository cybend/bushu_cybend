# Version:cybendywauto-pomelo-1.0
# By cybend
# Title:自动化部署POMELO环境
# ver:1.1

echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m     【By 采贝技术运维团队】 \033[0m"

sudo apt-get -y update
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m apt-get update finish! \033[0m"
sudo apt-get -y install g++ curl libssl-dev apache2-utils git-core  sysstat build-essential
echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  other apt-get finish! \033[0m"

Node_File="/usr/local/bin/node"

if [ -f "$Node_File" ] ; then

	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m node已安装! \033[0m"
	sleep 10

else

	
	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m nodejs未安装! \033[0m"
	sleep 10
        
        if [ -s node-v0.10.31.tar.gz ]; then  
		echo "\033[41;37m node-v0.10.31.tar.gz文件已存在！ \033[0m"  
        else  
  		echo "node-v0.10.31.tar.gz!!!下载中......"  
  		wget http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz
                echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
		echo "\033[41;37m download nodes finish! \033[0m"
        fi
        

	echo 1b65fe749f8e542a56a71af2b8c3a74a > nodemd5.1

	md5sum node-v0.10.31.tar.gz|cut -d ' ' -f1 >nodemd5.2


	if [ -z "`diff nodemd5.1 nodemd5.2`" ] ;then
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	        echo "\033[41;37m 下载文件MD5校验通过！ \033[0m"

	else
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        	echo "\033[41;37m 文件MD5校验不通过安装进程停止！ \033[0m"

	        exit 1
	fi



	tar -zxvf node-v0.10.31.tar.gz
	cd node-v0.10.31
	./configure
	sudo make
	sudo make install

	echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	echo "\033[41;37m nodejs install finish! \033[0m"


	echo v0.10.31 > node.1
	node -v > node.2


	if [ -z "`diff node.1 node.2`" ] ;then
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	        echo "\033[41;37m 经检测Nodejs 安装成功！ \033[0m"

	else
	        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
	        echo "\033[41;37m 经检测Nodejs 安装不成功！安装进程停止！ \033[0m"

	        exit 1
	fi
fi






npm install -g pomelo

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m pomelo install finish! \033[0m"




pomelo -V  > pomelo.2


if [ -s pomelo.2 ] ;then
        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m 经检测POMELO 安装成功！ \033[0m"

else
        echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
        echo "\033[41;37m 经检测POMELO 安装不成功！安装进程停止！ \033[0m"

        exit 1
fi


npm install  express

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m express install finish! \033[0m"

npm update

echo  "\033[44;37m 采贝技术运维团队提示： \033[0m"
echo "\033[41;37m  npm update  finish! \033[0m"


echo  "\033[44;37m ================================ \033[0m"
echo  "\033[44;37m 采贝技术服务器自动化部署平台 \033[0m"
echo  "\033[44;37m            部署完毕！ \033[0m"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
