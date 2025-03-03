$knvim_paths = @("$env:LOCALAPPDATA/nvim", "$env:LOCALAPPDATA/nvim-data")

function BackupKnvim {
  Write-Host ""
  Write-Host " 🍡 Kin.nvim Uninstaller "
  Write-Host "─────────────────────────"
  Write-Host ""

  $confirm_backup = Read-Host "Do you want to backup your configuration? [y/N] "
  Write-Host ""

  if ($confirm_backup -match "^[yY]$") {
    $backup_path = "$env:LOCALAPPDATA/knvim.bak"

    if (Test-Path -Path $knvim_paths[0]) {
      $confirm_overwrite = Read-Host "Backup directory already exists. Do you want to overwrite it? [y/N] "
      Write-Host ""

      if ($confirm_overwrite -match "^[yY]$") {
        Remove-Item -Path $backup_path -Recurse -Force
      }
      else {
        Write-Host "⚠ Backup aborted."
        Return
      }
    }

    $confirm_knvim_dir = Read-Host "Do you want to backup the entire 'knvim' directory? [y/N] "
    Write-Host ""

    if ($confirm_knvim_dir -match "^[yY]$") {
      Move-Item -Path $knvim_paths[0] -Destination $backup_path
      Write-Host "✔ Backup successful. Directory saved at '$backup_path'."

      Return
    }

    $confirm_knvim_file = Read-Host "Do you want to backup only 'knvim.lua' configuration? [y/N] "
    Write-Host ""

    if ($confirm_knvim_file -match "^[yY]$") {
      New-Item -Path $backup_path -ItemType Directory -Force
      Move-Item -Path $([string]::Join("", $knvim_paths[0], "/lua/user/knvim.lua")) -Destination "$backup_path/knvim.lua"

      Write-Host "✔ Backup successful. File saved at '$backup_path/knvim.lua'."
    }
  }
  else {
    Write-Host "⚠ Backup skipped..."
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

  Write-Host ""
  Write-Host "🍡 Kin.nvim has been successfully uninstalled!"
}

Uninstaller
