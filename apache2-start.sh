#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Install Apache2
echo "Installing Apache2..."
sudo apt-get install -y apache2

# Create a default web page
echo "Creating default web page..."
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<html>
  <head>
    <title>Hello, World!</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <p>This is the default web page for Apache2 on this server.</p>
  </body>
</html>
EOF'

# Set proper permissions for the web page
echo "Setting permissions for the web page..."
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

# Enable Apache2 to start on boot
echo "Enabling Apache2 to start on boot..."
sudo systemctl enable apache2

# Restart Apache2 to apply changes
echo "Restarting Apache2..."
sudo systemctl restart apache2

# Check Apache2 status
echo "Checking Apache2 status..."
sudo systemctl status apache2 --no-pager

# Display the public IP address (if available)
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)
if [ -n "$PUBLIC_IP" ]; then
  echo "Apache2 installation is complete!"
  echo "You can access the web page at: http://$PUBLIC_IP"
else
  echo "Apache2 installation is complete!"
  echo "You can access the web page at: http://<your-server-ip>"
fi
