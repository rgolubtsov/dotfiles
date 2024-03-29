# Ubuntu Server LTS VM box (WSL 2 on Windows 11 Pro laptop)

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
PS C:\> wsl -u radic --cd ~
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 5.15.90.1-microsoft-standard-WSL2 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

This message is shown once a day. To disable it please create the
/home/radic/.hushlogin file.
$
$ uname -a
Linux pmgbg5xx3 5.15.90.1-microsoft-standard-WSL2 #1 SMP Fri Jan 27 02:56:13 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```

**Exported WSL 2 VM box images (TAR and VHD):**

```
$ file \
  pmgbg5xx3-ubuntu-jammy-lts-20231019-expo.tar \
  pmgbg5xx3-ubuntu-jammy-lts-20231019-expo.vhdx
pmgbg5xx3-ubuntu-jammy-lts-20231019-expo.tar:  POSIX tar archive
pmgbg5xx3-ubuntu-jammy-lts-20231019-expo.vhdx: Microsoft Disk Image eXtended, by Microsoft Windows 10.0.22621.0, sequence 0x3c, NO Log Signature; region, 2 entries, id BAT, at 0x300000, Required 1, id Metadata, at 0x200000, Required 1, 2nd region INVALID
```
