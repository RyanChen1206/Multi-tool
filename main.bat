@echo off
title MultiTool
chcp 65001 >nul
cd files
color 5
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) System Informer[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(2) Wireshark[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠═══(3) HyperV[0m  
echo [38;2;255;255;0m        ║[0m
echo [38;2;255;255;0m        ╠════(4) Putty[0m  
echo [38;2;255;255;0m        ║[0m
echo [38;2;255;255;0m        ╠═════(5) Show Wifi[0m  
echo [38;2;255;255;0m        ║[0m    
echo [38;2;255;255;0m        ╠══════(6) Show IP[0m  
echo [38;2;255;255;0m        ║[0m 
echo [38;2;255;255;0m        ╚╦══════(7) IP Scan[0m  
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚═════════^>[0m  
if /I %input% EQU 1 start SystemInformer.lnk
if /I %input% EQU 2 start Wireshark.lnk
if /I %input% EQU 3 start HyperV.lnk
if /I %input% EQU 4 start putty.exe
if /I %input% EQU 5 start ShowWifi.vbs
if /I %input% EQU 6 start ShowIp.bat
if /I %input% EQU 7 start IpScan.lnk
if /I %input% EQU e exit
if /I %input% EQU exit exit
cls
goto start

:banner
echo.
echo.
echo                     [38;2;255;0;0m███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗[0m     
echo                     [38;2;255;51;0m████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
echo                     [38;2;255;102;0m██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║    [0m 
echo                     [38;2;255;153;0m██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     [0m
echo                     [38;2;255;204;0m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo                     [38;2;255;255;0m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
echo.