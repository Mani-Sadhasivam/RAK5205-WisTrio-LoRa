cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

project (lorawan-sources C)

add_subdirectory (mac)
add_subdirectory (radio)
add_subdirectory (system)
