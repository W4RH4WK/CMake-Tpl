if(ENABLE_BENCHMARKING)
    include(ExternalProject)

    if(EXISTS ${PROJECT_SOURCE_DIR}/vendor/googlebenchmark.zip)
        set(GBENCHMARK_URL ${PROJECT_SOURCE_DIR}/vendor/googlebenchmark.zip)
    elseif(AUTO_DOWNLOAD)
        set(GBENCHMARK_URL https://github.com/google/benchmark/archive/v1.3.0.zip)
    else()
        message(FATAL_ERROR "GoogleBenchmark not found, consider using -DAUTO_DOWNLOAD=ON")
    endif()

    ExternalProject_Add(GBenchmark
        URL ${GBENCHMARK_URL}

        PREFIX vendor/googlebenchmark
        SOURCE_DIR vendor/googlebenchmark-src
        BINARY_DIR vendor/googlebenchmark-build

        CMAKE_ARGS
            -DBENCHMARK_ENABLE_TESTING=OFF
            -DBUILD_SHARED_LIBS=OFF

        INSTALL_COMMAND ""

        BUILD_BYPRODUCTS
            <BINARY_DIR>/src/libbenchmark.a

        DOWNLOAD_NO_PROGRESS TRUE
        EXCLUDE_FROM_ALL TRUE
    )
    ExternalProject_Get_Property(GBenchmark source_dir binary_dir)

    # fix INTERFACE_INCLUDE_DIRECTORIES
    file(MAKE_DIRECTORY ${source_dir}/include)

    add_library(GBenchmark::GBenchmark STATIC IMPORTED)
    set_target_properties(GBenchmark::GBenchmark
        PROPERTIES
            IMPORTED_LOCATION ${binary_dir}/src/libbenchmark.a
            INTERFACE_INCLUDE_DIRECTORIES ${source_dir}/include
            INTERFACE_LINK_LIBRARIES Threads::Threads
    )
    add_dependencies(GBenchmark::GBenchmark GBenchmark)
endif()
