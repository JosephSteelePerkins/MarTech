Set-Location $PSScriptRoot

    #first prepare the log file.


$LogFileName = 'Log_GitPull_' +  $(get-date).ToString("yyyyMMdd_HHmmss") + ".txt"
$LogFileNameFull = "C:\MarTechLog\" + $LogFileName
$Errored = 0

    if (Test-Path $LogFileNameFull) 
    {
      Remove-Item $LogFileNameFull
    }

New-Item $LogFileNameFull | out-null


    #then, try to get a releaseID

$line = ""

$ErrorActionPreference = "stop"

#also needs to handle this error
#error: pathspec 'release67' did not match any file(s) known to git


try
{

$r = Get-Content 'C:\MarTechReleaseIDs\Systest.txt'

        #get the lines from the file contents that match the build/release ID. Assign to the line variable

$r | Where-Object {$_ -match ("Release:")} |  Set-Variable  "line" 


$ReleaseID = $line.Substring(8)
}
catch
{
$ErrorM = $_
Add-Content $LogFileNameFull ($ErrorM)
exit

}

    #if you've got this far and the ReleaseID is empty that means there is no id. Add this to the log file

if (! $ReleaseID) {
Add-Content $LogFileNameFull ("No release ID")

exit}


$ErrorActionPreference = "continue"





git fetch
git checkout master

$ErrorActionPreference = "stop"

    #the following will always generate an error

try{

git checkout -b $ReleaseID origin/$ReleaseID

}
catch {

   #check to see if there is a fatal git error
$GitError = $_ | Select-String  -Pattern "fatal"

 
    if (! $GitError)
    {
        #if there is not then add success to the log
       
    Add-Content $LogFileNameFull 'Success'
    }
    elseif ($GitError -like "fatal: A branch named * already exists.")
    {
    $ErrorActionPreference = "continue"
    git checkout $ReleaseID
    git pull
    Add-Content $LogFileNameFull 'Success'}
    else
    {
    Add-Content $LogFileNameFull $GitError
    }

}