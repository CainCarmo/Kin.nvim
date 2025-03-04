$knvim_paths = @("$env:LOCALAPPDATA/nvim", "$env:LOCALAPPDATA/nvim-data")

function BackupManager {
  param (
    [string]$knvim_path,
    [string]$backup_path
  )

  if (Test-Path -Path "$backup_path/knvim.lua") {
    Copy-Item -Path "$backup_path/knvim.lua" -Destination "$knvim_path/lua/user/knvim.lua" -Force

    Write-Host $((Test-Path -Path "$knvim_path/lua/user/knvim.lua") ? "✔ File restored: $knvim_path/lua/user/knvim.lua" : "🗙 Failed to restore file: $knvim_path/lua/user/knvim.lua")
  }
  else {
    Get-ChildItem -Path $backup_path -Recurse -File | ForEach-Object {
      $destination = $_.FullName -replace [regex]::Escape($backup_path), $knvim_path

      New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
      Copy-Item -Path $_.FullName -Destination $destination -Force

      Write-Host $((Test-Path -Path $destination) ? "✔ Backup successful. File saved at '$destination'." : "⚠ Backup failed. File not saved at '$destination'.")
    }
  }
}

function BackupChecker {
  $knvim_path = "$env:LOCALAPPDATA/nvim"
  $backup_path = "$env:LOCALAPPDATA/knvim.bak"

  if (Test-Path -Path $backup_path) {
    $confirm_restore = Read-Host "Backup found. Do you want to restore it? [y/N] "
    Write-Host ""

    if ($confirm_restore -match "^[yY]$") {
      BackupManager -knvim_path $knvim_path -backup_path $backup_path
    }
    else {
      Write-Host "⚠ Restore aborted."
    }

    $confirm_delete = Read-Host "Do you want to delete the backup directory? [y/N] "
    Write-Host ""

    if ($confirm_delete -match "^[yY]$") {
      $confirm_delete_final = Read-Host "Are you sure you want to delete the backup directory? This action cannot be undone. [y/N] "
      Write-Host ""

      if ($confirm_delete_final -match "^[yY]$") {
        Remove-Item -Path $backup_path -Recurse -Force
        Write-Host "✔ Backup deleted."
      }
      else {
        Write-Host "⚠ Backup kept."
      }
    }
    else {
      Write-Host "⚠ Deletion aborted."
    }
  }
}

function Installer {
  Write-Host ""
  Write-Host " 🍡 Kin.nvim Installer "
  Write-Host "────────────────────────"
  Write-Host ""

  if (Test-Path -Path $knvim_paths[0]) {
    $confirm_backup = Read-Host "Existing Neovim configuration found. Do you want to backup it? [y/N] "
    Write-Host ""

    if ($confirm_backup -match "^[yY]$") {
      Move-Item -Path $knvim_paths[0] -Destination "$env:LOCALAPPDATA/nvim.old" -Force
      Remove-Item -Path $knvim_paths[1] -Recurse -Force

      Write-Host "✔ Backup successful. Old configuration saved at '$env:LOCALAPPDATA/nvim.old'."
    }
    else {
      $confirm_overwrite = Read-Host "Do you want to overwrite the existing configuration? [y/N] "
      Write-Host ""

      if (-not ($confirm_overwrite -match "^[yY]$")) {
        Write-Host "⚠ Installation aborted."
        Return
      }

      foreach ($path in $knvim_paths) {
        Remove-Item -Path $path -Recurse -Force
      }
    }
  }

  try {
    git clone https://github.com/CainCarmo/Kin.nvim.git --depth 1 "$env:LOCALAPPDATA/nvim"
    Remove-Item -Path "$env:LOCALAPPDATA/nvim/.git" -Recurse -Force

    BackupChecker
    nvim
  }
  catch {
    Write-Host "🗙 Failed to clone the repository. Exiting."
    exit 1
  }
}

Installer
