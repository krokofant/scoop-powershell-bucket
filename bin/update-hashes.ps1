$modulesFolder = Join-Path -Resolve $PSScriptRoot "../" "modules"
$modules = Get-ChildItem $modulesFolder

function Get-Hash($string) {
  $tempFile = New-TemporaryFile
  Set-Content $tempFile $string
  $hash = Get-FileHash $tempFile
  $tempFile.Delete()
  return $hash.Hash
}

foreach ($module in $modules) {
    $fileFilter = @(".psd1", ".psm1")
    $files = $module.GetFiles() | Where-Object { $fileFilter -contains $_.Extension }
    $hash = Get-Hash ($files | ForEach-Object { Get-Content $_ })
    $hashFileName = Join-Path $module.FullName "SHASUM256.txt"
    Set-Content $hashFileName $hash -NoNewline
}
