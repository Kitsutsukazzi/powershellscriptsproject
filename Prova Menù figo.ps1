function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Preparazione Macchine AOUMO-GPI`n"
        Write-Host -ForegroundColor Cyan "Scegli L'Opzione Desiderata"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Menù Cambio IP"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Menù Cambio Nome"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
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
        $timeStamp = Get-Date -Uformat %d%m%y%H%M
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
        Write-Host "`n`t`t My Script`n"
        Write-Host -ForegroundColor Cyan "Sub Menu 2"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Show processes"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Show PS Version"
        $subMenu2 = Read-Host "`nSelection (leave blank to quit)"
        $timeStamp = Get-Date -Uformat %m%d%y%H%M
        # Option 1
        if($subMenu2 -eq 1){
            Get-Process
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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

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
        if($subCambioIP -eq 1){

            $MaskBits = 20 # This means subnet mask = 255.255.255.254
            $Dns = "172.16.16.1"
            $IPType = "IPv4"
            2
            CambioIP
            
            Clear-host

            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1
            write-Host "Configurazione IP in corso"; Start-Sleep -Seconds 1

            Start-Sleep -Seconds 2

            ipconfig

            Start-Sleep -Seconds 2

            Write-Host -ForegroundColor Red "`nCambio dell'IP eseguito"; 
            Write-Host -ForegroundColor Magenta "`nPremi un tasto qualsiasi per tornare indietro, DOPO AVER VERIFICATO IP"
            [void][System.Console]::ReadKey($true)
            
            mainMenu
    }


            }
}





function CambioIP {

         Disable-NetAdapterBinding –InterfaceAlias “Ethernet” –ComponentID ms_tcpip6 -ErrorAction SilentlyContinue

       # Retrieve the network adapter that you want to configure
        $adapter = Get-NetAdapter | ? {$_.Status -eq "up"} 

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
    $adapter | Set-DnsClientServerAddress -ServerAddresses ($DNS,"172.16.16.2")
}

mainMenu
