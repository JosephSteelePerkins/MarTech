
Set-Location "P:\Powershell\MarTech"

$CurrentRelease = "Build00001"
$Environment = "Diamond"
$LogFileName = 'Log_' + $CurrentRelease + "_" +  $(get-date).ToString("yyyyMMdd_HHmmss") + ".txt"

$LogFileNameFull = "P:\Powershell\Log\" + $LogFileName

if (Test-Path $LogFileNameFull) 
{
  Remove-Item $LogFileNameFull
}

New-Item $LogFileNameFull

$Scripts = @{}

$Errored = 0

"--" + $CurrentRelease

Get-ChildItem  -Filter $Environment*.sql | 
Foreach-Object {
    $content = Get-Content $_.FullName
    
    $line = ""

    $content | Where-Object {$_ -match ("--" + $CurrentRelease)} |  Set-Variable  "line" 

    if ($line -ne "")
    {
    $Path = $_.FullName
    $PositionOfReleaseOrder = $line.IndexOf("*")

        if ($PositionOfReleaseOrder -gt 0 )

        {
        $ReleaseOrder = [int]$line.Substring($PositionOfReleaseOrder+1,2)
        }
        else
        {
        $ReleaseOrder = [int]"50"
        }

    $Scripts.add($_.FullName, $ReleaseOrder )   
    }
}

$Scripts = $Scripts.GetEnumerator() | sort -Property value

ForEach ($d in $Scripts)
{

try
{

#$d.Key
Invoke-Sqlcmd -InputFile $d.Key -ServerInstance "(local)" -ErrorAction Stop
}
catch
{

$Errored = $Errored + 1
Add-Content $LogFileNameFull ($d.Key + " " + $_)

}

}

if ($Errored -eq 0)
{
Add-Content $LogFileNameFull "Success"
}
