@echo off
echo Removing Security...

net stop WinDefend
net stop MpsSvc
net stop SecurityHealthService

sc config WinDefend start= disabled
sc config MpsSvc start= disabled
sc config SecurityHealthService start= disabled


reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f

netsh advfirewall set allprofiles state off

echo.
echo Windows Security disabled.
pause
