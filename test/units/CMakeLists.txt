set(tests dice)

foreach(test IN LISTS tests)
    underscorify(test_ ${test})
    add_executable(ut_${test_} ${test}_test.cpp)
    target_link_libraries(ut_${test_} example gtest_main)
    add_test(ut_${test_} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/ut_${test_})
endforeach()
