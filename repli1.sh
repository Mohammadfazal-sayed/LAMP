ssh ubuntu@172.31.61.212 '
sudo mysql -u root -p
sudo echo "
CREATE USER 'Fazal'@'172.31.57.16' IDENTIFIED BY 'Fazal@7860';
GRANT REPLICATION SLAVE ON *.* TO 'Fazal'@'172.31.57.16';"
SHOW MASTER STATUS\G 
'

ssh ubuntu@172.31.57.16 '
sudo mysql -u root -p
sudo echo " 
STOP SLAVE; 
CHANGE MASTER TO MASTER_HOST ='172.31.61.212', MASTER_USER ='Fazal', MASTER_PASSWORD ='Fazal@7860', MASTER_LOG_FILE = ' mysql-bin.000001', MASTER_LOG_POS = 808;
START SLAVE;
'