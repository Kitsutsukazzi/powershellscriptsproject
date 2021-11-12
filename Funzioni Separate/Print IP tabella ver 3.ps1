Write-Host "Disabilitazione di tcpip6 in corso"

Disable-NetAdapterBinding -Name Ethernet -ComponentID ms_tcpip6
Get-NetAdapterBinding -Name Ethernet -ComponentID ms_tcpip6

Write-Host "Settaggio di IP temporaneo per recupero dati di rete"

  # Imposta su tutte le schede di rete attive, quindi tenere acceso solo quella necessaria!
$adapter = Get-NetAdapter | ? {$_.Status -eq "up"}

# Rimuove gli IP prima di metterli 
$adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
$adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false

#Mette ip sempre libero per prendere il file excel
$adapter | New-NetIPAddress `
 -AddressFamily IPv4 `
 -IPAddress 172.16.20.159 `
 -PrefixLength 20 `
 -DefaultGateway 172.16.16.254 `


# Configura il primo server DNS, non so come configurare il secondo ancora.
$adapter | Set-DnsClientServerAddress -ServerAddresses 172.16.16.254

# Carica il file e crea le variabili per il file
$FilePath = '\\ntced\CED\AssistenzaPC\IP IN GESTIONE\2021-08-16 TabellaIP.xls'
$xl = New-Object -ComObject Excel.Application
$xl.Visible = $true
$wb = $xl.Workbooks.Open($filepath)

# Prendi la prima colonna
$data = $wb.Worksheets['Foglio1'].UsedRange.Rows.Columns[1].Value2
$data2 = $wb.Worksheets['Foglio1'].UsedRange.Rows.Columns[2].Value2

# Chiudi excel aperto per prendere i dati
$wb.close()
$xl.Quit()
While([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) -ge 0){}
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl) -ge 0){} 
Remove-Variable xl,wb # Rimuovi le due variabili create

# display results
$data | select -skip 1 # Rimuove il titolo sopra

# Variabili degli IP
$Rows = $data -split [Environment]::NewLine #Grazie iRon modo corretto per dividere IP
$RowsVerifica = $data2 -split [Environment]::NewLine

function Show-Menu
{
 param (
 [string]$Title = 'Scegli IP'
 )
 Clear-Host
 Write-Host "================ $Title ================"
 Write-Host "1: Cambia IP da tabella IP nuovi"
 Write-Host "Q: premi 'Q' per uscire."
}

Show-Menu –Title 'Scegli IP'
$selection = Read-Host 'Scegli la'

switch ($selection)
 {
     '1' {
         ' Scrivi la linea che contiene IP libero'

          $LineaScelta = Read-Host

          $IP = $($Rows[$LineaScelta])
          $MaskBits = 20 # subnet mask in bits = 255.255.240.0
          $Gateway = "172.16.111.254"
          $Dns = "172.16.16.1"
          $IPType = "IPv4"
     } 

     'q' { 
           return
         }
 }

# Rimuove gli IP prima di metterli 
If (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
 $adapter | Remove-NetIPAddress -AddressFamily $IPType -Confirm:$false
}

If (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
 $adapter | Remove-NetRoute -AddressFamily $IPType -Confirm:$false
}

 # Configura gli IP, CHE BESTEMMIE PER CAPIRE COME USARE

$adapter | New-NetIPAddress `
 -AddressFamily $IPType `
 -IPAddress $IP `
 -PrefixLength $MaskBits `
 -DefaultGateway $Gateway

# Configura il primo server DNS, non so come configurare il secondo ancora.
$adapter | Set-DnsClientServerAddress -ServerAddresses $DNS

