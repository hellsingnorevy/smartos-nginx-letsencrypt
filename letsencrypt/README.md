# Letsencrypt certificates for multiple subdomains


## Steps

* Configure getcerts.sh to fit your domain and subdomains.
* run getcerts.sh
* the cert will show up in /etc/letsencrypt/live/


in the nginx config file per subdomain:

        location ~ /.well-known {
                allow all;
                root /opt/local/share/nginx/web1/;
        }


## SSL

Example config file domain.example

* to generate your dhparam.pem file, run in the terminal (2048 is an example)
        openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

### Maximum security (HSTS)

* Disclaimer: This can break your subdomains if not done correctly

* (HTTP Strict Transport Security) https://developer.mozilla.org/en-US/docs/Security/HTTP_Strict_Transport_Security
* to avoid ssl stripping https://en.wikipedia.org/wiki/SSL_stripping#SSL_stripping
        add_header Strict-Transport-Security "max-age=31536000; includeSubdomains;";
