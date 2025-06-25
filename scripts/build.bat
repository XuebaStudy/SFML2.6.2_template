@echo off
setlocal

set BUILD_DIR=build

if exist %BUILD_DIR% (
    echo ==== Cleaning existing build directory... ====
    rmdir /s /q %BUILD_DIR%
)

mkdir %BUILD_DIR%

cd /d %BUILD_DIR%

echo ==== Generating Makefiles with MinGW using CMake... ====
cmake -G "MinGW Makefiles" .. > NUL

echo ==== Building project... ====
..\mingw64\bin\make > NUL

if exist ..\Project\bin\main.exe (
    echo ==== Deleting old main.exe file... ====
    del ..\Project\bin\main.exe
)

copy main.exe ..\Project\bin\main.exe > NUL
echo ==== Build completed successfully, new main.exe created. ====

echo ==== Running the application... ====
cd ..\Project\bin
main.exe

