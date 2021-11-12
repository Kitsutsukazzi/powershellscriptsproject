function BlastFromThePast(){
	if(!$tickcounter){ Set-Variable -Name "tickcounter" -Scope global -Value 0 -Force -Option AllScope }
	if(!$tickoption){ Set-Variable -Name "tickoption" -Scope global -Value 0 -Force -Option AllScope }
	$chance = Get-Random -Minimum 1 -Maximum 10
	if($chance -eq 5){ if($tickoption -eq 1){$tickoption = 0}else{$tickoption = 1} }
	switch($tickoption){
		0 {
			switch($tickcounter){
				0 { Write-Host "`r|" -NoNewline }
				1 { Write-Host "`r/" -NoNewline }
				2 { Write-Host "`r-" -NoNewline }
				3 { Write-Host "`r\" -NoNewline }
			}
			break;
		}
		1 {
			switch($tickcounter){
				0 { Write-Host "`r|" -NoNewline }
				1 { Write-Host "`r\" -NoNewline }
				2 { Write-Host "`r-" -NoNewline }
				3 { Write-Host "`r/" -NoNewline }
			}
			break;
		}
	}
	if($tickcounter -eq 3){ $tickcounter = 0 }
	else{ $tickcounter++ }
}

BlastFromThePast
