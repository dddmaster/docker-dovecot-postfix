FROM dovecot/dovecot
ENV DEBIAN_FRONTEND noninteractive
COPY entry.sh /entry.sh
RUN apt-get -y update \
	&& apt-get install postfix -y \
	&& chmod u+x entry.sh \
	&& apt-get clean \
	&& apt-get autoremove --yes \
	&& rm -rf /var/lib/{apt,cache,log}/
ENTRYPOINT ["/entry.sh"]
CMD ["dovecot"]
