#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "<h1>Welcome to ${ENVIRONMENT} environment</h1>" | sudo tee /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
