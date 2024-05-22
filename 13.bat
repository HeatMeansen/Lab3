@echo off
setlocal enabledelayedexpansion

REM Fixed source directory
set "SOURCE_DIR=C:\labs\pz-23-2\Kotov\batch\Hidden"
set "FILE_NAME=copied_copyhelp.txt"

REM Request user input for destination directory
set /p DEST_DIR="Please enter the destination directory: "

REM Check if destination directory is empty
if "%DEST_DIR%"=="" (
    echo.
    echo Error: No destination directory specified.
    pause
    exit /b 1
)

REM Check if source directory exists
if not exist "%SOURCE_DIR%" (
    echo.
    echo Error: Source directory "%SOURCE_DIR%" does not exist.
    pause
    exit /b 2
)

REM Check if the file exists in the source directory
if not exist "%SOURCE_DIR%\%FILE_NAME%" (
    echo.
    echo Error: File "%SOURCE_DIR%\%FILE_NAME%" does not exist.
    pause
    exit /b 3
)

REM Check if destination directory exists
if not exist "%DEST_DIR%" (
    echo.
    echo Error: Destination directory "%DEST_DIR%" does not exist.
    pause
    exit /b 4
)

REM Move the file
echo.
echo Moving file "%FILE_NAME%" from "%SOURCE_DIR%" to "%DEST_DIR%":
move "%SOURCE_DIR%\%FILE_NAME%" "%DEST_DIR%\"
if %errorlevel% neq 0 (
    echo.
    echo Error: Failed to move the file.
    pause
    exit /b 5
)

echo.
echo Success: File "%FILE_NAME%" moved from "%SOURCE_DIR%" to "%DEST_DIR%".
pause
exit /b 0
