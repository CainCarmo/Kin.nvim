#!/usr/bin/env bash

if [ -d "$HOME/.config/nvim" ]; then
  rm -rf "$HOME/.config/nvim"
fi

if [ -d "$HOME/.local/share/nvim" ]; then
  rm -rf "$HOME/.local/share/nvim"
fi

if [ -d "$HOME/.local/state/nvim" ]; then
  rm -rf "$HOME/.local/state/nvim"
fi

if [ -d "$HOME/.cache/nvim" ]; then
  rm -rf "$HOME/.cache/nvim"
fi
