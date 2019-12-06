# HeadphoneBluetoothSwap
A automated way to turn off your phones Bluetooth and evoke auto-connect Bluetooth with pc

# How it works
- Send a signal using IFTTT webhooks to turn off bluetooth on your phone  
- On the computer turn Bluetooth off and on (without this windows won't autoconnect to the headphones when they become available)


# Requirements
 
 - Android phone
 - Windows PC
 - Bluetooth headphones

# How to setup


Install IFTTT on your phone, create an account (or use google) and login  
Give the app permission to access Bluetooth

We will now setup a custom IFTTT applet that will tell your phone to turn off bluetooth.  
Go to [IFTTT](https://ifttt.com/create) and create a new applet.


Click the "+", then search for and select the "Webhooks" service  
<img src="https://i.imgur.com/QqeDpBx.png" alt="drawing" width="400"/>

___________________________________



Chose "Recieve a web request", then give it a fitting trigger name and remeber it for later
<img src="https://i.imgur.com/IrsL1Qq.png" alt="drawing" width="400"/>

___________________________________


Now we want to select what happens after the trigger  
Click the + and search for "android" and select the "Turn off Bluetooth" option
<img src="https://i.imgur.com/PrUTGcB.png" alt="drawing" width="550"/>
___________________________________

You should now have completed your IFTTT applet, last we need to download and hook it up to our program  


[Download](https://drive.google.com/uc?export=download&id=1YBun-iPZA-wCy_Xr86BHUriPWVuWVae9) the repository.  
Extract and place the folder somewhere  

Inside the folder you will find a file called: "headponeBluetoothSwap.bat"
Right-click it and select "Edit"
You will then see:

```batch
rem replace these two variables:
set TRIGGER_NAME = TRIGGER-NAME-HERE
set KEY = YOUR-KEY-HERE
```

Replace `TRIGGER-NAME-HERE` with the name you gave your trigger in a previous step  
Replace `YOUR-KEY-HERE` with the key displayed by clicking "documentation" button on [this](https://ifttt.com/maker_webhooks) page

___________________________________

To run the program just start the headponeBluetoothSwap.bat (by double clicking)  

# Recommended
- For a more automated setup i have included a [AutoHotKey](https://www.autohotkey.com/) Script  
This means you can easily run the program with a shortcut  
By default the shortcut will be CTRL+ALT+B

- Create a "shortcut" of the script and put it in your startup folder  
`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`  
to keep the shortcut allways working 

# Issues
- Unfortunately the IFTTT system is a bit slow (~8 seconds), if there is a faster (and still simple) way please let me know!
- In my experience IFTTT only works if the your screens phone is on
- By default Windows does not like running batch files, it gives a lot of warnings 
