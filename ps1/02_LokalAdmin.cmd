@echo off
setlocal enabledelayedexpansion

set power=0
if exist %temp%\%~n0.ps1 del %temp%\%~n0.ps1
for /f "tokens=*" %%l in ('type "%~f0"') do (
  if !power!==0 (
    if "%%l"=="*** Ab hier PowerShell ***" set power=1
  ) else (
    echo %%l >> %temp%\%~n0.ps1
  )
)
powershell -NoProfile -ExecutionPolicy Bypass -File %temp%\%~n0.ps1 %*
del %temp%\%~n0.ps1
pause
exit /b

*** Ab hier PowerShell ***
.\IfIsAdmin.ps1
Add-LocalGroupMember -Name Administratoren -Member ul-dom\lokal-admin
