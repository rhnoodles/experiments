### MMAP 4KB, 2 MB, and 1 GB pages

## 4 KB
```
make clean
make ALL_CCFLAGS="-DFOURKB" V=1 vectorAdd
nsys nvprof --print-gpu-trace ./vectorAdd

WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-73d9.qdstrm'
[1/3] [========================100%] report1.nsys-rep
[2/3] [========================100%] report1.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 61,984,034,576  2,940,588,676     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 64,924,944,882  2,862,997,200     123                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 67,787,961,762     27,567,396     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 67,815,531,814  5,689,044,986     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]
```

## 2 MB
```
make clean
make ALL_CCFLAGS="-DTWOMB" V=1 vectorAdd
sudo echo "20000" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
$ cat /proc/meminfo | grep -i huge
AnonHugePages:     14336 kB
ShmemHugePages:        0 kB
FileHugePages:         0 kB
HugePages_Total:   20000
HugePages_Free:    20000
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:        40960000 kB

]$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-56e7.qdstrm'
[1/3] [========================100%] report4.nsys-rep
[2/3] [========================100%] report4.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 60,220,323,051  1,316,361,188     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 61,536,793,230  1,316,311,326     123                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 62,853,129,100     28,260,258     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 62,881,398,861  5,190,804,908     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

```

## 1 GB Pages
```
sudo echo "0" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
sudo echo "40" | sudo tee /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
]$ cat /proc/meminfo | grep -i huge
AnonHugePages:     14336 kB
ShmemHugePages:        0 kB
FileHugePages:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:        41943040 kB

$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-2e9a.qdstrm'
[1/3] [========================100%] report5.nsys-rep
[2/3] [========================100%] report5.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 64,683,872,355  1,241,911,002     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 65,925,884,636  1,241,057,262     123                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 67,166,952,938     28,251,136     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 67,195,207,690  2,738,976,118     126
```


### Analysis
I modified vectorAdd to use unsigned long long int  so that each vector is now ~ 12 GB , so the total allocation is 36 GB  From the profiler, I see that going from using 4KB to 2 MB pages improves the HostToDevice memory copy by 2.23X but the DeviceToHost improved only by 1.09X. However, if I then use the 1 GB pages, the HostToDevice improves by 2.34X and the also DeviceToHost improves by 2X.

These are all relative to the 4KB page case.