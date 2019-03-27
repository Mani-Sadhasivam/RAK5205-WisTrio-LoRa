set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER /usr/bin/arm-none-eabi-gcc)

set(CMAKE_AR "arm-none-eabi-ar")
set(CMAKE_LINKER "arm-none-eabi-ld")
set(CMAKE_SIZE "arm-none-eabi-size")
set(CMAKE_OBJCOPY "arm-none-eabi-objcopy")

# Search for programs in the build host directories
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set (CMAKE_C_FLAGS "-Wall -DSTM32L151xB -nostartfiles -nodefaultlibs -fno-common -ffunction-sections -fdata-sections -mabi=aapcs -march=armv7-m -mthumb -mcpu=cortex-m3") 

