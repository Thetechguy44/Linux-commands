#!/bin/bash


# github-ssh file
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/github-ssh.sh
sudo chmod +x github-ssh.sh
sudo ./github-ssh.sh

# installation file
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/nginx/install-nginx.sh
sudo chmod +x install.sh
sudo ./install.sh

# php config updated
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/update_php_ini_file.sh
sudo chmod +x update_php_ini_file.sh 
sudo ./update_php_ini_file.sh 

# Apache2 site-available config
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/nginx/config-nginx.sh
sudo chmod +x config.sh 
sudo ./config.sh







#!/bin/bash

# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/nginx/pull-nginx.sh
# sudo chmod +x pull.sh
# sudo ./pull.sh


# #!/bin/bash

# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/AMI/update.sh
# sudo chmod +x update.sh
# sudo ./update.sh