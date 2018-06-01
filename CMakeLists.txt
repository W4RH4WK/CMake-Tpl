cmake_minimum_required(VERSION 3.5)
project(example VERSION 1.0 LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

include(defaults)

#include(DIFAS)

include(dependencies/threads)
include(dependencies/boost)
include(dependencies/googletest)
include(dependencies/googlebenchmark)

include(project_defaults)

include(coverage)
include(doxygen)
include(profiling)
include(utilities)

add_library(example src/dice.cpp)
target_include_directories(example PUBLIC include)

if(ENABLE_EXECUTABLES)
    add_subdirectory(src/bin)
endif()

if(ENABLE_TESTING)
    add_subdirectory(test/units)
endif()

if(ENABLE_BENCHMARKING)
    add_subdirectory(test/benchmarks)
endif(ENABLE_BENCHMARKING)
