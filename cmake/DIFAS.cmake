if(DEFINED ENV{DIFAS_ROOT})
	set(DIFAS_ROOT $ENV{DIFAS_ROOT})
elseif(NOT DEFINED DIFAS_ROOT)
	set(DIFAS_ROOT ${CMAKE_SOURCE_DIR}/vendor/DIFAS)
endif()

if(NOT UNIX)
	message(WARNING "DIFAS is only supported on Linux / macOS")
elseif(NOT EXISTS ${DIFAS_ROOT}/third_party_linker)
	message(WARNING "DIFAS' third_party_linker not found")
else()
	execute_process(
		COMMAND ${DIFAS_ROOT}/third_party_linker
		WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
	)

	set(THIRD_PARTY_DIR ${CMAKE_BINARY_DIR}/third_party CACHE STRING "Third Party Symlink Directory")
	file(GLOB _prefix_paths ${THIRD_PARTY_DIR}/*)
	list(APPEND CMAKE_PREFIX_PATH ${_prefix_paths})
endif()
