@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-08-21
::FILE RUN_SPOON
::DESC run spoon with customize KETTLE_HOME


:v

::1������ֵ
set tip=Kettle���ȳ�������Spoon
set ver=1.0
set KETTLE_HOME=
set KETTLE_REPOSITORY=
for %%a in (.) do set current_folder=%%~na

set echo_use_project_kettle_home=ʹ����ĿKETTLE_HOMEĿ¼��
set echo_use_user_kettle_home=ʹ���û�KETTLE_HOMEĿ¼��
set echo_use_dir_name_as_repositorie_name=ʹ����ĿĿ¼����ΪĬ��������Դ�⣡

:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ�������Spoon
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if exist .kettle (
    echo %echo_use_project_kettle_home%
    set KETTLE_HOME=%cd%
) else ( 
    echo %echo_use_user_kettle_home%
)

set "_temp_file_repository=0"

if exist repository.log (
    set _temp_file_repository=1
)
if exist .meta (
    set _temp_file_repository=1
)
if exist *.kdb (
    set _temp_file_repository=1
)
if exist config.xml (
    set _temp_file_repository=1
)
if %_temp_file_repository% equ 1 (
    echo %echo_use_dir_name_as_repositorie_name%
    set KETTLE_REPOSITORY=%current_folder%
)


:begin

::4ִ��
%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo KETTLE_HOMEΪ��%KETTLE_HOME%
echo KETTLE_REPOSITORYΪ��%KETTLE_REPOSITORY%
echo ������...      Ctrl+C��������

::ִ��Kitchen
call Spoon.bat

::ִ�����
if %ERRORLEVEL% equ 0 goto end

echo �Ѿ�ִ����ϣ����Խ����˳���

pause


:end

::5�˳�

exit