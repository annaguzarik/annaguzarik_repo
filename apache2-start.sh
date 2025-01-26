#!/bin/bash
# Install Apache
sudo apt-get update
sudo apt-get install -y apache2

# Create a default web page
echo "<html><body><h1>Hello, Azure!</h1></body></html>" | sudo tee /var/www/html/index.html

# Restart Apache
sudo systemctl restart apache2
