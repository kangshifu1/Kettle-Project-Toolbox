@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2015-05-24
::FILE COPY_REP_CFG
::DESC copy one or more repository config xml node to new file(extraction deployment configuration)


:v

::1������ֵ
set tip=Kettle���𹤾ߣ���ȡ��������
set ver=1.0
set rNameRegex=%1

set echorNameRegex=��Ҫ����Kettle�ļ���Դ������(��������ʽ)
set esetrNameRegex=������Kettle�ļ���Դ������(��������ʽ)��Ȼ��س���

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���𹤾ߣ���ȡ��Դ������
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rNameRegex%"=="" (
	echo %echorNameRegex%
	set /p rNameRegex=%esetrNameRegex%
)


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle����ȡƥ���������ʽ��Դ�������ļ���%rNameRegex%
echo ������...      Ctrl+C��������

::ִ��Pan
pan -file:%~dp0CopyRepositoryConfig.ktr "-param:rNameRegex=%rNameRegex%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit