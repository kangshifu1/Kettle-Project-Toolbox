@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-08-21
::FILE RUN_SPOON
::DESC run spoon with customize KETTLE_HOME


:v

::1������ֵ
set tip=Kettle���ȳ�������Spoon
set ver=1.0
::current folder
for %%a in (.) do set current_folder=%%~na
::double-clicking is outer call and will set 0
set interactive=1
echo %cmdcmdline% | find /i "%~0" >nul
if not errorlevel 1 set interactive=0
::set kettle environment
call SET_ENVIRONMENT.bat


:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ�������Spoon
echo ���н�������Թر�
echo ...


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo KETTLE_HOMEΪ��%KETTLE_HOME%
echo KETTLE_REPOSITORYΪ��%KETTLE_REPOSITORY%
echo ������...      Ctrl+C��������

::ִ��Kitchen
call Spoon.bat

::ִ�����
if %ERRORLEVEL% equ 0 (
    if _%interactive%_ equ _0_ exit 
)

echo �Ѿ�ִ����ϣ����Խ����˳���
pause


:end

::5�˳�