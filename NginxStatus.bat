@echo off

rem Define nginx application directory and pid file path
set NGINX_HOME=C:\Users\feilong\Documents\opt\openresty-1.11.2.2-win32
set NGINX_PID=%NGINX_HOME%\logs\nginx.pid

if exist "%NGINX_PID%" (
	echo nginx is running
    tasklist /fi "imagename eq nginx.exe"
) else (
	echo nginx is not running
)

pause
