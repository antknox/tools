@echo off
title 部署Project
:PD
if not exist .\wget.exe goto DL

:BS
echo 需要部署Project的名称:
set /p PJ=
if exist .\"Project %PJ%" goto FH
goto BSM

:FH
echo 项目名已有,请重新命名!!
goto BS

:BSM
if not exist .\"Project %PJ%" md .\"Project %PJ%"\dome & md .\"Project %PJ%"\dome\tmp & md .\"Project %PJ%"\dome\main
goto PRE

:DL
echo 当前目录没有wget.exe文件，请下载wget.exe
echo 下载地址：
echo 32位系统程序
echo https://eternallybored.org/misc/wget/releases/wget-1.20.3-win32.zip
echo 64位系统程序
echo https://eternallybored.org/misc/wget/releases/wget-1.20.3-win64.zip
echo 请解压,把里面的wget.exe 复制到本目录下
echo %~dp0
echo ====
echo 如没有解压软件,可直下载此文件
echo 32位系统程序
echo https://raw.githubusercontent.com/antknox/tools/wget/x86/wget.exe
echo 64位系统程序
echo https://raw.githubusercontent.com/antknox/tools/wget/x64/wget.exe
echo 请把wget.exe 复制到本目录下
echo %~dp0
echo 请按下任意键,重新加载...
pause

start .\st.bat & exit

:PRE

echo 环境创建

if exist .\pre-tool\pre-tool-ok goto RTOK
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
if not exist .\pre-tool\bat\st.bat wget.exe --no-check-certificate -t 10 -nd https://raw.githubusercontent.com/antknox/tools/bat/st.bat -O .\pre-tool\bat\st.bat

if exist .\pre-tool\pre-tool-ok rd /s /q .\pre-tool\pre-tool-ok
if not exist .\pre-tool\pre-tool-ok md .\pre-tool\pre-tool-ok

if exist .\pre-tool\bat\st.bat goto RTOK

:RTOK
echo 环境创建成功

:DRT
echo dome环境创建
if exist .\"Project %PJ%"\dome\tmp\tool\dome-pre-tool-ok goto EX
:7M
if not exist .\"Project %PJ%"\dome\tmp\tool\7z md .\"Project %PJ%"\dome\tmp\tool\7z
if exist .\pre-tool\7z\lzma1900.7z .\pre-tool\7z\7zr.exe x .\pre-tool\7z\lzma1900.7z -o.\"Project %PJ%"\dome\tmp\tool\7z bin
if exist .\"Project %PJ%"\dome\tmp\tool\7z\bin move .\"Project %PJ%"\dome\tmp\tool\7z\bin\*.* .\"Project %PJ%"\dome\tmp\tool\7z
if exist .\"Project %PJ%"\dome\tmp\tool\7z\bin copy /y .\"Project %PJ%"\dome\tmp\tool\7z\bin\x64\7zr.exe .\"Project %PJ%"\dome\tmp\tool\7z\7zr-x64.exe
if exist .\"Project %PJ%"\dome\tmp\tool\7z\bin rd /s /q  .\"Project %PJ%"\dome\tmp\tool\7z\bin
:BAT
if exist .\pre-tool\bat\dp0.bat copy /y .\pre-tool\bat\dp0.bat .\"Project %PJ%"\dome\dp0.bat
if exist .\pre-tool\bat\main.bat copy /y .\pre-tool\bat\main.bat .\"Project %PJ%"\dome\main.bat
if exist .\pre-tool\bat\vxlast.bat copy /y .\pre-tool\bat\vxlast.bat .\"Project %PJ%"\dome\vxlast.bat

if exist .\"Project %PJ%"\dome\tmp\tool\dome-pre-tool-ok rd /s /q .\"Project %PJ%"\dome\tmp\tool\dome-pre-tool-ok
if not exist .\"Project %PJ%"\dome\tmp\tool\dome-pre-tool-ok md .\"Project %PJ%"\dome\tmp\tool\dome-pre-tool-ok

:EX
echo 部署完成,编写Main.bat主操作. & pause

