# setup with a subdomain 

# Configure the hosts
nano /etc/hosts

# insert
172.31.14.30 panel.disastercustomerservicesba.org


# Configure the hostname
nano /etc/hostname

# insert 
panel.disastercustomerservicesba.org

# Finally, reboot the server to apply the change:

# Log in again and check if the hostname is correct now with these commands:

root@panel:~$ hostname
disastercustomerservicesba.org

root@panel:~$ hostname -f
panel.disastercustomerservicesba.org

# Update the system
apt update && apt upgrade

# Install ISPConfig with Apache web server
wget -O - https://get.ispconfig.org | sh -s -- --use-ftp-ports=40110-40210 --unattended-upgrades

# Install ISPConfig with Nginx web server
wget -O - https://get.ispconfig.org | sh -s -- --use-nginx --use-ftp-ports=40110-40210 --unattended-upgrades


# [INFO] Your ISPConfig admin password is: 5GvfSSSYsdfdYC
# [INFO] Your MySQL root password is: kkAkft82d!kafMwqxdtYs


#  Setting up the firewall
TCP:

20,21,22,25,80,443,40110:40210,110,143,465,587,993,995,53,8080,8081
UDP:

53

# Your server is now set up and ready for use. You can log in at https://panel.disastercustomerservicesba.org:8080

