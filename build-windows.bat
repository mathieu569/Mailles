@echo off
setlocal

echo Compilation de Mailles...
call npx @neutralinojs/neu build --release
if errorlevel 1 goto :error

if not exist "dist\Mailles-Windows" mkdir "dist\Mailles-Windows"
copy /Y "dist\mailles\mailles-win_x64.exe" "dist\Mailles-Windows\Mailles.exe" >nul
copy /Y "dist\mailles\resources.neu" "dist\Mailles-Windows\resources.neu" >nul

if exist "dist\Mailles-Windows.zip" del "dist\Mailles-Windows.zip"
powershell -NoProfile -Command "Compress-Archive -Path 'dist\Mailles-Windows\*' -DestinationPath 'dist\Mailles-Windows.zip'"

echo.
echo Pret : dist\Mailles-Windows.zip
goto :eof

:error
echo.
echo La compilation a echoue, voir le message ci-dessus.
exit /b 1
