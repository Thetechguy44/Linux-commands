sudo nano /etc/nginx/sites-available/hidden-ssl.conf

# inside the file

server {
    listen 443 ssl;
    server_name aws.cyfamod.com;  # Replace with your domain

    #SSLCertificateFile /etc/letsencrypt/live/easelow.com.ng/cert.pem
    #SSLCertificateChainFile /etc/letsencrypt/live/easelow.com.ng/chain.pem
    #SSLCertificateKeyFile /etc/letsencrypt/live/easelow.com.ng/privkey.pem

    # ssl_certificate /path/to/your/ssl.crt;
    # ssl_certificate_key /path/to/your/ssl.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384';
    ssl_prefer_server_ciphers off;

    # Other SSL settings

    location / {
        # Your regular server configuration here
    }
}


# then include the ssl file path to the hidden.conf
sudo nano /etc/nginx/sites-available/hidden.conf

server {
    listen 80;
    server_name example.com;  # Replace with your domain

    # Your non-SSL server configuration

    location / {
        # Your regular server configuration here
    }
}

# Include the SSL configuration
include /etc/nginx/sites-available/hidden-ssl.conf;
