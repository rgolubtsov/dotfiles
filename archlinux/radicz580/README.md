# Arch Linux personal workhorse laptop

* **radicz580**: Arch Linux (x86-64)

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
