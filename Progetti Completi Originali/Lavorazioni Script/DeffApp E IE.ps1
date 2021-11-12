Function Start-Countdown
{   <#
    .SYNOPSIS
        Provide a graphical countdown if you need to pause a script for a period of time
    .PARAMETER Seconds
        Time, in seconds, that the function will pause
    .PARAMETER Messge
        Message you want displayed while waiting
    .EXAMPLE
        Start-Countdown -Seconds 30 -Message Please wait while Active Directory replicates data...
    .NOTES
        Author:            Martin Pugh
        Twitter:           @thesurlyadm1n
        Spiceworks:        Martin9700
        Blog:              www.thesurlyadmin.com
       
        Changelog:
           2.0             New release uses Write-Progress for graphical display while couting
                           down.
           1.0             Initial Release
    .LINK
        http://community.spiceworks.com/scripts/show/1712-start-countdown
    #>
	Param (
		[Int32]$Seconds = 10,
		[string]$Message = "Pausing for 10 seconds..."
	)
	ForEach ($Count in (1 .. $Seconds))
	{
		Write-Progress -Id 1 -Activity $Message -Status "Waiting for $Seconds seconds, $($Seconds - $Count) left" -PercentComplete (($Count / $Seconds) * 100)
		Start-Sleep -Seconds 1
	}
	Write-Progress -Id 1 -Activity $Message -Status "Completed" -PercentComplete 100 -Completed
}

Set-ExecutionPolicy Unrestricted -Force

Clear-Host
Write-Host "Installazione Del Modulo PolicyFileEditor"
start-sleep "1"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PolicyFileEditor -RequiredVersion 3.0.0 -Force
Import-Module -Name PolicyFileEditor -RequiredVersion 3.0.0 -Force

try
{
	Rename-Item -Path "C:\defaultapps" -NewName "C:\defaultapps.xml" -Force -ErrorAction Stop
}
catch
{
	[console]::beep(1000, 250)
	[console]::beep(2000, 250)
	[console]::beep(3000, 250)
	
	Write-host "Qualcosa è andato storto! Prova a ricontrollare che il file sia presente in C:\ col nome defaultapps"
	
	Start-Sleep "10"
	
	exit
}

Start-sleep "2"
Move-Item -Path "C:\defaultapps.xml" -Destination "C:\windows\system32\defaultassociations.xml" -Verbose
Start-sleep "2"
Write-Host "Cambiato il nome del file defaultapps.xml"

$RegPath = 'Software\Policies\Microsoft\Windows\System'
$RegName = 'DefaultAssociationsConfiguration'
$RegData = 'c:\windows\system32\defaultassociations.xml'
$RegType = 'String'
$MachineDir = "$env:windir\system32\GroupPolicy\Machine\registry.pol"

Set-PolicyFileEntry -Path $MachineDir -Key $RegPath -ValueName $RegName -Data $RegData -Type $RegType

Write-Host  "Impostata la Policy delle app di default!"
Start-Sleep "3"
Write-Host "Ora inserisco un collegamento di internet explorer sul desktop pubblico e pulisco alcune cosette"
Get-ChildItem -Path C:\Users\default\Downloads -Include * -File -Recurse | foreach { $_.Delete() }
Start-Sleep "2"
New-Item -ItemType SymbolicLink -Path "C:\users\Public\Desktop" -Name "Internet Explorer" -Value "C:\Program Files\Internet Explorer\iexplore.exe"
Clear-Host
Write-Host "Se vedi il collegamento di internet sul desktop, tutto ok, senno fammi ripartire`nIo tra poco mi chiudo!"
Write-Host "`nFaccio anche pulizia"
Write-Host "`nDisinstallo il module installato"
try
{
	Uninstall-Module -Name PolicyFileEditor -AllVersions -Force
}
catch
{
	Write-Host "Non sono riuscito a disinstallare il modulo PolicyFileEditor ora ci riprovo"

	& "$PSScriptRoot\Unistall_moduleLoop.ps1"
	
	exit
}

Set-ExecutionPolicy Restricted -Force
Clear-Host
Start-Countdown -Seconds "5" -Message "Chiusura tra 5 secondi"

Exit