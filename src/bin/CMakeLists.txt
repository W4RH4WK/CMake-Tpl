set(executables dice_roller resource_accessor)

foreach(executable IN LISTS executables)
    add_executable(${executable} ${executable}.cpp)
    target_link_libraries(${executable} example)

    install(TARGETS ${executable} RUNTIME DESTINATION bin)
endforeach()
