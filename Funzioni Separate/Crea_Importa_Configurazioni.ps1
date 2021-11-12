<#     
    .NOTES 
    =========================================================================== 
     Created with:     SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.172 
     Created on:       23/10/2021 00:29 
     Created by:       Kitsu 
     Organization:      
     Filename:          
    =========================================================================== 
    .DESCRIPTION 
        A description of the file. 
#> 
 
function New-Config 
{ 
    #COntrolla se c'è la directory, se non c'è creala  
    if (!(Test-Path -Path "$env:LOCALAPPDATA\GPI\Startatore")) 
    { 
        New-Item -ItemType Directory -Path "$env:LOCALAPPDATA\GPI\Startatore" 
    } 
     
    #Imposta le configurazioni     
    #Crea un tavolo hash e imposta le value basate su $weburl impostato nella cosa di testo. 
    $Config = @{ 
        'ConfigProperty1' = $WebUrl 
    } 
    $Config | Export-Clixml -Path "$env:LOCALAPPDATA\GPI\Startatore\Config.config" 
    Import-Config 
} #Finita funzione New-Game 
 
function Import-Config 
{ 
    #se c'è un file config, viene importato nelle impostazioni, se non c'è, lo crea 
     
    if (Test-Path -Path "$env:LOCALAPPDATA\GPI\Startatore\Config.config") 
    { 
        try 
        { 
            #Importa la configurazione e crea il file se non c'è' 
            $Config = Import-Clixml -Path "$env:LOCALAPPDATA\GPI\Startatore\Config.config" 
             
            #Crea una variabile basata sul file 
            $global:WebUrl = $Config.ConfigProperty1 
        } 
        catch 
        { 
            [System.Windows.Forms.MessageBox]::Show("C'è stato un errore ma ora creo un file config per te $_", 'Importatore errore', 'OK', 'Errore') 
            New-Config 
        } 
    } #Finito se il file esiste 
    else 
    { 
        New-Config 
    } 
} #Finita funzione 
