project(system)
cmake_minimum_required(VERSION 3.6)

#---------------------------------------------------------------------------------------
# Target
#---------------------------------------------------------------------------------------

file(GLOB ${PROJECT_NAME}_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/crypto/*.c"
)

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

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
