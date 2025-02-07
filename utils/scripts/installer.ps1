$paths = @("$env:USERPROFILE/AppData/Local/nvim", "$env:USERPROFILE/AppData/Local/nvim-data")

foreach ($path in $paths) {
  if (Test-Path -Path $path) {
    Copy-Item -Path $path -Destination "$path.bak" -Recurse
    Remove-Item -Path $path -Recurse -Force
  }
}

git clone https://github.com/CainCarmo/Kin.nvim.git --depth 1 "$env:USERPROFILE/AppData/Local/nvim" &&
Set-Location -Path "$env:USERPROFILE/AppData/Local/nvim" && nvim
