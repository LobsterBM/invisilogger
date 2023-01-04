Pre installation:
1: right click edit on mainLogin.bat
2: edit line circa 53
	tasklist | find "ProgramName.exe">NUL
   and replace ProgramName.exe with the file you want to be open for verification
   using a dot .  as a placeholder character (if version changes ex: dio-25.exe vs dio-26.exe would be dio-...exe)
3: save and exit, continue with normal installation process 

installation :
1: Open task scheduler & click on "Create task"
2: Add Name & desciption (recommended , will be useful in case of errors) 
3: click on "Run with highest privileges" & check the "hidden" box on the bottom left
4:Go to "Triggers tab and click on new 
5:click on the drop down menu and select "at logon" instead of "On a schedule"
6: Select "delay task for:" and insert time 
     6a : recommended to choose between 2-5 minutes in case of a slow computer
     6b: select "Repeat task every" and select the frequency at which the script will run (ex: 1 min)
7:click ok and go to the "Actions tab" & select new 
8:In the Browse section , make sure the drop down menu is set to "Start a program" 
	in the "Program/script" field , type "wscript.exe"
9: in the "Add arguments (optional)" field ,  copy the following line:

"C:\(directory of script)\invisible.vbs" "C:\directory of script)\mainLogIn.bat"


9a :replace the directory of script , !!!DO NOT remove the space between the two brackets!!!

10:IMPORTANT-> in the "Start in (optional)" section add running directory of the script :
example: 

C:\Users\username\Desktop\logger\logger\


11: in the 3conditions tabs " deselect the "Run only when computer is on AC power" in case the PC is a laptop
12: restart computer 


Notation: 
	- "wscript.exe" => with doublequotes	
	- "PATH\invisible.vbs" => with doublequotes
	- "PATH\mainLogIn.bat" => with doublequotes
	- PATH => NO doublequotes
Reminder: 
	PATH = $USERPATH/Documents/POINTEUSE - NE PAS DEPLACER/logger (FIRST subfolder)
