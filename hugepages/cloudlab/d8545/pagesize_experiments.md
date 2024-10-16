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
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ echo $CUDA_VISIBLE_DEVICES
0
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-bbdf.qdstrm'
[1/3] [========================100%] report15.nsys-rep
[2/3] [========================100%] report15.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,999,976,992    739,459,189     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,739,502,164    761,340,554     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,500,859,870     28,262,996     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,529,130,193  1,824,092,654     126
```

### Try exporting to different GPUs but still use 1 GB page
```

hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ export CUDA_VISIBLE_DEVICES=1
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-48b7.qdstrm'
[1/3] [========================100%] report11.nsys-rep
[2/3] [========================100%] report11.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,943,157,355    758,954,278     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,702,178,193    735,121,950     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,437,315,311     28,266,868     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,465,588,899  1,870,545,502     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report11.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report11.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-fd2e.qdstrm'
[1/3] [========================100%] report12.nsys-rep
[2/3] [========================100%] report12.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,547,855,256    769,021,316     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,316,945,083    745,294,912     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,062,255,771     28,271,950     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,090,537,321  1,850,898,873     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report12.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report12.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ export CUDA_VISIBLE_DEVICES=2
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-3b6d.qdstrm'
[1/3] [========================100%] report13.nsys-rep
[2/3] [========================100%] report13.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 36,159,443,643    739,974,834     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,899,489,677    710,499,853     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,610,001,850     28,173,171     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,638,183,948  1,829,294,517     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report13.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report13.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ export CUDA_VISIBLE_DEVICES=3
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 1600000000 elements, each vector has size 12207 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 6250000 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-4d8b.qdstrm'
[1/3] [========================100%] report14.nsys-rep
[2/3] [========================100%] report14.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------------------------
 35,568,294,548    771,409,629     122                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 36,339,778,480    740,367,465     123                                                                                12,800.000         12,800.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 37,080,157,209     28,273,600     124  6,250,000     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 37,108,433,305  1,808,447,189     126                                                                                12,800.000              0.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]
```