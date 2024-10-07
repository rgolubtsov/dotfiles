# Ubuntu Server LTS VM box

* **radicv144**: Ubuntu Server 24.04.1 LTS x86-64 (QEMU-KVM)

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
bogomips	: 4789.12
Total: 2
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        1807372 kB
MemFree:          877920 kB
MemAvailable:    1408208 kB
---------------------------
SwapCached:            0 kB
SwapTotal:       5242876 kB
SwapFree:        5242876 kB
```
