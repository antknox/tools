@echo off 
title �����汾��������last

:CJ
echo ������汾��  (��:v1)
set /p BB=
if exist ..\%BB% echo ����%BB%,���������� & goto CJ

:BB
if not exist ..\%BB% md ..\%BB%
copy /y .\*.* ..\%BB%

exit

:last
if exist ..\last rd /s /q ..\last
if not exist ..\last md ..\last
if exist ..\last copy /y .\*.* ..\last

start ..\last\ZM.bat
