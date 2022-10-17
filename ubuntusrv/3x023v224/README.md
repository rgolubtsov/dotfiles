# Ubuntu Server LTS VM box

* **3x023v224**: Ubuntu Server 22.04.1 LTS (x86-64), VMware vSphere-based

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep CPU | uniq                              && \
> echo '-----------------------------------------------------------------' && \
> cat /proc/cpuinfo | grep bogomips | uniq                                 && \
> echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l

model name	: Intel(R) Xeon(R) CPU           X5650  @ 2.67GHz
-----------------------------------------------------------------
bogomips	: 5320.60
Total: 1
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
> echo '---------------------------'   && \
> cat /proc/meminfo | grep Swap

MemTotal:        4018444 kB
MemFree:          483952 kB
MemAvailable:    2472972 kB
---------------------------
SwapCached:           52 kB
SwapTotal:       4020220 kB
SwapFree:        4019952 kB
```
