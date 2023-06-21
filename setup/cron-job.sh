#!/bin/bash

# Define the cron job command
cron_job="*/1 * * * * /home/ubuntu/apache-check.sh"

0 2 * * * /home/ubuntu/domain_renew.sh


# Add the cron job to the cron table
(crontab -l ; echo "$cron_job") | crontab -
