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
        $timeStamp = Get-Date -Uformat %d%m%y%H%M
        # opzione 1 di cambio IP
        if($subMenu1 -eq 1){
            subCambioIP
        }
        # opzione 2
        if($subMenu1 -eq 2){
            Write-Host 'Test!'
            # Pause e aspetta un input per tornare indietro
            Write-Host -ForegroundColor DarkCyan "`nScript Eseguito correttamente"
            Write-Host "`nPremi un tasto qualsiasi per tornare indietro"
            [void][System.Console]::ReadKey($true)
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
        # Opzione 1
        if($subMenu2 -eq 1){
            Get-Process
            # Pause e aspetta un input per tornare indietro
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Opzione 2
        if($subMenu2 -eq 2){
            $PSVersionTable.PSVersion
            # Pause e aspetta un input per tornare indietro
            Write-Host -ForegroundColor DarkCyan "`nScript execution complete."
            Write-Host "`nPress any key to return to the previous menu"
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
            Write-Host -ForegroundColor Cyan "20.153"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.153"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.154"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.155"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.156"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor Cyan "20.157"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
        $subCambioIP = Read-Host "`nSelezione (lascia vuoto per uscire)"

        if($subCambioIP -eq 1){
                
            $IP = "172.16.20.158"
            $MaskBits = 20 # Subnet in BITS di rete = 255.255.240.0
            $Gateway = "172.16.16.254"
            $Dns = "172.16.16.1"
            $IPType = "IPv4"

            CambioIP

            Write-Host -ForegroundColor DarkCyan "`nCambio dell'IP eseguito"
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }


   }

}

 
function CambioIP {

       # Predi le informazioni sul SIC
        $adapter = Get-NetAdapter | ? {$_.Status -eq "up"} 

       # Rimuove IP e gateway dalla scheda
       If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
         $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
    }

       If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
        $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
    }

    # Configura IP e cose
    $adapter | New-NetIPAddress `
    -AddressFamily $IPType `
    -IPAddress $IP `
    -PrefixLength $MaskBits `
    -DefaultGateway $Gateway

    # Configura il DNS
    $adapter | Set-DnsClientServerAddress -ServerAddresses ($DNS,172.16.16.2)
}

mainMenu
