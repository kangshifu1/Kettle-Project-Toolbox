@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-05-28
::FILE ZIP_DEPLOY_PATCH_PATH
::DESC create a zip patch file for deploy in filesystem path


:v

::1������ֵ
set tip=Kettle���𹤾ߣ����ɲ��𲹶�
set ver=1.0
set srcPath=%1

set echosrcPath=��Ҫ�����ļ���·��
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
echo Kettle�����ɲ��𲹶�����%srcPath%[Patch].zip
echo ������...      Ctrl+C��������

::ִ��Pan
call pan -file:%~dp0ZipDeployPatch4FSPath.ktr "-param:srcPath=%srcPath%" "-param:notRegex=.*\.kdb$|.*\.log$|.*\.git.*|.*data-integration$" "-param:regex=.*"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit