cmake_minimum_required(VERSION 3.5)
project(example VERSION 1.0 LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

include(options)

include(defaults)

#include(DIFAS)

include(testing)
include(benchmarking)

include(doxygen)
include(coverage)
include(profiling)

include(utilities)

include(dependencies/boost)

add_subdirectory(src)

if(ENABLE_EXECUTABLES)
    add_subdirectory(src/bin)
endif()

if(ENABLE_TESTING)
    add_subdirectory(test/unit)
endif()

if(ENABLE_BENCHMARKING)
    add_subdirectory(test/benchmarks)
endif(ENABLE_BENCHMARKING)

# Install Resources
install(DIRECTORY resources/ DESTINATION share/${PROJECT_NAME})
