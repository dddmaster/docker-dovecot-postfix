#!/bin/bash
if [[ "$1" == "dovecot" ]]; then
	postfix start
	/usr/bin/tini -- /usr/sbin/dovecot -F
else 
	exec $@
fi
