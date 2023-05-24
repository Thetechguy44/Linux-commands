#!/bin/bash


# installation file
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/install.sh
sudo chmod +x install.sh
sudo ./install.sh

# php config updated
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/update_php_ini_file.sh 
sudo chmod +x update_php_ini_file.sh 
sudo ./update_php_ini_file.sh 

# Apache2 site-available config
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/config.sh 
sudo chmod +x config.sh 
sudo ./config.sh




#!/bin/bash

# sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/pull.sh 

# sudo chmod +x pull.sh
# sudo ./pull.sh