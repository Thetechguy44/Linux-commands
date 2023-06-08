#!/bin/bash


# github-ssh file
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/github-ssh.sh
sudo chmod +x github-ssh.sh
sudo ./github-ssh.sh

# installation file
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/install.sh
sudo chmod +x install.sh
sudo ./install.sh

# php config updated
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/update_php_ini_file.sh
sudo chmod +x update_php_ini_file.sh 
sudo ./update_php_ini_file.sh 

# Apache2 site-available config
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/config.sh
sudo chmod +x config.sh 
sudo ./config.sh


# Apache2 check
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/apache-check.sh
sudo chmod +x apache-check.sh 
# sudo mv apache-check.sh /home/ubuntu/apache-check.sh
# sudo cd /home/ubuntu
# sudo chmod +x apache-check.sh 

# cron-job setup   
# crontab -e  [code to check file]
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/cron-job.sh
sudo chmod +x cron-job.sh 
#sudo su
sudo ./cron-job.sh




#!/bin/bash

# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/pull.sh
# sudo chmod +x pull.sh
# sudo ./pull.sh