#!/bin/bash

install_and_deploy_docker() {
    echo "🐳  Starting Docker Setup and NGINX Deployment..."

    # --- INSTALL DOCKER ---
    if ! command -v docker &> /dev/null; then
        echo "Docker not found. Installing now..."
        # Use the official Docker convenience script
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        # Add the current user to the docker group
        sudo usermod -aG docker "$USER"
        echo "✅ Docker installed. You may need to log out and back in for group changes to take effect."
    else
        echo "Docker is already installed."
    fi

    # --- INSTALL DOCKER COMPOSE ---
    if ! command -v docker-compose &> /dev/null; then
        echo "Docker Compose not found. Installing now..."
        # Install Docker Compose from GitHub releases
        LATEST_COMPOSE=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
        sudo curl -L "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        echo "✅ Docker Compose installed."
    else
        echo "Docker Compose is already installed."
    fi

    # --- DEPLOY NGINX CONTAINER ---
    if [ ! -f "compose-files/nginx.yml" ]; then
        echo "❌ Error: compose-files/nginx.yml not found! Cannot deploy NGINX."
        return 1
    fi

    echo "Deploying NGINX container..."
    docker-compose -f compose-files/nginx.yml up -d

    echo "✅ NGINX container has been started!"
    echo "You can access it by visiting: http://$(curl -s ifconfig.me)"
}
