# Ubuntu Server LTS VM box

* **radicv144**: Ubuntu Server 26.04.1 LTS x86-64 (QEMU-KVM)

---

**Was booted up as the following:**

```
$ qemu-system-x86_64 -m 1.7G -enable-kvm -cpu host -smp 2 -net nic,model=virtio -net vde   \
  -drive file=/opt/radicv144/radicv144ubuntu24041serveramd6401,format=raw > /dev/null 2>&1 &
```

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
$ # === Memory (2026-09-25):
$
$ echo && cat /proc/meminfo | grep Mem && \
  echo '---------------------------'   && \
  cat /proc/meminfo | grep Swap

MemTotal:        1699120 kB
MemFree:          324340 kB
MemAvailable:    1275668 kB
---------------------------
SwapCached:         4204 kB
SwapTotal:       5242876 kB
SwapFree:        5225368 kB
$
$ # === The running kernel:
$
$ uname -a
Linux radicv144 7.0.0-31-generic #31-Ubuntu SMP PREEMPT_DYNAMIC Sat Aug  1 04:26:38 UTC 2026 x86_64 GNU/Linux
$
$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 26.04.1 LTS
Release:        26.04
Codename:       resolute
$
$ uptime -s
2026-09-22 22:50:52
```
