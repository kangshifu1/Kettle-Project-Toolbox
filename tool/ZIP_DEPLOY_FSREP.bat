@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-20
::FILE ZIP_DEPLOY_FSREP
::DESC create a zip file for deploy in filesystem repositorie


:v

::1������ֵ
set tip=Kettle���𹤾ߣ����ɲ����ļ�
set ver=1.0
::double-clicking is outer call and will set 0
set interactive=1
echo %cmdcmdline% | find /i "%~0" >nul
if not errorlevel 1 set interactive=0
::set kettle environment
set rName=%1

set echorName=��Ҫ����Kettle�ļ���Դ�����ƣ�Ĭ��Ϊ��.*������һ����Ϊ��׼��
set esetrName=���������ƣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ�������Դ�ⲿ���ļ�
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
	echo %echorName%
	set /p rName=%esetrName%
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
echo Kettle�����ɴ���Դ��Ĳ����ļ���%rName%
echo Kettle�����ɲ����ļ���������Դ��ͬ��Ŀ¼��
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0ZipDeploy4RepositoryFile.kjb "-param:rNameRegex=%rName%" "-param:notRegex=.*\.backup$|.*\.log$|.*\.git\\.*|.*db\.cache.*" "-param:regex=.*""%isOpenShell%

::ִ�����
if _%interactive%_ equ _1_ exit /b 0
echo �Ѿ�ִ����ϣ����Խ����˳���
pause


:end

::5�˳�

exit /b 0