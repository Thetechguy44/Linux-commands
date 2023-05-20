#!/bin/bash

sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/install.sh 
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/update_php_ini_file.sh 
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/env.sh 


sudo chmod +x env.sh
sudo ./env.sh

sudo chmod +x install.sh
sudo ./install.sh

sudo chmod +x update_php_ini_file.sh 
sudo ./update_php_ini_file.sh 


# sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/pull.sh 

# sudo chmod +x pull.sh
# sudo ./pull.sh