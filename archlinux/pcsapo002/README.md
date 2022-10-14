# Arch Linux dedicated workstation box

* **pcsapo002**: Arch Linux (x86-64)

---

**Under the hood:**

```
$ # === CPU:
$
$ cat /proc/cpuinfo | grep CPU | uniq                               && \
> echo '----------------------------------------------------------' && \
> cat /proc/cpuinfo | grep bogomips | uniq                          && \
> echo -n 'Total: ' && cat /proc/cpuinfo | grep CPU | wc -l
model name	: Intel(R) Core(TM) i3-10105 CPU @ 3.70GHz
----------------------------------------------------------
bogomips	: 7402.02
Total: 8
```
