#!/usr/bin/env bash

backup_knvim() {
  read -n 1 -r -p "Do you want to backup your configuration? [y/N] " confirm_backup
  echo ""

  if [[ "$confirm_backup" ]]; then
    knvim_path="$HOME/.config/nvim"
    backup_path="$HOME/.config/knvim.bak"

    if [[ -d "$backup_path" ]]; then
      read -n 1 -r -p "Backup directory already exists. Do you want to overwrite it? [y/N] " confirm_overwrite
      echo ""

      if [[ $confirm_overwrite =~ ^[Yy]$ ]]; then
        rm -rf "$backup_path"
      else
        echo "⚠ Backup aborted."
        return 0
      fi
    fi

    read -n 1 -r -p "Do you want to backup the entire 'knvim' directory? [y/N] " confirm_knvim_dir
    echo ""

    if [[ "$confirm_knvim_dir" =~ ^[Yy]$ ]]; then
      if mv "$knvim_path" "$backup_path"; then
        echo "✔ Backup successful. Directory saved at '$backup_path'."
      else
        echo "🗙 Backup failed."
      fi

      return 0
    fi

    read -n 1 -r -p "Do you want to backup only 'knvim.lua' configuration? [y/N] " confirm_knvim_file
    echo ""

    if [[ "$confirm_knvim_file" =~ ^[Yy]$ ]]; then
      mkdir -p "$backup_path"
      mv "$knvim_path/lua/user/knvim.lua" "$backup_path/knvim.lua"

      echo "✔ Backup successful. File saved at '$backup_path/knvim.lua'."
    fi
  else
    echo "⚠ Backup skipped..."
  fi
}

uninstaller() {
  echo ""
  echo " 🍡 Kin.nvim Uninstaller "
  echo "─────────────────────────"
  echo ""

  backup_knvim

  if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    echo "✔ Deleted directory: $HOME/.config/nvim"
  fi

  if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
    echo "✔ Deleted directory: $HOME/.local/share/nvim"
  fi

  if [ -d "$HOME/.local/state/nvim" ]; then
    rm -rf "$HOME/.local/state/nvim"
    echo "✔ Deleted directory: $HOME/.local/state/nvim"
  fi

  if [ -d "$HOME/.cache/nvim" ]; then
    rm -rf "$HOME/.cache/nvim"
    echo "✔ Deleted directory: $HOME/.cache/nvim"
  fi

  echo ""
  echo "🍡 Kin.nvim has been uninstalled."
}

uninstaller
