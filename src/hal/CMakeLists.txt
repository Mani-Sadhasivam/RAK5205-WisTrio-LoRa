cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

project (hal C)

include_directories(../board/RAK811)
include_directories(../board/RAK811/cmsis)
include_directories(../application/RAK811)
include_directories(../hal/cmsis/)
include_directories(STM32L1xx_HAL_Driver/Inc)
include_directories(../external/utilities)
include_directories(../LoRaWAN/master/mac)
include_directories(../LoRaWAN/master/mac/region)
include_directories(../LoRaWAN/master/system)
include_directories(../LoRaWAN/master/radio)

FILE(GLOB halSources STM32L1xx_HAL_Driver/Src/*.c)
add_library(hal OBJECT EXCLUDE_FROM_ALL ${halSources})
