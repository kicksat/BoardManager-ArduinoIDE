# KickSat Arduino Boards

This repository contains support for the KickSat boards. This tutorial and repo are cloned and modified from the SparkFun GitHub repo.

**IMPORTANT NOTE:** These board files have been updated for compatibility with Arduino version 1.8 and higher. Some boards (e.g. SAMD) may not compile correctly with earlier versions of Arduino. If you need compatibility with earlier versions of Arduino, you can choose previous releases of these boards from the Boards Manager.

### Installation Instructions

To add board support for our products, start Arduino and open the Preferences window (**File** > **Preferences**). Now copy and paste the following URL into the 'Additional Boards Manager URLs' input field:

	https://github.com/kicksat/KickSat_Boards_ArduinoIDE/tree/master/IDE_Board_Manager/kicksat_board_index.json

![Location of Additional Boards Manager URL input field](prefs-arrow.png)

If there is already an URL from another manufacturer in that field, click the button at the right end of the field. This will open an editing window allowing you to paste the above URL onto a new line.

### AVR and ESP Installation Instructions

Open the Boards Manager window by selecting **Tools** > **Board**, scroll to the top of the board list, and select **Boards Manager**.

![Boards Manager Menu](manager-menu.png)

If you type "sparkfun" (without quotes) into the "filter your search" field, you will see options to install SparkFun's AVR and ESP board files. Click in the desired box, and click the "Install" button that appears. Once installed, the boards will appear at the bottom of the board list.

![Sparkfun Boards](sparkfunboards.png)

### SAMD Installation Instructions

When installing SAMD boards, you will need to first install Arduino SAMD support, then SparkFun's SAMD boards.

Open the Boards Manager window by selecting **Tools** > **Board**, scroll to the top of the board list, and select **Boards Manager**. Now type "samd" (without quotes) into the "filter your search" field at the top of the window. Two entries should show up, one for Arduino SAMD boards, and one for SparkFun SAMD boards. We'll install both of these, starting with Arduino SAMD boards.

Click anywhere in the "Arduino SAMD Boards" box, and click "Install". This is a large installation and will take a while.

![Arduino SAMD Boards](manager-arrow.png)

Now click anywhere in the "SparkFun SAMD Boards" box, and click "Install". This is a small installation and will happen much faster.

![SparkFun SAMD Boards](manager-arrow2.png)

You're now ready to use the boards. They will appear at the bottom of the board list.

### Notes

* Information on compiling and programming the bootloaders can be found in the bootloaders directory.

**Have fun!**<br>
\-Your friends from KickSat
