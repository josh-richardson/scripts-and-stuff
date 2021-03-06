echo off
rem Check if we're running from the right drive
cd /d %PROGRAMFILES(X86)%
echo --------------------------------------
echo -----Killing TeamViewer Processes-----
echo --------------------------------------
taskkill /f /im teamviewer.exe
taskkill /f /im teamviewer_service.exe
echo --------------------------------------
echo ---Killing TeamViewer Registry Keys---
echo --------------------------------------
reg delete HKLM\SOFTWARE\TeamViewer\ClientID /v ClientID /f
reg delete HKLM\SOFTWARE\WOW6432Node\TeamViewer\ /v ClientID /f
echo --------------------------------------
echo ---Downloading ^& extracting nircmdc---
echo --------------------------------------
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.nirsoft.net/utils/nircmd.zip', 'nircmd.zip') ; Add-Type -A System.IO.Compression.FileSystem ; [IO.Compression.ZipFile]::ExtractToDirectory('nircmd.zip', 'nircmd')"
"%PROGRAMFILES(X86)%\nircmd\nircmdc.exe" setfilefoldertime "%PROGRAMFILES(X86)%" now now
"%PROGRAMFILES(X86)%\nircmd\nircmdc.exe" setfilefoldertime "%PROGRAMFILES%" now now
echo --------------------------------------
echo ---------Changing MAC Address---------
echo --------------------------------------
getmac /V | find "\Device\" | find /V "Virtual" | find /V "VMWare" > tempfile
set /p otpt=<tempfile
del tempfile
echo %otpt%
pause