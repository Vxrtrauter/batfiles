@echo off
title Remove "- Shortcut" Suffix

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t REG_BINARY /d 00000000 /f
echo Restart Explorer to see the changes

:prompt
set /p ans=Restart Explorer now? [Y/N]: 

if /i "%ans%"=="Y" goto restartexplorer
if /i "%ans%"=="N" goto end

echo Invalid input, enter Y or N...
goto prompt


:restartexplorer
taskkill /f /im explorer.exe & start explorer.exe

:end
pause