cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

project (utilities C)

include_directories(../board/RAK811)
include_directories(../board/RAK811/cmsis)
include_directories(../application/RAK811)
include_directories(../hal/cmsis/)
include_directories(../hal/STM32L1xx_HAL_Driver/Inc)
include_directories(../external/utilities)
include_directories(../driver)
include_directories(../LoRaWAN/master/mac)
include_directories(../LoRaWAN/master/mac/region)
include_directories(../LoRaWAN/master/system)
include_directories(../LoRaWAN/master/radio)

file(GLOB ${PROJECT_NAME}_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/utilities/*.c")
add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
