# Arch Linux boxes

* **radicz580**: Arch Linux (x86-64)

---

**Configuring the network to assign and utilize a static IP address:**

Set a DNS server IP address as on the local router (and Google Public DNS too):

```
$ sudo su -
#
# echo 'nameserver 192.168.100.1' > /etc/resolv.conf
# echo 'nameserver 8.8.8.8'      >> /etc/resolv.conf
#
# logout
$
$ cat /etc/resolv.conf
nameserver 192.168.100.1
nameserver 8.8.8.8
```

Enable/disable interface(s):

```
$ sudo ip link set enp3s0   up   && \
  sudo ip link set wlp4s0b1 down
```

Assign a static IP address and add a default route:

```
$ sudo ip addr add 192.168.100.7/24 dev enp3s0
$ sudo ip route add default via 192.168.100.1
$
$ ip route
default via 192.168.100.1 dev enp3s0
192.168.100.0/24 dev enp3s0 proto kernel scope link src 192.168.100.7
$
$ ip a
...
```

Check/watch the connection is set up:

```
$ ping -c4 kernel.org
PING kernel.org (139.178.84.217) 56(84) bytes of data.
64 bytes from dfw.source.kernel.org (139.178.84.217): icmp_seq=1 ttl=46 time=162 ms
64 bytes from dfw.source.kernel.org (139.178.84.217): icmp_seq=2 ttl=46 time=157 ms
64 bytes from dfw.source.kernel.org (139.178.84.217): icmp_seq=3 ttl=46 time=153 ms
64 bytes from dfw.source.kernel.org (139.178.84.217): icmp_seq=4 ttl=46 time=155 ms

--- kernel.org ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 152.885/156.607/161.836/3.316 ms
$
$ ping -c4 archlinux.org
PING archlinux.org (95.217.163.246) 56(84) bytes of data.
64 bytes from archlinux.org (95.217.163.246): icmp_seq=1 ttl=51 time=54.6 ms
64 bytes from archlinux.org (95.217.163.246): icmp_seq=2 ttl=51 time=54.6 ms
64 bytes from archlinux.org (95.217.163.246): icmp_seq=3 ttl=51 time=54.5 ms
64 bytes from archlinux.org (95.217.163.246): icmp_seq=4 ttl=51 time=54.6 ms

--- archlinux.org ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 54.521/54.583/54.647/0.045 ms
```

---

Start up WPA supplicant to acquire carrier (when using Wi-Fi):

```
$ sudo wpa_supplicant -B -iwlp4s0b1 -c/etc/wpa_supplicant.conf
Successfully initialized wpa_supplicant
```
