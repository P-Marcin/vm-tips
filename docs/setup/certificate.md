# :clipboard: CERTIFICATE SETUP

## :pushpin: EXPORT CERTIFICATE

1. Open a website that uses the CA certificate
2. Click the padlock icon in the address bar and display certificate
3. Click "Details" and choose the certificate of the "Certificate Hierarchy"
4. Click "Export..." and save it as ".crt" file

## :pushpin: UBUNTU

1. Copy certificate to: `/usr/local/share/ca-certificates/`
2. Run: `sudo update-ca-certificates`
3. Test: `wget https://google.com`

## :pushpin: CENTOS

1. Copy certificate to: `/etc/pki/ca-trust/source/anchors/`
2. Run: `sudo update-ca-trust extract`
3. Test: `wget https://google.com`