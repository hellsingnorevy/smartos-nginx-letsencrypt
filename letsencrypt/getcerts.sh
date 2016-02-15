#***************************************
#* /usr/bin/letsencrypt-example.com.sh *
#***************************************

# Settings
DOMAIN=domain.net
TIMESTAMP=$(date +"%F %T")

# Execute
/opt/local/letsencrypt/letsencrypt-auto certonly -t --renew-by-default --email me@myself.me --text --agree-tos --webroot
-w /opt/local/share/nginx/web1/ -d web1.$DOMAIN \
-w /opt/local/share/nginx/web2/ -d web2.$DOMAIN \

# Log and restart web server
if [ $? -ne 0 ]
  then
      echo "["$TIMESTAMP"] Cert for "$DOMAIN" could NOT be renewed!" >> /var/log/letsencrypt/sh-renewals.log
  else
      echo "["$TIMESTAMP"] Cert for "$DOMAIN" renewed!" >> /var/log/letsencrypt/sh-renewals.log
      svcadm restart nginx
fi

exit 0
