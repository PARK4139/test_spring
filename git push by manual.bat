:: TITLE SETTING
title %~n0


:: MINIMIZED WINDOW SETTING
if not "%minimized%"=="" goto :minimized
set minimized=true
start /min cmd /C "%~dpnx0"
goto :EOF
:minimized


:: VARIABLE DEFINATION SETTING
chcp 65001 >nul
@echo off
@rem @echo on
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy-MM-dd HH:mm ss'') do set yyyyMMddHHmmss=%%i
cls


:: COMMIT MENT SETTING
::set commit_ment=
set commit_ment=프로젝트 초기생성
::set commit_ment=작업 이력은 README.md 의 DONE 참조요함(%yyyyMMddHHmmss%)



:: GIT PUSH
git add *  
git commit -m "%commit_ment%" 
git push -u origin main  
git status | find "working tree clean" 



:: GET PROJECT_DIRECTORY
SET PROJECT_DIRECTORY=%cd%
for %%F in ("%CD%") do set "PROJECT_DIRECTORY_DIRNAME=%%~nxF"



:: CHECK GIT HUB PUSH DONE (Now)
explorer https://github.com/PARK4139/%PROJECT_DIRECTORY_DIRNAME%



:: debug
timeout 600