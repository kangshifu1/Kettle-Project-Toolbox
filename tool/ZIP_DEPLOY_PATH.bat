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
call kitchen -file:%~dp0ZipDeploy4Path.kjb "-param:srcPath=%srcPath%" "-param:notRegex=.*\.backup$|.*\.log$|.*\.git.*|.*db\.cache.*|.*data-integration.*" "-param:regex=.*"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit \b