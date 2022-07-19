cmake_minimum_required(VERSION 3.0)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_C_FLAGS "--specs=nosys.specs")
set(CMAKE_CXX_FLAGS "--specs=nosys.specs")
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)


project(crc)

if(${BUILD} STREQUAL "CRC_32")
    add_definitions(-DCRC_32)
elseif(${BUILD} STREQUAL "CRC_16")
    add_definitions(-DCRC_16)
elseif(${BUILD} STREQUAL "CRC_CCITT")
    add_definitions(-DCRC_CCITT)
endif()

add_executable(crc crc.c main.c reflect.c)
