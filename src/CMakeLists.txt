cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

project (firmware C)

set(RADIO sx1276 CACHE INTERNAL "Radio sx1276 selected")

add_subdirectory (board/RAK811)
add_subdirectory (board/RAK811/cmsis)
add_subdirectory (driver)
add_subdirectory (hal)
add_subdirectory (LoRaWAN/master)
add_subdirectory (application/RAK811)
add_subdirectory (external)
