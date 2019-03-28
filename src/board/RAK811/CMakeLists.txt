cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

project (board C)

include_directories(./)
include_directories(./cmsis/)
include_directories(../../application/RAK811)
include_directories(../../hal/cmsis/)
include_directories(../../hal/STM32L1xx_HAL_Driver/Inc)
include_directories(../../driver)
include_directories(../../external/utilities)
include_directories(../../LoRaWAN/master/mac)
include_directories(../../LoRaWAN/master/mac/region)
include_directories(../../LoRaWAN/master/system)
include_directories(../../LoRaWAN/master/radio)

list(APPEND ${PROJECT_NAME}_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/adc-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/gps-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/gpio-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/i2c-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/rtc-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/spi-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/sx1276-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/uart-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/timer-board.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/BME680-board.c"
)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
set_property(TARGET ${PROJECT_NAME} PROPERTY C_STANDARD 11)
add_dependencies(${PROJECT_NAME} hal)
