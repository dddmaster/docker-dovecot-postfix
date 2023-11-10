# About
Docker image to run dovecot and postfix with mysql

Based on 
- [dovecot/dovecot](https://hub.docker.com/r/dovecot/dovecot/)
- https://www.postfix.org/
- https://www.postfix.org/MYSQL_README.html


https://hub.docker.com/r/dddmaster/dovecot-postfix

# Usage
- docker run -p 110:110 -p 143:143 -p 25:25 -p 587:587 -p 993:993 -p 995:995 -v dovepostconf:/etc/dovecot -v dovepostconf:/etc/postfix -v letsencrypt:/etc/letsencrypt -v mail:/srv/mail dddmaster/dovecot-postfix:latest

# Todo
- improve config system to utilize environment
- properly insert mysql data according to config
- documentation
