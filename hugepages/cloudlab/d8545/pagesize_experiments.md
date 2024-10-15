## Experiments with 4 KB, 2MB, 1 GB page sizes


### setup
```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]
```

### 4 KB pages
```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-d096.qdstrm'
[1/3] [========================100%] report4.nsys-rep
[2/3] [========================100%] report4.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 31,575,035,645  1,973,631,839     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 33,549,026,871  4,152,878,045     123                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,701,925,876     28,182,919     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,730,110,588  6,111,664,688     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report4.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report4.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-59b8.qdstrm'
[1/3] [========================100%] report5.nsys-rep
[2/3] [========================100%] report5.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 31,499,987,523  3,213,539,185     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 34,713,881,135  7,218,335,179     123                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 41,932,226,970     28,283,808     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 41,960,520,410  6,015,140,208     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

```

### 2 MB pages
```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "20000" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
20000
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ cat /proc/meminfo | grep -i huge
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
FileHugePages:         0 kB
HugePages_Total:   20000
HugePages_Free:    20000
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:        40960000 kB

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-b486.qdstrm'
[1/3] [========================100%] report6.nsys-rep
[2/3] [========================100%] report6.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 24,979,762,547    760,562,281     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 25,740,392,954    753,618,848     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 26,494,026,522     28,258,160     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 26,522,292,170  2,581,003,177     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report6.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report6.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-e092.qdstrm'
[1/3] [========================100%] report7.nsys-rep
[2/3] [========================100%] report7.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 25,831,538,013    751,762,196     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 26,583,366,064    765,214,642     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 27,348,597,122     28,272,230     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,376,877,704  2,533,092,426     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

```

### 1 GB Pages

```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "0" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
0
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "40" | sudo tee /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
40
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ cat /sys/kernel/mm/hugepages/hugepages-1048576kB/free_hugepages
40

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-7fdd.qdstrm'
[1/3] [========================100%] report8.nsys-rep
[2/3] [========================100%] report8.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,587,935,068  1,348,275,068     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,936,277,975    761,202,550     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,697,503,501     28,267,724     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,725,776,025  1,876,127,055     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report8.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report8.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-0150.qdstrm'
[1/3] [========================100%] report9.nsys-rep
[2/3] [========================100%] report9.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,581,858,786    813,823,358     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,395,754,943    729,843,281     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,125,624,592     28,272,076     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,153,903,836  1,877,375,866     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report9.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report9.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-1032.qdstrm'
[1/3] [========================100%] report10.nsys-rep
[2/3] [========================100%] report10.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,584,547,582  1,182,800,131     122                                                                                12,800.000              0.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,767,415,808    773,037,412     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,540,476,868     28,266,360     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,568,749,308  1,866,420,461     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

```