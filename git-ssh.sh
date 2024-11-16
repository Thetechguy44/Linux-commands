#!/bin/bash

# 1. Generate a new SSH key (if needed): If you don't have an SSH key, generate one using:
    ssh-keygen -t ed25519 -C "your_email@example.com"
    
# Follow the prompts to save the key to the default location and set a passphrase if desired.

# 2. Add your SSH key to the ssh-agent: Start the ssh-agent in the background and add your SSH key:
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

# 3. Add the SSH key to your GitHub account: Copy your SSH key to the clipboard:
    cat ~/.ssh/id_ed25519.pub

# 4. Then, go to GitHub:
#     Navigate to your GitHub account settings.
#     Go to SSH and GPG keys.
#     Click on New SSH key, give it a title, and paste the key from your clipboard.

# 5. Test SSH connection to GitHub: Verify that your SSH key is properly configured:
    ssh -T git@github.com

# 6. You should see a success message like:
    # Hi username! You've successfully authenticated, but GitHub does not provide shell access.
