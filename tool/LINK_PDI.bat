@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-10
::FILE LINK_PDI
::DESC create a symbolic link(in this parent directory) for data-integration directory


:v

::1������ֵ
set tip=Kettle�������ߣ�����Ŀ¼����
set ver=1.0
set pdiPath=%1

set echopdiPath=��Ҫ����ʵ��Kettle����Ŀ¼·����ʵ�ʵļ�Դdata-integrationĿ¼��
set esetpdiPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle�������ߣ�����Kettle����Ŀ¼����
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%pdiPath%"=="" (
	echo %echopdiPath%
	set /p pdiPath=%esetpdiPath%
)


:begin

::4ִ��
%~d0

cd %~dp0

cd..

set tarPath=%cd%\data-integration

if exist data-integration (
	for %%i in (data-integration) do (
		for /f %%j in ('echo %%~ai^|find /i "-l"') do ( 
			choice /c dre /m Ŀ��data-integration�ļ����Ѿ��Ƿ������ӣ�ɾ������^(D^)���滻����^(R^)���˳�^(E^)�� /t 10  /d e
			if !errorlevel! equ 1 goto dele
			if !errorlevel! equ 2 goto replace
			if !errorlevel! equ 3 goto quit
		)
	)
	
	choice /c yn /m Ŀ��data-integration�ļ����Ѿ����ڣ�ɾ���ļ��к�������^(Y^)��ȡ��^(N^)�� /t 10  /d n
	if !errorlevel! equ 1 goto replace
	if !errorlevel! equ 2 goto quit
	
:quit
	echo ȡ���������˳�...
	goto endwait
:dele
  rd /s /q data-integration
	echo ɾ��Ŀ��data-integrationĿ¼���
	goto quit
:replace
	rd /s /q data-integration
	echo ɾ��Ŀ��data-integrationĿ¼���
)

echo Kettleʵ������Ŀ¼Ϊ��%pdiPath%
echo Kettle��������Ŀ¼Ϊ��%tarPath%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle��Ϊ��Ŀ¼�������ӣ�%tarPath%�����ӵ���%pdiPath%
echo ������...      Ctrl+C��������

::ִ��MKLink
mklink /j "%tarPath%" "%pdiPath%" 

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���


:endwait
pause

:end

::5�˳�

exit /b