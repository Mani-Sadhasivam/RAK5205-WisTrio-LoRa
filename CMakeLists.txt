cmake_minimum_required (VERSION 3.13)

project (firmware)
set(CMAKE_TOOLCHAIN_FILE "toolchain.cmake" CACHE PATH "toolchain file")

# Uncomment below definitions based on the requirement
#add_definitions( -DLORA_LF_BOARD=1 )
add_definitions( -DLORA_HF_BOARD=1 )

add_definitions( -DTRACKERBOARD=1 )
add_definitions( -DHAL_IWDG_MODULE_ENABLED=1 )
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)
