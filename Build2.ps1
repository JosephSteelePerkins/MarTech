
Set-Location $PSScriptRoot

    #enter the ID of the build/release. This will appear in all the scripts being run as part of this build.

$CurrentRelease = "Build00002"

    #enter the environment

$Environment = "Diamond"

    #set the name of the log file. This is the build/release ID puls the date and time

$LogFileName = 'Log_' + $CurrentRelease + "_" +  $(get-date).ToString("yyyyMMdd_HHmmss") + ".txt"

    #then append the name of the log file to the path. This will always be C:\MarTechLog\ so it is a prerequiste of every environment that this folder exists

$LogFileNameFull = "C:\MarTechLog\" + $LogFileName


    if (Test-Path $LogFileNameFull) 
    {
      Remove-Item $LogFileNameFull
    }

    #create the empty log file

New-Item $LogFileNameFull | out-null 

    #Create an empty hashtable. This will hold script path and run order

$Scripts = @{}

    #initialise the Errored variable to 0

$Errored = 0

    #"--" + $CurrentRelease

    #get every file that begins with the environment variable and ends in SQL

Write-Host ( Get-ChildItem -Filter $Environment*.sql  | Measure-Object ).Count;

Get-ChildItem  -Filter Diamond*.sql C:\Users\User\MarTech | 
Foreach-Object {
 Write-Host 1
 }

