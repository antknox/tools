@echo off
title 使用wget下载7z(LZMA),并使用7zr解压LZMA压缩包到.\dome\7z下

if exist .\tool\7z\7zr.exe goto PM

:DL

echo 下载 7z(LZMA)

if exist .\tool\7z rd /s /q .\tool\7z
if not exist .\tool\7z md .\tool\7z

wget.exe --no-check-certificate -t 10 -nd https://www.7-zip.org/a/lzma1900.7z -O .\tool\7z\lzma1900.7z
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/dp0.bat -O .\tool\7z\dp0.bat
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zS2.sfx -O .\tool\7z\7zS2.sfx
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zS2con.sfx -O .\tool\7z\7zS2con.sfx
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zSD.sfx -O .\tool\7z\7zSD.sfx
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zdec.exe -O .\tool\7z\7zdec.exe
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zr-x64.exe -O .\tool\7z\7zr-x64.exe
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/7zr.exe -O .\tool\7z\7zr.exe
wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/7z/lzma.exe -O .\tool\7z\lzma.exe

:PM
echo 使用7zr解压LZMA包

:LZMA

if exist .\dome\7z rd /s /q .\dome\7z
if not exist .\dome\7z md .\dome\7z

.\tool\7z\7zr.exe x .\tool\7z\lzma1900.7z -o.\dome\7z bin
move .\dome\7z\bin\*.* .\dome\7z
move .\dome\7z\bin\x64\7zr.exe .\dome\7z\7zr-x64.exe
if exist .\dome\7z\bin rd /s /q  .\dome\7z\bin

:EX
exit
