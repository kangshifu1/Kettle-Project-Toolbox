@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2017-08-22
::FILE INIT_PROJECT_PATH
::DESC init file repository as project directory


:v

::1������ֵ
set tip=Kettle��Ŀ���ߣ���ʼ����Ŀ��Դ��
set ver=1.0
set rName=

set echorName=��Ҫ������Ŀ��Դ����������
set esetrName=���������ƣ�Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle��Ŀ���ߣ���ʼ����Ŀ��Դ��
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
echo Kettle�����ɴ���Դ�����ĿĿ¼��%rName%
echo Kettle��������ĿĿ¼����������ͬ��Ŀ¼��
echo ������...      Ctrl+C��������

::ִ��Kitchen
call kitchen -file:%~dp0CreateProjectRepository.kjb "-param:rName=%rName%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit \b