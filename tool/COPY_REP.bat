@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-11
::FILE COPY_REP
::DESC copy one or more repository config data(s) and file(s)


:v

::1������ֵ
set tip=Kettle���ƹ��ߣ�������Դ��
set ver=1.0
set rNameRegex=
set rNameRemove=
set rNameReplace=
set rNameNew=
set rDir=
set rPath=
set srcREP=
set tarREP=
set isCopyFile=

set echorName=��Ҫ����Kettle�ļ���Դ�����ƣ�׼ȷ���ƣ�Ĭ�ϣ�dev.*��
set esetrName=���������ƣ�Ȼ��س���

set echorNameRegex=��Ҫ����Kettle�ļ���Դ�����ƹ���������ʽ��Ĭ�ϣ�dev.*��
set esetrNameRegex=������������ʽ��Ȼ��س���

set echorNameRemove=��Ҫ������Դ�������������������ڲ����ַ���Ĭ�ϣ�dev��
set esetrNameRemove=������һ�������������е��ַ�����Ȼ��س���

set echorNameReplace=��Ҫ������Դ�������滻���������ڽ������ַ��滻��Ĭ�Ͽգ�
set esetrNameReplace=������һ�������滻���ַ�����Ȼ��س���

set echorNameNew=��Ҫ�����Զ�����Դ�����ƣ����ڱ�ʶ���Ƶ������ݣ�
set esetrNameNew=�������ַ�����Ȼ��س���

set echorDir=��Ҫ������Դ���ļ��и���·��������Ҫ���ƶ�����ã��޷����������ָ��һ��������ļ��У�
set esetrDir=�������ļ���·�����϶��ļ��е��ˣ�Ȼ��س���

set echorPath=��Ҫ����Ŀ����Դ���ļ���·���������ý�ָ���·����Ϊ��Դ��Ĵ洢λ�ã�
set esetrPath=�������ļ���·�����϶��ļ��е��ˣ�Ȼ��س���

set echosrcREP=��Ҫ����Kettle��Դ�������ļ�·�����������룩
set esetsrcREP=�������ļ�·�����϶��ļ����ˣ�Ȼ��س���

set echotarREP=��Ҫ����Kettle��Դ�������ļ�·�������������
set esettarREP=�������ļ�·�����϶��ļ����ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ƹ��ߣ������ļ���Դ��
echo ���н�������Թر�
echo ...


:check

::3�������� ��������

choice /c yn /m ����һ������^(Y^)���������^(N^)�� /t 5 /d n
	if !errorlevel! equ 1 goto one
	if !errorlevel! equ 2 goto more
	
:one
	set tempOm=one
	if "%rNameRegex%"=="" (
		echo %echorName%
		set /p rNameRegex=%esetrName%
	)

	choice /c yn /m ��Ҫ���Ƶ���Դ�����ã��Զ���һ��������^(Y^)�����ǶԾ����ƽ����滻^(N^)�� /t 10 /d n
		if !errorlevel! equ 1 goto namenew
		if !errorlevel! equ 2 goto namereplace
	
	:namenew
		set tempName=new
		if "%rNameNew%"=="" (
			echo %echorNameNew%
			set /p rNameNew=%esetrNameNew%
		)
	
		goto nameend
	
	:namereplace
		set teampname=replace
		if "%rNameRemove%"=="" (
			echo %echorNameRemove%
			set /p rNameRemove=%esetrNameRemove%
		)
		
		if "%rNameReplace%"=="" (
			echo %echorNameReplace%
			set /p rNameReplace=%esetrNameReplace%
		)
	
	:nameend
	
	choice /c yn /m ��Ҫָ����Դ��·���� /t 5 /d n
		if !errorlevel! equ 1 goto path
		if !errorlevel! equ 2 goto omend

	:path
		if "%rPath%"=="" (
			echo %echorPath%
			set /p rPath=%esetrPath%
		)
	
		goto omend

:more
	set tempOm=more
	if "%rNameRegex%"=="" (
		echo %echorNameRegex%
		set /p rNameRegex=%esetrNameRegex%
	)
	
	set tempName=replace
	if "%rNameRemove%"=="" (
		echo %echorNameRemove%
		set /p rNameRemove=%esetrNameRemove%
	)
	
	if "%rNameReplace%"=="" (
		echo %echorNameReplace%
		set /p rNameReplace=%esetrNameReplace%
	)
	
	choice /c yn /m ��Ҫָ����Դ�⸸��·���� /t 5 /d n
		if !errorlevel! equ 1 goto dir
		if !errorlevel! equ 2 goto omend

	:dir
		if "%rDir%"=="" (
			echo %echorDir%
			set /p rDir=%esetrDir%
		)

:omend

choice /c yn /m ��Ҫָ����Դ�������ļ����롢���λ���� /t 5 /d n
	if !errorlevel! equ 1 goto user
	if !errorlevel! equ 2 goto default

:user
	set tempUser=user
	if "%srcREP%"=="" (
		echo %echosrcREP%
		set /p srcREP=%esetsrcREP%
	)

	if "%tarREP%"=="" (
		echo %echotarREP%
		set /p tarREP=%esettarREP%
	)

	goto begin

:default
	set tempUser=default


choice /c yn /m ��Ҫָ��������Դ���ļ����� /t 5 /d n
	if !errorlevel! equ 1 set isCopyFile=1
	if !errorlevel! equ 2 set isCopyFile=0


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0

set tempParam="-param:rNameRegex=%rNameRegex%" "-param:isCopyFile=%isCopyFile%"

if "%tempUser%"=="default" (
	echo Kettle��ʹ���û�.kettleĿ¼�е���Դ�������ļ���Ϊ���롢���λ��
)else (
	echo Kettle����ȡ���ݴӴ���Դ�������ļ���%srcREP%
	echo Kettle��д�����ݵ�����Դ�������ļ���%tarREP%
	set tempParam=%tempParam% "-param:srcREP=%srcREP%" "-param:tarREP=%tarREP%"
)

if "%tempOm%"=="one" (
	echo Kettle�����ƴ���Դ����������ݣ�%rNameRegex%
)else (
	echo Kettle������ƥ���������ʽ����Դ���������ݣ�%rNameRegex%
)

if "%tempName%"=="new" (
	echo Kettle��������������Ϊ��%rNameNew%
	set tempParam=%tempParam% "-param:rNameNew=%rNameNew%"
)else (
	echo Kettle�����������ݾ����ƽ����滻��%rNameRemove% -^> %rNameReplace%
	set tempParam=%tempParam% "-param:rNameRemove=%rNameRemove%" "-param:rNameReplace=%rNameReplace%"
)

if "%tempOm%"=="one" (
	echo Kettle����������·����Ϊ��%rPath%
	set tempParam=%tempParam% "-param:rPath=%rPath% "
)else (
	echo Kettle����������·��ͳһ��Ϊ��Ŀ¼�£�%rDir%
	set tempParam=%tempParam% "-param:rDir=%rDir% "
)

echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0CopyRepository.kjb %tempParam%
::echo %tempParam%

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit \b