# this will start our file both on reboot and start-up

# Create a systemd service unit:

# Create a file, for example, /etc/systemd/system/restart_listener.service, and add the following content:

[Unit]
Description=Restart Baby Listener

[Service]
Type=simple
ExecStart=/var/auto-run.sh
# ExecStart=/home/ubuntu/script2.sh


[Install]
WantedBy=multi-user.target

# Replace /home/ubuntu/script.sh with the actual path to your script.

# Enable and start the service:

# sudo systemctl enable restart_listener.service
# sudo systemctl start restart_listener.service
