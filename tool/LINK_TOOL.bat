@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-10
::FILE LINK_TOOL
::DESC create a symbolic link for tool directory(this directory)


:v

::1������ֵ
set tip=Kettle�������ߣ�����Ŀ¼����
set ver=1.0
set tarPath=%1

set echotarPath=��Ҫ��������toolĿ¼·��������ļ�Ŀ��toolĿ¼��
set esettarPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle�������ߣ�����ToolĿ¼����
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%tarPath%"=="" (
	echo %echotarPath%
	set /p tarPath=%esettarPath%
)


:begin

::4ִ��
%~d0

cd %~dp0

set srcPath=%~dp0

if exist %tarPath% (
	for %%i in (%tarPath%) do (
		for /f %%j in ('echo %%~ai^|find /i "-l"') do ( 
			choice /c dre /m Ŀ��tool�ļ����Ѿ��Ƿ������ӣ�ɾ������^(D^)���滻����^(R^)���˳�^(E^)�� /t 10  /d e
			if !errorlevel! equ 1 goto dele
			if !errorlevel! equ 2 goto replace
			if !errorlevel! equ 3 goto quit
		)
	)
	
	choice /c yn /m Ŀ��tool�ļ����Ѿ����ڣ�ɾ���ļ��к�������^(Y^)��ȡ��^(N^)�� /t 10  /d n
	if !errorlevel! equ 1 goto replace
	if !errorlevel! equ 2 goto quit
	
:quit
	echo ȡ���������˳�...
	goto endwait
:dele
	rd /s /q %tarPath%
	echo ɾ��Ŀ��toolĿ¼���
	goto quit
:replace
	rd /s /q %tarPath%
	echo ɾ��Ŀ��toolĿ¼���
)

echo Kettleʵ��toolĿ¼Ϊ��%srcPath%
echo Kettle����toolĿ��Ϊ��%tarPath%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle��Ϊ��Ŀ¼�������ӣ�%tarPath%�����ӵ���%srcPath%
echo ������...      Ctrl+C��������

::ִ��MKLink
mklink /j %tarPath% %srcPath% 

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���


:endwait
pause

:end

::5�˳�

exit