# OpenBSD VM box

* **radicv760.my.domain**: OpenBSD/amd64 7.6 (QEMU-KVM)

---

**Under the hood:**

```
$ # === CPU (and OS kernel):
$
$ echo && dmesg | grep CPU                                                    && \
  echo '--------------------------------------------------------------------' && \
  dmesg | grep GENERIC

cpu0: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 134.32 MHz, 06-3a-09
cpu1: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 138.99 MHz, 06-3a-09
--------------------------------------------------------------------
OpenBSD 7.6 (GENERIC.MP) #1: Mon Feb 10 00:14:14 MST 2025
    root@syspatch-76-amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC.MP
$
$ # === Memory:
$
$ echo -en '\n ' && dmesg | grep mem

 real mem = 1486319616 (1417MB)
avail mem = 1418186752 (1352MB)
```
