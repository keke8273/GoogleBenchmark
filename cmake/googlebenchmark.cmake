set(PROJECT_NAME googlebenchmark)
set(COMPILE_FLAG $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>$<$<NOT:$<CONFIG:Release>>:${CMAKE_CXX_FLAGS_DEBUG}>)

include(ExternalProject)

ExternalProject_Add(
    ${PROJECT_NAME}
    DEPENDS             googletest
    GIT_REPOSITORY      "https://github.com/google/benchmark.git"
    GIT_TAG             "e776aa0275e293707b6a0901e0e8d8a8a3679508" #release-1.4.1
    BINARY_DIR          "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-build"
    SOURCE_DIR          "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-src"
    INSTALL_DIR         "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-install"
    CMAKE_ARGS          "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>" "-DCMAKE_CXX_FLAGS=${COMPILE_FLAG}"
    CMAKE_CACHE_ARGS    "-DGTEST_ROOT:PATH=${GTEST_ROOT}"
    LOG_BUILD ON
    )

ExternalProject_Get_Property(${PROJECT_NAME} INSTALL_DIR)
set(GBENCHMARK_LIB_INCLUDE "${INSTALL_DIR}/include")

# create include directory, otherwise INTERFACE_INCLUDE_DIRECTORIES will report error
file(MAKE_DIRECTORY ${GBENCHMARK_LIB_INCLUDE})

# config targets
add_library(libbenchmark IMPORTED STATIC GLOBAL)
set_target_properties(libbenchmark PROPERTIES
    "IMPORTED_LOCATION"                 "${INSTALL_DIR}/lib/libbenchmark.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES"     "${GBENCHMARK_LIB_INCLUDE}"
    )

add_library(libbenchmark_main IMPORTED STATIC GLOBAL)
set_target_properties(libbenchmark_main PROPERTIES
    "IMPORTED_LOCATION"                 "${INSTALL_DIR}/lib/libbenchmark_main.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES"     "${GBENCHMARK_LIB_INCLUDE}"
    )
