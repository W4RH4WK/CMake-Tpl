option(ENABLE_COVERAGE "Compile with coverage support" OFF)

if(ENABLE_COVERAGE)
    find_program(LCOV lcov)
    find_program(GENHTML genhtml)

    if(NOT LCOV)
        message(FATAL_ERROR "lcov not found")
    endif()

    if(NOT GENHTML)
        message(FATAL_ERROR "genhtml not found")
    endif()

    if(CMAKE_C_COMPILE_ID AND NOT CMAKE_C_COMPILE_ID MATCHES "GNU|Clang|AppleClang")
        message(FATAL_ERROR "compiler does not support coverage")
    else()
        set(CMAKE_C_FLAGS "--coverage ${CMAKE_C_FLAGS}")
    endif()

    if(CMAKE_CXX_COMPILER_ID AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang|AppleClang")
        message(FATAL_ERROR "compiler does not support coverage")
    else()
        set(CMAKE_CXX_FLAGS "--coverage ${CMAKE_CXX_FLAGS}")
    endif()

    set(CMAKE_EXE_LINKER_FLAGS    "--coverage ${CMAKE_EXE_LINKER_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "--coverage ${CMAKE_SHARED_LINKER_FLAGS}")

    set(_lcov_args
        --base-directory ${PROJECT_BINARY_DIR}
        --directory ${PROJECT_BINARY_DIR}
        --quiet
    )

    set(_genhtml_args --title ${PROJECT_NAME} --quiet)

    add_custom_target(coverage
        COMMAND ${LCOV} ${_lcov_args} --zerocounters
        COMMAND ${CMAKE_BUILD_TOOL} test
        COMMAND ${LCOV} ${_lcov_args} --capture -o coverage.info
        COMMAND ${LCOV} ${_lcov_args} --remove coverage.info "/usr*"  -o coverage.info
        COMMAND ${LCOV} ${_lcov_args} --remove coverage.info "boost*" -o coverage.info
        COMMAND ${LCOV} ${_lcov_args} --remove coverage.info "c++*"   -o coverage.info
        COMMAND ${LCOV} ${_lcov_args} --remove coverage.info "gtest*" -o coverage.info
        COMMAND ${GENHTML} ${_genhtml_args} coverage.info -o coverage
    )
endif()
