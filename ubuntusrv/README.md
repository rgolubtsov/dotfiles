# Ubuntu Server (VM-)boxes

* **radicv144**: Ubuntu Server/amd64 (QEMU-VM)

---

Launching an Ubuntu Server guest on an Arch Linux host:

```
$ qemu-system-x86_64 -m 2.0G -enable-kvm -cpu host -smp 2 -net nic,model=virtio -net vde -drive file=/opt/radicv144/radicv144ubuntu14044serveramd6400,format=raw
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

**Adding another disk partition (if needed), let's say of 60 Gigabytes:**

(1) In an Arch Linux host:

```
$ sudo qemu-img resize /opt/radicv144/radicv144ubuntu14044serveramd6400 +60G
```

(2) In an Ubuntu Server guest:

Run `sudo fdisk /dev/sda` and add a new partition, then reboot the VM.

Check/watch this new change:

```
$ sudo fdisk -l /dev/sda
Disk /dev/sda: 80 GiB, 85899345920 bytes, 167772160 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x00000000

Device     Boot    Start       End   Sectors Size Id Type
/dev/sda1  *        2048  41940991  41938944  20G 83 Linux
/dev/sda2       41940992 167772159 125831168  60G 83 Linux
```

Format this new partition using `sudo mkfs.ext4 /dev/sda2` and mount it:

```
$ sudo mkdir /sda2
$
$ sudo mount /dev/sda2 /sda2
```

Check/watch this new partition is mounted:

```
$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0      2:0    1    4K  0 disk
sda      8:0    0   80G  0 disk
├─sda1   8:1    0   20G  0 part /
└─sda2   8:2    0   60G  0 part /sda2
sr0     11:0    1 1024M  0 rom
```

It now can be used as usual, just like the root partition, for any kind of activities.

The last thing have to do is to update the `/etc/fstab` configuration:

```
$ cat /etc/fstab
/dev/sda1 /     ext4 errors=remount-ro 0 1
/dev/sda2 /sda2 ext4 errors=remount-ro 0 1
/swap     none  swap defaults          0 0
```

**Increasing (or adding initially) a swap file (if needed), let's say for 5 Gigabytes:**

Deactivate an old one (if any):

```
$ sudo swapoff /swap
```

Reallocate it then (or create a new one):

```
$ sudo fallocate -l 5G /sda2/swap
```

If it resides on another disk partition and in order not to change the corresponding entry in the `/etc/fstab` configuration (see above), make a symlink to it:

```
$ cd /
$
$ sudo ln -sfnv /sda2/swap
'./swap' -> '/sda2/swap'
```

(Re-)format and activate the swap file:

```
$ sudo mkswap /swap
mkswap: /swap: warning: wiping old swap signature.
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=389fc137-73b5-4464-9bda-da173e5be8e5
$
$ sudo swapon /swap
```

Finally check/watch the swap file is utilized by the system:

```
$ ls -al /swap /sda2/swap
-rw------- 1 root root 5368709120 Nov 30 16:40 /sda2/swap
lrwxrwxrwx 1 root root         10 Nov 30 16:40 /swap -> /sda2/swap
$
$ free
              total        used        free      shared  buff/cache   available
Mem:        2564164       86000     1123916       10352     1354248     2273860
Swap:       5242876           0     5242876
```
