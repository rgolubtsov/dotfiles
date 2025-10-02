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

**Packages from the AUR (2025-09-20):**

```
$ pacman -Qm
jmtpfs 0.5-3
libdockapp 0.7.3-1
normalize 0.7.7-7
pm-utils 1.4.1-8
redis 7.2.5-1
rxvt-unicode-truecolor-wide-glyphs 9.31-10
vlang 0.4.11-1
windowmaker 0.96.0-1
wmclockmon 0.8.1-7
wmcpuload 1.0.1-2
wmnetload 1.3-3
wmsystemtray 1.4-3
zoom 6.4.6-1
```

**A typical system load: uptime and process tree as of evening 2025-10-02:**

```
$ uptime && pstree
 22:12:20 up 160 days, 0 min,  1 user,  load average: 0.15, 0.24, 0.22
systemd─┬─agetty
        ├─chrome_crashpad───{chrome_crashpad}
        ├─chrome_crashpad
        ├─dbus-broker-lau───dbus-broker
        ├─dirmngr───{dirmngr}
        ├─gpg-agent
        ├─gpm
        ├─login───startx───xinit─┬─Xorg─┬─xf86-video-inte
        │                        │      └─2*[{Xorg}]
        │                        └─wmaker───wmaker─┬─chromium─┬─chromium───chromium───16*[{chromium}]
        │                                          │          ├─chromium───chromium─┬─chromium───7*[{chromium}]
        │                                          │          │                     ├─chromium───12*[{chromium}]
        │                                          │          │                     ├─chromium───13*[{chromium}]
        │                                          │          │                     ├─20*[chromium───10*[{chromium}]]
        │                                          │          │                     ├─3*[chromium───11*[{chromium}]]
        │                                          │          │                     └─chromium───9*[{chromium}]
        │                                          │          ├─chromium───8*[{chromium}]
        │                                          │          ├─chromium───7*[{chromium}]
        │                                          │          └─37*[{chromium}]
        │                                          ├─urxvt─┬─bash───top
        │                                          │       ├─bash───pstree
        │                                          │       ├─bash───journalctl
        │                                          │       ├─12*[bash]
        │                                          │       └─bash───rlwrap───java───20*[{java}]  # <== (1)
        │                                          ├─wmclockmon
        │                                          ├─wmcpuload
        │                                          ├─2*[wmnetload]
        │                                          ├─wmsystemtray
        │                                          ├─xterm───bash───lynx
        │                                          └─{wmaker}
        ├─polkitd───3*[{polkitd}]
        ├─rtkit-daemon───2*[{rtkit-daemon}]
        ├─sndiod                                                                                 # <== (2)
        ├─6*[ssh-agent]
        ├─systemd─┬─(sd-pam)
        │         ├─at-spi-bus-laun─┬─dbus-broker-lau───dbus-broker
        │         │                 └─4*[{at-spi-bus-laun}]
        │         ├─at-spi2-registr───3*[{at-spi2-registr}]
        │         ├─dbus-broker-lau───dbus-broker
        │         ├─dconf-service───3*[{dconf-service}]
        │         ├─pipewire───2*[{pipewire}]
        │         └─pulseaudio─┬─gsettings-helpe───4*[{gsettings-helpe}]
        │                      └─2*[{pulseaudio}]
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-udevd
        ├─vde_switch                                                                             # <== (3)
        └─xscreensaver───xscreensaver-sy
```

**(1):** Clojure REPL:

```
$ clj
Clojure 1.12.0
user=>
user=> (println "---")
---
nil
```

**(2):** Audio/MIDI server:

```
$ sndiod -L-
```

**(3):** Virtual Distributed Ethernet switch:

```
$ sudo vde_switch -mod 660 -group <usergroup> -tap tap0 -daemon
```
