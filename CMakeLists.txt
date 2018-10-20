cmake_minimum_required(VERSION 3.0)

project (googlebenchmark)

# define compiler flags

set(CMAKE_CXX_FLAGS_DEBUG   "-g -O0 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -DNDEBUG")

# add custom module path

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
include(googletest)
include(googlebenchmark)

# add targets

add_subdirectory(benchmarks)
