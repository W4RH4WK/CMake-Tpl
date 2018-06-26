if(NOT TARGET GTest)
    include(dependencies/threads)

    include(ExternalProject)

    if(EXISTS ${PROJECT_SOURCE_DIR}/vendor/googletest.zip)
        set(GTEST_URL ${PROJECT_SOURCE_DIR}/vendor/googletest.zip)
    elseif(AUTO_DOWNLOAD)
        set(GTEST_URL https://github.com/google/googletest/archive/release-1.8.0.zip)
    else()
        message(FATAL_ERROR "GoogleTest not found, consider using -DAUTO_DOWNLOAD=ON")
    endif()

    ExternalProject_Add(GTest
        URL ${GTEST_URL}

        PREFIX vendor/googletest
        SOURCE_DIR vendor/googletest-src
        BINARY_DIR vendor/googletest-build

        CMAKE_ARGS
            #-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
            #-DCMAKE_C_COMPILER_ARG1=${CMAKE_C_COMPILER_ARG1}
            -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
            -DCMAKE_CXX_COMPILER_ARG1=${CMAKE_CXX_COMPILER_ARG1}
            -DBUILD_SHARED_LIBS=OFF

        INSTALL_COMMAND ""

        BUILD_BYPRODUCTS
            <BINARY_DIR>/googlemock/gtest/libgtest.a
            <BINARY_DIR>/googlemock/gtest/libgtest_main.a

        DOWNLOAD_NO_PROGRESS TRUE
        EXCLUDE_FROM_ALL TRUE
    )
    ExternalProject_Get_Property(GTest source_dir binary_dir)

    # fix INTERFACE_INCLUDE_DIRECTORIES
    file(MAKE_DIRECTORY ${source_dir}/googletest/include)

    add_library(GTest::GTest STATIC IMPORTED)
    set_target_properties(GTest::GTest
        PROPERTIES
            IMPORTED_LOCATION ${binary_dir}/googlemock/gtest/libgtest.a
            INTERFACE_INCLUDE_DIRECTORIES ${source_dir}/googletest/include
            INTERFACE_LINK_LIBRARIES Threads::Threads
    )
    add_dependencies(GTest::GTest GTest)

    add_library(GTest::Main STATIC IMPORTED)
    set_target_properties(GTest::Main
        PROPERTIES
            IMPORTED_LOCATION ${binary_dir}/googlemock/gtest/libgtest_main.a
            INTERFACE_LINK_LIBRARIES GTest::GTest
    )
    add_dependencies(GTest::Main GTest)
endif()
