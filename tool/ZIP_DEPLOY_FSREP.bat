@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-05-28
::FILE ZIP_DEPLOY_FSREP
::DESC create a zip file for deploy in filesystem repositorie


:v

::1������ֵ
set tip=Kettle���𹤾ߣ����ɲ����ļ�
set ver=1.0
set rName=%1

set echorName=��Ҫ����Kettle�ļ���Դ������
set esetrName=������Kettle�ļ���Դ�����ƣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ�������Դ�ⲿ���ļ�
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
	echo %echorName%
	set /p rName=%esetrName%
)


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle�����ɴ���Դ��Ĳ����ļ���%rName%
echo Kettle�����ɲ����ļ���������Դ��ͬ��Ŀ¼��
echo ������...      Ctrl+C��������

::ִ��Pan
call pan -file:%~dp0ZipDeployPatch4FSREP.ktr "-param:rName=%rName%" "-param:notRegex=.*\.log$"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit