# bushu_cybend
采贝自动化部署平台 v1.0.1

1.将/bushu_cybend的文件部署到一个站点下面，能支持静态页面的站点即可。
+2.在linu平台下，命令界面输入：  curl http://站点的ip或域名/cybend
+将会显示以下部署向导界面【注意需要手工修改/bushu_cybend/cybend文件中的cybend.com为自己的ip或域名】：
+
+echo  "\033[44;37m ================================================ \033[0m"
+echo  "\033[44;37m 欢迎使用【采贝技术服务器自动化部署平台】v1.0 \033[0m"
+echo  "\033[44;37m ================================================ \033[0m"
+echo  "\033[44;37m               【By 采贝技术运维团队】 \033[0m"
+
+
+cat <<EOF
+                                   【部署向导：】
+        ======================================================================= 
+        1.redis(v2.8.13)环境部署地址：
+        curl http://站点的ip或域名/redis/redis.sh | sh 
+
+        2.Pomelo(v1.1.0) Nodejs(v0.10.31)环境部署地址: 
+        curl http://站点的ip或域名/pomelo/pomelo.sh | sh 
+
+        3.mysql percona-server-5.6环境部署地址: 
+        curl http://站点的ip或域名/mysql/mysqlpercona.sh | sh 
+
+        4.PHP 5.5 nginx-1.6.1环境脚本(Ubuntu12.04) 
+        curl http://站点的ip或域名/php/php12.04.sh | sh 
+
+        5.PHP 5.5 nginx-1.6.1环境脚本(Ubuntu14.04) 
+        curl http://站点的ip或域名/php/php14.04.sh | sh
+ 
+        6.sourceslist(东北大学源|阿里云提供)更新脚本(Ubuntu12.04) 
+        curl http://站点的ip或域名/apt/12.04/apt12.04.sh | sh 
+
+        7.sourceslist(东北大学源|阿里云提供)更新脚本(Ubuntu14.04) 
+        curl http://站点的ip或域名/apt/14.04/apt14.04.sh | sh 
+
+        8.puppet server 自动化部署服务端
+        curl http://站点的ip或域名/puppet/puppet-server.sh | sh
+
+        9.puppet client 自动化部署客户端
+        curl http://站点的ip或域名/puppet/puppet-client.sh | sh
+
+        =======================================================================
+EOF
+
+
+3.根据自己的需求，选择进行部署。
+例如部署：redis环境，在linux环境命令界面输入curl http://站点的ip或域名/redis/redis.sh | sh
+
+
+【 如果自己不想增加服务器部署，可以在自己的linux服务器上直接用采贝提供的开发部署平台：curl http://bushu.cybend.com/cybend  】
