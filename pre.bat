@echo off
title 环境创建

:PRE
echo pre 检测
if not exist .\pre-tool\pre-tool-ok goto MPRE
echo pre OK 
goto DRT

:MPRE
if not exist .\pre-tool md .\pre-tool\7z & md .\pre-tool\bat

if not exist .\pre-tool\7z\lzma1900.7z wget.exe --no-check-certificate -t 10 -nd https://www.7-zip.org/a/lzma1900.7z -O .\pre-tool\7z\lzma1900.7z
if not exist .\pre-tool\7z\dp0.bat wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/dp0.bat -O .\pre-tool\7z\dp0.bat
if not exist .\pre-tool\7z\7zS2.sfx wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zS2.sfx -O .\pre-tool\7z\7zS2.sfx
if not exist .\pre-tool\7z\7zS2con.sfx wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zS2con.sfx -O .\pre-tool\7z\7zS2con.sfx
if not exist .\pre-tool\7z\7zSD.sfx wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zSD.sfx -O .\pre-tool\7z\7zSD.sfx
if not exist .\pre-tool\7z\7zdec.exe wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zdec.exe -O .\pre-tool\7z\7zdec.exe
if not exist .\pre-tool\7z\7zr-x64.exe wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zr-x64.exe -O .\pre-tool\7z\7zr-x64.exe
if not exist .\pre-tool\7z\7zr.exe wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zr.exe -O .\pre-tool\7z\7zr.exe
if not exist .\pre-tool\7z\lzma.exe wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/lzma.exe -O .\pre-tool\7z\lzma.exe

if not exist .\pre-tool\bat\dp0.bat wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/bat/dp0.bat -O .\pre-tool\bat\dp0.bat
if not exist .\pre-tool\bat\main.bat wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/bat/main.bat -O .\pre-tool\bat\main.bat
if not exist .\pre-tool\bat\vxlast.bat wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/bat/vxlast.bat -O .\pre-tool\bat\vxlast.bat

if exist .\wget.exe copy /y .\wget.exe .\pre-tool\wget.exe

if exist .\pre-tool\pre-tool-ok rd /s /q .\pre-tool\pre-tool-ok
if not exist .\pre-tool\pre-tool-ok md .\pre-tool\pre-tool-ok

:DRT
echo dome-pre 检测

if not exist .\dome\tmp\tool\dome-tool-ok goto MDRT
echo dome-pre OK 
goto EX

:MDRT
if exist .\dome rd /s /q .\dome
if not exist .\dome md .\dome

if not exist .\dome\tmp\tool\7z md .\dome\tmp\tool\7z
if exist .\pre-tool\7z\lzma1900.7z .\pre-tool\7z\7zr.exe x .\pre-tool\7z\lzma1900.7z -o.\dome\tmp\tool\7z bin
if exist .\dome\tmp\tool\7z\bin move .\dome\tmp\tool\7z\bin\*.* .\dome\tmp\tool\7z
if exist .\dome\tmp\tool\7z\bin copy /y .\dome\tmp\tool\7z\bin\x64\7zr.exe .\dome\tmp\tool\7z\7zr-x64.exe
if exist .\dome\tmp\tool\7z\bin rd /s /q  .\dome\tmp\tool\7z\bin

if exist .\pre-tool\bat\dp0.bat copy /y .\pre-tool\bat\dp0.bat .\dome\dp0.bat
if exist .\pre-tool\bat\main.bat copy /y .\pre-tool\bat\main.bat .\dome\main.bat
if exist .\pre-tool\bat\vxlast.bat copy /y .\pre-tool\bat\vxlast.bat .\dome\vxlast.bat

if exist .\wget.exe copy /y .\wget.exe .\dome\tmp\tool\wget.exe

if exist .\dome\tmp\tool\dome-tool-ok rd /s /q .\dome\tmp\tool\dome-tool-ok
if not exist ..\dome\tmp\tool\dome-tool-ok md .\dome\tmp\tool\dome-tool-ok

:EX
echo 环境创建成功,请按任意键退出 & pause
