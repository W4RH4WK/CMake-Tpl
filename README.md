# CMake Template

- Use `-DAUTO_DOWNLOAD=ON` to automatically download build dependencies.

## Features

- Basic profiling support
- Coverage
- [Doxygen](http://www.doxygen.org/) integration
- [Google Test](https://github.com/google/googletest) integration
- [Google Benchmark](https://github.com/google/benchmark) integration
- [DIFAS](https://github.com/W4RH4WK/DIFAS) integration

## Demo

    $ mkdir build; cd build
    $ cmake -GNinja ..
    $ ninja
    $ ninja test
    $ ../scripts/run_benchmarks
