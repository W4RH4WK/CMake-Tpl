configure_file(resource_path.cpp.in resource_path.cpp @ONLY)

add_library(example
    dice.cpp
    ${CMAKE_CURRENT_BINARY_DIR}/resource_path.cpp
)

target_link_libraries(example Boost::random)

target_include_directories(example
    PUBLIC ${PROJECT_SOURCE_DIR}/include
    PRIVATE .
)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION include)
install(TARGETS example
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)
