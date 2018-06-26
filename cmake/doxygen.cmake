if(ENABLE_DOXYGEN)
    find_package(Doxygen)

    if(DOXYGEN_FOUND)
        configure_file(${PROJECT_SOURCE_DIR}/.doxyfile ${PROJECT_BINARY_DIR}/Doxyfile @ONLY)

        add_custom_target(doxygen
            COMMAND ${DOXYGEN_EXECUTABLE} ${PROJECT_BINARY_DIR}/Doxyfile
            SOURCES ${PROJECT_SOURCE_DIR}/.doxyfile
        )
    else()
        message(WARNING "Doxygen not found.")
    endif()
endif()
