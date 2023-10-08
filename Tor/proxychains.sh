#install 
sudo apt-get install proxychains -y
sudo apt-get install tor

#configure 
sudo nano /etc/proxychains.conf

#use port :9050
proxychains wget http://example.com/file.zip
proxychains curl https://www.whatismyip.com/

#enable tor.service
sudo systemctl enable tor.service

#start tor.service
sudo systemctl start tor.service

#using a python script
proxychains python3 your_script.py
