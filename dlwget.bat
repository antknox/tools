@echo off
title 引导下载wget
if not exist .\wget.exe goto DL
goto EX
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

start .\dlwget.bat & exit

:EX
echo 当前目录下已有wget.exe,请按任意键退出 & pause
