#!/usr/bin/env bash

set -e

echo "🚀 Bootstrap development environment"

# ---------------------------------------------------
# Homebrew
# ---------------------------------------------------

if ! command -v brew >/dev/null 2>&1; then
  echo "📦 Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---------------------------------------------------
# chezmoi
# ---------------------------------------------------

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "📦 Installing chezmoi..."

  brew install chezmoi
fi

# ---------------------------------------------------
# Apply dotfiles
# ---------------------------------------------------

echo "📂 Applying dotfiles..."

chezmoi init --apply YOUR_GITHUB_NAME

# ---------------------------------------------------
# Brew Bundle
# ---------------------------------------------------

echo "📦 Installing Brew packages..."

brew bundle --file="$HOME/.local/share/chezmoi/Brewfile"

# ---------------------------------------------------
# Corepack / pnpm
# ---------------------------------------------------

echo "📦 Enabling corepack..."

corepack enable || true

corepack prepare pnpm@latest --activate || true

# ---------------------------------------------------
# TPM (tmux plugin manager)
# ---------------------------------------------------

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ---------------------------------------------------
# Done
# ---------------------------------------------------

echo ""
echo "✅ Bootstrap complete!"
echo ""
echo "Please restart your terminal."
