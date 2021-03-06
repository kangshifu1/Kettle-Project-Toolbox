@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2015-06-03
::FILE RUN_J_LOG_PARAM_FSREP
::DESC run a job with param and log in filesystem repositorie 


:v

::1变量赋值
set tip=Kettle调度程序：运行资源库含参作业
set ver=1.0
set loglevel=Basic
set rName=
set jName=
set pName=
set pValue=

set echorName=需要输入Kettle文件资源库名称
set esetrName=请输入Kettle文件资源库名称，然后回车：
set echojName=需要输入Kettle作业名称
set esetjName=请输入Kettle作业名称，然后回车：
set echopName=需要输入参数名
set esetpName=请输入参数名后，然后回车：
set echopValue=需要输入参数值
set esetpValue=请输入参数值，然后回车：


:title

::2提示文本
title %tip% %ver%

echo Kettle调度程序：运行资源库含参作业
echo 运行结束后可以关闭
echo ...


:check

::3变量检验 参数处理
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

::4执行
set d=%date:~0,10%
set t=%time:~0,8%

%~d0

cd %~dp0

cd..

cd data-integration

echo Kettle引擎目录为：%cd%
echo Kettle工作目录为：%~dp0
echo Kettle运行此资源库中的作业：%rName%:%jName%
echo Kettle日志文件为："%~dp0log\%jName%%d:/=-%_%t::=-%.log"
echo Kettle作业参数为：%pName%=%pValue% 
echo 运行中...      Ctrl+C结束程序

::执行Kitchen
call kitchen -rep:%rName% -user:admin -pass:admin -job:%jName% -level:%loglevel% -log="%~dp0log\%jName%%d:/=-%_%t::=-%.log" "-param:%pName%=%pValue%"

::执行完毕
echo 已经执行完毕，可以结束此程序

pause


:end

::5退出

exit