@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.1
::TIME 2015-05-28
::FILE RUN_J_PARAM_FSREP
::DESC run a job with param no log in filesystem repositorie 


:v

::1������ֵ
set tip=Kettle���ȳ���������Դ�⺬����ҵ
set ver=1.0
set rName=
set jName=
set pName=
set pValue=

set echorName=��Ҫ����Kettle�ļ���Դ������
set esetrName=������Kettle�ļ���Դ�����ƣ�Ȼ��س���
set echojName=��Ҫ����Kettle��ҵ����
set esetjName=������Kettle��ҵ���ƣ�Ȼ��س���
set echopName=��Ҫ���������
set esetpName=�������������Ȼ��س���
set echopValue=��Ҫ�������ֵ
set esetpValue=���������ֵ��Ȼ��س���


:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ���������Դ�⺬����ҵ
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
	echo %echorName%
	set /p rName=%esetrName%
)

if "%jName%"=="" (
	echo %echojName%
	set /p jName=%esetjName%
)

if "%pName%"=="" (
	echo %echopName%
	set /p pName=%esetpName%
)

if "%~1"=="" (
	if "%pValue%"=="" (
		echo %echopValue%
		set /p pValue=%esetpValue%
	)
)else set pValue=%~1


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle���д���Դ���е���ҵ��%rName%:%jName%
echo Kettle��ҵ����Ϊ��%pName%=%pValue% 
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -rep:%rName% -user:admin -pass:admin -job:%jName% "-param:%pName%=%pValue%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit