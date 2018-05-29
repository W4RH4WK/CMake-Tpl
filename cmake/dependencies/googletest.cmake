if(ENABLE_TESTING)
    set(INSTALL_GTEST OFF CACHE BOOL "Enable installation of googletest." FORCE)
    set(INSTALL_GMOCK OFF CACHE BOOL "Enable installation of googlemock." FORCE)

    if(EXISTS ${PROJECT_SOURCE_DIR}/vendor/googletest)
	    add_subdirectory(${PROJECT_SOURCE_DIR}/vendor/googletest)
    elseif(NOT AUTO_DOWNLOAD)
	    message(FATAL_ERROR "GoogleTest not found, consider using -DAUTO_DOWNLOAD=ON")
    else()
	    include(DownloadProject)
	    download_project(
		    PROJ googletest
		    URL https://github.com/google/googletest/archive/release-1.8.0.zip
		    DOWNLOAD_DIR ${PROJECT_BINARY_DIR}/vendor/googletest-download
		    SOURCE_DIR ${PROJECT_BINARY_DIR}/vendor/googletest-src
		    BINARY_DIR ${PROJECT_BINARY_DIR}/vendor/googletest
		    QUIET
	    )
	    add_subdirectory(
		    ${PROJECT_BINARY_DIR}/vendor/googletest-src
		    ${PROJECT_BINARY_DIR}/vendor/googletest
	    )
    endif()
endif()
