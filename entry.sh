#!/bin/bash
if [[ "$1" == "dovecot" ]]; then
	mkdir -p /var/spool/postfix/etc/ssl/
	#cp /etc/resolv.conf /var/spool/postfix/etc/
	ln -s /etc/resolv.conf /var/spool/postfix/etc/resolv.conf
	#cp /etc/ssl/certs/ca-certificates.crt /var/spool/postfix/etc/ssl/certs/
	ln -s /etc/ssl/certs/ /var/spool/postfix/etc/ssl/
	postfix start-fg &
	#/usr/bin/tini -- /usr/sbin/dovecot -F
	/usr/sbin/dovecot -F
else 
	exec $@
fi
