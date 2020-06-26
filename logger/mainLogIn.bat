
@echo off

MODE CON COLS=18 LINES=1

rem date formatting


set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
rem echo hour=%hour%

set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
rem echo min=%min%

set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
rem echo secs=%secs%

set year=%date:~-4%
rem echo year=%year%

set month=%date:~3,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
rem echo month=%month%

set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
rem echo day=%day%

set dateformat=%year%-%month%-%day%T%hour%:%min%:%secs%

rem echo %dateformat%



rem check if token is valid

set /p token=<token.txt

echo(%token%|findstr /r "[^0-9a-zA-Z]" >nul && (
  rem echo Invalid token : please check token.txt file

  rem add to log file 
  echo %dateformat% TokenError : non alphanumeric symbol found in token >> log.txt
  goto exitloop
)


set loopcount=5

tasklist | findstr  "chro...exe">NUL
if not "%ERRORLEVEL%"=="0" (
  goto exitloop
)
:loop

login |findstr /C:"UserConnectionSuccess" >nul 2>&1
if not errorlevel 1 (
rem echo Exiting loop success
set resturl=https://huissieralexandre.be/

for /f "tokens=*" %%a in (connection.txt) do (
curl -s %resturl%%%a
)

del connection.txt
del temp.txt
goto exitloop 
) else ( 
echo %dateformat%ConnectionError : failed attempt to write  >> log.txt

)

set /a loopcount=loopcount-1
if %loopcount%==0 (
rem logging loop failure 

echo timeChecker/restorePing/%token%/%dateformat% >> connection.txt
echo %dateformat% ValidationError : Could not validate connection  >> log.txt
goto exitloop
)
goto loop
:exitloop
