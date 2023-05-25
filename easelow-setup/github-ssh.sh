#!/bin/bash

# connect with github
sudo wget https://github.com/Incrisz/Linux-commands/raw/main/ssh/id_ed25519
sudo chmod 600 id_ed25519
sudo mv id_ed25519 /root/.ssh/id_ed25519
sudo ssh -o StrictHostKeyChecking=no -T git@github.com



# Generate SSH Key Pair:

# Open a terminal or command prompt on your local machine.
# Run the following command to generate a new SSH key pair:
# mathematica

# ssh-keygen -t ed25519 -C "your_email@example.com"
# Press Enter to accept the default file location and name.
# You can optionally set a passphrase for your SSH key. It adds an extra layer of security but is optional.
# The command will generate two files: id_ed25519 (private key) and id_ed25519.pub (public key).
# Add SSH Key to SSH Agent:

# Start the SSH agent by running the following command:
# bash

# eval "$(ssh-agent -s)"
# Add your SSH private key to the agent by running the following command:


# ssh-add ~/.ssh/id_ed25519
# If you set a passphrase during key generation, you will be prompted to enter it.
# Add SSH Public Key to GitHub:

# Log in to your GitHub account.
# Go to "Settings" by clicking on your profile picture in the top-right corner of the GitHub interface.
# In the left sidebar, click on "SSH and GPG keys".
# Click on the "New SSH key" button.
# Give your SSH key a meaningful title (e.g., "My SSH Key").
# Open the id_ed25519.pub file in a text editor and copy its contents.
# Paste the copied SSH public key into the "Key" field on the GitHub website.
# Click the "Add SSH key" button to save the key.
# Test SSH Connection:

# In your terminal or command prompt, run the following command to test the SSH connection to GitHub:


# ssh -T git@github.com
# You may see a message asking you to confirm the authenticity of the host. Type "yes" to continue.
# If the SSH connection is successful, you will see a message like:


# Hi username! You've successfully authenticated...
# That's it! You have now set up SSH in GitHub, and you can use SSH URLs to clone and interact with repositories without entering your username and password each time.