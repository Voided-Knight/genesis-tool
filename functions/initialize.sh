#!/bin/bash

initialize_server() {
    echo "🚀 Starting Server Initialization..."
    
    # --- SYSTEM UPDATE ---
    sudo apt-get update && sudo apt-get upgrade -y

    # # --- SET HOSTNAME ---
    # read -p "Enter a new hostname for this server (e.g., web-prod): " NEW_HOSTNAME
    # if [[ -n "$NEW_HOSTNAME" ]]; then
    #     sudo hostnamectl set-hostname "$NEW_HOSTNAME"
    #     echo "✅ Hostname set to '$NEW_HOSTNAME'."
    # fi

    # # --- SET TIMEZONE ---
    # sudo timedatectl set-timezone "Asia/Kolkata"
    # echo "✅ Timezone set to Asia/Kolkata."

    # # --- INSTALL ESSENTIALS ---
    # echo "Installing essential packages (curl, wget, git, ufw, fail2ban, htop, unzip)..."
    # sudo apt-get install -y curl wget git tmux ufw fail2ban htop unzip

    # # --- CREATE NEW SUDO USER ---
    # read -p "Enter username for the new sudo user: " NEW_USER
    # if [[ -z "$NEW_USER" ]]; then
    #     echo "Username cannot be empty. Aborting user creation."
    #     return 1
    # fi
    
    # sudo adduser --disabled-password --gecos "" "$NEW_USER"
    # sudo usermod -aG sudo "$NEW_USER"

    # # --- COPY SSH KEY ---
    # # This is the new, critical step. It copies the SSH key from root to the new user.
    # echo "🔑 Copying SSH key to new user..."
    # rsync --archive --chown=$NEW_USER:$NEW_USER /root/.ssh /home/$NEW_USER
    
    # echo "✅ Initialization complete! New user '$NEW_USER' has been created."
    # echo "✅ Your SSH key has been copied. You can now log in as '$NEW_USER'."

    echo "" # Add a blank line for spacing
    read -p "Press any key to return to the menu..." -n 1 -s
    echo "" # Add another blank line
} # This is the closing brace
