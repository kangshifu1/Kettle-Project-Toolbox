@echo off
::CODER BY xiaoyao9184 1.0
::TIME 2017-08-26
::FILE SET_PARAM
::DESC set kettle param


:v

::1������ֵ
set pList=

set eset_pName=�������������Ȼ��س����ս�������
set eset_pValue=���������ֵ��Ȼ��س���


:loop

set /p pName=%eset_pName%|| Set pName=NONE
if "%pName%"=="NONE" goto :end

set /p pValue=%eset_pValue%

set pItem="-param:%pName%=%pValue%"
set pList=%pList% %pItem%

echo %pList%

goto loop


:end

::5�˳�
exit /b 0
