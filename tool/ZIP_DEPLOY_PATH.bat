@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-20
::FILE ZIP_DEPLOY_PATH
::DESC create a zip file for deploy in filesystem path


:v

::1������ֵ
set tip=Kettle���𹤾ߣ����ɲ��𲹶�
set ver=1.0
::double-clicking is outer call and will set 0
set interactive=1
echo %cmdcmdline% | find /i "%~0" >nul
if not errorlevel 1 set interactive=0
::set kettle environment
set srcPath=%1

set echosrcPath=��Ҫ�����ļ���·����Ĭ��ΪE:/Kettle��
set esetsrcPath=�������ļ���·����Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ������ļ��в��𲹶�
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%srcPath%"=="" (
	echo %echosrcPath%
	set /p srcPath=%esetsrcPath%
)

if _%interactive%_ equ _0_ (
	set isOpenShell= "-param:isOpenShell=true"
)


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle�����ɴ��ļ��еĲ��𲹶���%srcPath%
echo Kettle�����ɲ����ļ�������%srcPath%ͬ��Ŀ¼��
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0ZipDeploy4Path.kjb "-param:srcPath=%srcPath%" "-param:notRegex=.*\.backup$|.*\.log$|.*\.git.*|.*db\.cache.*|.*data-integration.*" "-param:regex=.*"%isOpenShell%

::ִ�����
if _%interactive%_ equ _1_ exit /b 0
echo �Ѿ�ִ����ϣ����Խ����˳���
pause


:end

::5�˳�

exit /b 0