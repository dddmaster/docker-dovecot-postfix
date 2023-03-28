#!/bin/bash
if [[ "$1" == "dovecot" ]]; then
	mkdir -p /var/spool/postfix/etc/ssl/certs/
	cp /etc/resolv.conf /var/spool/postfix/etc/
	cp /etc/ssl/certs/ca-certificates.crt /var/spool/postfix/etc/ssl/certs/
	postfix start
	/usr/bin/tini -- /usr/sbin/dovecot -F
else 
	exec $@
fi
