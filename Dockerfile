FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y expect wget net-tools iproute ipppd iptables ssh curl iputils-ping screen

WORKDIR /root

# Install fortivpn client unofficial .deb
RUN wget 'https://hadler.me/files/forticlient-sslvpn_4.4.2330-1_amd64.deb' -O forticlient-sslvpn_amd64.deb
#RUN dpkg -x forticlient-sslvpn_amd64.deb /usr/share/forticlient
RUN apt-get update
RUN apt-get install -y libgdk-pixbuf2.0-0 libglib2.0-0 libgtk2.0-0 libpango-1.0-0
RUN dpkg --install forticlient-sslvpn_amd64.deb

# Run setup
RUN /opt/forticlient-sslvpn/64bit/helper/setup.linux.sh 2

# Copy runfiles
#COPY forticlient /usr/bin/forticlient
COPY start.sh /start.sh
COPY 21v.sh /21v.sh

CMD [ "/start.sh" ]
