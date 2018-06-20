FROM debian:stretch-slim

RUN apt update && \
    apt install -y isc-dhcp-server vim net-tools procps && \
    rm -rf /var/lib/apt/lists/* 

COPY conf-private/etc/default/isc-dhcp-server /etc/default/
COPY conf-private/etc/dhcp/dhcpd.conf /etc/dhcp
RUN echo "" > /var/lib/dhcp/dhcpd.leases

EXPOSE 67/udp
EXPOSE 68/udp

ENTRYPOINT ["/usr/sbin/dhcpd", "-4", "-d" ,"-cf", "/etc/dhcp/dhcpd.conf" ] 
