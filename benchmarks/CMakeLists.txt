set(TARGET_NAME benchmark_string)

add_executable(${TARGET_NAME}
    benchmark_string.cpp)

target_link_libraries(${TARGET_NAME} 
    PRIVATE libbenchmark libbenchmark_main pthread)
