##--MAR-22*01

Set-Location $PSScriptRoot

## back up packages first. For rollback

if(Test-Path "C:\SSIS\Package1.dtsx")
{Copy-Item "C:\SSIS\Package1.dtsx" -Destination "C:\SSIS\Package1_MAR-22.dtsx"}

if(Test-Path "C:\SSIS\Package2.dtsx")
{Copy-Item "C:\SSIS\Package2.dtsx" -Destination "C:\SSIS\Package2_MAR-22.dtsx"}

Copy-Item "Package1.dtsx" -Destination "C:\SSIS"
Copy-Item "Package2.dtsx" -Destination "C:\SSIS"