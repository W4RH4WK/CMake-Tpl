function(underscorify variable value)
    string(REPLACE "/" "_" result ${value})
    set(${variable} ${result} PARENT_SCOPE)
endfunction()
