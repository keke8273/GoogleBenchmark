set(PROJECT_NAME googlebenchmark)

include(ExternalProject)

ExternalProject_Add(${PROJECT_NAME}
        DEPENDS           googletest
	GIT_REPOSITORY 	  "https://github.com/google/benchmark.git"
	GIT_TAG 	  "e776aa0275e293707b6a0901e0e8d8a8a3679508" #release-1.4.1
        BINARY_DIR	  "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-build"
        SOURCE_DIR	  "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-src"
        INSTALL_DIR       "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-install"
        CMAKE_ARGS        "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
        CMAKE_CACHE_ARGS  "-DGTEST_ROOT:PATH=${GTEST_ROOT}"
	LOG_BUILD ON
	)	

add_library(libbenchmark IMPORTED STATIC GLOBAL)
add_library(libbenchmark_main IMPORTED STATIC GLOBAL)

ExternalProject_Get_Property(${PROJECT_NAME} INSTALL_DIR)

set_target_properties(libbenchmark PROPERTIES
    "IMPORTED_LOCATION" "${INSTALL_DIR}/lib/libbenchmark.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${INSTALL_DIR}/include"
    )

set_target_properties(libbenchmark_main PROPERTIES
    "IMPORTED_LOCATION" "${INSTALL_DIR}/lib/libbenchmark_main.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${INSTALL_DIR}/include"
    )
