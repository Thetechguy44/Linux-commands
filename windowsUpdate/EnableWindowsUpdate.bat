
@echo off

rem Method 1: Registry Modification
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f
net start wuauserv
net start bits

rem Method 2: Service Configuration
@REM sc config wuauserv start= demand
@REM sc start wuauserv
@REM sc config bits start= manual
@REM sc start bits


