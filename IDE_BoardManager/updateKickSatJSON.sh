#!/bin/bash

#####################################################################################################################################
# This file automatically compresses the kicksat board repo (KickSatBoards-ArduinoIDE), moves the zip file to the board manager repo
# (BoardManager-ArduinoIDE), and then updates the JSON file as the next version. The version number is defined as the next biggest
# version number in the folder for the kicksat boards (e.g. if a file exists at 1.0, 1.1 is created). The user must define the major
# revision number (see below). This file must be run from the folder: GitHub/BoardManager-ArduinoIDE/IDE_BoardManager/.
#
# This script requires to command-line tool: jq
# To install jq, run in terminal: sudo apt install jq
#
# To run updateKickSatJSON.sh:
#   Open terminal
#   Navigate to "$HOME/Documents/GitHub/BoardManager-ArduinoIDE/IDE_BoardManager/"
#   Type: chmod +x updateKickSatJSON.sh
#   Type: . updateKickSatJSON.sh
#####################################################################################################################################

verMajor=1 # User-set major version number (e.g. version 1.X or 2.X)

#####################################################################################################################################
# Create new compressed file for the kicksat boards with all the board-specific files found the repo: GitHub/KickSatBoards-ArduinoIDE
#####################################################################################################################################
num=$((`find . -name "kicksat_boards*" | sed -e s/[^0-9]//g | sort -nrk1 | head -n 1` + 1))
version=$verMajor'.'${num:1:10}
url='https://raw.githubusercontent.com/kicksat/BoardManager-ArduinoIDE/master/IDE_BoardManager/kicksat_boards.'$version'.zip'
folderpathDestination=$HOME'/Documents/GitHub/BoardManager-ArduinoIDE/IDE_BoardManager/'
filenameDestination='kicksat_boards.'$version'.zip'
filepathDestination=$folderpathDestination$filenameDestination
folderpathSource=$HOME'/Documents/GitHub/'
filenameSource='KickSatBoards-ArduinoIDE'
filepathSource=$folderpathSource$filenameSource
jsonFolderpath=$folderpathDestination
jsonFilenameNoExt='package_kicksat_index'
jsonFilename=$jsonFilenameNoExt'.json'
jsonFilepath=$jsonFolderpath$jsonFilename
jsonFilepathNoExt=$jsonFolderpath$jsonFilenameNoExt
jsonFilepathTEMP=$jsonFolderpath$jsonFilenameNoExt'TEMP.json'
archiveFileName=$filenameDestination
echo Version: $version
echo Source folder: $filenameSource
echo Source folderpath: $folderpathSource
echo Destination folderpath: $folderpathDestination
echo Destination filename: $filenameDestination
echo Destination filepath: $filepathDestination
echo JSON filename: $jsonFilename
echo JSON filepath: $jsonFilepath
echo Archive File Name: $archiveFileName
cd $folderpathSource
zip -r $filepathDestination $filenameSource
cd -
filesize=$(du -b $filepathDestination | awk '{ print $1 }')
checksum='SHA-256:'$(sha256sum $filepathDestination | awk '{ print $1 }')
echo Folder zipped successfully
echo File size: $filesize
echo Checksum: $checksum
cp -a $jsonFilepath $jsonFilepathTEMP
jq --arg version "$version" --arg url "$url" --arg archiveFileName "$archiveFileName" --arg checksum "$checksum" --arg filesize "$filesize" '.packages[0].platforms += [{"name":"KickSat Boards","architecture":"samd","version":$version,"category":"Contributed","url":$url,"archiveFileName":$archiveFileName,"checksum":$checksum,"size":$filesize,"help":{"online":"https://learn.sparkfun.com/tutorials/installing-arduino-ide/board-add-ons-with-arduino-board-manager"},"boards":[{"name": "KMB20"},{"name": "KMB21"},{"name": "KMB22"}],"toolsDependencies":[{"packager": "arduino","name": "arm-none-eabi-gcc","version": "4.8.3-2014q1"},{"packager": "arduino","name": "bossac","version": "1.7.0"},{"packager": "arduino","name": "openocd","version": "0.9.0-arduino6-static"},{"packager": "arduino","name": "CMSIS","version": "4.5.0"},{"packager": "arduino","name": "CMSIS-Atmel","version": "1.1.0"},{"packager": "arduino","name": "arduinoOTA","version": "1.2.0"}]}]' $jsonFilepathTEMP > $jsonFilepath
echo JSON file written successfully
rm -f $jsonFilepathTEMP
echo Complete!
#####################################################################################################################################
# Complete!
