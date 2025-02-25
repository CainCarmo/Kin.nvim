$knvim_paths = @("$env:LOCALAPPDATA/nvim", "$env:LOCALAPPDATA/nvim-data")

function BackupKnvim {
  Write-Host " 🍡 Kin.nvim Uninstaller "
  Write-Host "─────────────────────────"
  Write-Host ""

  $confirm = Read-Host "Do you want to backup your 'knvim.lua' configuration? [y/N] "

  $knvim_file_path = "$env:LOCALAPPDATA/nvim/lua/user/knvim.lua"
  $knvim_backup_path = "$env:LOCALAPPDATA/nvim.bak/"

  if (Test-Path -Path "$knvim_file_path" && $confirm -match "^[yY]$") {
    New-Item -Path "$knvim_backup_path" -ItemType Directory -Force
    Copy-Item -Path "$knvim_file_path" -Destination "$knvim_backup_path" -Force

    Write-Host "✔ Backup created: $knvim_backup_path"
  }
  else {
    Write-Host (Test-Path -Path "$knvim_file_path") ? "⚠ File 'knvim.lua' not found." : "⚠ Backup skipped..."
  }
}

function Uninstaller {
  BackupKnvim

  foreach ($path in $knvim_paths) {
    if (Test-Path -Path $path) {
      Remove-Item -Path $path -Recurse -Force
      Write-Host "✔ Removed: $path"
    }
    else {
      Write-Host "⚠ Path not found: $path"
    }
  }
}

Uninstaller
