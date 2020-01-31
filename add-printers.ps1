New-Item -ErrorAction Ignore -Path 'c:\temp' -ItemType Directory
Invoke-WebRequest -Uri "https://support.ricoh.com/bb/pub_e/dr_ut_e/0001316/0001316926/V42600/z88755L19.exe" -OutFile "C:\temp\z88755L19.exe"
Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile "C:\temp\7z1900-x64.msi"
Start-Process msiexec.exe -Wait -ArgumentList '/I C:\temp\7z1900-x64.msi /quiet /norestart'
cmd /c "C:\Progra~1\7-Zip\7z.exe x c:\temp\z88755L19.exe -oc:\temp\z88755L19 -r"
Invoke-Command {pnputil.exe -a "C:\Temp\z88755L19\disk1\oemsetup.inf" }
Add-PrinterDriver -Name "PCL6 Driver for Universal Print"
Start-Sleep 3
Add-PrinterPort -Name "192.168.51.64" -PrinterHostAddress "192.168.51.64"
Start-Sleep 3
Add-Printer -DriverName "PCL6 Driver for Universal Print" -Name "Ricoh" -PortName "192.168.51.64"
write-host "De printer is geinstalleerd en is te vinden onder de naam Ricoh. Je kunt dit Powershell venster sluiten."
