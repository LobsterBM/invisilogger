
@echo off 

set /p token=<token.txt
set url=https://huissieralexandre.be/timeChecker/ping/


curl -k -s https://huissieralexandre.be/timeChecker/ping/pvsb7gtydi > temp.txt || echo error1


ping localhost -n 2 > NUL


type temp.txt|findstr /C:"true" >nul 2>&1
if not errorlevel 1 (
echo UserConnectionSuccess 
) else ( 
echo UserConnecitonFailure 
rem add to log file
)