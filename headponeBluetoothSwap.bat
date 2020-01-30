@echo off

rem replace these two variables:
set "TRIGGER_NAME_OFF=TRIGGER-NAME-HERE"
set "TRIGGER_NAME_ON=TRIGGER-NAME-HERE"
set "KEY=YOUR-KEY-HERE"

rem set this variable to something longer if windows doesn't auto-connect, for example: 5
set /A "WAIT_TIME=3"


rem minimize program
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

rem notify user program is running //giventool doesnt work on my win10 pc so I'm disabled it
rem call systemTrayNotification.bat -tooltip info -time 4000 -title "Headphones connecting" -text "Swapping connections" -icon information

rem turn bluetooth off to evoke windows bluetooth auto-connect
powershell -ExecutionPolicy Bypass -File .\bluetooth.ps1 -BluetoothStatus Off

rem tell phone to disconnect trough IFTTT
curl -X POST https://maker.ifttt.com/trigger/%TRIGGER_OFF%/with/key/%KEY%

rem wait for phone to turn off bluetooth (screen must be on)
timeout /t %WAIT_TIME%

rem turn bluetooth back on; evoking auto-connect functionality
powershell -ExecutionPolicy Bypass -File .\bluetooth.ps1 -BluetoothStatus On 

rem wait for headset to connect before turning bluetooth on phone again
timeout /t %WAIT_TIME%

rem tell phone to renable BT trough IFTTT
curl -X POST https://maker.ifttt.com/trigger/%TRIGGER_ON%/with/key/%KEY%

exit
