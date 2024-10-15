# d7525 hardware info

## A30
```
hand32@node0:~$ nvidia-smi
Tue Oct 15 16:28:18 2024
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 530.30.02              Driver Version: 530.30.02    CUDA Version: 12.1     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                  Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf            Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA A30                      Off| 00000000:25:00.0 Off |                    0 |
| N/A   29C    P0               31W / 165W|      0MiB / 24576MiB |     18%      Default |
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

## hardware
```
hand32@node0:~$ free -h
               total        used        free      shared  buff/cache   available
Mem:           125Gi       1.2Gi       109Gi       6.0Mi        14Gi       123Gi
Swap:          8.0Gi          0B       8.0Gi

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ numactl --hardware
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
node 0 size: 63908 MB
node 0 free: 50982 MB
node 1 cpus: 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
node 1 size: 64446 MB
node 1 free: 60503 MB
node distances:
node   0   1
  0:  10  32
  1:  32  10

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ uname -a
Linux node0.hand32-223812.bayopsys-pg0.wisc.cloudlab.us 6.2.0-1015-nvidia #15-Ubuntu SMP PREEMPT_DYNAMIC Wed Jan 17 16:25:21 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
```

## lshw
```
node0.hand32-223812.bayopsys-pg0.wisc.cloudlab.us
    description: Rack Mount Chassis
    product: PowerEdge R7525 (SKU=08FF;ModelName=PowerEdge R7525)
    vendor: Dell Inc.
    serial: 1KL0PF3
    width: 64 bits
    capabilities: smbios-3.3.0 dmi-3.3.0 smp vsyscall32
    configuration: boot=normal chassis=rackmount family=PowerEdge sku=SKU=08FF;ModelName=PowerEdge R7525 uuid=4c4c4544-004b-4c10-8030-b1c04f504633
  *-core
       description: Motherboard
       product: 0590KW
       vendor: Dell Inc.
       physical id: 0
       version: A01
       serial: .1KL0PF3.CNIVC0015M0739.
     *-firmware
          description: BIOS
          vendor: Dell Inc.
          physical id: 0
          version: 2.13.3
          date: 09/12/2023
          size: 64KiB
          capacity: 32MiB
          capabilities: isa pci pnp upgrade shadowing cdboot bootselect edd int13floppytoshiba int13floppy360 int13floppy1200 int13floppy720 int9keyboard int14serial int10video acpi usb biosbootspecification netboot uefi
     *-cpu:0
          description: CPU
          product: AMD EPYC 7302 16-Core Processor
          vendor: Advanced Micro Devices [AMD]
          physical id: 400
          bus info: cpu@0
          version: 23.49.0
          slot: CPU1
          size: 3GHz
          capacity: 3900MHz
          width: 64 bits
          clock: 3115MHz
          capabilities: lm fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp x86-64 constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd amd_ppin arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip rdpid overflow_recov succor smca sev sev_es
          configuration: cores=16 enabledcores=16 microcode=137367674 threads=32
        *-cache:0
             description: L1 cache
             physical id: 700
             size: 1MiB
             capacity: 1MiB
             capabilities: internal write-back unified
             configuration: level=1
        *-cache:1
             description: L2 cache
             physical id: 701
             size: 8MiB
             capacity: 8MiB
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
          product: AMD EPYC 7302 16-Core Processor
          vendor: Advanced Micro Devices [AMD]
          physical id: 401
          bus info: cpu@1
          version: 23.49.0
          slot: CPU2
          size: 3GHz
          capacity: 3900MHz
          width: 64 bits
          clock: 3115MHz
          capabilities: lm fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp x86-64 constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb cat_l3 cdp_l3 hw_pstate ssbd mba ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 cqm rdt_a rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_local clzero irperf xsaveerptr rdpru wbnoinvd amd_ppin arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif v_spec_ctrl umip rdpid overflow_recov succor smca sev sev_es
          configuration: cores=16 enabledcores=16 microcode=137367674 threads=32
        *-cache:0
             description: L1 cache
             physical id: 703
             size: 1MiB
             capacity: 1MiB
             capabilities: internal write-back unified
             configuration: level=1
        *-cache:1
             description: L2 cache
             physical id: 704
             size: 8MiB
             capacity: 8MiB
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
          size: 128GiB
          capacity: 4TiB
          capabilities: ecc
          configuration: errordetection=multi-bit-ecc
        *-bank:0
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 0
             serial: 35A3CFEF
             slot: A1
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:1
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 1
             serial: 35A3D032
             slot: A2
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:2
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 2
             serial: 35A3AD0F
             slot: A3
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:3
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 3
             serial: 35A3D010
             slot: A4
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:4
             description: [empty]
             physical id: 4
             slot: A5
        *-bank:5
             description: [empty]
             physical id: 5
             slot: A6
        *-bank:6
             description: [empty]
             physical id: 6
             slot: A7
        *-bank:7
             description: [empty]
             physical id: 7
             slot: A8
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
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 10
             serial: 35A7B16E
             slot: B1
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:17
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 11
             serial: 35A3AD13
             slot: B2
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:18
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 12
             serial: 35A3CFE0
             slot: B3
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:19
             description: DIMM DDR4 Synchronous Registered (Buffered) 3200 MHz (0.3 ns)
             product: HMA82GR7DJR8N-XN
             vendor: Hynix Semiconductor (Hyundai Electronics)
             physical id: 13
             serial: 35A3CB8A
             slot: B4
             size: 16GiB
             width: 64 bits
             clock: 3200MHz (0.3ns)
        *-bank:20
             description: [empty]
             physical id: 14
             slot: B5
        *-bank:21
             description: [empty]
             physical id: 15
             slot: B6
        *-bank:22
             description: [empty]
             physical id: 16
             slot: B7
        *-bank:23
             description: [empty]
             physical id: 17
             slot: B8
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:00:00.2
             version: 00
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
             resources: irq:34 ioport:1000(size=4096) memory:f9300000-f93fffff ioport:eb000000(size=2097152)
           *-raid
                description: RAID bus controller
                product: MegaRAID Tri-Mode SAS3416
                vendor: Broadcom / LSI
                physical id: 0
                bus info: pci@0000:01:00.0
                logical name: scsi0
                version: 01
                width: 64 bits
                clock: 33MHz
                capabilities: raid pm msi pciexpress msix bus_master cap_list rom
                configuration: driver=megaraid_sas latency=0
                resources: irq:79 memory:eb000000-eb0fffff memory:eb100000-eb1fffff memory:f9300000-f93fffff ioport:1000(size=256)
              *-disk:0
                   description: ATA Disk
                   product: MZ7KH480HAHQ0D3
                   physical id: 0.0.0
                   bus info: scsi@0:0.0.0
                   logical name: /dev/sda
                   version: HF58
                   serial: S5CNNA0R517849
                   size: 447GiB (480GB)
                   capabilities: gpt-1.00 partitioned partitioned:gpt
                   configuration: ansiversion=6 guid=916bb3f3-230a-44f6-8afc-b0ee55667823 logicalsectorsize=512 sectorsize=4096
                 *-volume:0 UNCLAIMED
                      description: Windows FAT volume
                      vendor: mkfs.fat
                      physical id: 1
                      bus info: scsi@0:0.0.0,1
                      version: FAT16
                      serial: d99e-6443
                      size: 254MiB
                      capacity: 255MiB
                      capabilities: boot fat initialized
                      configuration: FATs=2 filesystem=fat name=EFI System
                 *-volume:1
                      description: BIOS Boot partition
                      vendor: EFI
                      physical id: 2
                      bus info: scsi@0:0.0.0,2
                      logical name: /dev/sda2
                      serial: d1f49f15-f54e-47e5-8b0b-4033572b0bd3
                      capacity: 1023KiB
                      capabilities: nofs
                      configuration: name=BIOS boot partition
                 *-volume:2
                      description: EXT3 volume
                      vendor: Linux
                      physical id: 3
                      bus info: scsi@0:0.0.0,3
                      logical name: /dev/sda3
                      logical name: /
                      version: 1.0
                      serial: 571337a8-0ea6-44bd-9cfc-6cb9719427c1
                      size: 64GiB
                      capabilities: journaled extended_attributes large_files recover ext3 ext2 initialized
                      configuration: created=2022-08-23 13:10:00 filesystem=ext3 label=/ lastmountpoint=/ modified=2024-10-15 16:11:08 mount.fstype=ext3 mount.options=rw,relatime mounted=2024-10-15 16:11:09 name=Linux filesystem state=mounted
                 *-volume:3
                      description: Linux swap volume
                      vendor: Linux
                      physical id: 63
                      bus info: scsi@0:0.0.0,99
                      logical name: /dev/sda99
                      version: 1
                      serial: dbcb384c-6529-453e-8098-e3dbd68f87d0
                      size: 8GiB
                      capacity: 8GiB
                      capabilities: nofs swap initialized
                      configuration: filesystem=swap name=Linux swap pagesize=4096
              *-disk:1
                   description: ATA Disk
                   product: MZ7KH480HAHQ0D3
                   physical id: 0.1.0
                   bus info: scsi@0:0.1.0
                   logical name: /dev/sdb
                   version: HF58
                   serial: S5CNNA0R517841
                   size: 447GiB (480GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:2
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.2.0
                   bus info: scsi@0:0.2.0
                   logical name: /dev/sdc
                   version: 0007
                   serial: Z3G01CPK0000Z3G01CPK
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:3
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.3.0
                   bus info: scsi@0:0.3.0
                   logical name: /dev/sdd
                   version: 0007
                   serial: Z3G01D1P0000Z3G01D1P
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:4
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.4.0
                   bus info: scsi@0:0.4.0
                   logical name: /dev/sde
                   version: 0007
                   serial: Z3G01CP60000Z3G01CP6
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:5
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.5.0
                   bus info: scsi@0:0.5.0
                   logical name: /dev/sdf
                   version: 0007
                   serial: Z3G01CP10000Z3G01CP1
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:6
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.6.0
                   bus info: scsi@0:0.6.0
                   logical name: /dev/sdg
                   version: 0007
                   serial: Z3G01CYD0000Z3G01CYD
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:7
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.7.0
                   bus info: scsi@0:0.7.0
                   logical name: /dev/sdh
                   version: 0007
                   serial: Z3G01CXR0000Z3G01CXR
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:8
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.8.0
                   bus info: scsi@0:0.8.0
                   logical name: /dev/sdi
                   version: 0007
                   serial: Z3G01CY90000Z3G01CY9
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
              *-disk:9
                   description: SCSI Disk
                   product: ST800FM0043
                   vendor: SEAGATE
                   physical id: 0.9.0
                   bus info: scsi@0:0.9.0
                   logical name: /dev/sdj
                   version: 0007
                   serial: Z3G01D2R0000Z3G01D2R
                   size: 745GiB (800GB)
                   configuration: ansiversion=6 logicalsectorsize=512 sectorsize=4096
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
             resources: irq:36 memory:f9200000-f92fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:02:00.0
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
                bus info: pci@0000:02:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:347 memory:f9200000-f927ffff memory:f9280000-f9281fff
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
             resources: irq:37 memory:f9000000-f91fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
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
                resources: irq:35 memory:f9100000-f917ffff memory:f9180000-f9181fff
           *-usb
                description: USB controller
                product: Starship USB 3.0 Host Controller
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.3
                bus info: pci@0000:03:00.3
                version: 00
                width: 64 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix xhci bus_master cap_list
                configuration: driver=xhci_hcd latency=0
                resources: irq:198 memory:f9000000-f90fffff
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
          product: Starship Device 24; Function 0
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 108
          bus info: pci@0000:00:18.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:9
          description: Host bridge
          product: Starship Device 24; Function 1
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 109
          bus info: pci@0000:00:18.1
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:10
          description: Host bridge
          product: Starship Device 24; Function 2
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10a
          bus info: pci@0000:00:18.2
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:11
          description: Host bridge
          product: Starship Device 24; Function 3
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
          product: Starship Device 24; Function 4
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10c
          bus info: pci@0000:00:18.4
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:13
          description: Host bridge
          product: Starship Device 24; Function 5
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10d
          bus info: pci@0000:00:18.5
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:14
          description: Host bridge
          product: Starship Device 24; Function 6
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10e
          bus info: pci@0000:00:18.6
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:15
          description: Host bridge
          product: Starship Device 24; Function 7
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 10f
          bus info: pci@0000:00:18.7
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:16
          description: Host bridge
          product: Starship Device 24; Function 0
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 110
          bus info: pci@0000:00:19.0
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:17
          description: Host bridge
          product: Starship Device 24; Function 1
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 111
          bus info: pci@0000:00:19.1
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:18
          description: Host bridge
          product: Starship Device 24; Function 2
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 112
          bus info: pci@0000:00:19.2
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:19
          description: Host bridge
          product: Starship Device 24; Function 3
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
          product: Starship Device 24; Function 4
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 114
          bus info: pci@0000:00:19.4
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:21
          description: Host bridge
          product: Starship Device 24; Function 5
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 115
          bus info: pci@0000:00:19.5
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:22
          description: Host bridge
          product: Starship Device 24; Function 6
          vendor: Advanced Micro Devices, Inc. [AMD]
          physical id: 116
          bus info: pci@0000:00:19.6
          version: 00
          width: 32 bits
          clock: 33MHz
     *-pci:23
          description: Host bridge
          product: Starship Device 24; Function 7
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:20:00.2
             version: 00
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
             resources: irq:38 ioport:2000(size=4096) memory:ce800000-cebfffff ioport:2bf40000000(size=2097152)
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
             resources: irq:39 memory:cf000000-cf0fffff ioport:2bf40200000(size=2097152)
           *-nvme
                description: NVMe device
                product: Dell Ent NVMe AGN MU U.2 1.6TB
                vendor: Samsung Electronics Co Ltd
                physical id: 0
                bus info: pci@0000:22:00.0
                logical name: /dev/nvme0
                version: 2.5.0
                serial: S61ENE0R305117
                width: 64 bits
                clock: 33MHz
                capabilities: nvme pm msi pciexpress msix nvm_express bus_master cap_list
                configuration: driver=nvme latency=0 nqn=nqn.1994-11.com.samsung:nvme:PM1733:2.5-inch:S61ENE0R305117 state=live
                resources: irq:207 memory:cf000000-cf007fff
              *-namespace:0
                   description: NVMe disk
                   physical id: 0
                   logical name: hwmon0
              *-namespace:1
                   description: NVMe disk
                   physical id: 1
                   logical name: nvme0c0n1
                   configuration: wwid=eui.36314530523051170025384500000004
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
             resources: irq:40 memory:ce400000-ce7fffff ioport:2bf40400000(size=2097152)
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
             resources: irq:41 memory:ce000000-ce3fffff ioport:2bf40600000(size=2097152)
        *-pci:4
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 3.1
             bus info: pci@0000:20:03.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:42 memory:c4000000-c5ffffff ioport:2c000000000(size=85899345920)
           *-display
                description: 3D controller
                product: GA100GL [A30 PCIe]
                vendor: NVIDIA Corporation
                physical id: 0
                bus info: pci@0000:25:00.0
                logical name: /dev/fb0
                version: a1
                width: 64 bits
                clock: 33MHz
                capabilities: pm bus_master cap_list fb
                configuration: depth=32 driver=nvidia latency=0 mode=1024x768 visual=truecolor xres=1024 yres=768
                resources: iomemory:2c00-2bff iomemory:2d00-2cff irq:378 memory:c4000000-c4ffffff memory:2c000000000-2c7ffffffff memory:2d000000000-2d001ffffff memory:c5000000-c51fffff memory:2c800000000-2cfffffffff memory:2d002000000-2d011ffffff
        *-pci:5
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
             resources: irq:44 memory:cef00000-ceffffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
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
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:26:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:350 memory:cef00000-cef7ffff memory:cef80000-cef81fff
        *-pci:6
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
             resources: irq:45 memory:cec00000-ceefffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:27:00.0
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
                bus info: pci@0000:27:00.1
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ccp latency=0
                resources: irq:367 memory:ced00000-cedfffff memory:cee82000-cee83fff
           *-generic:2
                description: Encryption controller
                product: Starship/Matisse PTDMA
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.2
                bus info: pci@0000:27:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:43 memory:cee00000-cee7ffff memory:cee80000-cee81fff
           *-usb
                description: USB controller
                product: Starship USB 3.0 Host Controller
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.3
                bus info: pci@0000:27:00.3
                version: 00
                width: 64 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix xhci bus_master cap_list
                configuration: driver=xhci_hcd latency=0
                resources: irq:209 memory:cec00000-cecfffff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:40:00.2
             version: 00
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
             resources: irq:46 memory:d1000000-d10fffff ioport:d2000000(size=33554432)
           *-network DISABLED
                description: Ethernet interface
                product: MT28908 Family [ConnectX-6]
                vendor: Mellanox Technologies
                physical id: 0
                bus info: pci@0000:41:00.0
                logical name: enp65s0np0
                version: 00
                serial: 94:6d:ae:61:9e:8a
                capacity: 40Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pciexpress vpd msix pm bus_master cap_list rom ethernet physical fibre 1000bt-fd 10000bt-fd 25000bt-fd 40000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=mlx5_core driverversion=6.2.0-1015-nvidia firmware=20.36.1010 (DEL0000000010) latency=0 link=no multicast=yes port=fibre
                resources: irq:282 memory:d2000000-d3ffffff memory:d1000000-d10fffff
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
             resources: irq:48 memory:da100000-da1fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:42:00.0
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
                bus info: pci@0000:42:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:353 memory:da100000-da17ffff memory:da180000-da181fff
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
             resources: irq:50 memory:da000000-da0fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
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
                resources: irq:47 memory:da000000-da07ffff memory:da080000-da081fff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:60:00.2
             version: 00
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
             resources: irq:51 memory:df300000-df3fffff ioport:df000000(size=3145728)
           *-network:0
                description: Ethernet interface
                product: BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet Controller
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0
                bus info: pci@0000:63:00.0
                logical name: eno33np0
                version: 01
                serial: e4:3d:1a:13:4d:20
                capacity: 25Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msix pciexpress bus_master cap_list rom ethernet physical fibre 1000bt-fd 10000bt-fd 25000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=bnxt_en driverversion=6.2.0-1015-nvidia duplex=full firmware=227.0.134.0/pkg 22.71.11.13 ip=128.105.146.31 latency=0 link=yes multicast=yes port=fibre
                resources: irq:146 memory:df210000-df21ffff memory:df100000-df1fffff memory:df222000-df223fff memory:df300000-df33ffff
           *-network:1 DISABLED
                description: Ethernet interface
                product: BCM57414 NetXtreme-E 10Gb/25Gb RDMA Ethernet Controller
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0.1
                bus info: pci@0000:63:00.1
                logical name: eno34np1
                version: 01
                serial: e4:3d:1a:13:4d:21
                capacity: 25Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msix pciexpress bus_master cap_list rom ethernet physical fibre 1000bt-fd 25000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=bnxt_en driverversion=6.2.0-1015-nvidia firmware=227.0.134.0/pkg 22.71.11.13 latency=0 link=no multicast=yes
                resources: irq:163 memory:df200000-df20ffff memory:df000000-df0fffff memory:df220000-df221fff memory:df340000-df37ffff
        *-pci:1
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 5.2
             bus info: pci@0000:60:05.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:52 memory:e7000000-e78fffff ioport:de000000(size=16777216)
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
                   resources: irq:377 memory:de000000-deffffff memory:e7808000-e780bfff memory:e7000000-e77fffff memory:c0000-dffff
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
             resources: irq:54 memory:e7a00000-e7afffff
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
                resources: irq:356 memory:e7a00000-e7a7ffff memory:e7a80000-e7a81fff
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
             resources: irq:56 memory:e7900000-e79fffff
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
                resources: irq:53 memory:e7900000-e797ffff memory:e7980000-e7981fff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:80:00.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
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
             resources: irq:58 memory:99100000-991fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:81:00.0
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
                bus info: pci@0000:81:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:359 memory:99100000-9917ffff memory:99180000-99181fff
        *-pci:1
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
             resources: irq:60 memory:99000000-990fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:82:00.0
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
                bus info: pci@0000:82:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:57 memory:99000000-9907ffff memory:99080000-99081fff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:a0:00.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
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
             resources: irq:62 memory:a6200000-a62fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:a1:00.0
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
                bus info: pci@0000:a1:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:362 memory:a6200000-a627ffff memory:a6280000-a6281fff
        *-pci:1
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
             resources: irq:64 memory:a6000000-a61fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
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
                product: Starship/Matisse Cryptographic Coprocessor PSPCPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.1
                bus info: pci@0000:a2:00.1
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ccp latency=0
                resources: irq:372 memory:a6000000-a60fffff memory:a6182000-a6183fff
           *-generic:2
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
                resources: irq:61 memory:a6100000-a617ffff memory:a6180000-a6181fff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:c0:00.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
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
             resources: irq:65 memory:b3c00000-b3ffffff ioport:55e20000000(size=2097152)
        *-pci:1
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
             resources: irq:66 memory:b3800000-b3bfffff ioport:55e20200000(size=2097152)
        *-pci:2
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
             resources: irq:67 memory:b3400000-b37fffff ioport:55e20400000(size=2097152)
        *-pci:3
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
             resources: irq:68 ioport:7000(size=4096) memory:b3000000-b33fffff ioport:55e20600000(size=2097152)
        *-pci:4
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
             resources: irq:70 memory:b4200000-b42fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c5:00.0
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
                bus info: pci@0000:c5:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:365 memory:b4200000-b427ffff memory:b4280000-b4281fff
        *-pci:5
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
             resources: irq:72 memory:b4100000-b41fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c6:00.0
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
                bus info: pci@0000:c6:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:69 memory:b4100000-b417ffff memory:b4180000-b4181fff
        *-pci:6
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
             resources: irq:73 memory:b4000000-b40fffff
           *-sata
                description: SATA controller
                product: FCH SATA Controller [AHCI mode]
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:c7:00.0
                version: 51
                width: 32 bits
                clock: 33MHz
                capabilities: sata pm pciexpress msi ahci_1.0 bus_master cap_list
                configuration: driver=ahci latency=0
                resources: irq:166 memory:b4000000-b40007ff
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
             product: Starship/Matisse IOMMU
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 0.2
             bus info: pci@0000:e0:00.2
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: msi ht bus_master cap_list
             configuration: latency=0
        *-pci:0
             description: PCI bridge
             product: Starship/Matisse GPP Bridge
             vendor: Advanced Micro Devices, Inc. [AMD]
             physical id: 5.1
             bus info: pci@0000:e0:05.1
             version: 00
             width: 32 bits
             clock: 33MHz
             capabilities: pci pm pciexpress msi ht normal_decode bus_master cap_list
             configuration: driver=pcieport
             resources: irq:74 memory:b7100000-b71fffff ioport:b7000000(size=1048576)
           *-network:0 DISABLED
                description: Ethernet interface
                product: NetXtreme BCM5720 Gigabit Ethernet PCIe
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0
                bus info: pci@0000:e1:00.0
                logical name: eno1
                version: 00
                serial: b0:7b:25:d4:87:18
                capacity: 1Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msi msix pciexpress bus_master cap_list rom ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt 1000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=tg3 driverversion=6.2.0-1015-nvidia firmware=FFV22.71.3 bc 5720-v1.39 latency=0 link=no multicast=yes port=twisted pair
                resources: irq:95 memory:b7030000-b703ffff memory:b7040000-b704ffff memory:b7050000-b705ffff memory:b7100000-b713ffff
           *-network:1 DISABLED
                description: Ethernet interface
                product: NetXtreme BCM5720 Gigabit Ethernet PCIe
                vendor: Broadcom Inc. and subsidiaries
                physical id: 0.1
                bus info: pci@0000:e1:00.1
                logical name: eno2
                version: 00
                serial: b0:7b:25:d4:87:19
                capacity: 1Gbit/s
                width: 64 bits
                clock: 33MHz
                capabilities: pm vpd msi msix pciexpress bus_master cap_list rom ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt 1000bt-fd autonegotiation
                configuration: autonegotiation=on broadcast=yes driver=tg3 driverversion=6.2.0-1015-nvidia firmware=FFV22.71.3 bc 5720-v1.39 latency=0 link=no multicast=yes port=twisted pair
                resources: irq:164 memory:b7000000-b700ffff memory:b7010000-b701ffff memory:b7020000-b702ffff memory:b7140000-b717ffff
        *-pci:1
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
             resources: irq:76 memory:c0100000-c01fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse PCIe Dummy Function
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0
                bus info: pci@0000:e2:00.0
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
                bus info: pci@0000:e2:00.2
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi msix bus_master cap_list
                configuration: driver=ptdma latency=0
                resources: irq:371 memory:c0100000-c017ffff memory:c0180000-c0181fff
        *-pci:2
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
             resources: irq:78 memory:c0000000-c00fffff
           *-generic:0 UNCLAIMED
                description: Non-Essential Instrumentation
                product: Starship/Matisse Reserved SPP
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
                resources: irq:75 memory:c0000000-c007ffff memory:c0080000-c0081fff
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
       serial: PHARP0016A003F
       capacity: 2400mWh
  *-power:1 UNCLAIMED
       description: PWR SPLY,2400W,RDNT,ARTESYN
       product: 07GN3CA02
       vendor: DELL
       physical id: 2
       serial: PHARP0016A003I
       capacity: 2400mWh
  *-input
       product: Power Button
       physical id: 3
       logical name: input0
       logical name: /dev/input/event0
       capabilities: platform
```