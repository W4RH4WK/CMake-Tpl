# CMake Template

See [`cmake/options.cmake`](cmake/options.cmake).

## Features

- Install target
- Basic profiling support
- Coverage
- [Doxygen](http://www.doxygen.org/) integration
- [Google Test](https://github.com/google/googletest) integration
- [Google Benchmark](https://github.com/google/benchmark) integration
- [DIFAS](https://github.com/W4RH4WK/DIFAS) integration

## Demo

    $ mkdir build; cd build
    $ cmake -GNinja -DAUTO_DOWNLOAD=ON ..
    $ ninja
    $ ninja test
    $ ../scripts/run_benchmarks
