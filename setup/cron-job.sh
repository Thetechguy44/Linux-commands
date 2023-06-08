#!/bin/bash

# Define the cron job command
cron_job="*/1 * * * * /home/ubuntu/apache-check.sh"

# Add the cron job to the cron table
(crontab -l ; echo "$cron_job") | crontab -
