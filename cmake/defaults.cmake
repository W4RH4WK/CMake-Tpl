option(AUTO_DOWNLOAD "Automatically download build dependencies" OFF)
option(ENABLE_TESTING "Enable tests" ON)
option(ENABLE_BENCHMARKING "Enable benchmarks" ON)

if(NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE "Release" CACHE STRING "CMake Build Type" FORCE)
endif()
