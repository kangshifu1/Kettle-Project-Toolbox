@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-05-28
::FILE ZIP_DEPLOY_KETTLE
::DESC create kettle config zip file for deploy


:v

::1������ֵ
set tip=Kettle���𹤾ߣ����ɲ����ļ�
set ver=1.0
::double-clicking is outer call and will set 0
set interactive=1
echo %cmdcmdline% | find /i "%~0" >nul
if not errorlevel 1 set interactive=0
::set kettle environment
set rNameRegex=%1

set echorNameRegex=��Ҫ����Kettle�ļ���Դ�����ƣ���������ʽ��Ĭ�ϣ�.*��
set esetrNameRegex=���������ƻ�������ʽ��Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ�����KETTLE���ò����ļ�
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rNameRegex%"=="" (
	echo %echorNameRegex%
	set /p rNameRegex=%esetrNameRegex%
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
echo Kettle�����ɴ���Դ���KETTLE���ò����ļ���%rNameRegex%
echo Kettle�����ɲ����ļ�����%USERPROFILE%\.kettle\[Deploy].kettle.zip
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0ZipDeploy4KettleConfig.kjb "-param:rNameRegex=%rNameRegex%" "-param:notRegex=.*\.backup$|.*\.log$|.*\.git\\.*|.*db\.cache.*" "-param:regex=kettle.properties|repositories.xml|shared.xml""%isOpenShell%

::ִ�����
if _%interactive%_ equ _1_ exit /b 0
echo �Ѿ�ִ����ϣ����Խ����˳���
pause


:end

::5�˳�

exit /b 0