# Experiments with 4 KB, 2 MB, 1 GB page size

## 4 KB
```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ make ALL_CCFLAGS="-DFOURKB" V=1 vectorAdd
/usr/local/cuda/bin/nvcc -ccbin g++ -I../../../Common -DFOURKB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd.o -c vectorAdd.cu
/usr/local/cuda/bin/nvcc -ccbin g++ -DFOURKB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd vectorAdd.o
mkdir -p ../../../bin/x86_64/linux/release
cp vectorAdd ../../../bin/x86_64/linux/release
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-8f34.qdstrm'
[1/3] [========================100%] report3.nsys-rep
[2/3] [========================100%] report3.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 32,429,064,336  7,688,744,098     122                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 40,119,277,971  7,721,467,588     123                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 47,840,894,935     25,627,697     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 47,866,528,648  4,340,213,605     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report3.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report3.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-ba5d.qdstrm'
[1/3] [========================100%] report4.nsys-rep
[2/3] [========================100%] report4.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 32,272,081,978  4,619,414,471     122                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 36,892,909,378  9,028,989,166     123                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 45,922,125,841     25,623,963     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 45,947,753,164  4,373,141,022     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report4.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report4.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-d81b.qdstrm'
[1/3] [========================100%] report5.nsys-rep
[2/3] [========================100%] report5.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 32,392,207,520  1,580,902,096     122                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 33,973,593,135  1,899,926,827     123                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 35,873,578,490     26,397,514     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 35,899,983,620  4,305,347,635     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report5.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report5.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-ab6c.qdstrm'
[1/3] [========================100%] report6.nsys-rep
[2/3] [========================100%] report6.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 32,414,127,207  1,579,441,917     122                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 33,994,006,563  1,740,491,513     123                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 35,734,564,508     26,411,245     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 35,760,979,209  4,296,557,793     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report6.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report6.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-7eee.qdstrm'
[1/3] [========================100%] report7.nsys-rep
[2/3] [========================100%] report7.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 32,584,372,842  7,678,068,919     122                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 40,263,892,895  7,723,683,831     123                                                                                 7,200.000              0.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 47,987,718,357     25,626,807     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 48,013,350,124  4,353,830,256     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report7.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report7.sqlite
```

## 2 MB
```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "20000" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
20000
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ make clean
rm -f vectorAdd vectorAdd.o
rm -rf ../../../bin/x86_64/linux/release/vectorAdd
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ make ALL_CCFLAGS="-DTWOMB" V=1 vectorAdd
/usr/local/cuda/bin/nvcc -ccbin g++ -I../../../Common -DTWOMB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd.o -c vectorAdd.cu
/usr/local/cuda/bin/nvcc -ccbin g++ -DTWOMB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd vectorAdd.o
mkdir -p ../../../bin/x86_64/linux/release
cp vectorAdd ../../../bin/x86_64/linux/release
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-6925.qdstrm'
[1/3] [========================100%] report8.nsys-rep
[2/3] [========================100%] report8.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 26,178,012,358    514,454,339     122                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 26,692,546,601    512,889,409     123                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 27,205,501,099     26,396,505     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,231,901,796  1,214,644,867     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report8.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report8.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-014f.qdstrm'
[1/3] [========================100%] report9.nsys-rep
[2/3] [========================100%] report9.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 26,304,843,006    504,430,923     122                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 26,809,368,393    504,308,364     123                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 27,313,724,917     26,389,166     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,340,121,315  1,213,948,096     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report9.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report9.sqlite
```

## 1 GB

```
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "0" | sudo tee /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
0
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ sudo echo "40" | sudo tee /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
40
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ make clean
rm -f vectorAdd vectorAdd.o
rm -rf ../../../bin/x86_64/linux/release/vectorAdd
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ make ALL_CCFLAGS="-DONEGB" V=1 vectorAdd
/usr/local/cuda/bin/nvcc -ccbin g++ -I../../../Common -DONEGB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd.o -c vectorAdd.cu
/usr/local/cuda/bin/nvcc -ccbin g++ -DONEGB -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_80,code=sm_80 -gencode arch=compute_86,code=sm_86 -gencode arch=compute_89,code=sm_89 -gencode arch=compute_90,code=sm_90 -gencode arch=compute_90,code=compute_90 -o vectorAdd vectorAdd.o
mkdir -p ../../../bin/x86_64/linux/release
cp vectorAdd ../../../bin/x86_64/linux/release
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-1d11.qdstrm'
[1/3] [========================100%] report10.nsys-rep
[2/3] [========================100%] report10.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 26,048,377,937    515,440,708     122                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 26,563,898,453    514,228,005     123                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 27,078,178,106     26,399,965     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,104,587,447  1,277,666,966     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report10.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report10.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-db5b.qdstrm'
[1/3] [========================100%] report11.nsys-rep
[2/3] [========================100%] report11.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 26,169,387,608    503,744,647     122                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 26,673,211,455    502,790,733     123                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 27,176,053,772     26,405,602     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,202,467,438  1,269,370,529     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

Generated:
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report11.nsys-rep
    /users/hand32/cuda-samples-12.1/Samples/0_Introduction/vectorAdd/report11.sqlite
hand32@node0:~/cuda-samples-12.1/Samples/0_Introduction/vectorAdd$ nsys nvprof --print-gpu-trace ./vectorAdd
WARNING: vectorAdd and any of its children processes will be profiled.

[Vector addition of 900000000 elements, each vector has size 6866 MB]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 3515625 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
Generating '/tmp/nsys-report-ba0d.qdstrm'
[1/3] [========================100%] report12.nsys-rep
[2/3] [========================100%] report12.sqlite
[3/3] Executing 'cuda_gpu_trace' stats report

   Start (ns)    Duration (ns)  CorrId    GrdX     GrdY  GrdZ  BlkX  BlkY  BlkZ  Reg/Trd  StcSMem (MB)  DymSMem (MB)  Bytes (MB)  Throughput (MBps)  SrcMemKd  DstMemKd      Device      Ctx  Strm                                   Name
 --------------  -------------  ------  ---------  ----  ----  ----  ----  ----  -------  ------------  ------------  ----------  -----------------  --------  --------  --------------  ---  ----  -----------------------------------------------------------------------
 26,045,216,969    513,749,859     122                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 26,559,044,972    511,981,029     123                                                                                 7,200.000          7,200.000  Pageable  Device    NVIDIA A30 (0)    1     7  [CUDA memcpy HtoD]
 27,071,076,721     26,399,523     124  3,515,625     1     1   256     1     1       16         0.000         0.000                                                     NVIDIA A30 (0)    1     7  vectorAdd(const double *, const double *, double *, unsigned long long)
 27,097,480,468  1,280,491,954     126                                                                                 7,200.000              0.000  Device    Pageable  NVIDIA A30 (0)    1     7  [CUDA memcpy DtoH]

```