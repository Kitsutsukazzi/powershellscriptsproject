# Carica il file e crea le variabili per il file
$FilePath = '\\ntced\CED\AssistenzaPC\IP IN GESTIONE\2021-08-16 TabellaIP.xls'
$xl = New-Object -ComObject Excel.Application
$xl.Visible = $false
$wb = $xl.Workbooks.Open($filepath)

# Prendi la prima colonna
$data = $wb.Worksheets[1].UsedRange.Rows.Columns[1].Value2

# Chiudi excel aperto per prendere i dati
$wb.close()
$xl.Quit()
While([System.Runtime.Interopservices.Marshal]::ReleaseComObject($wb) -ge 0){}
while([System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl) -ge 0){} 
Remove-Variable xl,wb # Rimuovi le due variabili create

# display results
$data | select -skip 1 

 # Rimuove il titolo sopra