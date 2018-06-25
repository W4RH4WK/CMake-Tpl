set(benchmarks dice)

foreach(benchmark IN LISTS benchmarks)
    underscorify(benchmark_ ${benchmark})
    add_executable(bm_${benchmark_} ${benchmark}_benchmark.cpp)
    target_link_libraries(bm_${benchmark_} example GBenchmark::GBenchmark)
endforeach()
