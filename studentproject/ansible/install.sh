
sudo apt update

sudo add-apt-repository -y ppa:ansible/ansible
sudo apt update

sudo apt install ansible -y

sudo apt install python3-pip
pip3 install ansible -y

sudo apt install ansible-core -y
sudo apt install ansible -y
ansible-galaxy collection install amazon.aws
pip3 install boto3

sudo cd /etc/ansible
# sudo nano ansible.cfg

ansible_cfg_path="/etc/ansible/ansible.cfg"

# Check if the file exists
if [ -f "$ansible_cfg_path" ]; then
  # Append the lines to the file
  echo "[inventory]" >> "$ansible_cfg_path"
  echo "enable_plugins = aws.ec2" >> "$ansible_cfg_path"
  
fi


sudo cd /opt
sudo touch aws_ec2.yaml
yaml="/opt/aws_ec2.yaml"

# Check if the file exists
if [ -f "$yaml" ]; then
  # Append the lines to the file
  echo "plugin: aws_ec2" >> "$yaml"
  echo "regions:
         - af-south-1" >> "$yaml"
  
fi

sudo ansible-inventory -i /opt/aws_ec2.yaml