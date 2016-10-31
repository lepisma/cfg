@echo off

:: Usage
:: hotspot init -> Setup a hotspot
:: hotspot on -> start
:: hotspot on -> stop

if "%~1"=="init" (
    set /P ssid=enter ssid : 
    set /P key=enter key : 
    netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
) else if "%~1"=="on" (
    netsh wlan start hostednetwork
) else if "%~1"=="off" (
    netsh wlan stop hostednetwork
) else (
    echo Error in Usage
    echo --------------
    echo hotspot init:: Setup a hotspot
    echo hotspot on :: Start hotspot
    echo hotspot on :: Stop hotspot
)