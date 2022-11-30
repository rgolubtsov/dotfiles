# Ubuntu Server LTS VM box

* **radicv144**: Ubuntu Server 22.04.1 LTS x86-64 (QEMU-KVM)

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
bogomips	: 4789.11
Total: 2
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        1712680 kB
MemFree:          135968 kB
MemAvailable:    1195916 kB
---------------------------
SwapCached:         6528 kB
SwapTotal:       5242876 kB
SwapFree:        5197616 kB
```
