# Arch Linux personal workhorse laptop

* **radicz580**: Arch Linux (x86-64)

**Lenovo IdeaPad Z580** (Mfd. September 2012)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep CPU | uniq                       && \
  echo '----------------------------------------------------------' && \
  cat /proc/cpuinfo | grep bogomips | uniq                          && \
  echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l

model name	: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz
----------------------------------------------------------
bogomips	: 4790.38
Total: 4
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        5936080 kB
MemFree:          680440 kB
MemAvailable:    1922168 kB
---------------------------
SwapCached:        67720 kB
SwapTotal:       8787988 kB
SwapFree:        8167404 kB
```

**Packages from the AUR (2025-04-25):**

```
$ pacman -Qm
jmtpfs 0.5-3
libdockapp 0.7.3-1
normalize 0.7.7-7
pm-utils 1.4.1-8
rxvt-unicode-truecolor-wide-glyphs 9.31-10
vlang 0.4.10-3
windowmaker 0.96.0-1
wmclockmon 0.8.1-7
wmcpuload 1.0.1-2
wmnetload 1.3-3
wmsystemtray 1.4-3
zoom 6.4.6-1
```
