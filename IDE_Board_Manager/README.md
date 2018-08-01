Instructions to update KickSat boards (on Windows)

1. Pack the kicksat board folder in kicksat_boards (they can be packed as either a zip or tar.bz2)
2. Rename the packed file to: kicksat_boards.X.X.zip (OR kicksat_boards.X.X.tar.bz2), replacing X.X with the version number
3. Open file properties to determine the fize size in bytes, then add that info into the JSON file: package_kicksat_index.json, under platforms>>size
4. In Windows PowerShell, type: "Get-FileHash -Path kicksat_boards.X.X.tar.bz2 -Algorithm SHA256 | Format-List" (without quotes and replacing X.X with the version number), then update that info into the JSON file: package_kicksat_index.json, under platforms>>checksum