@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2015-06-03
::FILE RUN_T_LOG_PARAM_NOLOG_FSREP
::DESC run a transformation with param and log in filesystem repositorie 


:v

::1������ֵ
set tip=Kettle���ȳ���������Դ�⺬��ת��
set ver=1.0
set loglevel=Basic
set rName=
set tName=
set pName=
set pValue=

set echorName=��Ҫ����Kettle�ļ���Դ������
set esetrName=������Kettle�ļ���Դ�����ƣ�Ȼ��س���
set echotName=��Ҫ����Kettleת���ļ���
set esettName=������Kettleת���ļ�����Ȼ��س���
set echopName=��Ҫ���������
set esetpName=�������������Ȼ��س���
set echopValue=��Ҫ�������ֵ
set esetpValue=���������ֵ��Ȼ��س���


:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ���������Դ�⺬��ת��
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
	echo %echorName%
	set /p rName=%esetrName%
)

if "%tName%"=="" (
	echo %echotName%
	set /p tName=%esettName%
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
set d=%date:~0,10%
set t=%time:~0,8%

%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle���д���Դ���е�ת����%rName%:%tName%
echo Kettle��־�ļ�Ϊ��"%~dp0log\%jName%%d:/=-%_%t::=-%.log"
echo Kettleת������Ϊ��%pName%=%pValue% 
echo ������...      Ctrl+C��������

::ִ��Pan
call pan -rep:%rName% -user:admin -pass:admin -job:%tName% -level:%loglevel% -log="%~dp0log\%jName%%d:/=-%_%t::=-%.log" "-param:%pName%=%pValue%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit