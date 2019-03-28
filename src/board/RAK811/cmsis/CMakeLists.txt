project (cmsis C ASM)
cmake_minimum_required (VERSION 3.13)

include_directories(./)
include_directories(../../../application/RAK811)
include_directories(../../../hal/cmsis/)
include_directories(../../../hal/STM32L1xx_HAL_Driver/Inc)
include_directories(../../../driver)

list(APPEND ${PROJECT_NAME}_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/arm-gcc/startup_stm32l1xx_md.s"
    "${CMAKE_CURRENT_SOURCE_DIR}/system_stm32l1xx.c"
)

remove_definitions( -DLORA_HF_BOARD=1 )
remove_definitions( -DTRACKERBOARD=1 )
remove_definitions( -DHAL_IWDG_MODULE_ENABLED=1 )
add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})
