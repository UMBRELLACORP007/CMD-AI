@echo off
color 0a
title AI TERMINAL

:start
echo.
set /p user=You: 

if /i "%user%"=="hello" echo AI: Hello human.
if /i "%user%"=="hi" echo AI: Hi there.
if /i "%user%"=="who are you" echo AI: I am your personal CMD intelligence.
if /i "%user%"=="time" echo AI: The time is %time%
if /i "%user%"=="date" echo AI: Today is %date%

if /i "%user%"=="00" (
    echo AI: Generating battery report...
    powercfg /batteryreport /output "%USERPROFILE%\battery-report.html"
    echo AI: Opening report...
    start "" "%USERPROFILE%\battery-report.html"
)

if /i "%user%"=="scan" (
    echo AI: Starting system file scan... This may take a while.
    sfc /scannow
    echo AI: Scan complete!
)

if /i "%user%"=="startup" (
    echo AI: Loading stratup apps data...	
    color 04
    wmic startup get caption,command
    echo AI: Start up apps fetched succefully!
)

if /i "%user%"=="exit" exit

goto start