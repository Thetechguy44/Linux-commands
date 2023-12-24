

@echo off
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
net stop wuauserv
net stop bits

@REM @echo off
@REM sc config wuauserv start= disabled
@REM sc stop wuauserv
@REM sc config bits start= disabled
@REM sc stop bits

