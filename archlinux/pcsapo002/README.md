# Arch Linux dedicated workstation box

* **pcsapo002**: Arch Linux (x86-64)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep CPU | uniq                       && \
> echo '----------------------------------------------------------' && \
> cat /proc/cpuinfo | grep bogomips | uniq                          && \
> echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l

model name	: Intel(R) Core(TM) i3-10105 CPU @ 3.70GHz
----------------------------------------------------------
bogomips	: 7402.02
Total: 8
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
> echo '---------------------------'   && \
> cat /proc/meminfo | grep Swap

MemTotal:        7962408 kB
MemFree:         3544820 kB
MemAvailable:    5028580 kB
---------------------------
SwapCached:            0 kB
SwapTotal:       8388604 kB
SwapFree:        8388604 kB
```
