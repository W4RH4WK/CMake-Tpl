cmake_minimum_required(VERSION 3.5)
project(example VERSION 1.0 LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

include(defaults)

#include(DIFAS)

include(dependencies/threads)
include(dependencies/boost)
include(dependencies/googletest)
include(dependencies/googlebenchmark)

add_library(example src/dice.cpp)
target_include_directories(example PUBLIC include)

add_executable(dice_roller src/bin/dice_roller.cpp)
target_link_libraries(dice_roller example)

add_executable(ut_dice test/unit/dice_test.cpp)
target_link_libraries(ut_dice example gtest_main)
add_test(ut_dice ut_dice)

add_executable(bm_dice test/benchmark/dice_benchmark.cpp)
target_link_libraries(bm_dice example benchmark)
