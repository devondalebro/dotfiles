#!/bin/bash

# Define the location of your dotfiles
DOTFILES="$HOME/dotfiles"

echo "🔗 Setting up Symlinks..."

# --- 1. Neovim ---
echo "Linking Neovim..."
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"

if [[ ! "$1" == "nix" ]]; then
	# --- 3. Tmux ---
	echo "Linking Tmux..."
	rm -rf "$HOME/.config/tmux"
	ln -s "$DOTFILES/tmux" "$HOME/.config/tmux"
	tmux source-file ~/.config/tmux/tmux.conf

	# --- 3. AeroSpace ---
	echo "Linking AeroSpace..."
	rm -f "$HOME/.aerospace.toml"
	ln -s "$DOTFILES/aerospace/aerospace.toml" "$HOME/.aerospace.toml"
	aerospace reload-config

	# --- 4. Zsh (Shell) ---
	echo "Linking Zshrc..."
	rm -f "$HOME/.zshrc"
	ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

	# --- 5. Scripts ---
	echo "Linking Scripts..."
	rm -rf "$HOME/scripts"
	ln -s "$DOTFILES/scripts" "$HOME/scripts"

	# SAFETY NET: Force all scripts to be executable
	echo "⚙️  Making scripts executable..."
	chmod +x "$DOTFILES/scripts/"*

	echo "✅ All done! Please restart your terminal."
fi
