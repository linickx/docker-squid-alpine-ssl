Squid
=====

Squid on Alpine, with the [additional packages for SSL](https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy#SSL_interception_or_SSL_bumping)

How to use
=========

```
docker run -p 3128:3128 linickx/squid-ssl
```

With bespoke configuration:

```
docker run  -v <configPath>/squid.conf:/etc/squid/squid.conf:ro \
            -v <configPath/cache:/var/cache/squid:rw \
            -v /var/log/squid:/var/log/squid:rw \
            -v /etc/localtime:/etc/localtime:ro \
            -p 3128:3128 \
            linickx/squid-ssl
```

---
Original Work by: [Simon Perkins](https://github.com/sjperkins/docker-squid-alpine)
