ssh ubuntu@172.31.57.16 '
sudo apt install mysql-server mysql-client -y
sudo chmod 777 -R /etc/mysql/
sudo echo "
bind-address  	=172.31.57.16
server-id	 =3
log_bin = /var/log/mysql/mysql-bin.log
log_bin_index =/var/log/mysql/mysql-bin.log.index
relay_log = /var/log/mysql/mysql-relay-bin
relay_log_index = /var/log/mysql/mysql-relay-bin.index " >> /etc/mysql/mysql.conf.d/mysqld.cnf 
sudo systemctl restart mysql
sudo systemctl status mysql
'