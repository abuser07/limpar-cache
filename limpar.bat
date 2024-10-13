@echo off
title Limpeza de Cache e Arquivos Temporários
echo ==========================================
echo        LIMPEZA DO SISTEMA EM ANDAMENTO
echo ==========================================
echo.

:: Limpando arquivos temporários do sistema e do usuário
echo Limpando arquivos temporários...
del /q /f /s C:\servidores\cash\* 2>nul
del /q /f /s %TEMP%\* 2>nul
del /q /f /s C:\Windows\Temp\* 2>nul

:: Limpando a lixeira
echo Esvaziando a lixeira...
PowerShell -Command "New-Object -ComObject Shell.Application ^| ForEach-Object { $_.Namespace(0xA).Items() ^| ForEach-Object { $_.InvokeVerb('delete') } }"

:: Limpando cache do Windows Update
echo Limpando cache do Windows Update...
net stop wuauserv >nul 2>&1
del /q /f /s C:\Windows\SoftwareDistribution\Download\* 2>nul
net start wuauserv >nul 2>&1

:: Limpando cache do Google Chrome
echo Limpando cache do Google Chrome...
del /q /f /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" 2>nul

:: Limpando cache do Mozilla Firefox
echo Limpando cache do Mozilla Firefox...
del /q /f /s "%AppData%\Mozilla\Firefox\Profiles\*\cache2\entries\*" 2>nul

:: Limpando cache do Microsoft Edge
echo Limpando cache do Microsoft Edge...
del /q /f /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" 2>nul

:: Limpando cache do Opera
echo Limpando cache do Opera...
del /q /f /s "%AppData%\Opera Software\Opera Stable\Cache\*" 2>nul
del /q /f /s "%LocalAppData%\Opera Software\Opera Stable\Cache\*" 2>nul

:: Finalização
echo.
echo LIMPEZA CONCLUÍDA!
pause
exit
