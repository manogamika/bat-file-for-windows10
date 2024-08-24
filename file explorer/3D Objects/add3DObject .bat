@echo off
:: Re-enable User Account Control (UAC) prompts if running as admin
echo Adding "3D Objects" back to "This PC"...

:: Add 3D Objects back to HKEY_LOCAL_MACHINE for 64-bit systems
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

:: For 64-bit systems, also add to Wow6432Node
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

:: Adding 3D Objects back to the current user's profile
echo Adding "3D Objects" back to File Explorer...

:: Use PowerShell to create the 3D Objects folder in the user's profile if it doesn't exist
powershell -command "$userProfile = [System.Environment]::GetFolderPath('MyDocuments'); $threeDObjectsPath = Join-Path -Path $userProfile -ChildPath '3D Objects'; if (-not (Test-Path $threeDObjectsPath)) { New-Item -Path $threeDObjectsPath -ItemType Directory }"

echo Done! Please restart File Explorer or your computer to see the changes.
pause
