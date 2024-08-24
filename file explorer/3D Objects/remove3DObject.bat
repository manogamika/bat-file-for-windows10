@echo off
:: Disable User Account Control (UAC) prompts if running as admin
echo Removing "3D Objects" from "This PC"...

:: Remove 3D Objects from HKEY_LOCAL_MACHINE for 64-bit systems
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

:: For 64-bit systems, also delete from Wow6432Node
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

:: Removing 3D Objects from the current user's profile
echo Removing "3D Objects" from File Explorer...

:: Use PowerShell to get the current user's profile path and remove the 3D Objects folder
powershell -command "$userProfile = [System.Environment]::GetFolderPath('MyDocuments'); $threeDObjectsPath = Join-Path -Path $userProfile -ChildPath '3D Objects'; if (Test-Path $threeDObjectsPath) { Remove-Item -Path $threeDObjectsPath -Recurse -Force }"

echo Done! Please restart File Explorer or your computer to see the changes.
pause
