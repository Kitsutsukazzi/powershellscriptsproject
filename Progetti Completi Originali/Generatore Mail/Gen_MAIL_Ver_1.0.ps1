$Inventario = Read-Host "Numero di Inventario"

$Excel = New-Object -ComObject Excel.Application

$Workbook = $Excel.Workbooks.Open('C:\Users\Kitsu\Desktop\PC_attivi.xlsx')

$workSheet = $Workbook.Sheets.Item(1)

$WorkSheet.Name

$Found = $WorkSheet.Rows.EntireRow.Find($Inventario)

$BeginAddress = $Found.Row()

$data = $WorkBook.Worksheets['q_Export_per_STI'].UsedRange.Rows[$BeginAddress].Columns.Value2

$Rows = $data -split [Environment]::NewLine

$variables = @()
$i = 0
foreach ($row in ($data -split [Environment]::NewLine)) {
  # Crea una variabile per ogni riga
	New-Variable -Name "row$i" -Value $row
	
	Write-Host "Nuove Variabili dovrebbero già essere qui"
	
	
	
  # e un membro dell'array
  $variables += [pscustomobject]@{Name = "row$i"; Value = $row} # Copiato male, era troppo complicato arrivarci
  $i++
}



