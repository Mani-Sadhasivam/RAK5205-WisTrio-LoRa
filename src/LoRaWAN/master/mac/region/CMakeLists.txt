cmake_minimum_required (VERSION 3.13)
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")
endif()

project (firmware C)

include_directories(../../../../hal/cmsis/)

FILE(GLOB regionSources *.c)
add_library(region OBJECT EXCLUDE_FROM_ALL ${regionSources})
