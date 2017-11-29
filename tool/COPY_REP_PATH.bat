@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-19
::FILE COPY_REP_PATH
::DESC copy one or more repository file(s)


:v

::1������ֵ
set tip=Kettle���ƹ��ߣ�������Դ��
set ver=1.0
set rNameRegex=
set rPath=
set rPathType=
set srcREP=

set echorName=��Ҫ����Kettle�ļ���Դ�����ƣ�׼ȷ���ƣ�Ĭ�ϣ�dev.*��
set esetrName=���������ƣ�Ȼ��س���

set echorNameRegex=��Ҫ����Kettle�ļ���Դ�����ƹ���������ʽ��Ĭ�ϣ�dev.*��
set esetrNameRegex=������������ʽ��Ȼ��س���

set echorPath=��Ҫ����Ŀ����Դ���ļ���·���������ý�ָ���·����Ϊ��Դ��Ĵ洢λ�ã�
set esetrPath=�������ļ���·�����϶��ļ��е��ˣ�Ȼ��س���

set echosrcREP=��Ҫ����Kettle��Դ�������ļ�·�����������룩
set esetsrcREP=�������ļ�·�����϶��ļ����ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ƹ��ߣ�������Դ���ļ���
echo ���н�������Թر�
echo ...


:check

::3�������� ��������

choice /c yn /m ����һ������^(Y^)���������ƶ������^(N��Ĭ��^)�� /t 5 /d n
	if !errorlevel! equ 1 goto one
	if !errorlevel! equ 2 goto more
	
:one
	set tempOm=one
	if "%rNameRegex%"=="" (
		echo %echorName%
		set /p rNameRegex=%esetrName%
	)

	goto omend

:more
	set tempOm=more
	if "%rNameRegex%"=="" (
		echo %echorNameRegex%
		set /p rNameRegex=%esetrNameRegex%
	)
	
:omend

choice /c yn /m ��Ҫָ������Դ���ļ���·���𣿣�Ĭ������ļ���ͬ��������Դ������ͬ���� /t 10 /d n
	if !errorlevel! equ 1 goto path
	if !errorlevel! equ 2 goto pathend

:path
	if "%rPath%"=="" (
		echo %echorPath%
		echo ���������·����\��β�������ж�Ϊģ��·��������Ϊ����Դ���ļ��еĸ���·��ʹ�ã�
		set /p rPath=%esetrPath%
	)
	
	echo %rPath%end|findstr /o /r /c:\\end >cmd.tmp
	for /f %%i in (cmd.tmp) do (
		set isDir=%%i
	)
	del cmd.tmp

	if not "%isDir%"=="" (
		choice /c yn /m ���Ƶ�����Դ���ļ��У����þ��ļ�������^(Y^)��������Դ������ͬ��^(N��Ĭ��^)�� /t 15 /d n
			if !errorlevel! equ 1 set rPathType=1
			if !errorlevel! equ 2 set rPathType=0
	)
:pathend

choice /c yn /m ��Ҫָ����Դ�������ļ�����λ����Ĭ�ϲ�ָ������ /t 5 /d n
	if !errorlevel! equ 1 goto user
	if !errorlevel! equ 2 goto default

:user
	set tempUser=user
	if "%srcREP%"=="" (
		echo %echosrcREP%
		set /p srcREP=%esetsrcREP%
	)

	goto uesrend

:default
	set tempUser=default

:uesrend

:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0

set tempParam="-param:rNameRegex=%rNameRegex%"

if "%tempUser%"=="default" (
	echo Kettle��ʹ���û�.kettleĿ¼�е���Դ�������ļ���Ϊ����λ��
)else (
	echo Kettle����ȡ���ݴӴ���Դ�������ļ���%srcREP%
	set tempParam=%tempParam% "-param:srcREP=%srcREP%"
)

if "%tempOm%"=="one" (
	echo Kettle�����ƴ���Դ��� �������ݣ�%rNameRegex%
)else (
	echo Kettle������ƥ���������ʽ����Դ�� �������ݣ�%rNameRegex%
)
echo Kettle���Ḵ����Դ��������ļ���

if "%rPath%"=="" (
	echo Kettle���޸� ����·�� �����������ͬ��Ŀ¼������ �������� �����ļ��� 
)else (
	echo Kettle���޸� ����^(����^)·�� Ϊ��%rPath%
	if "%rPathType%"=="1" (
		echo Kettle�����þ� �����ļ��� ����
		set tempParam=!tempParam! "-param:rPathType=%rPathType%"
	)else (
		echo Kettle���޸� �����ļ��� ������ �������� ��ͬ
		set tempParam=!tempParam! "-param:rPathType=%rPathType%"
	)
	set tempParam=!tempParam! "-param:rPath=%rPath% "
)

echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0CopyRepositoryPath.kjb %tempParam%
::echo %tempParam%

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit /b