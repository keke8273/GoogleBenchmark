find_package(Threads REQUIRED)

include(ExternalProject)

ExternalProject_Add(gtest
	PREFIX 		"googletest"
	GIT_REPOSITORY 	"https://github.com/google/googletest.git"
	GIT_TAG 	"2fe3bd994b3189899d93f1d5a881e725e046fdc2" #release-1.8.1
	BINARY_DIR	${CMAKE_BINARY_DIR}/src/googletest
	SOURCE_DIR	${CMAKE_BINARY_DIR}/src/googletest
	LOG_BUILD ON
	)	

add_library(libgtest IMPORTED STATIC GLOBAL)
add_library(libgtest_main IMPORTED STATIC GLOBAL)

#ExternalProject_Get_Property(gtest source_dir binary_dir)
#include_directories("${source_dir}/include")

set_target_properties(libgtest PROPERTIES
    "IMPORTED_LOCATION" "${binary_dir}/libgtest.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    )

set_target_properties(libgtest_main PROPERTIES
    "IMPORTED_LOCATION" "${binary_dir}/libgtest_main.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    )

