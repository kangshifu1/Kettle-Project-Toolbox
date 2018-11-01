@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2017-08-26
::FILE RUN_REP_J
::DESC run a job in filesystem repositorie 


:v

::1������ֵ
set tip=Kettle���ȳ���������Դ��ת��
set ver=1.0
::double-clicking is outer call and will set 0
set interactive=1
echo %cmdcmdline% | find /i "%~0" >nul
if not errorlevel 1 set interactive=0
::set kettle environment
call SET_ENVIRONMENT.bat
set rName=%KETTLE_REPOSITORY%
set jName=
set pList=

set loglevel=Basic
set fileName=%~n0
set extName=
set kCommand=

set echo_rName=��Ҫ����Kettle�ļ���Դ������
set eset_rName=������Kettle�ļ���Դ�����ƣ�Ȼ��س���
set echo_jName=��Ҫ����Kettle��Դ����ҵ/ת����
set eset_jName=������Kettle��Դ����ҵ/ת������Ȼ��س���
set echo_jFile=Kettle��ҵ�ļ�·����
set echo_pList=�������ò����ű���
set echo_kCommand=������ҵ^(J^)������ת��^(T^)��


:title

::2��ʾ�ı�
title %tip% %ver%

echo Kettle���ȳ���������Դ����ҵ
echo ���н�������Թر�
echo ...


:check

::3�������� ��������
if "%rName%"=="" (
    echo %echo_rName%
    set /p rName=%eset_rName%
)

::kitchen or pan

set extName=kjb
goto finding

:notfound

if %extName%==kjb (
    set extName=ktr
    goto finding
)
echo %echo_jName%
set /p jName=%eset_jName%
set fileName=
goto found

:finding

echo finding file in this path: %fileName%.%extName%
if exist "%fileName%.%extName%" (
    set jName=%fileName%
) else (
    set fileName=%fileName:.=\%
    echo finding file in sub path: !fileName!.%extName%
    if exist "!fileName!.%extName%" (
        set jName=!fileName:.=/!
    ) else (
        goto notfound
    )
)

echo %extName%
if %extName%==kjb (
    set kCommand=kitchen
)
if %extName%==ktr (
    set kCommand=pan
)
set fileName=%fileName%.%extName%
echo use this command to run: %kCommand%

:found

if "%kCommand%"=="" (
    choice /c JT /m !echo_kCommand!
    if !errorlevel! equ 1 set kCommand=kitchen
    if !errorlevel! equ 2 set kCommand=pan
)

if exist "%~n0.SET_PARAM.bat" (
    echo %echo_pList% %~n0.SET_PARAM.bat
    call %~n0.SET_PARAM.bat
)


:begin

::4ִ��
set d=%date:~0,10%
set t=%time:~0,8%

%~d0

cd %~dp0

cd..

cd data-integration

if _%interactive%_ equ _0_ cls

echo ===========================================================
echo Kettle����Ŀ¼Ϊ��%cd%
echo Kettle����Ŀ¼Ϊ��%~dp0
echo Kettle��ҵ�ļ�·����%fileName%
echo Kettle����̨��־�ļ�Ϊ��"%~dp0log\%~n0%d:/=-%_%t::=-%.log"
echo Kettle���д���Դ���е���ҵ��%rName%:%jName%
echo Kettle������%pList% 
echo Kettle��־����%loglevel%
echo ===========================================================
echo ������...      Ctrl+C��������

::ִ��Pan
set c=%kCommand% -rep:%rName% -user:admin -pass:admin -level:%loglevel% -job:%jName%%pList%
if _%interactive%_ neq _0_ echo %c%

if _%JENKINS_HOME%_ neq __ (
    echo Used in Jenkins no log file!
    call %c%
) else (
    call %c%>>"%~dp0log\%~n0%d:/=-%_%t::=-%.log"
)

::ִ�����
if %errorlevel% equ 0 (
    echo �Ѿ�ִ����ϣ����Խ����˳���
) else (
    echo ִ�нű������ִ���
)

if _%interactive%_ equ _0_ pause


:end

::5�˳�

exit /b %errorlevel%