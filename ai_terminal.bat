@echo off
setlocal EnableExtensions EnableDelayedExpansion
color 0a
title AI TERMINAL

:choose
echo.
echo Run as admin?
echo 1) Yes
echo 2) No
set "choice="
set /p "choice=Select: "
if "%choice%"=="1" goto elevate
if "%choice%"=="2" goto nonadmin
goto choose

:elevate
net session >nul 2>&1
if not errorlevel 1 goto admin
echo Set UAC = CreateObject("Shell.Application") > "%temp%\ai_terminal_admin.vbs"
echo UAC.ShellExecute "%~f0", "admin", "", "runas", 1 >> "%temp%\ai_terminal_admin.vbs"
cscript //nologo "%temp%\ai_terminal_admin.vbs" >nul 2>&1
del "%temp%\ai_terminal_admin.vbs" >nul 2>&1
exit /b

:admin
set "ADMIN_MODE=1"
goto start

:nonadmin
set "ADMIN_MODE=0"
goto start

:start
if /i "%~1"=="admin" set "ADMIN_MODE=1"
cls
echo AI TERMINAL (Admin: %ADMIN_MODE%)
goto main

:main
echo.
set "cmd="
set /p "cmd=You: "
if not defined cmd goto main
for /f "tokens=* delims= " %%A in ("%cmd%") do set "cmd=%%A"

if /i "%cmd%"=="menu" goto menu
if /i "%cmd%"=="hello" goto hello
if /i "%cmd%"=="hi" goto hi
if /i "%cmd%"=="who are you" goto who
if /i "%cmd%"=="time" goto show_time
if /i "%cmd%"=="date" goto show_date
if /i "%cmd%"=="00" goto battery_report
if /i "%cmd%"=="scan" goto scan
if /i "%cmd%"=="verify" goto verify
if /i "%cmd%"=="startup" goto startup
if /i "%cmd%"=="sysinfo" goto sysinfo
if /i "%cmd%"=="ip" goto ip
if /i "%cmd%"=="ipall" goto ipall
if /i "%cmd%"=="ping" goto ping
if /i "%cmd%"=="dns" goto dns
if /i "%cmd%"=="netcheck" goto netcheck
if /i "%cmd%"=="winsock" goto winsock
if /i "%cmd%"=="energy" goto energy
if /i "%cmd%"=="hibernateoff" goto hibernateoff
if /i "%cmd%"=="lastwake" goto lastwake
if /i "%cmd%"=="requests" goto requests
if /i "%cmd%"=="dismcleanup" goto dismcleanup
if /i "%cmd%"=="chkdsk" goto chkdsk
if /i "%cmd%"=="cleanmgrset" goto cleanmgrset
if /i "%cmd%"=="cleanmgrrun" goto cleanmgrrun
if /i "%cmd%"=="speedup" goto speedup
if /i "%cmd%"=="task" goto taskmgr
if /i "%cmd%"=="tasks" goto tasks
if /i "%cmd%"=="kill" goto kill
if /i "%cmd%"=="control" goto control
if /i "%cmd%"=="settings" goto settings
if /i "%cmd%"=="update" goto update
if /i "%cmd%"=="disk" goto disk
if /i "%cmd%"=="gpu" goto gpu
if /i "%cmd%"=="cpu" goto cpu
if /i "%cmd%"=="ram" goto ram
if /i "%cmd%"=="battery" goto battery
if /i "%cmd%"=="activation" goto activation
if /i "%cmd%"=="dxdiag" goto dxdiag
if /i "%cmd%"=="device" goto device
if /i "%cmd%"=="diskmgmt" goto diskmgmt
if /i "%cmd%"=="services" goto services
if /i "%cmd%"=="logs" goto logs
if /i "%cmd%"=="wifi" goto wifi
if /i "%cmd%"=="wifipass" goto wifipass
if /i "%cmd%"=="temp" goto temp
if /i "%cmd%"=="cleantemp" goto cleantemp
if /i "%cmd%"=="downloads" goto downloads
if /i "%cmd%"=="desktop" goto desktop
if /i "%cmd%"=="recent" goto recent
if /i "%cmd%"=="chrome" goto chrome
if /i "%cmd%"=="youtube" goto youtube
if /i "%cmd%"=="github" goto github
if /i "%cmd%"=="shutdown" goto shutdown
if /i "%cmd%"=="restart" goto restart
if /i "%cmd%"=="cancel" goto cancel
if /i "%cmd%"=="exit" goto exit_app

echo AI: Unknown command. Type "menu" to see commands.
goto main

:menu
echo.
echo ===== AI TERMINAL COMMANDS =====
echo hello, hi, who are you, time, date
echo 00 (battery report)
echo scan (system file scan)
echo verify (system file verify)
echo startup
echo sysinfo, cpu, gpu, ram, disk, battery
echo ip, ipall, ping, dns, netcheck
echo winsock, energy, hibernateoff, lastwake, requests
echo dismcleanup, chkdsk, cleanmgrset, cleanmgrrun
echo speedup
echo task, tasks, kill
echo control, settings, update
echo device, diskmgmt, services, logs
echo wifi, wifipass
echo temp, cleantemp, downloads, desktop, recent
echo dxdiag, activation
echo chrome, youtube, github
echo shutdown, restart, cancel
echo exit
echo ===============================
goto main

:hello
echo AI: Hello human.
goto main

:hi
echo AI: Hi there.
goto main

:who
echo AI: I am your personal CMD intelligence.
goto main

:show_time
echo AI: The time is %time%
goto main

:show_date
echo AI: Today is %date%
goto main

:battery_report
call :require_admin || goto main
echo AI: Generating battery report...
powercfg /batteryreport /output "%USERPROFILE%\battery-report.html"
if errorlevel 1 (
    echo AI: Failed to generate battery report.
    goto main
)
echo AI: Opening report...
start "" "%USERPROFILE%\battery-report.html"
goto main

:scan
call :require_admin || goto main
echo AI: Starting system file scan...
sfc /scannow
if errorlevel 1 (
    echo AI: Scan completed with errors.
) else (
    echo AI: Scan complete!
)
goto main

:verify
call :require_admin || goto main
echo AI: Verifying system files...
sfc /verifyonly
if errorlevel 1 (
    echo AI: Verify completed with errors.
) else (
    echo AI: Verify complete!
)
goto main

:startup
wmic startup get caption,command
if errorlevel 1 echo AI: Unable to read startup apps.
goto main

:sysinfo
systeminfo
goto main

:ip
ipconfig
goto main

:ipall
ipconfig /all
goto main

:ping
ping google.com
goto main

:dns
call :require_admin || goto main
ipconfig /flushdns
if errorlevel 1 (
    echo AI: DNS flush failed.
) else (
    echo AI: DNS cache cleared!
)
goto main

:netcheck
ping 8.8.8.8 -n 5
goto main

:winsock
call :require_admin || goto main
netsh winsock reset
if errorlevel 1 (
    echo AI: Winsock reset failed.
) else (
    echo AI: Winsock reset complete.
)
goto main

:energy
call :require_admin || goto main
echo AI: Generating energy report...
powercfg -energy
goto main

:hibernateoff
call :require_admin || goto main
powercfg -h off
if errorlevel 1 (
    echo AI: Failed to disable hibernation.
) else (
    echo AI: Hibernation disabled.
)
goto main

:lastwake
powercfg /lastwake
goto main

:requests
powercfg /requests
goto main

:dismcleanup
call :require_admin || goto main
DISM /Online /Cleanup-Image /StartComponentCleanup
goto main

:chkdsk
call :require_admin || goto main
chkdsk C: /scan
goto main

:cleanmgrset
call :require_admin || goto main
cleanmgr /sageset:1
goto main

:cleanmgrrun
call :require_admin || goto main
cleanmgr /sagerun:1
goto main

:speedup
call :require_admin || goto main
echo AI: Running safe speedup tasks...
cleanmgr /sagerun:1
if not exist "%temp%" (
    echo AI: Temp folder not found.
) else (
    del /q /f /s "%temp%\*" >nul 2>&1
)
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
DISM /Online /Cleanup-Image /StartComponentCleanup >nul 2>&1
echo AI: Speedup tasks complete.
goto main

:taskmgr
start "" taskmgr
goto main

:tasks
tasklist
goto main

:kill
call :require_admin || goto main
set "pname="
set /p "pname=Enter process name (example chrome.exe): "
if not defined pname (
    echo AI: No process name provided.
    goto main
)
taskkill /f /im "%pname%"
if errorlevel 1 echo AI: Failed to terminate %pname%.
goto main

:control
start "" control
goto main

:settings
start "" ms-settings:
goto main

:update
start "" ms-settings:windowsupdate
goto main

:disk
wmic logicaldisk get size,freespace,caption
goto main

:gpu
wmic path win32_videocontroller get name
goto main

:cpu
wmic cpu get name
goto main

:ram
wmic memorychip get capacity
goto main

:battery
wmic path Win32_Battery get EstimatedChargeRemaining,BatteryStatus
goto main

:activation
slmgr /xpr
goto main

:dxdiag
start "" dxdiag
goto main

:device
start "" devmgmt.msc
goto main

:diskmgmt
start "" diskmgmt.msc
goto main

:services
start "" services.msc
goto main

:logs
start "" eventvwr
goto main

:wifi
netsh wlan show profiles
goto main

:wifipass
call :require_admin || goto main
set "wname="
set /p "wname=Enter WiFi Name: "
if not defined wname (
    echo AI: No WiFi name provided.
    goto main
)
netsh wlan show profile name="%wname%" key=clear
if errorlevel 1 echo AI: Unable to read WiFi profile "%wname%".
goto main

:temp
if exist "%temp%" (
    start "" "%temp%"
) else (
    echo AI: Temp folder not found.
)
goto main

:cleantemp
call :require_admin || goto main
if not exist "%temp%" (
    echo AI: Temp folder not found.
    goto main
)
del /q /f /s "%temp%\*" >nul 2>&1
if errorlevel 1 (
    echo AI: Temp clean failed.
) else (
    echo AI: Temp cleaned!
)
goto main

:downloads
if exist "%USERPROFILE%\Downloads" (
    start "" "%USERPROFILE%\Downloads"
) else (
    echo AI: Downloads folder not found.
)
goto main

:desktop
if exist "%USERPROFILE%\Desktop" (
    start "" "%USERPROFILE%\Desktop"
) else (
    echo AI: Desktop folder not found.
)
goto main

:recent
if exist "%APPDATA%\Microsoft\Windows\Recent" (
    start "" "%APPDATA%\Microsoft\Windows\Recent"
) else (
    echo AI: Recent folder not found.
)
goto main

:chrome
start "" chrome
goto main

:youtube
start "" "https://youtube.com"
goto main

:github
start "" "https://github.com"
goto main

:shutdown
call :require_admin || goto main
shutdown /s /t 5
goto main

:restart
call :require_admin || goto main
shutdown /r /t 5
goto main

:cancel
call :require_admin || goto main
shutdown /a
goto main

:exit_app
exit

:require_admin
if "%ADMIN_MODE%"=="1" (
    net session >nul 2>&1
    if not errorlevel 1 exit /b 0
)
echo AI: Admin mode required. Restart in admin mode (choose 1 on launch).
exit /b 1
