cmake_minimum_required(VERSION 3.0)

project (googlebenchmark)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

add_compile_options(-W -Wall)

include(googletest)
