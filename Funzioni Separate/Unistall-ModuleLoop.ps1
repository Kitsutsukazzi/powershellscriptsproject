Function Unistall-PolicyFileEditor
{
	Clear-Host
	
	while ($true)
	{
		Write-Host "Provo solo a togliere di nuovo il modulo"
		
		try
		{
			Uninstall-Module -Name PolicyFileEditor -AllVersions -Force -Verbose
			
			Write-Host "Ci sono riuscito!"
			
			break
		}
		catch
		{
			Start-Sleep "3"
			Write-Warning "Niente, ci Riprovo"
			Start-Sleep "3"
		}
	}
	
}