@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-10
::FILE LINK_KSS
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

set echo_linkPath=��Ҫ����KSS����Ŀ¼·��
set eset_linkPath=������·�����϶�Ŀ¼���ˣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle�������ߣ�����KSSĿ¼
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

set kssPath=%cd%

cd %~dp0

if not exist %linkPath% (
    md %linkPath%
)
set linkToolPath=%linkPath%\tool
set linkDefaultPath=%linkPath%\default
set linkWindowsPath=%linkPath%\Windows
set linkPdiPath=%linkPath%\data-integration


echo KSSĿ¼Ϊ��%kssPath%
echo ����Ŀ¼Ϊ��%linkPath%
echo ������...      Ctrl+C��������

::ִ��MKLink
if _%interactive%_ equ _0_ cls
echo ===========================================================
echo ���ӹ���Ŀ¼��tool\��
call LINK_FOLDER.bat "%linkToolPath%" "%kssPath%\tool"

echo ===========================================================
echo ����Ĭ����Դ��Ŀ¼��default\��
call LINK_FOLDER.bat "%linkDefaultPath%" "%kssPath%\default"


echo ===========================================================
echo ���ӽű�Ŀ¼��Windows\��
call LINK_FOLDER.bat "%linkWindowsPath%" "%kssPath%\Windows"


echo ===========================================================
echo ����Kettle����Ŀ¼��data-integration\��
call LINK_FOLDER.bat "%linkPdiPath%" "%pdiPath%"


::ִ�����
if _%interactive%_ equ _0_ echo �Ѿ�ִ����ϣ����Խ����˳���


:endwait
if _%interactive%_ equ _0_ pause


:end

::5�˳�

exit /b 0