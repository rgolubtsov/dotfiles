# Ubuntu Server LTS VM box (WSL2 on Windows 11 Pro laptop)

* **pmgbg5xx3**: Ubuntu Server 22.04.3 LTS x86-64 (Microsoft Hyper-V-based)

**GIGABYTE G5 GE** (Mfd. September 2022)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep '\sGen\s' | uniq             && \
  echo '------------------------------------------------------' && \
  cat /proc/cpuinfo | grep bogomips | uniq                      && \
  echo -n 'Total: ' && cat /proc/cpuinfo | grep '\sGen\s' | wc -l

model name	: 12th Gen Intel(R) Core(TM) i5-12500H
------------------------------------------------------
bogomips	: 6220.80
Total: 16
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        7985436 kB
MemFree:         6975332 kB
MemAvailable:    7209880 kB
---------------------------
SwapCached:            0 kB
SwapTotal:       2097152 kB
SwapFree:        2097152 kB
```

**The greeting and the kernel:**

```
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 5.15.90.1-microsoft-standard-WSL2 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


This message is shown once a day. To disable it please create the
/home/radic/.hushlogin file.
$
$ uname -a
Linux pmgbg5xx3 5.15.90.1-microsoft-standard-WSL2 #1 SMP Fri Jan 27 02:56:13 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```
