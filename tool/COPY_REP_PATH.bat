@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-05-29
::FILE COPY_REP_PATH
::DESC copy one filesystem repository folder to new folder


:v

::1������ֵ
set tip=Kettle���𹤾ߣ���ȡ��������
set ver=1.0
set rName=%1
set tarPath=%2

set echorName=��Ҫ����Kettle�ļ���Դ�����ƣ���������ʽ��
set esetrName=������Kettle�ļ���Դ�����ƣ���������ʽ����Ȼ��س���
set echotarPath=��Ҫ����Kettle�ļ���Դ���ļ������·��
set esettarPath=������Kettle�ļ���Դ���ļ������·����Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ�������Դ���ļ���
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
	echo %echorName%
	set /p rName=%esetrName%
)

if "%1"=="" (
	choice /c yn /m ʹ��Ĭ�����·���� /t 5 /d y
	if !errorlevel! equ 1 goto default
	if !errorlevel! equ 2 goto user
)

if "%tarPath%"=="" (
	goto default
)
goto begin

::Ĭ��λ��
:default
echo ʹ��Ĭ��λ��
set tarPathparam=
goto begin

::�û�����λ��
:user
echo ʹ���û�����λ��
if "%tarPath%"=="" (
	echo %echotarPath%
	set /p tarPath=%esettarPath%
)
REM �˴��Ŀո���Ϊ�˷�ֹ\��׺+"������\"����ת��
set tarPathparam="-param:tarPath=%tarPath% "
goto begin


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle�����ƴ���Դ����ļ��У�%rName%
echo Kettle��������Դ���ļ��е���%tarPath%
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0CopyRepositoryPath.kjb "-param:rName=%rName%" %tarPathparam%

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit