#!/bin/bash

# Check Apache status
  if ! pgrep apache2 >/dev/null; then
    # echo "Apache is not running. Restarting..."
    sudo service apache2 start
  else
    # echo "Apache is running."
  fi
