#!/bin/bash
if [[ "$1" == "dovecot" ]]; then
	mkdir -p /var/spool/postfix/etc/ssl/
	
	if [[ ! -e /var/spool/postfix/etc/resolv.conf ]]; then
		ln -s /etc/resolv.conf /var/spool/postfix/etc/resolv.conf
	fi

	if [[ ! -d /var/spool/postfix/etc/ssl/certs ]]; then
		ln -s /etc/ssl/certs/ /var/spool/postfix/etc/ssl/
	fi
	
	postfix start-fg &
	#/usr/bin/tini -- /usr/sbin/dovecot -F
	/usr/sbin/dovecot -F
else 
	exec $@
fi
