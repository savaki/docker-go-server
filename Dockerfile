FROM dockerfile/java:oracle-java7
MAINTAINER matt.ho@gmail.com

ENV DEB_PACKAGE go-server-14.4.0-1356.deb

RUN curl -o /tmp/${DEB_PACKAGE} -s -L http://dl.bintray.com/gocd/gocd-deb/${DEB_PACKAGE} ; \
	dpkg -i /tmp/${DEB_PACKAGE} ; \
	rm -f /tmp/${DEB_PACKAGE} ; \
	sed --in-place=bak 's/DAEMON=Y/DAEMON=N/' /etc/default/go-server

EXPOSE 8153
EXPOSE 8154

# externalize artifacts
VOLUME [ "/data/artifacts" ]

# externalize database
VOLUME [ "/var/lib/go-server" ]

# export log files
VOLUME [ "/var/log/go-server" ]

CMD [ "/usr/share/go-server/server.sh" ]
