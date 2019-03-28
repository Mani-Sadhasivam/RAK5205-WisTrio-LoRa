project(radio)
cmake_minimum_required(VERSION 3.6)

#---------------------------------------------------------------------------------------
# Options
#---------------------------------------------------------------------------------------

# Allow switching of radios
set(RADIO_LIST sx1272 sx1276)
set(RADIO sx1276 CACHE STRING "Default radio is sx1276")
set_property(CACHE RADIO PROPERTY STRINGS ${RADIO_LIST})
set_property(CACHE RADIO PROPERTY ADVANCED)

#---------------------------------------------------------------------------------------
# Target
#---------------------------------------------------------------------------------------

file(GLOB ${PROJECT_NAME}_SOURCES "${RADIO}/*.c")

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
include_directories(../system)
include_directories(../radio)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})

add_dependencies(${PROJECT_NAME} board)
