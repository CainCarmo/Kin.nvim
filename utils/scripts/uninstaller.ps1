$paths = @("$env:USERPROFILE/AppData/Local/nvim", "$env:USERPROFILE/AppData/Local/nvim-data")

foreach ($path in $paths) {
  if (Test-Path -Path $path) {
    Remove-Item -Path $path -Recurse -Force
  }
}