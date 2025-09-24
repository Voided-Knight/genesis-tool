#!/bin/bash

show_health_monitor() {
    # Check for and install tmux
    if ! command -v tmux &> /dev/null; then
        echo "Installing tmux..."
        sudo apt-get update && sudo apt-get install -y tmux
    fi

    # Check for and install btop
    if ! command -v btop &> /dev/null; then
        echo "Installing btop for advanced monitoring..."
        sudo apt-get install -y snapd
        sudo snap install btop
    fi

    local session_name="btop-monitor"

    # Check if the tmux session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "✅ Found existing btop session. Attaching..."
        sleep 1
        tmux attach-session -t "$session_name"
    else
        echo "🚀 Launching btop in a new tmux session..."
        sleep 1
        # Create a new session, run btop, and attach to it
        tmux new-session -d -s "$session_name" btop
        tmux attach-session -t "$session_name"
    fi
}
