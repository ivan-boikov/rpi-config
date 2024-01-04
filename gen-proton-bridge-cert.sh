#!/bin/sh

hostname="$(hostname)"

# cleanup
rm -v *.key *.csr *.ext *.crt *.pem

# https://gist.github.com/KeithYeh/bb07cadd23645a6a62509b1ec8986bbc

# Step 1: Generate a Private Key
#openssl genrsa -des3 -out $hostname.key 2048
# make unprotected key, step 3 is not needed anymore
openssl genrsa -out $hostname.key 2048

# Step 2: Generate a CSR (Certificate Signing Request)
openssl req -new -key $hostname.key -out $hostname.csr

# Step 3: Remove Passphrase from Key
#cp $hostname.key $hostname.key.org
#openssl rsa -in $hostname.key.org -out $hostname.key

# Step 4: Create config file for SAN
echo "
subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid:always,issuer:always
basicConstraints       = CA:TRUE
keyUsage               = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment, keyAgreement, keyCertSign
subjectAltName         = DNS:$hostname, DNS:*.$hostname
issuerAltName          = issuer:copy" > v3.ext

## Step 5: Generating a Self-Signed Certificate
openssl x509 -req -in $hostname.csr -signkey $hostname.key -out $hostname.crt -days 3650 -sha256 -extfile v3.ext

# convert crt to pem, if crt is in binary
# https://stackoverflow.com/questions/991758/how-to-get-pem-file-from-key-and-crt-files
#openssl x509 -inform DER -outform PEM -in $hostname.crt -out $hostname.crt.pem
# same for .key
#openssl rsa -inform DER -outform PEM -in $hostname.key -out $hostname.key.pem
# they are in base64, so just copy
mv -n $hostname.crt $hostname.pem
mv -n $hostname.key $hostname.key.pem

mv -n $hostname.pem /home/proton/proton-bridge/cert.pem
mv -n $hostname.key.pem /home/proton/proton-bridge/key.pem

chown proton:proton /home/proton/proton-bridge/*.pem

