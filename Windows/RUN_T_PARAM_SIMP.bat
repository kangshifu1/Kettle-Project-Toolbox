@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.2
::TIME 2015-05-28
::FILE RUN_T_PARAM_NOLOG_SIMP
::DESC run a transformation with param no log no repositorie


:v

::1������ֵ
set tip=Kettle���ȳ������к���ת��
set ver=1.0
set tName=
set pName=
set pValue=

set echotName=��Ҫ����Kettleת���ļ���
set esettName=������Kettleת���ļ�����Ȼ��س���
set echopName=��Ҫ���������
set esetpName=�������������Ȼ��س���
set echopValue=��Ҫ�������ֵ
set esetpValue=���������ֵ��Ȼ��س���


:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ������к���ת��
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
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
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle��ִ��ת����%tName%
echo Kettleת������Ϊ��%pName%=%pValue% 
echo ������...      Ctrl+C��������

::ִ��Pan
call Pan -file:%~dp0%tName%.ktr "-param:%pName%=%pValue%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit