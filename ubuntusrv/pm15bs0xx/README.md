# Ubuntu Server LTS VM box (WSL2 on Windows 10 Pro laptop)

* **pm15bs0xx**: Ubuntu Server 22.04.3 LTS x86-64 (Microsoft Hyper-V-based)

**HP Laptop 15-bs0xx** (Mfd. February 2018)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep CPU | uniq                       && \
  echo '----------------------------------------------------------' && \
  cat /proc/cpuinfo | grep bogomips | uniq                          && \
  echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l

model name	: Intel(R) Core(TM) i3-6006U CPU @ 2.00GHz
----------------------------------------------------------
bogomips	: 3984.00
Total: 4
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        3971860 kB
MemFree:         3055476 kB
MemAvailable:    3252152 kB
---------------------------
SwapCached:            0 kB
SwapTotal:       1048576 kB
SwapFree:        1048576 kB
```

**The greeting and the kernel:**

```
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
Linux pm15bs0xx 5.15.90.1-microsoft-standard-WSL2 #1 SMP Fri Jan 27 02:56:13 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```
