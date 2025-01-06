#!/bin/bash
if [ -d ~/.cache/nvim ]; then
  rm -rf ~/.cache/nvim
fi

if [ -d ~/.config/nvim ]; then
  rm -rf ~/.config/nvim
fi

if [ -d ~/.local/share/nvim ]; then
  rm -rf ~/.local/share/nvim
fi

if [ -d ~/.local/state/nvim ]; then
  rm -rf ~/.local/state/nvim
fi