@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-10
::FILE LINK_KPT
::DESC create a symbolic link for Kettle-Scheduling-Scripts(this directory)


:v

::1������ֵ
set tip=Kettle�������ߣ�����Ŀ¼����
set ver=1.0
set linkPath=%1
set pdiPath=%2
::not set param set 0
set interactive=1
if "%1" equ "" set interactive=0

set echo_linkPath=��Ҫ����KPT����Ŀ¼·��
set eset_linkPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle�������ߣ�����KPTĿ¼
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%linkPath%"=="" (
	echo %echo_linkPath%
	set /p linkPath=%eset_linkPath%
)


:begin

::4ִ��
%~d0

cd %~dp0

cd ..

set kptPath=%cd%

cd %~dp0

if not exist %linkPath% (
    md %linkPath%
)
set linkToolPath=%linkPath%\tool
set linkDefaultPath=%linkPath%\default
set linkWindowsPath=%linkPath%\Windows
set linkPdiPath=%linkPath%\data-integration


echo KPTĿ¼Ϊ��%kptPath%
echo ����Ŀ¼Ϊ��%linkPath%
echo ������...      Ctrl+C��������

::ִ��MKLink
if _%interactive%_ equ _0_ (
	cls
) else  (
	echo ��ͻ���ԣ�ǿ���滻�Ѿ����ڵ�ʵ��Ŀ¼������Ŀ¼
    set param=noskip force
)

echo ===========================================================
echo ���ӹ���Ŀ¼��tool\��
call LINK_FOLDER.bat "%linkToolPath%" "%kptPath%\tool" %param%


echo ===========================================================
echo ����Ĭ����Դ��Ŀ¼��default\��
call LINK_FOLDER.bat "%linkDefaultPath%" "%kptPath%\default" %param%


echo ===========================================================
echo ���ӽű�Ŀ¼��Windows\��
call LINK_FOLDER.bat "%linkWindowsPath%" "%kptPath%\Windows" %param%


echo ===========================================================
echo ����Kettle����Ŀ¼��data-integration\��
if "%pdiPath%"=="" (
	call LINK_FOLDER.bat "%linkPdiPath%"
) else (
	call LINK_FOLDER.bat "%linkPdiPath%" "%pdiPath%" %param%
)


::ִ�����
if %errorlevel% equ 0 (
    echo �Ѿ�ִ����ϣ����Խ����˳���
) else (
    echo ִ�нű������ִ���
)

if _%interactive%_ equ _0_ pause


:end

::5�˳�

exit /b 0