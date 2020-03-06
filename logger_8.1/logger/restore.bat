@echo off

set url=https://huissieralexandre.be/

echo test
for /f "tokens=*" %%a in (connection.txt) do (
curl %url%%%a


)


echo Restoration ended