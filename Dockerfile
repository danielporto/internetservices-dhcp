FROM debian:stretch-slim

RUN apt update && \
    apt install -y isc-dhcp-server vim net-tools procps && \
    rm -rf /var/lib/apt/lists/* 


