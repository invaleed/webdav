FROM ubuntu:16.04
MAINTAINER Ramadoni Ashudi <ramadoni.ashudi@gmail.com> 

ENV LAST_REFRESHED 25 July 2018 

# Update & install packages RUN apt-get update && apt-get -y upgrade
RUN apt-get update && apt-get -y install lighttpd \
	lighttpd-mod-webdav
RUN mkdir -p /webdav/input

ADD htpasswd /webdav/
ADD share.conf /etc/lighttpd/conf-available/20-share.conf

RUN lighty-enable-mod auth webdav share
RUN mkdir -p /var/run/lighttpd && chown www-data.www-data /var/run/lighttpd /webdav/input

EXPOSE 8880

VOLUME /webdav/input
ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
