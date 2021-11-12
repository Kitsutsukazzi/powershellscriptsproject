function introGPI
{
	
	$t = @"
   __              _____ _____ _____             ____  _    _ __  __  ____    _             _    _ _             
  / _|            / ____|  __ \_   _|      /\   / __ \| |  | |  \/  |/ __ \  | |           | |  (_) |            
 | |_ ___  _ __  | |  __| |__) || |______ /  \ | |  | | |  | | \  / | |  | | | |__  _   _  | | ___| |_ ___ _   _ 
 |  _/ _ \| '__| | | |_ |  ___/ | |______/ /\ \| |  | | |  | | |\/| | |  | | | '_ \| | | | | |/ / | __/ __| | | |
 | || (_) | |    | |__| | |    _| |_    / ____ \ |__| | |__| | |  | | |__| | | |_) | |_| | |   <| | |_\__ \ |_| |
 |_| \___/|_|     \_____|_|   |_____|  /_/    \_\____/ \____/|_|  |_|\____/  |_.__/ \__, | |_|\_\_|\__|___/\__,_| - OverHaul 1.2 
                                                                                     __/ |                       
                                                                                    |___/                

"@
	
	for ($i = 0; $i -lt $t.length; $i++)
	{
		if ($i % 2)
		{
			$c = "red"
		}
		elseif ($i % 5)
		{
			$c = "yellow"
		}
		elseif ($i % 7)
		{
			$c = "green"
		}
		else
		{
			$c = "white"
		}
		write-host $t[$i] -NoNewline -ForegroundColor $c
	}
}

function Load-Module ($m)
{
	
	# If module is imported say that and do nothing
	if (Get-Module | Where-Object { $_.Name -eq $m })
	{
		write-host -ForegroundColor Cyan "Il Modulo $m è Già Stato Importato"
	}
	else
	{
		
		# If module is not imported, but available on disk then import
		if (Get-Module -ListAvailable | Where-Object { $_.Name -eq $m })
		{
			Import-Module $m -Force
		}
		else
		{
			
			# If module is not imported, not available on disk, but is in online gallery then install and import
			if (Find-Module -Name $m | Where-Object { $_.Name -eq $m })
			{
				Install-Module -Name $m -Scope CurrentUser -Force
				Import-Module $m -Force
			}
			else
			{
				
				# If the module is not imported, not available and not in the online gallery then abort
				write-host -ForegroundColor Cyan "Il Modulo $m è introvabile monline o su cartelle di rete"
				EXIT 1
			}
		}
	}
}

function Error-Menu
{
	[System.Console]::Clear()
	$mainMenu = 'X'
	while ($mainMenu -ne '')
	{
		Clear-Host
		Write-Host "`n`t`t Script DeffApps_Ver 2.0 - OverHaul - Error Menu`n"
		Write-Host -ForegroundColor Cyan "Scegli L'Opzione Desiderata"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
		Write-Host -ForegroundColor DarkCyan "Vuoi uscire e riprovare?"
		Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
		Write-Host -ForegroundColor DarkCyan "Vuoi uscire dallo script? Lo dovrai far ripartire a mano"
		$mainMenu = Read-Host "`nSelection (Lascia bianco per uscire)"
		# Parte Il SubMenù1
		if ($mainMenu -eq 1)
		{
			main-start
		}
		# Parte il SubMenù2
		if ($mainMenu -eq 2)
		{
			Write-Host "Ciao!"
			Set-ExecutionPolicy Restricted -Force -Verbose
			exit
		}
	}
}

function ProcessingAnimation($scriptBlock)
{
	$cursorTop = [Console]::CursorTop
	
	try
	{
		[Console]::CursorVisible = $false
		
		$counter = 0
		$frames = '|', '/', '-', '\'
		$jobName = Start-Job -ScriptBlock $scriptBlock
		
		while ($jobName.JobStateInfo.State -eq "Running")
		{
			$frame = $frames[$counter % $frames.Length]
			
			Write-Host "$frame" -NoNewLine
			[Console]::SetCursorPosition(0, $cursorTop)
			
			$counter += 1
			Start-Sleep -Milliseconds 125
		}
		
		# Only needed if you use a multiline frames
		Write-Host -ForegroundColor Magenta ($frames[0] -replace '[^\s+]', ' ')
	}
	finally
	{
		[Console]::SetCursorPosition(0, $cursorTop)
		[Console]::CursorVisible = $true
	}
}

function Rename-DefApp
{
	try
	{
	    
		Write-host "In caso di 'Beep' C'è Qualcosa di storto"
		
		Rename-Item -Path "C:\defaultapps" -NewName "C:\defaultapps.xml" -Force -ErrorAction Stop
		Move-Item -Path "C:\defaultapps.xml" -Destination "C:\windows\system32\defaultassociations.xml" -Verbose -ErrorAction Stop
		
	}
	catch
	{
		[System.Media.SystemSounds]::Hand.Play()
		
		[System.Console]::Clear()

		Write-host "Qualcosa è andato storto! Prova a ricontrollare che il file sia presente in C:\ col nome defaultapps"
		Write-host "`nApertura Menu gestione errori"

		ProcessingAnimation { Start-Sleep 3 }
		
		Error-Menu
	}
	
}

function Add-Policy
{
	$RegPath = 'Software\Policies\Microsoft\Windows\System'
	$RegName = 'DefaultAssociationsConfiguration'
	$RegData = 'c:\windows\system32\defaultassociations.xml'
	$RegType = 'String'
	$MachineDir = "$env:windir\system32\GroupPolicy\Machine\registry.pol"
	
	Set-PolicyFileEntry -Path $MachineDir -Key $RegPath -ValueName $RegName -Data $RegData -Type $RegType
	
}

function add-IElink
{
	try
	{ New-Item -ItemType SymbolicLink -Path "C:\users\Public\Desktop" -Name "Internet Explorer" -Value "C:\Program Files\Internet Explorer\iexplore.exe" }
	catch
	{
		Write-Host "`nNon sono riuscito a creare il link per internet explorer"
		
		
	}
	
	
}

function Set-WindowStyle
{
	param (
		[Parameter()]
		[ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE',
					 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED',
					 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
		$Style = 'SHOW',
		[Parameter()]
		$MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
	)
	$WindowStates = @{
		FORCEMINIMIZE = 11; HIDE = 0
		MAXIMIZE	  = 3; MINIMIZE = 6
		RESTORE	      = 9; SHOW = 5
		SHOWDEFAULT   = 10; SHOWMAXIMIZED = 3
		SHOWMINIMIZED = 2; SHOWMINNOACTIVE = 7
		SHOWNA	      = 8; SHOWNOACTIVATE = 4
		SHOWNORMAL    = 1
	}
	Write-Verbose ("Set Window Style {1} on handle {0}" -f $MainWindowHandle, $($WindowStates[$style]))
	
	$Win32ShowWindowAsync = Add-Type -memberDefinition @" 
    [DllImport("user32.dll")] 
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@ -name "Win32ShowWindowAsync" -namespace Win32Functions -passThru
	
	$Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
}

function main-start
{
	
	Add-Policy
	Rename-DefApp
	
	#Pulizia di Alcuni file che avevo lasciato per sbaglio nell'utente di default.'
	Get-ChildItem -Path C:\Users\default\Downloads -Include * -File -Recurse | foreach { $_.Delete() }
	
	try
	{
		New-Item -ItemType SymbolicLink -Path "C:\users\Public\Desktop" -Name "Internet Explorer" -Value "C:\Program Files\Internet Explorer\iexplore.exe" -ErrorAction Stop
	}
	catch
	{
		[System.Console]::Clear()
		Write-Host -ForegroundColor Red "`nSembra che qualcosa sia andato storto nel creare il link per internet explorer, forse esiste già"
		Write-Host -ForegroundColor Cyan "`nEsco dallo script"
	}
	
	
	exit
}

#Obbligatorio per far andare lo script quand'è un exe
Set-ExecutionPolicy Unrestricted -Force -ErrorAction SilentlyContinue

[System.Console]::Clear()

# (Get-Process -Name powershell).MainWindowHandle | ForEach-Object { Set-WindowStyle MAXIMIZE $_ }

#Intro e installazione dei moduli necessari
ProcessingAnimation { Start-Sleep 2 }

[System.Console]::Clear()

introGPI

ProcessingAnimation { Start-Sleep 1 }

Write-Host -ForegroundColor Cyan "`nInstallo i moduli necessari"

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

ProcessingAnimation { Start-Sleep 1 }

Load-Module -m "PolicyFileEditor"

[System.Console]::Clear()

main-start
