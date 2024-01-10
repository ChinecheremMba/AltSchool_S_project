#!/bin/bash

# Clone PHP application from GitHub
git clone https://github.com/username/repo.git /var/www/html/app

# Install necessary packages
sudo apt-get update
sudo apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Configure Apache web server
sudo cp /var/www/html/app/config/apache.conf /etc/apache2/sites-available/app.conf
sudo a2ensite app.conf
sudo systemctl restart apache2

# Configure MySQL
sudo mysql -e "CREATE DATABASE appdb;"
sudo mysql -e "GRANT ALL PRIVILEGES ON appdb.* TO 'appuser'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "LAMP stack deployment completed!"
