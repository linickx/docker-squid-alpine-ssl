#!/bin/sh

set -e

CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

# Clean SSL Squid DB
echo "Initializing SSL DB..."
rm -rf /var/lib/ssl_db
/usr/lib/squid/ssl_crtd -c -s /var/lib/ssl_db

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -z

# Give the Squid cache some time to rebuild.
sleep 5


# Launch squid
echo "Starting Squid..."
exec "$SQUID" -NYCd 1
