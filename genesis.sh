#!/bin/bash

# Source all function files from the 'functions' directory
# The '.' is a shortcut for the 'source' command.
. functions/initialize.sh
. functions/security.sh
. functions/monitor.sh
. functions/docker.sh

# Welcome message
echo "Welcome to the Genesis Server Tool!"

# Menu options
options=(
    "Initialize Server"
    "Harden Security"
    "Show Health Monitor"
    "Install Docker & Deploy NGINX"
    "Quit"
)

# Main menu loop
PS3="Please select an option: "
select opt in "${options[@]}"; do
    case $opt in
        "Initialize Server")
            initialize_server
            echo "-----------------------------------"
            ;;

        "Harden Security")
            harden_security
            echo "-----------------------------------"
            ;;

        "Show Health Monitor")
            show_health_monitor
            echo "-----------------------------------"
            ;;

        "Install Docker & Deploy NGINX")
            install_and_deploy_docker         
            echo "-----------------------------------"
            ;;

        "Quit")
            echo "Goodbye!"
            break
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done
