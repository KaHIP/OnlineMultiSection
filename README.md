OMS 1.00
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/90c5cca9a6384fbbbe28220cb20b8e53)](https://app.codacy.com/gh/KaHIP/OnlineMultiSection/dashboard)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FKaHIP%2FOnlineMultiSection.svg?type=shield&issueType=license)](https://app.fossa.com/projects/git%2Bgithub.com%2FKaHIP%2FOnlineMultiSection?ref=badge_shield&issueType=license)
[![C++](https://img.shields.io/badge/C++-17-blue.svg)](https://isocpp.org/)
[![CMake](https://img.shields.io/badge/CMake-3.10+-064F8C.svg)](https://cmake.org/)
[![Linux](https://img.shields.io/badge/Linux-supported-success.svg)](https://github.com/KaHIP/OnlineMultiSection)
[![macOS](https://img.shields.io/badge/macOS-supported-success.svg)](https://github.com/KaHIP/OnlineMultiSection)
[![GitHub Stars](https://img.shields.io/github/stars/KaHIP/OnlineMultiSection)](https://github.com/KaHIP/OnlineMultiSection/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/KaHIP/OnlineMultiSection)](https://github.com/KaHIP/OnlineMultiSection/issues)
[![Last Commit](https://img.shields.io/github/last-commit/KaHIP/OnlineMultiSection)](https://github.com/KaHIP/OnlineMultiSection/commits)
[![Homebrew](https://img.shields.io/badge/Homebrew-available-orange)](https://github.com/KaHIP/homebrew-kahip)
[![arXiv](https://img.shields.io/badge/arXiv-2202.00394-b31b1b.svg)](https://arxiv.org/abs/2202.00394)
[![CLUSTER'22](https://img.shields.io/badge/CLUSTER'22-10.1109/CLUSTER51413.2022.00057-blue)](https://doi.org/10.1109/CLUSTER51413.2022.00057)
[![Heidelberg University](https://img.shields.io/badge/Heidelberg-University-c1002a)](https://www.uni-heidelberg.de)
=====

<p align="center">
  <img src="https://raw.githubusercontent.com/KaHIP/OnlineMultiSection/master/logo/oms-banner.png" alt="OMS Banner" width="900"/>
</p>

**OMS (Online Multi-Section)** is a shared-memory streaming algorithm for process mapping and hierarchical graph partitioning via recursive multi-section. Part of the [KaHIP](https://github.com/KaHIP) organization.

| | |
|:--|:--|
| **What it solves** | Streaming process mapping and graph partitioning for large-scale hierarchical topologies |
| **Techniques** | Recursive multi-section, Fennel scoring, OpenMP parallelization, multi-pass restreaming |
| **Interfaces** | CLI (`streammultisection`) |
| **Requires** | C++17, CMake 3.10+, OpenMP |

## Quick Start

### Install via Homebrew

```bash
brew install KaHIP/kahip/oms
```

### Or build from source

```bash
git clone https://github.com/KaHIP/OnlineMultiSection.git
cd OnlineMultiSection
./compile.sh
```

Alternatively, use the standard CMake build process:

```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
```

The resulting binary is `deploy/streammultisection`.

### Run

```bash
# Process mapping (1024 PEs, hierarchy 4:16:16, distances 1:10:100)
./deploy/streammultisection graph.graph --k=1024 --enable_mapping \
    --hierarchy_parameter_string=4:16:16 --distance_parameter_string=1:10:100

# Graph partitioning (recursive b-section, default b=4)
./deploy/streammultisection graph.graph --k=1024

# Graph partitioning with b=2 (recursive bisection)
./deploy/streammultisection graph.graph --k=1024 --stream_rec_bisection_base=2

# Multi-pass restreaming with b=5
./deploy/streammultisection graph.graph --k=1024 --stream_rec_bisection_base=5 --num_streams_passes=2

# Full parameter list
./deploy/streammultisection --help
```

---

## Notes

- 64-bit edge IDs are enabled by default.
- For the METIS graph format, refer to the [KaHIP manual](https://github.com/KaHIP/KaHIP/raw/master/manual/kahip.pdf).

---

## Citing

If you use OMS in your research, please cite:

```bibtex
@inproceedings{OnlineMultiSection2022,
    author    = {Marcelo Fonseca Faraj and Christian Schulz},
    title     = {Recursive Multi-Section on the Fly: Shared-Memory Streaming Algorithms
                 for Hierarchical Graph Partitioning and Process Mapping},
    booktitle = {{IEEE} International Conference on Cluster Computing ({CLUSTER} 2022)},
    pages     = {473--483},
    publisher = {{IEEE}},
    year      = {2022},
    doi       = {10.1109/CLUSTER51413.2022.00057}
}
```

## Licensing

OMS is distributed under the MIT License. See [LICENSE](LICENSE) for details.
