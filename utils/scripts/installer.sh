#!/usr/bin/env bash

if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi

if [ -d "$HOME/.local/share/nvim" ]; then
  mv "$HOME/.local/share/nvim" "$HOME/.local/share/nvim.bak"
fi

if [ -d "$HOME/.local/state/nvim" ]; then
  mv "$HOME/.local/state/nvim" "$HOME/.local/state/nvim.bak"
fi

if [ -d "$HOME/.cache/nvim" ]; then
  mv "$HOME/.cache/nvim" "$HOME/.cache/nvim.bak"
fi

if git clone https://github.com/CainCarmo/Kin.nvim.git --depth 1 "$HOME/.config/nvim"; then
  cd "$HOME/.config/nvim" && rm -rf ".git"  && nvim
else
  echo "Failed to clone the repository. Exiting."
  exit 1
fi
