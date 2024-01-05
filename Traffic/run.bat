@echo off
set website=https://easelowmarket.com
set torPath="C:\Users\Administrator\Desktop\Tor Browser\Browser\firefox.exe"

:loop
echo Opening Tor Browser...
start "" %torPath% %website%

echo Waiting for 3 minutes...
timeout /t 180 /nobreak

echo Closing Tor Browser...
taskkill /IM firefox.exe /F

goto loop
