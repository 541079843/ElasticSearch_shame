#!/bin/bash

if [ -f /data/www/cronjob/sync_ocl_attachments.lock ]
then
    echo 'is synchronizing files'
else
    echo 'start synchronizing files ...'

    touch /data/www/cronjob/sync_ocl_attachments.lock

    rsync -vzurtopg --progress --delete /data/file/attachments/ www@172.31.17.208::/data/file/attachments/

    rm -f /data/www/cronjob/sync_ocl_attachments.lock

    echo 'synchronizing files end'
fi


CREATE TABLE person111 (number INT(11),name VARCHAR(255),birthday DATE);


sudo mkdir /etc/keepalived
sudo cp /usr/local/keepalived-1.2.2/etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf
sudo cp /usr/local/keepalived-1.2.2/etc/rc.d/init.d/keepalived /etc/init.d/
sudo cp /usr/local/keepalived-1.2.2/etc/sysconfig/keepalived /etc/sysconfig/
sudo cp /usr/local/keepalived-1.2.2/sbin/keepalived /usr/sbin/


#!/bin/sh
/etc/init.d/keepalived stop


mysql -h172.31.26.128 -uroot -p


change master to master_host='172.31.30.75',master_user='root',master_password='q58FT+LUIEoKg8M+',master_log_file='ocl-bin.000005',master_log_pos=5798;


grant replication slave on *.* to 'root'@'172.31.%.%' identified by 'q58FT+LUIEoKg8M+';    

GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.31.%.%' IDENTIFIED BY 'q58FT+LUIEoKg8M+' WITH GRANT OPTION;