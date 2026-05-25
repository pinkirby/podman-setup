#!/bin/sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:pinkirby/dotfiles.git -b "$HOME/.local/bin"
