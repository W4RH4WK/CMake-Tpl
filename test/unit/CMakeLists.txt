set(tests dice)

foreach(test IN LISTS tests)
    underscorify(test_ ${test})
    add_executable(ut_${test_} ${test}_test.cpp)
    target_link_libraries(ut_${test_} example GTest::Main)
    add_test(NAME ut_${test_} COMMAND $<TARGET_FILE:ut_${test_}>)
endforeach()
