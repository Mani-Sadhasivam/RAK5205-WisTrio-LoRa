cmake_minimum_required (VERSION 3.13)
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")
endif()

project (firmware C)

include_directories(../../../../hal/cmsis/)

FILE(GLOB sx1272Sources *.c)
add_executable(sx1272 ${sx1272Sources})
