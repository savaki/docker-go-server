FROM dockerfile/java:oracle-java7
MAINTAINER matt.ho@gmail.com

ENV DEB_PACKAGE go-server-14.2.0-377.deb

RUN wget -q http://dl.bintray.com/gocd/gocd-deb/${DEB_PACKAGE} 
RUN dpkg -i ${DEB_PACKAGE} ; sed --in-place=bak 's/DAEMON=Y/DAEMON=N/' /etc/default/go-server

EXPOSE 8153
EXPOSE 8154

CMD [ "/usr/share/go-server/server.sh" ]
