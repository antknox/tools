@echo off 
title 创建版本并发布到last

:CJ
echo 请输入版本号  (如:v1)
set /p BB=
if exist ..\%BB% echo 已有%BB%,请重新设置 & goto CJ

:BB
if not exist ..\%BB% md ..\%BB%
copy /y .\*.* ..\%BB%
if not exist ..\%BB%\main md ..\%BB%\main
xcopy /E .\main ..\%BB%\main

:exit

:last
if exist ..\last rd /s /q ..\last
if not exist ..\last md ..\last
if exist ..\last copy /y .\*.* ..\last
if not exist ..\last\main md ..\last\main
xcopy /E .\main ..\last\main
cd ..
cd last
start .\main.bat
