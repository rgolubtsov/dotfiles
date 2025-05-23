# OpenBSD VM box

* **radicv760.my.domain**: OpenBSD/amd64 7.7 (QEMU-KVM)

---

**Under the hood:**

```
$ # === CPU (and OS kernel):
$
$ echo && dmesg | grep CPU                                                    && \
  echo '--------------------------------------------------------------------' && \
  dmesg | grep GENERIC

cpu0: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 120.95 MHz, 06-3a-09
cpu1: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz, 119.02 MHz, 06-3a-09
--------------------------------------------------------------------
OpenBSD 7.7 (GENERIC.MP) #0: Sun May  4 11:23:50 MDT 2025
    root@syspatch-77-amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC.MP
$
$ # === Memory:
$
$ echo -en '\n ' && dmesg | grep mem

 real mem = 1486319616 (1417MB)
avail mem = 1414946816 (1349MB)
```

**Install additional packages:**

* For system administering and development:

```
$ sudo pkg_add -vr pstree nmap
...
$ sudo pkg_add -vr node lua go v
...
$ sudo pkg_add -vr erlang elixir lfe
...
$ sudo pkg_add -vr clojure
...
$ sudo pkg_add -vr crystal
...
```

* For comfortable desktop experience, suitable as for development as well for entertainment:

```
$ sudo pkg_add -vr windowmaker        \
                   windowmaker-extra  \
                   wmclockmon wmnetload
...
$ sudo pkg_add -vr liberation-fonts noto-fonts    \
                                    noto-cjk      \
                                    noto-emoji    \
                                    roboto-fonts  \
                                    cantarell-fonts
...
$ sudo pkg_add -vr openbsd-backgrounds  \
                   mplayer rxvt-unicode \
                   chromium
...
```
