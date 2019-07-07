@echo off 
title 创建版本并发布到last

:CJ
echo 请输入版本号  (如:v1)
set /p BB=
if exist ..\%BB% echo 已有%BB%,请重新设置 & goto CJ

:BB
if not exist ..\%BB% md ..\%BB%
copy /y .\*.* ..\%BB%

:exit

:last
if exist ..\last rd /s /q ..\last
if not exist ..\last md ..\last
if exist ..\last copy /y .\*.* ..\last

cd ..
start .\last\main.bat
