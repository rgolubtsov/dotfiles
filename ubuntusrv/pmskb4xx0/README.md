# Ubuntu Server LTS VM box (WSL 1 on Windows 10 Pro casual workstation)

* **pmskb4xx0**: Ubuntu Server 22.04.3 LTS x86-64 (Microsoft Virtual Machine Platform-based)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep Processor | uniq          && \
  echo '---------------------------------------------------' && \
  cat /proc/cpuinfo | grep bogomips | uniq                   && \
  echo -n 'Total: ' && cat /proc/cpuinfo | grep Processor | wc -l

model name	: AMD Ryzen 5 4500 6-Core Processor
---------------------------------------------------
bogomips	: 7186.00
Total: 12
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:       16663940 kB
MemFree:        14150588 kB
---------------------------
SwapCached:            0 kB
SwapTotal:      29221244 kB
SwapFree:       29221244 kB
```

**The greeting and the kernel:**

```
PS C:\> wsl -u radic
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 4.4.0-18362-Microsoft x86_64)

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
Linux pmskb4xx0 4.4.0-18362-Microsoft #1-Microsoft Mon Mar 18 12:02:00 PST 2019 x86_64 x86_64 x86_64 GNU/Linux
```
