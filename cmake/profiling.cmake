if(ENABLE_PROFILING)
    if(BUILD_SHARED_LIBS)
        message(WARNING "Profiling may not work when building shared libraries!")
    endif()

    if(CMAKE_C_COMPILE_ID AND NOT CMAKE_C_COMPILE_ID MATCHES "GNU|Clang|AppleClang")
        message(FATAL_ERROR "compiler does not support profiling")
    else()
        set(CMAKE_C_FLAGS "-pg ${CMAKE_C_FLAGS}")
    endif()

    if(CMAKE_CXX_COMPILER_ID AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang|AppleClang")
        message(FATAL_ERROR "compiler does not support profiling")
    else()
        set(CMAKE_CXX_FLAGS "-pg ${CMAKE_CXX_FLAGS}")
    endif()

    set(CMAKE_EXE_LINKER_FLAGS "-pg ${CMAKE_EXE_LINKER_FLAGS}")
endif()
