find_package(Threads REQUIRED)

include(ExternalProject)

ExternalProject_Add(gtest
	PREFIX 		"googletest"
	GIT_REPOSITORY 	"https://github.com/google/googletest.git"
	GIT_TAG 	"2fe3bd994b3189899d93f1d5a881e725e046fdc2" #release-1.8.1
	BINARY_DIR	${CMAKE_BINARY_DIR}/gtest
	SOURCE_DIR	${CMAKE_BINARY_DIR}/third_party/gtest
        INSTALL_COMMAND cmake -E echo "Skipping install gtest."
	LOG_BUILD ON
	)	

add_library(libgtest IMPORTED STATIC GLOBAL)
add_library(libgtest_main IMPORTED STATIC GLOBAL)

ExternalProject_Get_Property(gtest SOURCE_DIR BINARY_DIR)

set_target_properties(libgtest PROPERTIES
    "IMPORTED_LOCATION" "${BINARY_DIR}/libgtest.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${SOURCE_DIR}/googletest/include"
    )

set_target_properties(libgtest_main PROPERTIES
    "IMPORTED_LOCATION" "${BINARY_DIR}/libgtest_main.a"
    "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
    "INTERFACE_INCLUDE_DIRECTORIES" "${SOURCE_DIR}/googletest/include"
    )
