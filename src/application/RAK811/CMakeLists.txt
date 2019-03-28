cmake_minimum_required (VERSION 3.13)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

#cmake_policy(SET CMP0079 NEW)

project (lorawan C)

# Allow switching of sub projects
set(SUB_PROJECT_LIST node)
set(SUB_PROJECT node CACHE STRING "Default sub project is node")
set_property(CACHE SUB_PROJECT PROPERTY STRINGS ${SUB_PROJECT_LIST})

include_directories(./)
include_directories(../../hal/cmsis/)
include_directories(../../board/RAK811)
include_directories(../../board/RAK811/cmsis)
include_directories(../../driver)
include_directories(../../external/utilities)
include_directories(../../LoRaWAN/master/mac)
include_directories(../../LoRaWAN/master/mac/region)
include_directories(../../LoRaWAN/master/system)
include_directories(../../LoRaWAN/master/radio)
include_directories(../../LoRaWAN/master/radio/sx1276)
include_directories(../../hal/STM32L1xx_HAL_Driver/Inc)

list(APPEND ${PROJECT_NAME}_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/app.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/at_cmd.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/lora_config.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/partition.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/rw_lora.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
)

add_executable(${PROJECT_NAME}-${SUB_PROJECT}
                            ${${PROJECT_NAME}_SOURCES}
                            $<TARGET_OBJECTS:mac>
                            $<TARGET_OBJECTS:system>
                            $<TARGET_OBJECTS:radio>
                            $<TARGET_OBJECTS:hal>
                            $<TARGET_OBJECTS:board>
                            $<TARGET_OBJECTS:cmsis>
                            $<TARGET_OBJECTS:drivers>
                            $<TARGET_OBJECTS:utilities>
)

set_property(TARGET ${PROJECT_NAME}-${SUB_PROJECT} PROPERTY C_STANDARD 11)

target_link_libraries(${PROJECT_NAME}-${SUB_PROJECT} m)

#---------------------------------------------------------------------------------------
# Creates output in hex format
#---------------------------------------------------------------------------------------
add_custom_target(${PROJECT_NAME}-${SUB_PROJECT}.hex ALL DEPENDS ${PROJECT_NAME}-${SUB_PROJECT} COMMAND ${CMAKE_OBJCOPY} -Oihex ${PROJECT_NAME}-${SUB_PROJECT} ../../../${PROJECT_NAME}-${SUB_PROJECT}.hex)

#---------------------------------------------------------------------------------------
# Creates output in binary format
#---------------------------------------------------------------------------------------
add_custom_target(${PROJECT_NAME}-${SUB_PROJECT}.bin ALL DEPENDS ${PROJECT_NAME}-${SUB_PROJECT} COMMAND ${CMAKE_OBJCOPY} -Obinary ${PROJECT_NAME}-${SUB_PROJECT} ../../../${PROJECT_NAME}-${SUB_PROJECT}.bin)

#---------------------------------------------------------------------------------------
# Creates objdump
#---------------------------------------------------------------------------------------
add_custom_target(${PROJECT_NAME}-${SUB_PROJECT}.lst ALL DEPENDS ${PROJECT_NAME}-${SUB_PROJECT} COMMAND ${CMAKE_OBJDUMP} -S ${PROJECT_NAME}-${SUB_PROJECT} > ../../../${PROJECT_NAME}-${SUB_PROJECT}.lst)
