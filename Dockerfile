FROM dovecot/dovecot
ENV DEBIAN_FRONTEND noninteractive
COPY entry.sh /entry.sh
RUN apt-get -y update \
	&& apt-get install postfix postfix-mysql -y \
	&& chmod u+x entry.sh \
	&& apt-get clean \
	&& apt-get autoremove --yes \
	&& rm -rf /var/lib/{apt,cache,log}/ \
	&& usermod -a -G dovecot postfix
ENTRYPOINT ["/entry.sh"]
CMD ["dovecot"]
