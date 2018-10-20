set(PROJECT_NAME googletest)
set(COMPILE_FLAG $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>$<$<NOT:$<CONFIG:Release>>:${CMAKE_CXX_FLAGS_DEBUG}>)

include(ExternalProject)

ExternalProject_Add(${PROJECT_NAME}
	GIT_REPOSITORY 	"https://github.com/google/googletest.git"
	GIT_TAG 	"release-1.8.1"
        BINARY_DIR	"${CMAKE_BINARY_DIR}/${PROJECT_NAME}-build"
        SOURCE_DIR	"${CMAKE_BINARY_DIR}/${PROJECT_NAME}-src"
        INSTALL_DIR     "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-install"
        BUILD_COMMAND   make CFLAGS=${COMPILE_FLAG}
        CMAKE_ARGS      "-DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>"
	LOG_BUILD ON
	)	

add_library(libgtest IMPORTED STATIC GLOBAL)

add_library(libgtest_main IMPORTED STATIC GLOBAL)

ExternalProject_Get_Property(${PROJECT_NAME} INSTALL_DIR)

set_target_properties(libgtest PROPERTIES
    "IMPORTED_LOCATION"                 "${INSTALL_DIR}/lib/libgtest.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES"     "${INSTALL_DIR}/include"
    )

set_target_properties(libgtest_main PROPERTIES
    "IMPORTED_LOCATION"                 "${INSTALL_DIR}/lib/libgtest_main.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES"     "${INSTALL_DIR}/include"
    )

set(GTEST_ROOT "${INSTALL_DIR}" CACHE PATH "path to gtest")
