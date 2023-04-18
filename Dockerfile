FROM dovecot/dovecot
ENV DEBIAN_FRONTEND noninteractive
COPY entry.sh /entry.sh
RUN apt-get -y update \
	&& apt-get install postfix postfix-mysql procps -y \
	&& chmod u+x entry.sh \
	&& apt-get clean \
	&& apt-get autoremove --yes \
	&& rm -rf /var/lib/{apt,cache,log}/ \
	&& usermod -a -G dovecot postfix
HEALTHCHECK --interval=120s --timeout=30s \
	CMD (ps -aux | grep 'postfix' | grep -v grep) && (ps -aux | grep 'dovecot -F' | grep -v grep) || exit 1
ENTRYPOINT ["/entry.sh"]
CMD ["dovecot"]
