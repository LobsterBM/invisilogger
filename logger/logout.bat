
@echo off 

set /p token=<token.txt
set url=https://huissieralexandre.be/timeChecker/logOut/


curl -s %url%%token% > temp.txt || echo error1


rem ping for delay
ping localhost -n 2 > NUL


type temp.txt|findstr /C:"true" >nul 2>&1
if not errorlevel 1 (
echo UserConnectionSuccess 
) else ( 
echo UserConnecitonFailure 
rem add to log file
)