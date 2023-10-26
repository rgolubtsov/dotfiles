# OpenBSD VM box

* **radicv740.my.domain**: OpenBSD/amd64 7.4 (QEMU-KVM)

---

**Under the hood:**

```
$ # === CPU (and OS kernel):
$
$ echo && dmesg | grep CPU                                                    && \
  echo '--------------------------------------------------------------------' && \
  dmesg | grep GENERIC

<N/A for a while - TBD later on>
$
$ # === Memory:
$
$ echo -en '\n ' && dmesg | grep mem

<N/A for a while - TBD later on>
```
