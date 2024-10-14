
# Understanding and exploring the use of 4 KB and 2 MB page sizes impacts the hostToDevice and deviceToHost CUDA memcpy
## there is a 1.7X - 2X CUDA memcpy difference between 4 KB and 2 MB pages

## memory layout
```
$ numactl --hardware
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
node 0 size: 515113 MB
node 0 free: 502892 MB
node 1 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
node 1 size: 516075 MB
node 1 free: 505225 MB
node distances:
node   0   1
  0:  10  20
  1:  20  10
```

### vectorAdd with 4 KB Pages
** Disable transparent huge table to force default 4 KB page sizes **
```
# echo "never" | tee /sys/kernel/mm/transparent_hugepage/enabled
never
# cat /sys/kernel/mm/transparent_hugepage/enabled
always madvise [never]
```

** Profiling **
```
$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 50000000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 195313 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-3d39.qdstrm'
[1/3] [========================100%] report9.nsys-rep
[2/3] [========================100%] report9.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

  Start (ns)    Duration (ns)  CorrId   GrdX    GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                          Name
 -------------  -------------  ------  -------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------
 3,143,191,297     20,912,712     122                                                                                 200.000          9,400.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 3,164,405,319     47,622,927     123                                                                                 200.000          4,000.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 3,212,065,077        448,062     124  195,313     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const float *, const float *, float *, int)
 3,212,520,915     91,068,053     126                                                                                 200.000          2,000.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

$ nsys profile --stats=true vectorAdd
[Vector addition of 50000000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 195313 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-2f2e.qdstrm'
[1/8] [========================100%] report10.nsys-rep
[2/8] [========================100%] report10.sqlite
[3/8] Executing 'nvtx_sum' stats report

[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)    Min (ns)   Max (ns)    StdDev (ns)           Name
 --------  ---------------  ---------  ------------  ------------  --------  -----------  ------------  ---------------------
     66.6      501,080,736         18  27,837,818.7  14,957,227.5     7,297  100,195,980  37,324,237.3  poll
     31.0      233,597,360        849     275,144.1       9,476.0       358   20,806,175   1,006,116.9  ioctl
      1.6       11,975,762         37     323,669.2       2,130.0       708   11,854,351   1,948,293.2  fopen
      0.4        2,814,731         12     234,560.9     170,210.5    72,157    1,004,428     258,494.9  sem_timedwait
      0.2        1,427,293         45      31,717.6       7,139.0     3,526      877,423     129,501.0  mmap64
      0.1          682,493          4     170,623.3     165,538.0   145,776      205,641      25,406.8  pthread_create
      0.0          372,164         71       5,241.7       4,664.0     1,567       14,033       1,882.6  open64
      0.0          105,250         17       6,191.2       3,583.0     1,513       38,610       8,787.0  mmap
      0.0           40,351         25       1,614.0          44.0        39       39,286       7,848.3  fgets
      0.0           39,391         31       1,270.7         908.0       514        8,348       1,451.2  fclose
      0.0           38,450         16       2,403.1       2,482.0       630        3,804       1,217.1  read
      0.0           36,252         11       3,295.6       2,379.0     1,395        8,938       2,111.6  munmap
      0.0           29,420         77         382.1         306.0       131        1,057         207.9  fcntl
      0.0           28,897          6       4,816.2       4,474.5     1,854        8,223       2,462.6  open
      0.0           26,542          2      13,271.0      13,271.0     7,392       19,150       8,314.2  socket
      0.0           22,372         13       1,720.9       1,768.0       725        2,489         510.1  write
      0.0            9,373          1       9,373.0       9,373.0     9,373        9,373           0.0  connect
      0.0            8,201          1       8,201.0       8,201.0     8,201        8,201           0.0  fread
      0.0            5,582          1       5,582.0       5,582.0     5,582        5,582           0.0  pipe2
      0.0            2,758         10         275.8         302.5       141          358          74.7  dup
      0.0            2,458         64          38.4          25.0        24          241          39.5  pthread_mutex_trylock
      0.0            1,443          1       1,443.0       1,443.0     1,443        1,443           0.0  bind
      0.0              749          1         749.0         749.0       749          749           0.0  listen

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)     Min (ns)    Max (ns)     StdDev (ns)            Name
 --------  ---------------  ---------  ------------  ------------  ----------  -----------  -------------  ----------------------
     56.2      208,387,575          3  69,462,525.0     217,268.0     188,438  207,981,869  119,961,271.7  cudaMalloc
     43.6      161,886,839          3  53,962,279.7  48,727,307.0  21,316,554   91,842,978   35,553,450.2  cudaMemcpy
      0.2          613,366          3     204,455.3     168,166.0     161,973      283,227       68,288.5  cudaFree
      0.0           74,847          1      74,847.0      74,847.0      74,847       74,847            0.0  cuLibraryLoadData
      0.0           38,467          1      38,467.0      38,467.0      38,467       38,467            0.0  cudaLaunchKernel
      0.0            1,515          1       1,515.0       1,515.0       1,515        1,515            0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)                          Name
 --------  ---------------  ---------  ---------  ---------  --------  --------  -----------  -----------------------------------------------------
    100.0          447,006          1  447,006.0  447,006.0   447,006   447,006          0.0  vectorAdd(const float *, const float *, float *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count    Avg (ns)      Med (ns)     Min (ns)    Max (ns)   StdDev (ns)       Operation
 --------  ---------------  -----  ------------  ------------  ----------  ----------  ------------  ------------------
     56.6       90,594,918      1  90,594,918.0  90,594,918.0  90,594,918  90,594,918           0.0  [CUDA memcpy DtoH]
     43.4       69,454,749      2  34,727,374.5  34,727,374.5  21,023,819  48,430,930  19,379,754.0  [CUDA memcpy HtoD]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation
 ----------  -----  --------  --------  --------  --------  -----------  ------------------
    400.000      2   200.000   200.000   200.000   200.000        0.000  [CUDA memcpy HtoD]
    200.000      1   200.000   200.000   200.000   200.000        0.000  [CUDA memcpy DtoH]
```


### vectorAdd with 2 MB Pages
** Enable transparent huge table to use 2 MB page sizes **
```
# echo "always" | tee /sys/kernel/mm/transparent_hugepage/enabled
always
# cat /sys/kernel/mm/transparent_hugepage/enabled
[always] madvise never
```

** Profiling **
```
$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 50000000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 195313 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-8742.qdstrm'
[1/3] [========================100%] report11.nsys-rep
[2/3] [========================100%] report11.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

  Start (ns)    Duration (ns)  CorrId   GrdX    GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd           Device            Ctx  Strm                          Name
 -------------  -------------  ------  -------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  -------------------------  ---  ----  -----------------------------------------------------
 2,771,771,277     17,793,370     122                                                                                 200.000         11,200.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 2,789,871,141     18,100,152     123                                                                                 200.000         11,000.000  Pageable  Device    NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy HtoD]
 2,807,995,613        447,422     124  195,313     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A100-SXM4-40GB (0)    1     7  vectorAdd(const float *, const float *, float *, int)
 2,808,444,987     45,566,747     126                                                                                 200.000          4,200.000  Device    Pageable  NVIDIA A100-SXM4-40GB (0)    1     7  [CUDA memcpy DtoH]

$ nsys profile --stats=true vectorAdd
[Vector addition of 50000000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 195313 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-0d7b.qdstrm'
[1/8] [========================100%] report12.nsys-rep
[2/8] [========================100%] report12.sqlite
[3/8] Executing 'nvtx_sum' stats report

[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)    Min (ns)   Max (ns)    StdDev (ns)           Name
 --------  ---------------  ---------  ------------  ------------  --------  -----------  ------------  ---------------------
     61.1      399,568,327         17  23,504,019.2  14,595,651.0     3,798  100,235,239  33,754,109.2  poll
     36.1      236,060,020        849     278,044.8       9,901.0       336   22,100,255   1,039,642.4  ioctl
      1.9       12,121,609         37     327,611.1       2,147.0       839   12,008,373   1,973,648.9  fopen
      0.5        3,361,434         12     280,119.5     213,155.5    73,771    1,405,336     366,619.6  sem_timedwait
      0.2        1,519,327         45      33,762.8       8,131.0     3,914      919,949     135,722.6  mmap64
      0.1          943,653          4     235,913.3     187,657.0   155,412      412,927     121,128.0  pthread_create
      0.1          389,852         71       5,490.9       5,211.0     1,544       15,408       2,016.3  open64
      0.0          111,982         17       6,587.2       3,217.0     1,590       42,665       9,757.3  mmap
      0.0           79,841         16       4,990.1       2,629.0       632       42,836      10,169.3  read
      0.0           43,217         11       3,928.8       2,581.0     1,817       14,476       3,676.9  munmap
      0.0           37,260         25       1,490.4          42.0        40       36,185       7,228.0  fgets
      0.0           34,455          6       5,742.5       5,313.0     1,786       11,455       3,393.4  open
      0.0           32,325         31       1,042.7         871.0       496        3,058         515.1  fclose
      0.0           30,425         77         395.1         297.0       129        1,378         237.6  fcntl
      0.0           25,545          2      12,772.5      12,772.5     8,675       16,870       5,794.7  socket
      0.0           23,157         13       1,781.3       1,898.0       984        2,442         480.9  write
      0.0           15,173          1      15,173.0      15,173.0    15,173       15,173           0.0  connect
      0.0            7,619          1       7,619.0       7,619.0     7,619        7,619           0.0  fread
      0.0            6,395          1       6,395.0       6,395.0     6,395        6,395           0.0  pipe2
      0.0            2,645         10         264.5         285.5       135          349          67.0  dup
      0.0            2,424         64          37.9          25.0        24          369          49.9  pthread_mutex_trylock
      0.0            1,332          1       1,332.0       1,332.0     1,332        1,332           0.0  bind
      0.0              874          1         874.0         874.0       874          874           0.0  listen

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)     Min (ns)    Max (ns)     StdDev (ns)            Name
 --------  ---------------  ---------  ------------  ------------  ----------  -----------  -------------  ----------------------
     70.1      211,709,778          3  70,569,926.0     217,958.0     191,139  211,300,681  121,876,409.7  cudaMalloc
     29.7       89,578,686          3  29,859,562.0  20,676,483.0  20,394,762   48,507,441   16,150,151.2  cudaMemcpy
      0.2          666,044          3     222,014.7     175,682.0     172,550      317,812       82,977.7  cudaFree
      0.0           92,680          1      92,680.0      92,680.0      92,680       92,680            0.0  cuLibraryLoadData
      0.0           49,934          1      49,934.0      49,934.0      49,934       49,934            0.0  cudaLaunchKernel
      0.0            1,761          1       1,761.0       1,761.0       1,761        1,761            0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)                          Name
 --------  ---------------  ---------  ---------  ---------  --------  --------  -----------  -----------------------------------------------------
    100.0          447,677          1  447,677.0  447,677.0   447,677   447,677          0.0  vectorAdd(const float *, const float *, float *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count    Avg (ns)      Med (ns)     Min (ns)    Max (ns)   StdDev (ns)      Operation
 --------  ---------------  -----  ------------  ------------  ----------  ----------  -----------  ------------------
     54.1       47,663,855      1  47,663,855.0  47,663,855.0  47,663,855  47,663,855          0.0  [CUDA memcpy DtoH]
     45.9       40,475,321      2  20,237,660.5  20,237,660.5  20,122,925  20,352,396    162,260.5  [CUDA memcpy HtoD]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)      Operation
 ----------  -----  --------  --------  --------  --------  -----------  ------------------
    400.000      2   200.000   200.000   200.000   200.000        0.000  [CUDA memcpy HtoD]
    200.000      1   200.000   200.000   200.000   200.000        0.000  [CUDA memcpy DtoH]
```