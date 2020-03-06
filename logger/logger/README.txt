1: Open task scheduler & click on "Create task"
2: Add Name & desciption (recommended , will be useful in case of errors) 
3: click on "Run with highest privileges" & check the "hidden" box on the bottom left
4:Go to "Triggers tab and click on new 
5:click on the drop down menu and select "at logon" instead of "On a schedule"
6: Select "delay task for:" and insert time 
     6a : for login script choose between 2-5 minutes 
     6b: for logout script select 15 minutes and click on "Repeat task every:" and select 15 minutes 
7:click ok and go to the "Actions tab" & select new 
8:In the Browse section , select the program you want to run 
9:IMPORTANT-> in the "Start in (optional)" section add running directory of the script
10: click ok 

Redo these steps once for MainLogin & then once for MainLogout