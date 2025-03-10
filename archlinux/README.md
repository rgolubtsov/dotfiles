# Arch Linux boxes

* **radicz580**: Arch Linux (x86-64)

---

**Configuring the network to assign and utilize a static IP address:**

Stop a DHCP client (`dhcpcd`):

```
$ sudo systemctl stop dhcpcd -l
$ sudo systemctl status dhcpcd -l
● dhcpcd.service - dhcpcd on all interfaces
   Loaded: loaded (/usr/lib/systemd/system/dhcpcd.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since ...
...
<hostname> dhcpcd: wlp2s0: removing interface
<hostname> dhcpcd: enp4s0: removing interface
<hostname> dhcpcd: dhcpcd exited
<hostname> systemd: dhcpcd.service: Succeeded.
<hostname> systemd: Stopped dhcpcd on all interfaces.
```

Set a DNS server IP address as on the router:

```
$ sudo su -
#
# echo 'nameserver 192.168.100.1' > /etc/resolv.conf
#
# logout
$
$ cat /etc/resolv.conf
nameserver 192.168.100.1
```

Assign a static IP address and add a default route:

```
$ sudo ip addr add 192.168.100.2/24 broadcast 192.168.100.255 dev wlp2s0
$ sudo ip route add default via 192.168.100.1
$
$ ip route
default via 192.168.100.1 dev wlp2s0 linkdown
192.168.100.0/24 dev wlp2s0 proto kernel scope link src 192.168.100.2 linkdown
```

Start up WPA supplicant to acquire carrier (when using Wi-Fi):

```
$ sudo wpa_supplicant -B -iwlp2s0 -c/etc/wpa_supplicant.conf
Successfully initialized wpa_supplicant
```

Disable unused interface(s):

```
$ sudo ip link set enp4s0 down
```

Check/watch the connection is set up:

```
$ ip route
default via 192.168.100.1 dev wlp2s0
192.168.100.0/24 dev wlp2s0 proto kernel scope link src 192.168.100.2
$
$ ping -c4 archlinux.org
PING archlinux.org (138.201.81.199) 56(84) bytes of data.
64 bytes from apollo.archlinux.org (138.201.81.199): icmp_seq=1 ttl=53 time=38.3 ms
64 bytes from apollo.archlinux.org (138.201.81.199): icmp_seq=2 ttl=53 time=37.8 ms
64 bytes from apollo.archlinux.org (138.201.81.199): icmp_seq=3 ttl=53 time=38.3 ms
64 bytes from apollo.archlinux.org (138.201.81.199): icmp_seq=4 ttl=53 time=38.7 ms

--- archlinux.org ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 8ms
rtt min/avg/max/mdev = 37.805/38.271/38.711/0.400 ms
```
