set(TARGET_NAME benchmark_string)

add_executable(${TARGET_NAME}
    benchmark_string.cpp
    benchmark_stl_containers.cpp
    benchmark_language_features.cpp
    )

target_include_directories(${TARGET_NAME}
    PRIVATE
      "${PROJECT_SOURCE_DIR}/src"
    )

target_link_libraries(${TARGET_NAME} 
    PRIVATE 
      libbenchmark 
      libbenchmark_main 
      pthread
    )
