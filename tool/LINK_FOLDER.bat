@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2017-09-05
::FILE LINK_FOLDER
::DESC create a symbolic link for directory


:v

::1������ֵ
set tip=Kettle�������ߣ�����Ŀ¼����
set ver=1.0
set linkPath=%1
set targetPath=%2
::not set param set 0
set interactive=1
if "%1" equ "" set interactive=0

set echo_linkPath=��Ҫ�������ӣ����⣩Ŀ¼·��
set eset_linkPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

set echo_targetPath=��Ҫ���뱻���ӣ�Ŀ�꣩Ŀ¼·��
set eset_targetPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

:title

::2��ʾ�ı�
if _%interactive%_ neq _0_ goto check

title %tip% %ver%

echo Kettle�������ߣ�����Ŀ¼����
echo ���н�������Թر�
echo ...

:check

::3�������� ��������
if "%linkPath%"=="" (
	echo %echo_linkPath%
	set /p linkPath=%eset_linkPath%
)
if "%targetPath%"=="" (
	echo %echo_targetPath%
	set /p targetPath=%eset_targetPath%
)

if exist %linkPath% (
	for %%i in (%linkPath%) do (
		for /f %%j in ('echo %%~ai^|find /i "-l"') do ( 
			choice /c dre /m ����Ŀ¼�Ѿ��Ƿ������ӣ�ɾ������^(D^)���滻����^(R^)�����ֲ���^(Ĭ��E^)�� /t 10  /d e
			if !errorlevel! equ 1 goto dele
			if !errorlevel! equ 2 goto replace
			if !errorlevel! equ 3 goto quit
		)
	)
	
	choice /c yn /m ����Ŀ¼�ļ����Ѿ����ڣ�ɾ���ļ��к�������^(Y^)��ȡ��^(N^)�� /t 10  /d n
	if !errorlevel! equ 1 goto replace
	if !errorlevel! equ 2 goto quit
	
:quit
	echo δִ���κβ������˳�...
	if _%interactive%_ equ _0_ pause
	goto end
:dele
	rd /s /q %linkPath%
	echo ɾ������Ŀ¼���˳�...
        pause
	goto end
:replace
	rd /s /q %linkPath%
	echo ɾ������Ŀ¼���
)

:begin

::4ִ��
%~d0

cd %~dp0

if _%interactive%_ neq _0_ goto call

echo Kettle����Ŀ��Ϊ��%linkPath%
echo Kettleʵ��Ŀ¼Ϊ��%targetPath%
echo ������...      Ctrl+C��������

::ִ��MKLink
:call
set c=mklink /j %linkPath% %targetPath% 
if _%interactive%_ equ _0_ echo %c%
call %c%

::ִ�����
if _%interactive%_ equ _0_ echo �Ѿ�ִ����ϣ����Խ����˳���


:endwait
if _%interactive%_ equ _0_ pause


:end

::5�˳�

exit /b 0