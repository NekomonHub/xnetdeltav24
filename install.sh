#!/bin/bash

echo "🚀 Termux installer for Node.js + PHP"

if [ -z "$PREFIX" ] || [ ! -x "$(command -v pkg)" ]; then
    echo "❌ This script is for Termux only!"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    pkg install -y nodejs
else
    echo "Node.js already installed ✅"
fi

# Install PHP kalo belum ada
if ! command -v php &> /dev/null; then
    echo "Installing PHP..."
    pkg install -y php
else
    echo "PHP already installed ✅"
fi

if [ -f package.json ]; then
    echo "Installing npm dependencies..."
    npm install
fi

if [ -f start.sh ]; then
    echo "Starting project..."
    bash start.sh
else
    echo "start.sh not found ❌"
fi

echo "Done!"
