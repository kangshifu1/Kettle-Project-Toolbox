@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2015-06-11
::FILE COPY_REP_CFG
::DESC copy one or more repository config data(s) to new file(extraction deployment configuration)


:v

::1������ֵ
set tip=Kettle���ƹ��ߣ�������Դ��
set ver=1.0
set rNameRegex=%1
set tarREP=%2

set echorNameRegex=��Ҫ����Kettle�ļ���Դ�����ƣ���������ʽ��
set esetrNameRegex=������Kettle�ļ���Դ�����ƣ���������ʽ����Ȼ��س���
set echotarREP=��Ҫ����Kettle�ļ���Դ���������·��
set esettarREP=������Kettle�ļ���Դ���������·����Ȼ��س���

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

if "%1"=="" (
	choice /c yn /m ʹ��Ĭ�����·���� /t 5 /d y
	if !errorlevel! equ 1 goto default
	if !errorlevel! equ 2 goto user
)

if "%tarREP%"=="" (
	goto default
)
goto begin

::Ĭ��λ��
:default
echo ʹ��Ĭ��λ��
set tarREP=%USERPROFILE%\.kettle\[Copy]repositories.xml
goto begin

::�û�����λ��
:user
echo ʹ���û�����λ��
if "%tarREP%"=="" (
	echo %echotarREP%
	set /p tarREP=%esettarREP%
)
goto begin


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle����ȡƥ���������ʽ��Դ�������ļ���%rNameRegex%
echo Kettle����ȡ��Դ�������ļ�����%tarREP%
echo ������...      Ctrl+C��������

::ִ��Pan
call pan -file:%~dp0CopyRepositoryConfig.ktr "-param:rNameRegex=%rNameRegex%" "-param:tarREP=%tarREP%"

::ִ�����
echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit