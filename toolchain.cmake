# Target definition

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)
SET(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(OBJECT_GEN_FLAGS "-g -O2 -mthumb -fno-builtin -mcpu=cortex-m3 -pedantic -Wno-unused-parameter -ffunction-sections -fdata-sections -mabi=aapcs")
set(CMAKE_C_FLAGS "-g -O2 -DSTM32L151xB -Wno-implicit-function-declaration -ffunction-sections -fdata-sections -mabi=aapcs -march=armv7-m -mcpu=cortex-m3") 
set(CMAKE_ASM_FLAGS "-march=armv7-m -mcpu=cortex-m3") 
set(LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/src/board/RAK811/cmsis/arm-gcc/stm32l1xx_md_flash.ld)
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections --specs=nano.specs --specs=nosys.specs -mthumb -g2 -mcpu=cortex-m3 -mabi=aapcs -u _printf_float -T${LINKER_SCRIPT} -Wl,-Map=${CMAKE_PROJECT_NAME}.map" CACHE INTERNAL "Linker options")

#---------------------------------------------------------------------------------------
# Set toolchain paths
#---------------------------------------------------------------------------------------
set(TOOLCHAIN arm-none-eabi)
set(TOOLCHAIN_PREFIX "/usr")
set(TOOLCHAIN_BIN_DIR ${TOOLCHAIN_PREFIX}/bin)
set(TOOLCHAIN_INC_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/include)
set(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/lib)

set(TOOLCHAIN_EXT "" )

# Perform compiler test with static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

#---------------------------------------------------------------------------------------
# Preset some general GCC Options
#---------------------------------------------------------------------------------------

# Options for DEBUG build
# -g produce debugging information in the operating system’s native format
set(CMAKE_C_FLAGS_DEBUG "-g -DDEBUG" CACHE INTERNAL "C Compiler options for debug build type")
set(CMAKE_CXX_FLAGS_DEBUG "-g -DDEBUG" CACHE INTERNAL "C++ Compiler options for debug build type")
set(CMAKE_ASM_FLAGS_DEBUG "" CACHE INTERNAL "ASM Compiler options for debug build type")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker options for debug build type")

# Options for RELEASE build
set(CMAKE_C_FLAGS_RELEASE "" CACHE INTERNAL "C Compiler options for release build type")
set(CMAKE_CXX_FLAGS_RELEASE "" CACHE INTERNAL "C++ Compiler options for release build type")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM Compiler options for release build type")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE INTERNAL "Linker options for release build type")

#---------------------------------------------------------------------------------------
# Set compilers
#---------------------------------------------------------------------------------------
set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-gcc${TOOLCHAIN_EXT} CACHE INTERNAL "C Compiler")
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-g++${TOOLCHAIN_EXT} CACHE INTERNAL "C++ Compiler")
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-as${TOOLCHAIN_EXT} CACHE INTERNAL "ASM Compiler")
set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-objcopy${TOOLCHAIN_EXT} CACHE INTERNAL "ASM Compiler")

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PREFIX}/${${TOOLCHAIN}} ${CMAKE_PREFIX_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

