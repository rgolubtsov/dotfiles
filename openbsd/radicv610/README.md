# OpenBSD VM box

* **radicv610.my.domain**: OpenBSD/amd64 6.7 (QEMU-KVM)

---

**Under the hood:**

```
$ # === CPU (and OS kernel):
$
$ echo && dmesg | grep CPU                                                    && \
  echo '--------------------------------------------------------------------' && \
  dmesg | grep GENERIC

cpu0: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 543.73 MHz, 06-3a-09
cpu1: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 554.31 MHz, 06-3a-09
--------------------------------------------------------------------
OpenBSD 6.7 (GENERIC.MP) #1: Sat May 16 16:33:02 MDT 2020
    root@syspatch-67-amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC.MP
$
$ # === Memory:
$
$ echo -en '\n ' && dmesg | grep mem

 real mem = 1271574528 (1212MB)
avail mem = 1220481024 (1163MB)
```
