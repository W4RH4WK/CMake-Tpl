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
    set(executables dice_roller)

    foreach(executable IN LISTS executables)
        add_executable(${executable} src/bin/${executable}.cpp)
        target_link_libraries(${executable} example)
    endforeach()
endif()

if(ENABLE_TESTING)
    set(tests dice)

    foreach(test IN LISTS tests)
        underscorify(test_ ${test})
        add_executable(ut_${test_} test/unit/${test}_test.cpp)
        target_link_libraries(ut_${test_} example gtest_main)
        add_test(ut_${test_} ut_${test_})
    endforeach()
endif()

if(ENABLE_BENCHMARKING)
    set(benchmarks dice)

    foreach(benchmark IN LISTS benchmarks)
        underscorify(benchmark_ ${benchmark})
        add_executable(bm_${benchmark_} test/benchmark/${benchmark}_benchmark.cpp)
        target_link_libraries(bm_${benchmark_} example benchmark)
    endforeach()
endif(ENABLE_BENCHMARKING)
