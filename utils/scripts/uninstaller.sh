#!/usr/bin/env bash

backup_knvim() {
  echo " 🍡 Kin.nvim Uninstaller "
  echo "─────────────────────────"
  echo ""

  read -n 1 -r -p "Do you want to backup your 'knvim.lua' configuration? [y/N] " confirm_knvim
  echo ""

  knvim_file_path="$HOME/.config/nvim/lua/user/knvim.lua"
  knvim_backup_path="$HOME/.config/nvim.bak/"

  if [[ -f "$knvim_file_path" && "$confirm_knvim" =~ ^[Yy]$ ]]; then
    mkdir -p "$knvim_backup_path"

    if mv "$knvim_file_path" "$knvim_backup_path/"; then
      echo "✔ Backup successful. File saved at '$knvim_backup_path'."
    else
      echo "🗙 Backup failed."
    fi
  else
    [[ ! -f "$knvim_file_path" ]] && echo "⚠ File 'knvim.lua' not found." || echo "⚠ Backup skipped..."
  fi
}

uninstaller() {
  backup_knvim

  if [ -d "$HOME/.config/nvim" ]; then
    rm -rf "$HOME/.config/nvim"
    echo "✔ Deleted file: $HOME/.config/nvim"
  fi

  if [ -d "$HOME/.local/share/nvim" ]; then
    rm -rf "$HOME/.local/share/nvim"
    echo "✔ Deleted file: $HOME/.local/share/nvim"
  fi

  if [ -d "$HOME/.local/state/nvim" ]; then
    rm -rf "$HOME/.local/state/nvim"
    echo "✔ Deleted file: $HOME/.local/state/nvim"
  fi

  if [ -d "$HOME/.cache/nvim" ]; then
    rm -rf "$HOME/.cache/nvim"
    echo "✔ Deleted file: $HOME/.cache/nvim"
  fi
}

uninstaller
