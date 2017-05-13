# OpenBSD (VM-)boxes

**radicv610.my.domain**: OpenBSD/amd64 (QEMU-VM)

---

**TODO:** Provide instructions on how to create an OpenBSD VM-guest using QEMU-KVM.

---

Launching an OpenBSD guest on an Arch Linux host:

```
$ qemu-system-x86_64 -m 2.0G -enable-kvm -show-cursor -cpu host -smp 2 -net nic,macaddr=52:54:00:12:34:57,model=virtio -net vde -drive file=/opt/radicv610/radicv610openbsd61amd6400,format=raw,if=virtio
```

Adding `ssh-agent`:

```
$ eval `ssh-agent -s` && ssh-add
Agent pid <PID>
Enter passphrase for /home/radic/.ssh/id_rsa:
Identity added: /home/radic/.ssh/id_rsa (/home/radic/.ssh/id_rsa)
```

**Note:** `radicv610` below is the OpenBSD hostname assigned to its IP address `10.0.2.101` as the following:

```
$ cat /etc/hosts
# /etc/hosts: static lookup table for host names

#<ip-address>   <hostname.domain.org>   <hostname>
127.0.0.1       localhost.localdomain   localhost       radicz580  # <== Arch Linux host (IPv4)
::1             localhost.localdomain   localhost       radicz580  # <== Arch Linux host (IPv6)

10.0.2.100                              localv144       radicv144  # <== Ubuntu Server VM
10.0.2.101                              localv610       radicv610  # <== OpenBSD VM
```

SSH-ing into this box:

```
$ ssh -C radic@radicv610
Last login: Wed May  3 04:24:49 2017 from 10.0.2.1
OpenBSD 6.1 (GENERIC.MP) #20: Sat Apr  1 13:45:56 MDT 2017

Welcome to OpenBSD: The proactively secure Unix-like operating system.

Please use the sendbug(1) utility to report bugs in the system.
Before reporting a bug, please try to reproduce it with the latest
version of the code.  With bug reports, please try to ensure that
enough information to reproduce the problem is enclosed, and if a
known fix for it exists, include that as well.

[23:46:59][radic][radicv610][~]$
[23:47:00][radic][radicv610][~]$ uname -a
OpenBSD radicv610.my.domain 6.1 GENERIC.MP#20 amd64
```

---

**Semi-OFFTOP:** Some useful tips from [Eric Radman's blog](http://eradman.com "Eric Radman : A Journal"): [An OpenBSD Workstation](http://eradman.com/posts/openbsd-workstation.html "2013-07-05 : An OpenBSD Workstation (Last updated on March 28, 2017)").

:cd:
