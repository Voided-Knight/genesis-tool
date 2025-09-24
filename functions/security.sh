#!/bin/bash

harden_security() {
    echo "🛡️  Starting Security Hardening..."

    # --- CONFIGURE FIREWALL (UFW) ---
    echo "Configuring the Uncomplicated Firewall (UFW)..."
    # Deny all incoming traffic by default
    sudo ufw default deny incoming
    # Allow all outgoing traffic by default
    sudo ufw default allow outgoing

    # Allow essential ports
    sudo ufw allow ssh      # Port 22 - CRITICAL for you to log in
    sudo ufw allow http     # Port 80 - For web servers
    sudo ufw allow https    # Port 443 - For secure web servers

    # Enable the firewall without a confirmation prompt
    sudo ufw --force enable
    echo "✅ Firewall has been enabled."

    # --- HARDEN SSH ---
    echo "Hardening SSH configuration..."
    # Disable root login over SSH
    sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    # Restart the SSH service to apply changes
    sudo systemctl restart sshd

    echo "✅ Root login via SSH has been disabled."
    echo "✅ Security hardening complete."

    echo "" # Add a blank line for spacing
    read -p "Press any key to return to the menu..." -n 1 -s
    echo "" # Add another blank line
} # This is the closing brace
