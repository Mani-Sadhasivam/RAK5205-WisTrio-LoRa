cmake_minimum_required (VERSION 3.13)
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")
endif()

project (firmware C)

include_directories(./)
include_directories(./Region)
include_directories(../../../hal/cmsis/)
include_directories(../../../board/RAK811)
include_directories(../../../board/RAK811/cmsis)
include_directories(../../../driver)
include_directories(../../../application/RAK811)
include_directories(../../../hal/STM32L1xx_HAL_Driver/Inc)
include_directories(../../../LoRaWAN/master/mac)
include_directories(../../../LoRaWAN/master/mac/region)
include_directories(../../../LoRaWAN/master/system/crypto)
include_directories(../../../external/utilities)
include_directories(../radio)


FILE(GLOB cryptoSources *.c)
add_library(crypto OBJECT EXCLUDE_FROM_ALL  ${cryptoSources})
