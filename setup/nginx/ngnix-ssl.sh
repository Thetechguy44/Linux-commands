sudo nano /etc/nginx/sites-available/hidden-ssl.conf

# inside the file

server {
    listen 443 ssl;
    server_name localhost;  # Replace with your domain


    ssl_certificate /etc/nginx/ssl/localhost.crt;
    ssl_certificate_key /etc/nginx/ssl/localhost.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    # for Real ssl cert
    # ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384';
    ssl_prefer_server_ciphers off;

    # for local
    ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384';

    # Other SSL settings

    location / {
        # Your regular server configuration here
    }
}


# then include the ssl file path to the hidden.conf
sudo nano /etc/nginx/sites-available/hidden.conf

server {
    listen 80;
    server_name localhost;  # Replace with your domain

    # Your non-SSL server configuration

    location / {
        # Your regular server configuration here
    }
}

# Include the SSL configuration
include /etc/nginx/sites-available/hidden-ssl.conf;
