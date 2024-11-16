#!/bin/bash

# Check Installation
which cloudflared

# If it returns nothing, proceed to install it.

#  Install cloudflared
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64

# Move it to /usr/local/bin:
sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared

# Make it executable:
sudo chmod +x /usr/local/bin/cloudflared

# Verify Installation
cloudflared --version

# Run your command to make you localhost live e.g localhost:3000
cloudflared tunnel --url localhost:3000
