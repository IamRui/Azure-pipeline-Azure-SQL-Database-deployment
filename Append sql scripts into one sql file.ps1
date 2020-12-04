$NewFileName = "Base.sql"
$path = "$(build.artifactstagingdirectory)\sql"
$outFile = "$path\$NewFileName"
 
cls
if((Test-Path $outFile) -eq $true) {Remove-Item -Path $outFile -Force}
 
$files = Get-ChildItem -LiteralPath $path -Include "*.sql" -Recurse | Sort-Object -Property Name
 
New-Item -ItemType file -Path $outFile -Force | Out-Null
 
foreach($file in $files)
{
    Write-Host "Appending file $file..." -ForegroundColor Gray
    $content = Get-Content -Path $file.FullName
    Add-Content -Path $outFile "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
    Add-Content -Path $outFile "--      $File"
    Add-Content -Path $outFile "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
    Add-Content -Path $outFile $content
    Add-Content -Path $outFile "GO`n"
}
 
Write-Host "Completed file $outFile" -ForegroundColor DarkGreen