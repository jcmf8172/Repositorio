@echo off
setlocal EnableExtensions

rem ---------------------------------------------------------------------------
rem Compila y ejecuta la prueba de VISION (tests\vision_test.bas) con fbc.
rem
rem Uso:
rem   tests\compilar.bat
rem
rem Variables opcionales:
rem   FBC       compilador a usar             (por defecto: fbc)
rem   FBCFLAGS  flags extra para fbc          (por defecto: ninguno)
rem   OUT       ruta del ejecutable generado  (por defecto: build\vision_test.exe)
rem
rem Sale con el codigo de la prueba: 0 si todo pasa, numero de fallos si no.
rem ---------------------------------------------------------------------------

for %%I in ("%~dp0..") do set "ROOT=%%~fI"
if not defined FBC set "FBC=fbc"
if not defined OUT set "OUT=%ROOT%\build\vision_test.exe"
set "SRC=%ROOT%\tests\vision_test.bas"
set "INC=%ROOT%\LIBRERIAS\VISION"

where "%FBC%" >nul 2>&1
if errorlevel 1 (
	echo error: no se encuentra el compilador "%FBC%".
	echo instala FreeBASIC ^(https://www.freebasic.net^) o define FBC=C:\ruta\fbc.exe
	exit /b 127
)

if not exist "%ROOT%\build" mkdir "%ROOT%\build"

echo fbc:    %FBC%
echo fuente: %SRC%
echo salida: %OUT%
echo.

"%FBC%" %FBCFLAGS% -i "%INC%" -w all -x "%OUT%" "%SRC%"
if errorlevel 1 (
	echo.
	echo error de compilacion.
	exit /b 1
)

echo.
"%OUT%"
exit /b %ERRORLEVEL%
