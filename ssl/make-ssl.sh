# make dir
mkdir /etc/nginx/ssl

# Generate a Certificate Authority (CA) Key and Certificate (Self-Signed):

openssl genpkey -algorithm RSA -out rootCA.key
openssl req -new -key rootCA.key -x509 -sha256 -days 3650 -out rootCA.crt

# Create a Certificate Signing Request (CSR):
openssl req -new -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.csr

# Sign the CSR with Your CA:
openssl x509 -req -in localhost.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out localhost.crt -days 365


sudo chmod 644 /etc/nginx/ssl/localhost.crt
sudo chmod 600 /etc/nginx/ssl/localhost.key
