cmake_minimum_required (VERSION 2.8.11)
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")
endif()

project (firmware C)

add_subdirectory (src)
