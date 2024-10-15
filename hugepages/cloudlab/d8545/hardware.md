## d8545 Hardware Info

```
hand32@node0:~/experiments/hugepages/cloudlab/d8545$ uname -a
Linux node0.hand32-223794.bayopsys-pg0.wisc.cloudlab.us 6.2.0-1015-nvidia #15-Ubuntu SMP PREEMPT_DYNAMIC Wed Jan 17 16:25:21 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
hand32@node0:~/experiments/hugepages/cloudlab/d8545$ nvidia-smi
Tue Oct 15 16:16:12 2024
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 530.30.02              Driver Version: 530.30.02    CUDA Version: 12.1     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                  Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf            Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA A100-SXM4-40GB           On | 00000000:01:00.0 Off |                    0 |
| N/A   26C    P0               50W / 400W|      0MiB / 40960MiB |      0%      Default |
|                                         |                      |             Disabled |
+-----------------------------------------+----------------------+----------------------+
|   1  NVIDIA A100-SXM4-40GB           On | 00000000:41:00.0 Off |                    0 |
| N/A   25C    P0               49W / 400W|      0MiB / 40960MiB |      0%      Default |
|                                         |                      |             Disabled |
+-----------------------------------------+----------------------+----------------------+
|   2  NVIDIA A100-SXM4-40GB           On | 00000000:81:00.0 Off |                    0 |
| N/A   27C    P0               50W / 400W|      0MiB / 40960MiB |      0%      Default |
|                                         |                      |             Disabled |
+-----------------------------------------+----------------------+----------------------+
|   3  NVIDIA A100-SXM4-40GB           On | 00000000:C1:00.0 Off |                    0 |
| N/A   25C    P0               48W / 400W|      0MiB / 40960MiB |      0%      Default |
|                                         |                      |             Disabled |
+-----------------------------------------+----------------------+----------------------+

+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|  No running processes found                                                           |
+---------------------------------------------------------------------------------------+
```

```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ numactl --hardware
available: 8 nodes (0-7)
node 0 cpus: 0 1 2 3 4 5 48 49 50 51 52 53
node 0 size: 64069 MB
node 0 free: 59660 MB
node 1 cpus: 6 7 8 9 10 11 54 55 56 57 58 59
node 1 size: 64508 MB
node 1 free: 63617 MB
node 2 cpus: 12 13 14 15 16 17 60 61 62 63 64 65
node 2 size: 64508 MB
node 2 free: 54826 MB
node 3 cpus: 18 19 20 21 22 23 66 67 68 69 70 71
node 3 size: 64496 MB
node 3 free: 63441 MB
node 4 cpus: 24 25 26 27 28 29 72 73 74 75 76 77
node 4 size: 64508 MB
node 4 free: 64179 MB
node 5 cpus: 30 31 32 33 34 35 78 79 80 81 82 83
node 5 size: 64508 MB
node 5 free: 64047 MB
node 6 cpus: 36 37 38 39 40 41 84 85 86 87 88 89
node 6 size: 64456 MB
node 6 free: 64038 MB
node 7 cpus: 42 43 44 45 46 47 90 91 92 93 94 95
node 7 size: 64502 MB
node 7 free: 64027 MB
node distances:
node   0   1   2   3   4   5   6   7
  0:  10  12  12  12  32  32  32  32
  1:  12  10  12  12  32  32  32  32
  2:  12  12  10  12  32  32  32  32
  3:  12  12  12  10  32  32  32  32
  4:  32  32  32  32  10  12  12  12
  5:  32  32  32  32  12  10  12  12
  6:  32  32  32  32  12  12  10  12
  7:  32  32  32  32  12  12  12  10
  
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nproc
96
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ cat /proc/cpuinfo | head -n 28
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 25
model		: 1
model name	: AMD EPYC 7413 24-Core Processor
stepping	: 1
microcode	: 0xa0011d3
cpu MHz		: 2644.843
cache size	: 512 KB
physical id	: 0
siblings	: 48
core id		: 0
cpu cores	: 24
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 16
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 invpcid_single hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 invpcid cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd amd_ppin brs arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca
bugs		: sysret_ss_attrs spectre_v1 spectre_v2 spec_store_bypass srso
bogomips	: 5289.68
TLB size	: 2560 4K pages
clflush size	: 64
cache_alignment	: 64
address sizes	: 48 bits physical, 48 bits virtual
power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ free -h
               total        used        free      shared  buff/cache   available
Mem:           503Gi        41Gi       448Gi       6.0Mi        13Gi       459Gi
Swap:          8.0Gi          0B       8.0Gi

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ df -h .
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb3        63G   18G   43G  29% /
```

### lshw
```
    description: Rack Mount Chassis
    product: PowerEdge XE8545 (SKU=0A2D;ModelName=PowerEdge XE8545)
    vendor: Dell Inc.
    serial: 7FB02G3
    width: 64 bits
    capabilities: smbios-3.3.0 dmi-3.3.0 smp vsyscall32
    configuration: boot=normal chassis=rackmount family=PowerEdge sku=SKU=0A2D;ModelName=PowerEdge XE8545 uuid=4c4c4544-0046-4210-8030-b7c04f324733
  *-core
       description: Motherboard
       product: 099K88
       vendor: Dell Inc.
       physical id: 0
       version: A00
       serial: .7FB02G3.CNIVC0014A0048.
     *-firmware
          description: BIOS
          vendor: Dell Inc.
          physical id: 0
          version: 2.14.1
          date: 12/18/2023
          size: 64KiB
          capacity: 32MiB
          capabilities: isa pci pnp upgrade shadowing cdboot bootselect edd int13floppytoshiba int13floppy360 int13floppy1200 int13floppy720 int9keyboard int14serial int10video acpi usb biosbootspecification netboot uefi
     *-cpu:0
          description: CPU
          product: AMD EPYC 7413 24-Core Processor
          vendor: Advanced Micro Devices [AMD]
          physical id: 400
          bus info: cpu@0
          version: 25.1.1
          slot: CPU1
          size: 2650MHz
          capacity: 3900MHz
          width: 64 bits
          clock: 3115MHz
          capabilities: lm fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp x86-64 constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 invpcid_single hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 invpcid cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd amd_ppin brs arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca
          configuration: cores=24 enabledcores=24 microcode=167776723 threads=48
        *-cache:0
             description: L1 cache
             physical id: 700
             size: 1536KiB
             capacity: 1536KiB
             capabilities: internal write-back unified
             configuration: level=1
        *-cache:1
             description: L2 cache
             physical id: 701
             size: 12MiB
             capacity: 12MiB
             capabilities: internal write-back unified
             configuration: level=2
        *-cache:2
             description: L3 cache
             physical id: 702
             size: 128MiB
             capacity: 128MiB
             capabilities: internal write-back unified
             configuration: level=3
     *-cpu:1
          description: CPU
          product: AMD EPYC 7413 24-Core Processor
          vendor: Advanced Micro Devices [AMD]
          physical id: 401
          bus info: cpu@1
          version: 25.1.1
          slot: CPU2
          size: 2650MHz
          capacity: 3900MHz
          width: 64 bits
          clock: 3115MHz
          capabilities: lm fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp x86-64 constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 invpcid_single hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 invpcid cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd amd_ppin brs arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload vgif v_spec_ctrl umip pku ospke vaes vpclmulqdq rdpid overflow_recov succor smca
          configuration: cores=24 enabledcores=24 microcode=167776723 threads=48
        *-cache:0
             description: L1 cache
             physical id: 703
             size: 1536KiB
             capacity: 1536KiB
             capabilities: internal write-back unified
             configuration: level=1
        *-cache:1
             description: L2 cache
             physical id: 704
             size: 12MiB
             capacity: 12MiB
             capabilities: internal write-back unified
             configuration: level=2
        *-cache:2
             description: L3 cache
             physical id: 705
             size: 128MiB
             capacity: 128MiB
             capabilities: internal write-back unified
             configuration: level=3
     *-memory
          description: System Memory
          physical id: 1000
          slot: System board or motherboard
          size: 512GiB
          capacity: 4TiB
          capabilities: ecc
          configuration: errordetection=multi-bit-ecc
        *-bank:0
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 0
             serial: 2FC47B10
             slot: A1
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:1
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 1
             serial: 2FC48380
             slot: A2
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:2
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 2
             serial: 2FC2FDC2
             slot: A3
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:3
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 3
             serial: 2FC3026E
             slot: A4
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:4
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 4
             serial: 2FC47B31
             slot: A5
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:5
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 5
             serial: 2FC48120
             slot: A6
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:6
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 6
             serial: 2FC2FEB8
             slot: A7
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:7
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 7
             serial: 2FC3006D
             slot: A8
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:8
             description: [empty]
             physical id: 8
             slot: A9
        *-bank:9
             description: [empty]
             physical id: 9
             slot: A10
        *-bank:10
             description: [empty]
             physical id: a
             slot: A11
        *-bank:11
             description: [empty]
             physical id: b
             slot: A12
        *-bank:12
             description: [empty]
             physical id: c
             slot: A13
        *-bank:13
             description: [empty]
             physical id: d
             slot: A14
        *-bank:14
             description: [empty]
             physical id: e
             slot: A15
        *-bank:15
             description: [empty]
             physical id: f
             slot: A16
        *-bank:16
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 10
             serial: 2FC47B58
             slot: B1
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:17
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 11
             serial: 2FC4817E
             slot: B2
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:18
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 12
             serial: 2FC48388
             slot: B3
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:19
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 13
             serial: 2FC48140
             slot: B4
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:20
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 14
             serial: 2FC47F84
             slot: B5
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:21
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 15
             serial: 2FC4830A
             slot: B6
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:22
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 16
             serial: 2FC2F3EE
             slot: B7
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:23
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: 36ASF4G72PZ-3G2J3
             vendor: Micron Technology
             physical id: 17
             serial: 2FC30334
             slot: B8
             size: 32GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:24
             description: [empty]
             physical id: 18
             slot: B9
        *-bank:25
             description: [empty]
             physical id: 19
             slot: B10
        *-bank:26
             description: [empty]
             physical id: 1a
             slot: B11
        *-bank:27
             description: [empty]
             physical id: 1b
             slot: B12
        *-bank:28
             description: [empty]
             physical id: 1c
             slot: B13
        *-bank:29
             description: [empty]
             physical id: 1d
             slot: B14
        *-bank:30
             description: [empty]
             physical id: 1e
             slot: B15
        *-bank:31
             description: [empty]
             physical id: 1f
             slot: B16
     *-pci:0
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 100
          bus info: pci@0000:00:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:00:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.1
             bus info: pci@0000:00:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:34 memory:f9000000-fa3fffff ioport:3a000000000(size=86469771264)
           *-display
                description: 3D controller
                product: GA100 [A100 SXM4 40GB]
                vendor: NVIDIA Corporation
                physical id: 0
                bus info: pci@0000:01:00.0
                logical name: /dev/fb0
                version: a1
                width: 64 bits
                clock: 33MHz
                capabilities: pm bus_master cap_list fb
                configuration: depth=32 driver=nvidia latency=0 mode=1024x768 visual=truecolor xres=1024 yres=768
                resources: iomemory:3a00-39ff iomemory:3b40-3b3f irq:461 memory:f9000000-f9ffffff memory:3a000000000-3afffffffff memory:3b420000000-3b421ffffff memory:fa000000-fa3fffff memory:3b000000000-3b3ffffffff memory:3b400000000-3b41fffffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:00:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:36 memory:fa600000-fa6fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:03:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:03:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:430 memory:fa600000-fa67ffff memory:fa680000-fa681fff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:00:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:37 memory:fa400000-fa5fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:04:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:04:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:35 memory:fa500000-fa57ffff memory:fa580000-fa581fff
           *-usb
                description: USB controller
                product: Starship USB 3.0 Host Controller
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.3
                bus info: pci@0000:04:00.3
                version: 00
                width: 64 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix xhci bus_master cap_list
                configuration: driver=xhci_hcd latency=0
                resources: irq:82 memory:fa400000-fa4fffff
              *-usbhost:0
                   product: xHCI Host Controller
                   vendor: Linux 6.2.0-1015-nvidia xhci-hcd
                   physical id: 0
                   bus info: usb@1
                   logical name: usb1
                   version: 6.02
                   capabilities: usb-2.00
                   configuration: driver=hub slots=2 speed=480Mbit/s
              *-usbhost:1
                   product: xHCI Host Controller
                   vendor: Linux 6.2.0-1015-nvidia xhci-hcd
                   physical id: 1
                   bus info: usb@2
                   logical name: usb2
                   version: 6.02
                   capabilities: usb-3.10
                   configuration: driver=hub slots=2 speed=10000Mbit/s
        *-serial
             description: SMBus
             product: FCH SMBus Controller
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 14
             bus info: pci@0000:00:14.0
             version: 61
             width: 32 bits
             clock: 66MHz
             configuration: driver=piix4_smbus latency=0
             resources: irq:0
        *-isa
             description: ISA bridge
             product: FCH LPC Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 14.3
             bus info: pci@0000:00:14.3
             version: 51
             width: 32 bits
             clock: 66MHz
             capabilities: isa bus_master
             configuration: latency=0
           *-pnp00:00
                product: PnP device PNP0c01
                physical id: 0
                capabilities: pnp
                configuration: driver=system
           *-pnp00:01
                product: PnP device PNP0c02
                physical id: 1
                capabilities: pnp
                configuration: driver=system
           *-pnp00:02
                product: PnP device PNP0b00
                physical id: 2
                capabilities: pnp
                configuration: driver=rtc_cmos
           *-pnp00:03
                product: PnP device PNP0501
                physical id: 3
                capabilities: pnp
                configuration: driver=serial
           *-pnp00:04
                product: PnP device PNP0501
                physical id: 4
                capabilities: pnp
                configuration: driver=serial
     *-pci:1
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 101
          bus info: pci@0000:00:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:2
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 102
          bus info: pci@0000:00:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:3
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 103
          bus info: pci@0000:00:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:4
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 104
          bus info: pci@0000:00:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:5
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 105
          bus info: pci@0000:00:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:6
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 106
          bus info: pci@0000:00:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:7
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 107
          bus info: pci@0000:00:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:8
          description: Host bridge
          product: Milan Data Fabric; Function 0
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 108
          bus info: pci@0000:00:18.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:9
          description: Host bridge
          product: Milan Data Fabric; Function 1
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 109
          bus info: pci@0000:00:18.1
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:10
          description: Host bridge
          product: Milan Data Fabric; Function 2
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10a
          bus info: pci@0000:00:18.2
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:11
          description: Host bridge
          product: Milan Data Fabric; Function 3
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10b
          bus info: pci@0000:00:18.3
          version: 00
          width: 32 bits
          clock: 33MHz
          configuration: driver=k10temp
          resources: irq:0
     *-pci:12
          description: Host bridge
          product: Milan Data Fabric; Function 4
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10c
          bus info: pci@0000:00:18.4
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:13
          description: Host bridge
          product: Milan Data Fabric; Function 5
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10d
          bus info: pci@0000:00:18.5
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:14
          description: Host bridge
          product: Milan Data Fabric; Function 6
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10e
          bus info: pci@0000:00:18.6
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:15
          description: Host bridge
          product: Milan Data Fabric; Function 7
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10f
          bus info: pci@0000:00:18.7
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:16
          description: Host bridge
          product: Milan Data Fabric; Function 0
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 110
          bus info: pci@0000:00:19.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:17
          description: Host bridge
          product: Milan Data Fabric; Function 1
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 111
          bus info: pci@0000:00:19.1
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:18
          description: Host bridge
          product: Milan Data Fabric; Function 2
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 112
          bus info: pci@0000:00:19.2
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:19
          description: Host bridge
          product: Milan Data Fabric; Function 3
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 113
          bus info: pci@0000:00:19.3
          version: 00
          width: 32 bits
          clock: 33MHz
          configuration: driver=k10temp
          resources: irq:0
     *-pci:20
          description: Host bridge
          product: Milan Data Fabric; Function 4
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 114
          bus info: pci@0000:00:19.4
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:21
          description: Host bridge
          product: Milan Data Fabric; Function 5
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 115
          bus info: pci@0000:00:19.5
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:22
          description: Host bridge
          product: Milan Data Fabric; Function 6
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 116
          bus info: pci@0000:00:19.6
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:23
          description: Host bridge
          product: Milan Data Fabric; Function 7
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 117
          bus info: pci@0000:00:19.7
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:24
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 118
          bus info: pci@0000:20:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:20:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.1
             bus info: pci@0000:20:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:38 memory:cd800000-cdbfffff ioport:2bf40000000(size=2097152)
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.2
             bus info: pci@0000:20:01.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:39 memory:ce000000-ce0fffff ioport:2bf40200000(size=2097152)
           *-nvme
                description: NVMe device
                product: Dell Ent NVMe v2 AGN MU U.2 1.6TB
                vendor: Samsung Electronics Co Ltd
                physical id: 0
                bus info: pci@0000:22:00.0
                logical name: /dev/nvme0
                version: 2.5.0
                serial: S6CTNA0R701170
                width: 64 bits
                clock: 33MHz
                capabilities: nvme pm msi pciexpress msix nvm_express bus_master cap_list
                configuration: driver=nvme latency=0 nqn=nqn.1994-11.com.samsung:nvme:PM1733:2.5-inch:S6CTNA0R701170 state=live
                resources: irq:267 memory:ce000000-ce007fff
              *-namespace:0
                   description: NVMe disk
                   physical id: 0
                   logical name: hwmon0
              *-namespace:1
                   description: NVMe disk
                   physical id: 1
                   logical name: nvme0c0n1
                   configuration: wwid=eui.36435430527011700025384100000003
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.3
             bus info: pci@0000:20:01.3
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:40 memory:cd400000-cd7fffff ioport:2bf40400000(size=2097152)
        *-pci:3
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.4
             bus info: pci@0000:20:01.4
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:41 ioport:2000(size=4096) memory:cd000000-cd3fffff ioport:2bf40600000(size=2097152)
        *-pci:4
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:20:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:43 memory:cdf00000-cdffffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:25:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:25:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:433 memory:cdf00000-cdf7ffff memory:cdf80000-cdf81fff
        *-pci:5
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:20:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:44 memory:cdc00000-cdefffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:26:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse Cryptographic Coprocessor PSPCPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.1
                bus info: pci@0000:26:00.1
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ccp latency=0
                resources: irq:435 memory:cdd00000-cddfffff memory:cde82000-cde83fff
           *-generic:2
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:26:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:42 memory:cde00000-cde7ffff memory:cde80000-cde81fff
           *-usb
                description: USB controller
                product: Starship USB 3.0 Host Controller
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.3
                bus info: pci@0000:26:00.3
                version: 00
                width: 64 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix xhci bus_master cap_list
                configuration: driver=xhci_hcd latency=0
                resources: irq:241 memory:cdc00000-cdcfffff
              *-usbhost:0
                   product: xHCI Host Controller
                   vendor: Linux 6.2.0-1015-nvidia xhci-hcd
                   physical id: 0
                   bus info: usb@3
                   logical name: usb3
                   version: 6.02
                   capabilities: usb-2.00
                   configuration: driver=hub slots=2 speed=480Mbit/s
                 *-usb:0
                      description: USB hub
                      product: Dell Integrated Hub
                      vendor: Tascam
                      physical id: 1
                      bus info: usb@3:1
                      version: 0.00
                      capabilities: usb-2.00
                      configuration: driver=hub maxpower=100mA slots=4 speed=480Mbit/s
                    *-usb:0
                         description: USB hub
                         product: Dell Integrated Hub
                         vendor: Tascam
                         physical id: 1
                         bus info: usb@3:1.1
                         version: 0.00
                         capabilities: usb-2.00
                         configuration: driver=hub maxpower=100mA slots=4 speed=480Mbit/s
                    *-usb:1
                         description: USB hub
                         product: Dell Integrated Hub
                         vendor: Tascam
                         physical id: 4
                         bus info: usb@3:1.4
                         version: 0.00
                         capabilities: usb-2.00
                         configuration: driver=hub maxpower=100mA slots=4 speed=480Mbit/s
                 *-usb:1
                      description: USB hub
                      product: USB 2.0 Hub
                      vendor: Microchip Technology, Inc. (formerly SMSC)
                      physical id: 2
                      bus info: usb@3:2
                      version: 0.00
                      capabilities: usb-2.00
                      configuration: driver=hub maxpower=2mA slots=2 speed=480Mbit/s
              *-usbhost:1
                   product: xHCI Host Controller
                   vendor: Linux 6.2.0-1015-nvidia xhci-hcd
                   physical id: 1
                   bus info: usb@4
                   logical name: usb4
                   version: 6.02
                   capabilities: usb-3.10
                   configuration: driver=hub slots=2 speed=10000Mbit/s
     *-pci:25
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 119
          bus info: pci@0000:20:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:26
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11a
          bus info: pci@0000:20:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:27
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11b
          bus info: pci@0000:20:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:28
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11c
          bus info: pci@0000:20:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:29
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11d
          bus info: pci@0000:20:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:30
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11e
          bus info: pci@0000:20:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:31
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 11f
          bus info: pci@0000:20:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:32
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 120
          bus info: pci@0000:40:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:40:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.1
             bus info: pci@0000:40:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:45 memory:da000000-db3fffff ioport:1e000000000(size=86469771264)
           *-display
                description: 3D controller
                product: GA100 [A100 SXM4 40GB]
                vendor: NVIDIA Corporation
                physical id: 0
                bus info: pci@0000:41:00.0
                version: a1
                width: 64 bits
                clock: 33MHz
                capabilities: pm bus_master cap_list
                configuration: driver=nvidia latency=0
                resources: iomemory:1e00-1dff iomemory:1f40-1f3f irq:462 memory:da000000-daffffff memory:1e000000000-1efffffffff memory:1f420000000-1f421ffffff memory:db000000-db3fffff memory:1f000000000-1f3ffffffff memory:1f400000000-1f41fffffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:40:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:47 memory:db500000-db5fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:43:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:43:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:442 memory:db500000-db57ffff memory:db580000-db581fff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:40:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:49 memory:db400000-db4fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:44:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:44:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:46 memory:db400000-db47ffff memory:db480000-db481fff
     *-pci:33
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 121
          bus info: pci@0000:40:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:34
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 122
          bus info: pci@0000:40:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:35
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 123
          bus info: pci@0000:40:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:36
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 124
          bus info: pci@0000:40:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:37
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 125
          bus info: pci@0000:40:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:38
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 126
          bus info: pci@0000:40:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:39
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 127
          bus info: pci@0000:40:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:40
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 128
          bus info: pci@0000:60:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:60:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:60:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:50 memory:df300000-df3fffff ioport:df000000(size=3145728)
           *-network:0
                description: Ethernet interface
                product: BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet Controller
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0
                bus info: pci@0000:63:00.0
                logical name: eno12399np0
                version: 01
                serial: e4:3d:1a:15:4a:e0
                capacity: 25Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msix pciexpress bus_master cap_list rom ethernet physical fibre 1000bt-fd 10000bt-fd 25000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=bnxt_en driverversion=6.2.0-1015-nvidia duplex=full firmware=229.2.75.0/pkg 22.92.07.50 ip=128.105.146.72 latency=0 link=yes multicast=yes port=fibre
                resources: irq:83 memory:df210000-df21ffff memory:df100000-df1fffff memory:df222000-df223fff memory:df300000-df33ffff
           *-network:1 DISABLED
                description: Ethernet interface
                product: BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet Controller
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0.1
                bus info: pci@0000:63:00.1
                logical name: eno12409np1
                version: 01
                serial: e4:3d:1a:15:4a:e1
                capacity: 25Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msix pciexpress bus_master cap_list rom ethernet physical fibre 1000bt-fd 25000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=bnxt_en driverversion=6.2.0-1015-nvidia firmware=229.2.75.0/pkg 22.92.07.50 latency=0 link=no multicast=yes
                resources: irq:119 memory:df200000-df20ffff memory:df000000-df0fffff memory:df220000-df221fff memory:df340000-df37ffff
        *-pci:1
             description: PCI bridge
             product: Starship PCIe GPP Bridge [1:0]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 5.2
             bus info: pci@0000:60:05.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:51 memory:e7000000-e78fffff ioport:de000000(size=16777216)
           *-pci
                description: PCI bridge
                product: PCI Express Bridge
                vendor: PLDA
                physical id: 0
                bus info: pci@0000:61:00.0
                version: 02
                width: 32 bits
                clock: 33MHz
                capabilities: pci msi pm pciexpress normal_decode bus_master cap_list
                resources: memory:e7000000-e78fffff ioport:de000000(size=16777216)
              *-display
                   description: VGA compatible controller
                   product: Integrated Matrox G200eW3 Graphics Controller
                   vendor: Matrox Electronics Systems Ltd.
                   physical id: 0
                   bus info: pci@0000:62:00.0
                   logical name: /dev/fb0
                   version: 04
                   width: 32 bits
                   clock: 66MHz
                   capabilities: pm vga_controller bus_master cap_list rom fb
                   configuration: depth=32 driver=mgag200 latency=64 maxlatency=32 mingnt=16 resolution=1024,768
                   resources: irq:460 memory:de000000-deffffff memory:e7808000-e780bfff memory:e7000000-e77fffff memory:c0000-dffff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:60:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:53 memory:e7a00000-e7afffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:64:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:64:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:445 memory:e7a00000-e7a7ffff memory:e7a80000-e7a81fff
        *-pci:3
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:60:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:55 memory:e7900000-e79fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:65:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:65:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:52 memory:e7900000-e797ffff memory:e7980000-e7981fff
     *-pci:41
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 129
          bus info: pci@0000:60:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:42
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12a
          bus info: pci@0000:60:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:43
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12b
          bus info: pci@0000:60:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:44
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12c
          bus info: pci@0000:60:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:45
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12d
          bus info: pci@0000:60:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:46
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12e
          bus info: pci@0000:60:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:47
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 12f
          bus info: pci@0000:60:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:48
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 130
          bus info: pci@0000:80:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:80:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.1
             bus info: pci@0000:80:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:56 memory:99000000-9a3fffff ioport:72000000000(size=86469771264)
           *-display
                description: 3D controller
                product: GA100 [A100 SXM4 40GB]
                vendor: NVIDIA Corporation
                physical id: 0
                bus info: pci@0000:81:00.0
                version: a1
                width: 64 bits
                clock: 33MHz
                capabilities: pm bus_master cap_list
                configuration: driver=nvidia latency=0
                resources: iomemory:7200-71ff iomemory:7340-733f irq:463 memory:99000000-99ffffff memory:72000000000-72fffffffff memory:73420000000-73421ffffff memory:9a000000-9a3fffff memory:73000000000-733ffffffff memory:73400000000-7341fffffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:80:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:58 memory:9a500000-9a5fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:83:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:83:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:448 memory:9a500000-9a57ffff memory:9a580000-9a581fff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:80:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:60 memory:9a400000-9a4fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:84:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:84:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:57 memory:9a400000-9a47ffff memory:9a480000-9a481fff
     *-pci:49
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 131
          bus info: pci@0000:80:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:50
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 132
          bus info: pci@0000:80:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:51
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 133
          bus info: pci@0000:80:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:52
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 134
          bus info: pci@0000:80:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:53
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 135
          bus info: pci@0000:80:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:54
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 136
          bus info: pci@0000:80:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:55
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 137
          bus info: pci@0000:80:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:56
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 138
          bus info: pci@0000:a0:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:a0:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:a0:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:61 memory:9d000000-9d0fffff ioport:9e000000(size=33554432)
           *-network DISABLED
                description: Ethernet interface
                product: MT28908 Family [ConnectX-6]
                vendor: Mellanox Technologies
                physical id: 0
                bus info: pci@0000:a1:00.0
                logical name: enp161s0np0
                version: 00
                serial: 94:6d:ae:61:94:e2
                capacity: 40Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pciexpress vpd msix pm bus_master cap_list rom ethernet physical fibre 1000bt-fd 10000bt-fd 25000bt-fd 40000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=mlx5_core driverversion=6.2.0-1015-nvidia firmware=20.41.1000 (DEL0000000010) latency=0 link=no multicast=yes port=fibre
                resources: irq:365 memory:9e000000-9fffffff memory:9d000000-9d0fffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:a0:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:63 memory:a6200000-a62fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:a2:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:a2:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:451 memory:a6200000-a627ffff memory:a6280000-a6281fff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:a0:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:65 memory:a6000000-a61fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:a3:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse Cryptographic Coprocessor PSPCPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.1
                bus info: pci@0000:a3:00.1
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ccp latency=0
                resources: irq:438 memory:a6000000-a60fffff memory:a6182000-a6183fff
           *-generic:2
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:a3:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:62 memory:a6100000-a617ffff memory:a6180000-a6181fff
     *-pci:57
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 139
          bus info: pci@0000:a0:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:58
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13a
          bus info: pci@0000:a0:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:59
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13b
          bus info: pci@0000:a0:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:60
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13c
          bus info: pci@0000:a0:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:61
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13d
          bus info: pci@0000:a0:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:62
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13e
          bus info: pci@0000:a0:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:63
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 13f
          bus info: pci@0000:a0:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:64
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 140
          bus info: pci@0000:c0:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:c0:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 1.1
             bus info: pci@0000:c0:01.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:66 memory:b3000000-b43fffff ioport:56000000000(size=86469771264)
           *-display
                description: 3D controller
                product: GA100 [A100 SXM4 40GB]
                vendor: NVIDIA Corporation
                physical id: 0
                bus info: pci@0000:c1:00.0
                version: a1
                width: 64 bits
                clock: 33MHz
                capabilities: pm bus_master cap_list
                configuration: driver=nvidia latency=0
                resources: iomemory:5600-55ff iomemory:5740-573f irq:464 memory:b3000000-b3ffffff memory:56000000000-56fffffffff memory:57420000000-57421ffffff memory:b4000000-b43fffff memory:57000000000-573ffffffff memory:57400000000-5741fffffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:c0:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:67 memory:b5000000-b53fffff ioport:55e20000000(size=2097152)
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.2
             bus info: pci@0000:c0:03.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:68 memory:b4c00000-b4ffffff ioport:55e20200000(size=2097152)
        *-pci:3
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.3
             bus info: pci@0000:c0:03.3
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:69 memory:b4800000-b4bfffff ioport:55e20400000(size=2097152)
        *-pci:4
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.4
             bus info: pci@0000:c0:03.4
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:70 ioport:7000(size=4096) memory:b4400000-b47fffff ioport:55e20600000(size=2097152)
        *-pci:5
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:c0:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:72 memory:b5600000-b56fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c7:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:c7:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:454 memory:b5600000-b567ffff memory:b5680000-b5681fff
        *-pci:6
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:c0:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:74 memory:b5500000-b55fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c8:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:c8:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:71 memory:b5500000-b557ffff memory:b5580000-b5581fff
        *-pci:7
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.3
             bus info: pci@0000:c0:08.3
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:75 memory:b5400000-b54fffff
           *-sata
                description: SATA controller
                product: FCH SATA Controller [AHCI mode]
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c9:00.0
                version: 51
                width: 32 bits
                clock: 33MHz
                capabilities: sata pm pciexpress msi ahci_1.0 bus_master cap_list
                configuration: driver=ahci latency=0
                resources: irq:251 memory:b5400000-b54007ff
     *-pci:65
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 141
          bus info: pci@0000:c0:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:66
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 142
          bus info: pci@0000:c0:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:67
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 143
          bus info: pci@0000:c0:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:68
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 144
          bus info: pci@0000:c0:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:69
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 145
          bus info: pci@0000:c0:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:70
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 146
          bus info: pci@0000:c0:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:71
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 147
          bus info: pci@0000:c0:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:72
          description: Host bridge
          product: Starship/Matisse Root Complex
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 148
          bus info: pci@0000:e0:00.0
          version: 00
          width: 32 bits
          clock: 33MHz
        *-generic UNCLAIMED
             description: IOMMU
             product: Milan IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:e0:00.2
             version: 01
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:e0:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:76 ioport:8000(size=4096) memory:c0200000-c02fffff ioport:b7100000(size=2097152)
           *-raid
                description: RAID bus controller
                product: MegaRAID Tri-Mode SAS3516
                vendor: Broadcom / LSI
                physical id: 0
                bus info: pci@0000:e2:00.0
                logical name: scsi0
                version: 01
                width: 64 bits
                clock: 33MHz
                capabilities: raid pm msi pciexpress msix bus_master cap_list rom
                configuration: driver=megaraid_sas latency=0
                resources: irq:94 memory:b7100000-b71fffff memory:b7200000-b72fffff memory:c0200000-c02fffff ioport:8000(size=256)
              *-disk:0
                   description: SCSI Disk
                   product: PERC H745 Adp
                   vendor: DELL
                   physical id: 2.0.0
                   bus info: scsi@0:2.0.0
                   logical name: /dev/sda
                   version: 5.16
                   serial: 008da39f21d1f71d2c001518d550b207
                   size: 446GiB (479GB)
                   configuration: ansiversion=5 logicalsectorsize=512 sectorsize=512
              *-disk:1
                   description: SCSI Disk
                   product: PERC H745 Adp
                   vendor: DELL
                   physical id: 2.1.0
                   bus info: scsi@0:2.1.0
                   logical name: /dev/sdb
                   version: 5.16
                   serial: 0028590838e0f71d2c001518d550b207
                   size: 446GiB (479GB)
                   capabilities: gpt-1.00 partitioned partitioned:gpt
                   configuration: ansiversion=5 guid=916bb3f3-230a-44f6-8afc-b0ee55667823 logicalsectorsize=512 sectorsize=512
                 *-volume:0
                      description: Windows FAT volume
                      vendor: mkfs.fat
                      physical id: 1
                      bus info: scsi@0:2.1.0,1
                      logical name: /dev/sdb1
                      logical name: /boot/efi
                      version: FAT16
                      serial: d99e-6443
                      size: 254MiB
                      capacity: 255MiB
                      capabilities: boot fat initialized
                      configuration: FATs=2 filesystem=fat mount.fstype=vfat mount.options=rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro name=EFI System state=mounted
                 *-volume:1
                      description: BIOS Boot partition
                      vendor: EFI
                      physical id: 2
                      bus info: scsi@0:2.1.0,2
                      logical name: /dev/sdb2
                      serial: d1f49f15-f54e-47e5-8b0b-4033572b0bd3
                      capacity: 1023KiB
                      capabilities: nofs
                      configuration: name=BIOS boot partition
                 *-volume:2
                      description: EXT3 volume
                      vendor: Linux
                      physical id: 3
                      bus info: scsi@0:2.1.0,3
                      logical name: /dev/sdb3
                      logical name: /
                      version: 1.0
                      serial: 571337a8-0ea6-44bd-9cfc-6cb9719427c1
                      size: 64GiB
                      capabilities: journaled extended_attributes large_files recover ext3 ext2 initialized
                      configuration: created=2022-08-23 13:10:00 filesystem=ext3 label=/ lastmountpoint=/ modified=2024-10-15 15:28:22 mount.fstype=ext3 mount.options=rw,relatime mounted=2024-10-15 15:28:23 name=Linux filesystem state=mounted
                 *-volume:3
                      description: Linux swap volume
                      vendor: Linux
                      physical id: 63
                      bus info: scsi@0:2.1.0,99
                      logical name: /dev/sdb99
                      version: 1
                      serial: 648e47e0-98f3-485e-9a87-0158d1a7ef80
                      size: 8GiB
                      capacity: 8GiB
                      capabilities: nofs swap initialized
                      configuration: filesystem=swap name=Linux swap pagesize=4096
        *-pci:1
             description: PCI bridge
             product: Starship PCIe GPP Bridge [1:0]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 5.1
             bus info: pci@0000:e0:05.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:77 memory:b7300000-b73fffff ioport:b7000000(size=1048576)
           *-network:0 DISABLED
                description: Ethernet interface
                product: NetXtreme BCM5720 Gigabit Ethernet PCIe
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0
                bus info: pci@0000:e1:00.0
                logical name: eno8303
                version: 00
                serial: 70:b5:e8:f0:61:26
                capacity: 1Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msi msix pciexpress bus_master cap_list rom ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt 1000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=tg3 driverversion=6.2.0-1015-nvidia firmware=FFV22.91.5 bc 5720-v1.39 latency=0 link=no multicast=yes port=twisted pair
                resources: irq:84 memory:b7030000-b703ffff memory:b7040000-b704ffff memory:b7050000-b705ffff memory:b7300000-b733ffff
           *-network:1 DISABLED
                description: Ethernet interface
                product: NetXtreme BCM5720 Gigabit Ethernet PCIe
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0.1
                bus info: pci@0000:e1:00.1
                logical name: eno8403
                version: 00
                serial: 70:b5:e8:f0:61:27
                capacity: 1Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msi msix pciexpress bus_master cap_list rom ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt 1000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=tg3 driverversion=6.2.0-1015-nvidia firmware=FFV22.91.5 bc 5720-v1.39 latency=0 link=no multicast=yes port=twisted pair
                resources: irq:93 memory:b7000000-b700ffff memory:b7010000-b701ffff memory:b7020000-b702ffff memory:b7340000-b737ffff
        *-pci:2
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 7.1
             bus info: pci@0000:e0:07.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:79 memory:c0100000-c01fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:e3:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:e3:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:457 memory:c0100000-c017ffff memory:c0180000-c0181fff
        *-pci:3
             description: PCI bridge
             product: Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 8.1
             bus info: pci@0000:e0:08.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:81 memory:c0000000-c00fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:e4:00.0
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress bus_master cap_list
                configuration: latency=0
           *-generic:1
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:e4:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:78 memory:c0000000-c007ffff memory:c0080000-c0081fff
     *-pci:73
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 149
          bus info: pci@0000:e0:01.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:74
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14a
          bus info: pci@0000:e0:02.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:75
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14b
          bus info: pci@0000:e0:03.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:76
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14c
          bus info: pci@0000:e0:04.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:77
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14d
          bus info: pci@0000:e0:05.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:78
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14e
          bus info: pci@0000:e0:07.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:79
          description: Host bridge
          product: Starship/Matisse PCIe Dummy Host Bridge
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 14f
          bus info: pci@0000:e0:08.0
          version: 00
          width: 32 bits
          clock: 33MHz
  *-power:0 UNCLAIMED
       description: PWR SPLY,2400W,RDNT,ARTESYN
       product: 07GN3CA02
       vendor: DELL
       physical id: 1
       serial: PHARP00176002I
       capacity: 2400mWh
  *-power:1 UNCLAIMED
       description: PWR SPLY,2400W,RDNT,ARTESYN
       product: 07GN3CA02
       vendor: DELL
       physical id: 2
       serial: PHARP00176002J
       capacity: 2400mWh
  *-power:2 UNCLAIMED
       description: PWR SPLY,2400W,RDNT,ARTESYN
       product: 07GN3CA02
       vendor: DELL
       physical id: 3
       serial: PHARP00176002G
       capacity: 2400mWh
  *-power:3 UNCLAIMED
       description: PWR SPLY,2400W,RDNT,ARTESYN
       product: 07GN3CA02
       vendor: DELL
       physical id: 4
       serial: PHARP00176002D
       capacity: 2400mWh
  *-input
       product: Power Button
       physical id: 5
       logical name: input0
       logical name: /dev/input/event0
       capabilities: platform
```