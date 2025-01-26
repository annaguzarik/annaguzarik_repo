#!/bin/bash
# Install Apache
sudo apt-get update
sudo apt-get install -y apache2

# Restart Apache
sudo systemctl restart apache2
