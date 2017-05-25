# Ubuntu Server (VM-)boxes

**radicv144**: Ubuntu Server/amd64 (QEMU-VM)

---

**TODO:** Provide instructions on how to create an Ubuntu Server VM-guest using QEMU-KVM.

---

Launching an Ubuntu Server guest on an Arch Linux host:

```
$ qemu-system-x86_64 -m 2.0G -enable-kvm -show-cursor -cpu host -smp 2 -net nic,model=virtio -net vde -drive file=/opt/radicv144/radicv144ubuntu14044serveramd6400,format=raw
```

Adding `ssh-agent`:

```
$ eval `ssh-agent -s` && ssh-add
Agent pid <PID>
Enter passphrase for /home/radic/.ssh/id_rsa:
Identity added: /home/radic/.ssh/id_rsa (/home/radic/.ssh/id_rsa)
```

**Note:** `radicv144` below is the Ubuntu Server hostname assigned to its IP address `10.0.2.100` as the following:

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
$ ssh -C radic@radicv144
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-78-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Fri May 26 00:43:20 AEST 2017

  System load:  0.06               Processes:           109
  Usage of /:   28.7% of 19.56GB   Users logged in:     1
  Memory usage: 27%                IP address for eth0: 10.0.2.100
  Swap usage:   0%

  Graph this data and manage this system at:
    https://landscape.canonical.com/

0 packages can be updated.
0 updates are security updates.

Last login: Thu May 25 23:55:20 2017 from 10.0.2.1
[00:43:21][radic][radicv144][~]$
[00:43:22][radic][radicv144][~]$ uname -a
Linux radicv144 4.4.0-78-generic #99-Ubuntu SMP Thu Apr 27 15:29:09 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```

:cd:
