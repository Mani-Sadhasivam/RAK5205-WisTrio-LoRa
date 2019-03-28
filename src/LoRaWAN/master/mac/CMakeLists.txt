project(mac)
cmake_minimum_required(VERSION 3.6)

#---------------------------------------------------------------------------------------
# Options
#---------------------------------------------------------------------------------------

# Allow selection of region
option(REGION_EU868 "Region EU868" ON)
option(REGION_US915 "Region US915" OFF)
option(REGION_CN779 "Region CN779" OFF)
option(REGION_EU433 "Region EU433" OFF)
option(REGION_AU915 "Region AU915" OFF)
option(REGION_AS923 "Region AS923" OFF)
option(REGION_CN470 "Region CN470" OFF)
option(REGION_KR920 "Region KR920" OFF)
option(REGION_IN865 "Region IN865" ON)
option(REGION_RU864 "Region RU864" OFF)
set(REGION_LIST REGION_EU868 REGION_US915 REGION_CN779 REGION_EU433 REGION_AU915 REGION_AS923 REGION_CN470 REGION_KR920 REGION_IN865 REGION_RU864)

#---------------------------------------------------------------------------------------
# Target
#---------------------------------------------------------------------------------------

list(APPEND ${PROJECT_NAME}_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/LoRaMac.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/LoRaMacCrypto.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/Region.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionAS923.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionAU915.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionCN470.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionCN779.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionCommon.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionEU433.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionEU868.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionIN865.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionKR920.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionUS915.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/region/RegionUS915-Hybrid.c"
)

include_directories(./)
include_directories(./Region)
include_directories(../../../hal/cmsis/)
include_directories(../../../board/RAK811)
include_directories(../../../board/RAK811/cmsis)
include_directories(../../../driver)
include_directories(../../../application/RAK811)
include_directories(../../../hal/STM32L1xx_HAL_Driver/Inc)
include_directories(../../../LoRaWAN/master/mac/region)
include_directories(../../../LoRaWAN/master/system/crypto)
include_directories(../../../external/utilities)
include_directories(../system)
include_directories(../radio)

add_library(${PROJECT_NAME} OBJECT EXCLUDE_FROM_ALL ${${PROJECT_NAME}_SOURCES})

# Loops through all regions and add compile time definitions for the enabled ones.
foreach( REGION ${REGION_LIST} )
    if(${REGION})
        target_compile_definitions(${PROJECT_NAME} PUBLIC -D"${REGION}")
    endif()
endforeach()

add_dependencies(${PROJECT_NAME} board)

set_property(TARGET ${PROJECT_NAME} PROPERTY C_STANDARD 11)
