#!/usr/bin/env bash

backup_manager() {
  knvim_path="$1"
  backup_path="$2"

  find "$backup_path" -type f | while read -r file; do
    destination="${file/$backup_path/$knvim_path}"

    mkdir -p "$(dirname "$destination")"
    cp -p "$file" "$destination"

    [[ -f "$destination" ]] && echo "✔ File restored: $destination" || echo "🗙 Failed to restore file: $destination"
  done
}

backup_checker() {
  kvnim_path="$HOME/.config/nvim"
  backup_path="$HOME/.config/knvim.bak"

  if [[ -d "$backup_path" ]]; then
    read -n 1 -r -p "Backup found. Do you want to restore it? [y/N] " confirm_restore
    echo ""

    if [[ $confirm_restore =~ ^[Yy]$ ]]; then
      backup_manager "$kvnim_path" "$backup_path"
    else
      echo "⚠ Restore aborted."
    fi

    read -n 1 -r -p "Do you want to delete the backup? [y/N] " confirm_delete
    echo ""

    if [[ $confirm_delete =~ ^[Yy]$ ]]; then
      read -n 1 -r -p "Are you sure you want to delete the backup? This action cannot be undone. [y/N] " confirm_delete_final
      echo ""

      if [[ "$confirm_delete_final" =~ ^[Yy]$ ]]; then
        rm -rf "$backup_path"
        echo "✔ Backup deleted."
      else
        echo "⚠ Backup kept."
      fi
    else
      echo "⚠ Deletion aborted."
    fi
  else
    echo "⚠ No backup found."
  fi
}

installer() {
  echo ""
  echo " 🍡 Kin.nvim Installer "
  echo "───────────────────────"
  echo ""

  if [[ -d "$HOME/.config/nvim" ]]; then
    read -n 1 -r -p "Existing Neovim configuration found. Do you want to backup it? [y/N] " confirm_backup
    echo ""

    if [[ $confirm_backup =~ ^[Yy]$ ]]; then
      mv "$HOME/.config/nvim" "$HOME/.config/nvim.old"
      rm -rf "$HOME/.local/share/nvim"

      echo "✔ Backup successful. Old configuration saved at '$HOME/.cofig/nvim.old'."
    else
      read -n 1 -r -p "Do you want to overwrite the existing configuration? [y/N] " confirm_overwrite
      echo ""

      if [[ ! $confirm_overwrite =~ ^[Yy]$ ]]; then
        echo "⚠ Installation aborted."
        return 1
      fi

      rm -rf "$HOME/.config/nvim"
      rm -rf "$HOME/.local/share/nvim"
    fi
  fi

  if git clone https://github.com/CainCarmo/Kin.nvim.git --depth 1 "$HOME/.config/nvim"; then
    rm -rf "$HOME/.config/nvim/.git/" && backup_checker && nvim
  else
    echo "🗙 Failed to clone the repository. Exiting."
    exit 1
  fi
}

installer
