# create IAM ROLE
# Permissions policies 
-CloudWatchAgentAdminPolicy



# Steps to install and configure cloudwatch agent 

wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
# apache log dir
 /var/log/apache2/access.log
# OR
 /var/log/nginx/access.log

# Do you want to specify any additional log files to monitor?
 /var/log/apache2/error.log
 # OR 
 /var/log/nginx/error.log

# Do you want to specify any additional log files to monitor?
/var/www/html/update/storage/logs/laravel.log
# To check configuration file 
cat /opt/aws/amazon-cloudwatch-agent/bin/config.json

sudo apt-get update -y
sudo apt-get install collectd -y
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status