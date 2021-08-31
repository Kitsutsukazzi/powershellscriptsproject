function mainMenu {
    
    introGPI
    
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Write-Host "`n`t`t Preparazione Macchine AOUMO-GPI`n"
        Write-Host -ForegroundColor Cyan "Scegli L'Opzione Desiderata"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Menù Cambio IP"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Menù Cambio Nome"
        $mainMenu = Read-Host "`nSelection (Lascia bianco per uscire)"
        # Parte Il SubMenù1
        if($mainMenu -eq 1){
            subMenu1
        }
        # Parte il SubMenù2
        if($mainMenu -eq 2){
            subMenu2
        }
    }
}

function subMenu1 {
    $subMenu1 = 'X'
    while($subMenu1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Preparazione Macchine AOUMO-GPI`n"
        Write-Host -ForegroundColor Cyan "Menù Cambio IP"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " IP di laboratorio"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " IP a scelta"
        $subMenu1 = Read-Host "`nSelezione (lascia vuoto per uscire)"
        # Optione 1 di cambio IP
        if($subMenu1 -eq 1){
            subCambioIP
        }
        # Option 2
        if($subMenu1 -eq 2){
           subCambioIP1
        }
    }
}

function subMenu2 {
    $subMenu2 = 'X'
    while($subMenu2 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Preparazione Macchine AOUMO-GPI`n"
        Write-Host -ForegroundColor Cyan "Menù Cambio Nome e Dominio"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Cambia il Nome e il Dominio"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Cambia Solo il Nome"
        $subMenu2 = Read-Host "`nSelezione (lascia vuoto per uscire)"
        # Option 1
        if($subMenu2 -eq 1){

            CambioNomePc

            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Option 2
        if($subMenu2 -eq 2){
            $PSVersionTable.PSVersion
            # Pause and wait for input before going back to the menu
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPremi un qualsiasi tasto per tornare indietro"
            [void][System.Console]::ReadKey($true)
        }
    }
}

#Opzioni del SubMenu 1 

function subCambioIP { 
    $subCambioIP = 'X'
    while($subCambioIP -ne ''){
        Clear-Host
        Write-Host "`n`t`t Scegli L'IP di Laboratorio desiderato`n"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.152"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.153"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.154"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.155"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.156"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.157"

        $subCambioIP = Read-Host "`nSelezione (lascia vuoto per uscire)"

        if($subCambioIP -eq 1){
                
            $IP = "172.16.20.152"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }
        if($subCambioIP -eq 2){
                
            $IP = "172.16.20.153"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }
        if($subCambioIP -eq 3){
                
            $IP = "172.16.20.154"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }
        if($subCambioIP -eq 4){
                
            $IP = "172.16.20.155"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }
        if($subCambioIP -eq 5){
                
            $IP = "172.16.20.156"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }
        if($subCambioIP -eq 6){
                
            $IP = "172.16.20.157"
            $MaskBits = 20 # This means subnet mask = 255.255.255.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }

  }
}

function subCambioIP1 {
    $subCambioIP1 = 'X'
    while($subCambioIP1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Scegli L'opzione desiderata`n"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "Per scegliere un indirizzo personalizzato"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "DHCP"

        $subcambioip1 = Read-Host "`nSelezione (lascia vuoto per uscire)"
        if($subCambioIP1 -eq 1){
            
            $IP = Read-Host = "`n`t`t Scrivi l'indirizzo IP desiderato`n" 
            $Gateway = Read-Host = "`n`t`t Scrivi il Gateway desiderato`n"
            $MaskBits = 20 # This means subnet mask = 255.255.255.254
            $Dns = "172.16.16.1","172.16.16.2"
            $IPType = "IPv4"

            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            ProcessingAnimation { Start-Sleep 4}

            ipconfig

            ProcessingAnimation { Start-Sleep 3}

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }


            }
}

#Opzioni del SubMenu 2

function CambioNomePc{

    Write-Host -ForegroundColor Magenta "Il nome del computer è ="(HOSTNAME.EXE)
    
    $ComputerName = Read-Host "Inserisci il nome desiderato"
    $Dominio = Read-Host "Inserisci il dominio desiderato"
    $Credenziali = Get-Credential
    
    # Rename-Computer $ComputerName 

    Add-Computer -Domain $Dominio -NewName $ComputerName -Credential $Credenziali -Restart -Force
 
}

function CambioIP {

         Disable-NetAdapterBinding –InterfaceAlias “Ethernet” –ComponentID ms_tcpip6 -ErrorAction SilentlyContinue

       # Retrieve the network adapter that you want to configure
        $adapter = Get-NetAdapter | Where-Object {$_.Status -eq "up"} 

       # Remove any existing IP, gateway from our ipv4 adapter
       If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
         $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
    }

       If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
        $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
    }

    # Configure the IP address and default gateway
    $adapter | New-NetIPAddress `
    -AddressFamily $IPType `
    -IPAddress $IP `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway

    # Configure the DNS client server IP addresses
    $adapter | Set-DnsClientServerAddress -ServerAddresses ($DNS)
}

function introGPI {

$t = @"
   __              _____ _____ _____             ____  _    _ __  __  ____    _             _    _ _             
  / _|            / ____|  __ \_   _|      /\   / __ \| |  | |  \/  |/ __ \  | |           | |  (_) |            
 | |_ ___  _ __  | |  __| |__) || |______ /  \ | |  | | |  | | \  / | |  | | | |__  _   _  | | ___| |_ ___ _   _ 
 |  _/ _ \| '__| | | |_ |  ___/ | |______/ /\ \| |  | | |  | | |\/| | |  | | | '_ \| | | | | |/ / | __/ __| | | |
 | || (_) | |    | |__| | |    _| |_    / ____ \ |__| | |__| | |  | | |__| | | |_) | |_| | |   <| | |_\__ \ |_| |
 |_| \___/|_|     \_____|_|   |_____|  /_/    \_\____/ \____/|_|  |_|\____/  |_.__/ \__, | |_|\_\_|\__|___/\__,_| - ver 0.1.1 Alpha
                                                                                     __/ |                       
                                                                                    |___/                
                                                   
"@

for ($i=0;$i -lt $t.length;$i++) {
if ($i%2) {
 $c = "red"
}
elseif ($i%5) {
 $c = "yellow"
}
elseif ($i%7) {
 $c = "green"
}
else {
   $c = "white"
}
write-host $t[$i] -NoNewline -ForegroundColor $c
}
}

function ProcessingAnimation($scriptBlock) {
    $cursorTop = [Console]::CursorTop
    
    try {
        [Console]::CursorVisible = $false
        
        $counter = 0
        $frames = '|', '/', '-', '\' 
        $jobName = Start-Job -ScriptBlock $scriptBlock
    
        while($jobName.JobStateInfo.State -eq "Running") {
            $frame = $frames[$counter % $frames.Length]
            
            Write-Host "$frame" -NoNewLine
            [Console]::SetCursorPosition(0, $cursorTop)
            
            $counter += 1
            Start-Sleep -Milliseconds 125
        }
        
        # Only needed if you use a multiline frames
        Write-Host -ForegroundColor Magenta ($frames[0] -replace '[^\s+]', ' ')
    }
    finally {
        [Console]::SetCursorPosition(0, $cursorTop)
        [Console]::CursorVisible = $true
    }
}

function Set-WindowStyle {
param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE', 
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED', 
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    $Style = 'SHOW',
    [Parameter()]
    $MainWindowHandle = (Get-Process -Id $pid).MainWindowHandle
)
    $WindowStates = @{
        FORCEMINIMIZE   = 11; HIDE            = 0
        MAXIMIZE        = 3;  MINIMIZE        = 6
        RESTORE         = 9;  SHOW            = 5
        SHOWDEFAULT     = 10; SHOWMAXIMIZED   = 3
        SHOWMINIMIZED   = 2;  SHOWMINNOACTIVE = 7
        SHOWNA          = 8;  SHOWNOACTIVATE  = 4
        SHOWNORMAL      = 1
    }
    Write-Verbose ("Set Window Style {1} on handle {0}" -f $MainWindowHandle, $($WindowStates[$style]))

    $Win32ShowWindowAsync = Add-Type –memberDefinition @” 
    [DllImport("user32.dll")] 
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru

    $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$Style]) | Out-Null
}

#Lo script inizia qua, Prima sono solo funzioni.

Clear-Host

(Get-Process -Name powershell).MainWindowHandle | ForEach-Object { Set-WindowStyle MAXIMIZE $_ }

mainMenu