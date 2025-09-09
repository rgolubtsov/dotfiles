# Ubuntu Server (VM-)boxes

* **radicv144**: Ubuntu Server LTS x86-64 (QEMU-KVM)

---

Booting up the Ubuntu Server guest on an Arch Linux host:

```
$ qemu-system-x86_64 -m 1.8G -enable-kvm -cpu host -smp 2 -net nic,model=virtio -net vde   \
  -drive file=/opt/radicv144/radicv144ubuntu24041serveramd6401,format=raw > /dev/null 2>&1 &
```

Starting up SSH agent in the background and adding a private key:

```
$ eval `ssh-agent -s` && ssh-add
Agent pid <PID>
Enter passphrase for /home/radic/.ssh/id_rsa:
Identity added: /home/radic/.ssh/id_rsa (/home/radic/.ssh/id_rsa)
```

**Note:** `radicv144` below is the Ubuntu Server hostname assigned to its IP address `10.0.2.100` as the following:

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

SSH-ing in to this box:

```
$ ssh -C radicv144
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-79-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Sep  9 08:40:10 PM CEST 2025

  System load:  0.0                Processes:             107
  Usage of /:   23.1% of 78.56GB   Users logged in:       1
  Memory usage: 14%                IPv4 address for ens3: 10.0.2.100
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

4 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm


Last login: Tue Sep  9 20:00:30 2025 from 10.0.2.1
$
$ uname -a
Linux radicv144 6.8.0-79-generic #79-Ubuntu SMP PREEMPT_DYNAMIC Tue Aug 12 14:42:46 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux
$
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 24.04.3 LTS
Release:        24.04
Codename:       noble
```

**Adding another disk partition (if needed), let's say of 60 Gigabytes:**

1. In an Arch Linux host **do**:

```
$ sudo qemu-img resize /opt/radicv144/radicv144ubuntu24041serveramd6401 +60G
```

2. In an Ubuntu Server guest **do**:

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

Finally, check/watch the swap file is utilized by the system:

```
$ ls -al /swap /sda2/swap
-rw------- 1 root root 5368709120 Nov 30 16:40 /sda2/swap
lrwxrwxrwx 1 root root         10 Nov 30 16:40 /swap -> /sda2/swap
$
$ free
               total        used        free      shared  buff/cache   available
Mem:         1803188      256264      562288         968      984636     1383300
Swap:        5242876           0     5242876
```
