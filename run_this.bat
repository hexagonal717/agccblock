@echo off
:: Check for admin rights
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    powershell.exe -Command "Start-Process '%0' -Verb RunAs"
    exit
)

PowerShell -ExecutionPolicy Bypass -File "%~dp0src\AdobeServerBlock.ps1"