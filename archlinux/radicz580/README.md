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

**Packages from the AUR (2025-03-15):**

```
$ pacman -Qm
erlang-nox 27.1.2-1
jedit 5.7.0-1
jmtpfs 0.5-3
lib32-sdl2 2.30.8-1
libdockapp 0.7.3-1
normalize 0.7.7-7
p7zip 1:17.05-2
pm-utils 1.4.1-8
reiserfsprogs 3.6.27-5
rxvt-unicode-truecolor-wide-glyphs 9.31-9
sdl2 2.30.8-1
skypeforlinux-stable-bin 8.109.0.209-1
vlang 0.4.9-2
windowmaker 0.96.0-1
wmclockmon 0.8.1-7
wmcpuload 1.0.1-2
wmnetload 1.3-3
wmsystemtray 1.4-1
zoom 6.2.6-1
```
