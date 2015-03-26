FROM ubuntu:14.04
MAINTAINER Arne Schauf <docker@asmaps.de>

ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /opt/install
WORKDIR /opt/install
ADD pdns-static_3.4.3-1_amd64.deb /opt/install/
RUN dpkg -i pdns-static_3.4.3-1_amd64.deb

EXPOSE 53 53/udp
ENTRYPOINT ["pdns_server"]
CMD ["--no-config", "--master", "--daemon=no", "--launch=random", "--random-hostname=example.org"]
