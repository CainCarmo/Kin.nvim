if (Test-Path -Path "~/AppData/Local/nvim") {
  Remove-Item -Path "~/AppData/Local/nvim" -Recurse -Force
}

if (Test-Path -Path "~/AppData/Local/nvim-data") {
  Remove-Item -Path "~/AppData/Local/nvim-data" -Recurse -Force
}