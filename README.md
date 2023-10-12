# OMS: Online Multi-Section
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/90c5cca9a6384fbbbe28220cb20b8e53)](https://app.codacy.com/gh/KaHIP/OnlineMultiSection/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FKaHIP%2FOnlineMultiSection.svg?type=shield&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2FKaHIP%2FOnlineMultiSection?ref=badge_shield&issueType=license)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Online Multi-Section is a streaming algorithm designed for process mapping and also applicable to standard graph partitioning tasks when no hierarchy is specified.
It creates a hierarchy of partitioning subproblems reflecting the hierarchical topology of the system, facilitating improved process mapping and solving challenges posed by large-scale and dynamic data processing.
Parallelization using OpenMP is supported for concurrent processing of nodes, with careful consideration for data consistency to ensure load balance between blocks.
The algorithm outperforms the previous state-of-the-art in streaming partitioning in terms of speed and communication cost with a comparable edge-cut, while running only three times slower than Hashing on 32 threads with improved results.


This repository is associated with the following paper:

 - "**Recursive Multi-Section on the Fly: Shared-Memory Streaming Algorithms for Hierarchical Graph Partitioning and Process Mapping**", which has been published as a full paper at [IEEE CLUSTER 2022](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9912716). 
Additionally, you can find a [technical report](https://arxiv.org/pdf/2202.00394.pdf).

If you publish results using our algorithms, please acknowledge our work by citing our paper:

```
@InProceedings{OnlineMultiSection2022,
  author       = {Marcelo Fonseca Faraj and
                  Christian Schulz},
  title        = {Recursive Multi-Section on the Fly: Shared-Memory Streaming Algorithms
                  for Hierarchical Graph Partitioning and Process Mapping},
  booktitle    = {{IEEE} International Conference on Cluster Computing, {CLUSTER} 2022,
                  Heidelberg, Germany, September 5-8, 2022},
  pages        = {473--483},
  publisher    = {{IEEE}},
  year         = {2022},
  url          = {https://doi.org/10.1109/CLUSTER51413.2022.00057},
  doi          = {10.1109/CLUSTER51413.2022.00057},
  timestamp    = {Wed, 26 Oct 2022 19:40:32 +0200},
  biburl       = {https://dblp.org/rec/conf/cluster/FarajS22.bib},
  bibsource    = {dblp computer science bibliography, https://dblp.org}
}
```

## Installation Notes

### Requirements

* C++-17 ready compiler 
* CMake 
* Scons (http://www.scons.org/)
* Argtable (http://argtable.sourceforge.net/)

### Building Online Multi-Section

To build the software, clone this repository, enter the intended code base and run
```shell
./compile.sh
```

Alternatively, you can use the standard CMake build process.

The resulting binary is located in the `deploy/` subdirectory.       
The *streammultisection* executable solves the process mapping and graph partitioning problem in 

## Running Online Multi-Section for process mapping

Example: command to solve the process mapping problem for a communication graph in METIS format (specifically, examples/rgg_n_2_15_s0.graph) and a computing topology comprising 1024 processing elements organized in a hierarchical structure of 4:16:16, with layer distances of 1:10:100 between the processing elements.

```shell
./deploy/streammultisection examples/rgg_n_2_15_s0.graph --k=1024  --enable_mapping --hierarchy_parameter_string=4:16:16 --distance_parameter_string=1:10:100
```

## Running Online Multi-Section for graph partitioning (Recursive b-Section)

Example: commands to partition a graph in METIS format (specifically, examples/rgg_n_2_15_s0.graph) into 1024 blocks (b=4 is implicit).

```shell
./deploy/streammultisection examples/rgg_n_2_15_s0.graph --k=1024  
```

Example: command to partition a graph in METIS format (specifically, examples/rgg_n_2_15_s0.graph) into 1024 blocks with b=2

```shell
./deploy/streammultisection examples/rgg_n_2_15_s0.graph --k=1024 --stream_rec_bisection_base=2
```

Example: command to partition a graph in METIS format (specifically, examples/rgg_n_2_15_s0.graph) into 1024 blocks with b=5 with 2 passes over the graph

```shell
./deploy/streammultisection examples/rgg_n_2_15_s0.graph --k=1024 --stream_rec_bisection_base=5 --num_streams_passes=2
```

## Other Parameters

For a complete list of parameters alongside with descriptions, run:

```shell
./deploy/streammultisection --help
```

## METIS Format

For a description of the graph METIS format, please have a look at the [KaHiP manual](https://github.com/KaHIP/KaHIP/raw/master/manual/kahip.pdf).

## Licensing

Online Multi-Section is free software provided under the MIT License.

