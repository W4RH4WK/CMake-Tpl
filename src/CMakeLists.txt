configure_file(resource_path.def.in resource_path.def @ONLY)

add_library(example
    dice.cpp
    resource_path.cpp
)

target_link_libraries(example Boost::random)

target_include_directories(example
    PUBLIC ${PROJECT_SOURCE_DIR}/include
    PRIVATE . ${CMAKE_CURRENT_BINARY_DIR}
)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION include)
install(TARGETS example
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
