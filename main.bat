@echo off
title abc

:echo

:if exist .\wget.exe .\wget.exe --no-check-certificate -t 10 -nd url -O.\tmp\filesname
:ex
:if exist .\tmp\tool\wget.exe .\tmp\tool\wget.exe --no-check-certificate -t 10 -nd https://www.7-zip.org/a/lzma1900.7z -O.\tmp\lzma1900.7z

:DL
if not exist .\tmp\PSTools.zip .\tmp\tool\wget.exe --no-check-certificate -t 10 -nd https://download.sysinternals.com/files/PSTools.zip  -O.\tmp\PSTools.zip

:JY
:.\tool\7z\7z a d.7z "%UserProfile%\Desktop\*"

:.\tool\7z\7zr.exe x .\tool\7z\lzma1900.7z -o.\dome\7z bin

:.\tmp\tool\7z\7zr x .\tmp\PSTools.zip -o.\main
:.\tmp\tool\7z\7zr e .\tmp\PSTools.7z

:zip 文件无法只用7zr解压,请使用7z
if not exist .\tmp\7z1900.exe .\tmp\tool\wget.exe --no-check-certificate -t 10 -nd https://www.7-zip.org/a/7z1900.exe -O.\tmp\7z1900.exe
:if not exist .\tmp\7z1900-x64.exe .\tmp\tool\wget.exe --no-check-certificate -t 10 -nd https://www.7-zip.org/a/7z1900-x64.exe -O.\tmp\7z1900-x64.exe
set WJ=%~dp0
if not exist .\tmp\tool\7zm .\tmp\7z1900.exe /S /D="%~dp0tmp\tool\7zm"

if not exist .\main\psping.exe .\tmp\tool\7zm\7z.exe x -y -o.\main .\tmp\PSTools.zip

:.\main\psping -n 5 -w 1 -h 3 www.baidu.com:80

.\main\psping %*


