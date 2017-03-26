@echo off

rem Define nginx application directory and pid file path
set NGINX_HOME=C:\Users\feilong\Documents\opt\openresty-1.11.2.2-win32
set NGINX_PID=%NGINX_HOME%\logs\nginx.pid

set SIGNAL=start

rem Start nginx
if "%SIGNAL%" == "start" (
	if exist "%NGINX_PID%" (
		echo nginx has already been started
	) else (
		pushd "%NGINX_HOME%" > nul
		start nginx
		popd > nul
	)
	exit /b
)

rem Check if argument is one of the supported signals
if "%SIGNAL%" == "stop" goto LBL_SIGNAL
if "%SIGNAL%" == "quit" goto LBL_SIGNAL
if "%SIGNAL%" == "reload" goto LBL_SIGNAL
if "%SIGNAL%" == "reopen" goto LBL_SIGNAL
echo Unknown action: %SIGNAL%
exit /b 1

rem Signal nginx
:LBL_SIGNAL
if exist "%NGINX_PID%" (
	pushd "%NGINX_HOME%" > nul
	nginx -s %SIGNAL%
	popd > nul
) else (
	echo nginx is not running
)

pause