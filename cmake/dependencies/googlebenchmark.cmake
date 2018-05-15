set(BENCHMARK_ENABLE_TESTING OFF CACHE BOOL "Enable testing of googlebenchmark." FORCE)
set(BENCHMARK_ENABLE_INSTALL OFF CACHE BOOL "Enable installation of googlebenchmark." FORCE)

if(EXISTS ${PROJECT_SOURCE_DIR}/vendor/googlebenchmark)
	add_subdirectory(${PROJECT_SOURCE_DIR}/vendor/googlebenchmark)
elseif(NOT AUTO_DOWNLOAD)
	message(FATAL_ERROR "GoogleBenchmark not found, consider using -DAUTO_DOWNLOAD=ON")
else()
	include(DownloadProject)
	download_project(
		PROJ googlebenchmark
		URL https://github.com/google/benchmark/archive/v1.4.0.zip
		DOWNLOAD_DIR ${PROJECT_BINARY_DIR}/vendor/googlebenchmark-download
		SOURCE_DIR ${PROJECT_BINARY_DIR}/vendor/googlebenchmark-src
		BINARY_DIR ${PROJECT_BINARY_DIR}/vendor/googlebenchmark
		QUIET
	)
	add_subdirectory(
		${PROJECT_BINARY_DIR}/vendor/googlebenchmark-src
		${PROJECT_BINARY_DIR}/vendor/googlebenchmark
	)
endif()
