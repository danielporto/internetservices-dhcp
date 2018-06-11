# internetservices-dhcp
base for deploying dhcp in local network.

## Configuration examples
Look at the conf directory. 

## Building the container

docker build -t dhcp .

## Running 

docker network create -d macvlan --subnet 192.168.0.0/24 --gateway 192.168.0.254 -o parent=eth0 pub_net 

docker run --net=pub_net  -v $(pwd)/conf/etc/dhcp:/etc/dhcp -v $(pwd)/conf/var/lib/dhcp:/var/lib/dhcp --rm -t  dhcp /usr/sbin/dhcpd -cf /etc/dhcp/dhcpd.conf
## Configure to autostart as a service


