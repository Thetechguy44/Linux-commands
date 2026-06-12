#!/bin/bash

APP_NAME=$1
DOMAIN=$2
APP_PATH=$3
PHP_VERSION="8.4"

if [ -z "$APP_NAME" ] || [ -z "$DOMAIN" ] || [ -z "$APP_PATH" ]; then
  echo "Usage: ./setup-nginx-laravel.sh app_name domain /var/www/app"
  exit 1
fi

echo "🚀 Setting up Nginx for $APP_NAME on $DOMAIN"

# 1. Create Nginx config
NGINX_CONF="/etc/nginx/sites-available/$APP_NAME"

sudo tee $NGINX_CONF > /dev/null <<EOF
server {
  listen 80;
  server_name domain.test;
  
  root /var/www/$APP_NAME/public;
  index index.php index.html;
  
  location / {
    try_files $uri $uri/ /index.php?$query_string;
  }
  
  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php8.4-fpm.sock;
  }
  
  location ^~ /phpmyadmin/ {
    root /usr/share/;
    index index.php index.html;
    
    location ~ \.php$ {
      include snippets/fastcgi-php.conf;
      fastcgi_pass unix:/run/php/php8.4-fpm.sock;
      
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      }
  }
}
EOF

echo "✔ Nginx config created"

# 2. Enable site
sudo ln -s $NGINX_CONF /etc/nginx/sites-enabled/

# 3. Test & reload Nginx
sudo nginx -t && sudo systemctl reload nginx

# 4. Add to hosts file (optional)
if ! grep -q "$DOMAIN" /etc/hosts; then
    echo "127.0.0.1 $DOMAIN" | sudo tee -a /etc/hosts
    echo "✔ Added $DOMAIN to /etc/hosts"
fi

echo "🎉 Setup complete!"
echo "Visit: http://$DOMAIN"
