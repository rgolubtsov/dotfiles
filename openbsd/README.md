# OpenBSD (VM-)boxes

* **radicv760.my.domain**: OpenBSD/amd64 7.7 (QEMU-KVM)
* **radicv610.my.domain**: OpenBSD/amd64 6.7 (QEMU-KVM) *Wiped out in favor of using `radicv760.my.domain`*

---

Boot up the OpenBSD guest on an Arch Linux host:

* OpenBSD 7.7:

```
$ qemu-system-x86_64 -m 1.4G -enable-kvm -cpu host -smp 2                     \
  -net nic,macaddr=52:54:00:12:34:57,model=virtio  -net vde                   \
  -drive file=/opt/radicv760/radicv760openbsd76amd6400,format=raw,if=virtio > \
  /dev/null 2>&1 &
...
```

Log in to this box via SSH:

```
$ ssh -C radicv760
Last login: Sat May 10 22:50:00 2025 from 10.0.2.1
OpenBSD 7.7 (GENERIC.MP) #0: Sun May  4 11:23:50 MDT 2025

Welcome to OpenBSD: The proactively secure Unix-like operating system.

Please use the sendbug(1) utility to report bugs in the system.
Before reporting a bug, please try to reproduce it with the latest
version of the code.  With bug reports, please try to ensure that
enough information to reproduce the problem is enclosed, and if a
known fix for it exists, include that as well.

$
$ uname -a
OpenBSD radicv760.my.domain 7.7 GENERIC.MP#0 amd64
```

---

* OpenBSD 6.7 (*Wiped out in favor of using the 7.7 release-based VM*):

```
$ qemu-system-x86_64 -m 1.2G -enable-kvm -cpu host -smp 2                     \
  -net nic,macaddr=52:54:00:12:34:57,model=virtio  -net vde                   \
  -drive file=/opt/radicv610/radicv610openbsd61amd6400,format=raw,if=virtio > \
  /dev/null 2>&1 &
...
```

When the guest OS (OpenBSD) is up and running, login into it and configure the network like the following:

```
$ sudo ifconfig vio0 10.0.2.101/24
$ sudo route add default 10.0.2.1
add net default: gateway 10.0.2.1
```

Also it needs to specify a valid DNS server. This usually should be done once and it doesn't require any changes later:

```
$ sudo su -
# echo 'nameserver 8.8.8.8' > /etc/resolv.conf
# logout
```

Check the network is set up and working well:

```
$ ifconfig
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 32768
        index 3 priority 0 llprio 3
        groups: lo
        inet6 ::1 prefixlen 128
        inet6 fe80::1%lo0 prefixlen 64 scopeid 0x3
        inet 127.0.0.1 netmask 0xff000000
vio0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        lladdr 52:54:00:12:34:57
        index 1 priority 0 llprio 3
        groups: egress
        media: Ethernet autoselect
        status: active
        inet 10.0.2.101 netmask 0xffffff00 broadcast 10.0.2.255
enc0: flags=0<>
        index 2 priority 0 llprio 3
        groups: enc
        status: active
pflog0: flags=141<UP,RUNNING,PROMISC> mtu 33144
        index 4 priority 0 llprio 3
        groups: pflog
```

```
$ route show
Routing tables

Internet:
Destination        Gateway            Flags   Refs      Use   Mtu  Prio Iface
default            10.0.2.1           UGS        3      173     -     8 vio0
base-address.mcast localhost          URS        0        0 32768     8 lo0
10.0.2/24          10.0.2.101         UCn        1        6     -     4 vio0
10.0.2.1           02:d7:90:41:00:e3  UHLch      4      158     -     3 vio0
10.0.2.101         52:54:00:12:34:57  UHLl       0      213     -     1 vio0
10.0.2.255         10.0.2.101         UHb        0        0     -     1 vio0
loopback           localhost          UGRS       0        0 32768     8 lo0
localhost          localhost          UHhl       1     2501 32768     1 lo0

Internet6:
Destination        Gateway            Flags   Refs      Use   Mtu  Prio Iface
::/96              localhost          UGRS       0        0 32768     8 lo0
::/104             localhost          UGRS       0        0 32768     8 lo0
localhost          localhost          UHhl      14       28 32768     1 lo0
::127.0.0.0/104    localhost          UGRS       0        0 32768     8 lo0
::224.0.0.0/100    localhost          UGRS       0        0 32768     8 lo0
::255.0.0.0/104    localhost          UGRS       0        0 32768     8 lo0
::ffff:0.0.0.0/96  localhost          UGRS       0        0 32768     8 lo0
2002::/24          localhost          UGRS       0        0 32768     8 lo0
2002:7f00::/24     localhost          UGRS       0        0 32768     8 lo0
2002:e000::/20     localhost          UGRS       0        0 32768     8 lo0
2002:ff00::/24     localhost          UGRS       0        0 32768     8 lo0
fe80::/10          localhost          UGRS       0        0 32768     8 lo0
fec0::/10          localhost          UGRS       0        0 32768     8 lo0
fe80::1%lo0        fe80::1%lo0        UHl        0        0 32768     1 lo0
ff01::/16          localhost          UGRS       0        0 32768     8 lo0
ff01::%lo0/32      localhost          Um         0        1 32768     4 lo0
ff02::/16          localhost          UGRS       0        0 32768     8 lo0
ff02::%lo0/32      localhost          Um         0        1 32768     4 lo0
```

```
$ ping -c4 openports.se
PING openports.se (37.49.241.54): 56 data bytes
64 bytes from 37.49.241.54: icmp_seq=0 ttl=241 time=64.149 ms
64 bytes from 37.49.241.54: icmp_seq=1 ttl=241 time=109.320 ms
64 bytes from 37.49.241.54: icmp_seq=2 ttl=241 time=72.206 ms
64 bytes from 37.49.241.54: icmp_seq=3 ttl=241 time=113.226 ms

--- openports.se ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/std-dev = 64.149/89.725/113.226/21.779 ms
```

Log out from the current user. The guest OS is now ready to accept connections from the host OS via SSH. To speed up consequent logging into the guest OS, it is handy to add `ssh-agent`:

```
$ eval `ssh-agent -s` && ssh-add
Agent pid <PID>
Enter passphrase for /home/radic/.ssh/id_rsa:
Identity added: /home/radic/.ssh/id_rsa (/home/radic/.ssh/id_rsa)
```

**Note:** `radicv610` below is the OpenBSD hostname assigned to its IP address `10.0.2.101` as the following:

```
$ cat /etc/hosts
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1       localhost.localdomain   localhost       radicz580  # <== Arch Linux host (IPv4)
::1             localhost.localdomain   localhost       radicz580  # <== Arch Linux host (IPv6)

10.0.2.100                              radicv144                  # <== Ubuntu Server VM
10.0.2.101      radicv760.my.domain     radicv760       radicv610  # <== OpenBSD VM

# vim:set nu et ts=4 sw=4:
```

Log in to this box via SSH:

```
$ ssh -C radicv610
Last login: Fri Jun 30 19:40:00 2023 from 10.0.2.1
OpenBSD 6.7 (GENERIC.MP) #1: Sat May 16 16:33:02 MDT 2020

Welcome to OpenBSD: The proactively secure Unix-like operating system.

Please use the sendbug(1) utility to report bugs in the system.
Before reporting a bug, please try to reproduce it with the latest
version of the code.  With bug reports, please try to ensure that
enough information to reproduce the problem is enclosed, and if a
known fix for it exists, include that as well.

$
$ uname -a
OpenBSD radicv610.my.domain 6.7 GENERIC.MP#1 amd64
```

Step by step instructions on how to upgrade OpenBSD from the 6.3 release to the 6.5 release can be found [here](https://rgolubtsov.github.io/data/docs/openbsd/upgrade-63-to-65 "Upgrade OpenBSD 6.3 to 6.5").

---

**Semi-OFFTOP:** Some useful tips from [Eric Radman's blog](https://eradman.com "Eric Radman : A Journal"): [An OpenBSD Workstation](https://eradman.com/posts/openbsd-workstation.html "2013-07-05 : An OpenBSD Workstation (Last updated on April 30, 2025)").
