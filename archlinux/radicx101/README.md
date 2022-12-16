# Arch Linux 32 personal handy netbook

* **radicx101**: Arch Linux 32 (i686)

**ASUS Eee PC X101CH** (Mfd. circa middle of Spring 2012)

---

**Under the hood:**

```
$ # === CPU:
$
$ echo && cat /proc/cpuinfo | grep CPU | uniq                       && \
  echo '----------------------------------------------------------' && \
  cat /proc/cpuinfo | grep bogomips | uniq                          && \
  echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l

<N/A for a while - TBD later on>
$
$ # === Memory:
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

<N/A for a while - TBD later on>
```
