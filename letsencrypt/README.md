the cert will show up in /etc/letsencrypt/live/


in the nginx config file per subdomain:

        location ~ /.well-known {
                allow all;
                root /opt/local/share/nginx/web1/;
        }
