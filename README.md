# 🚀 Dotfiles

Personal terminal-native development environment powered by:

* tmux
* Neovim
* zsh
* chezmoi
* Homebrew
* modern CLI tools
* AI-native workflow

---

# ✨ Features

## Shell

* zsh
* starship prompt
* zoxide smart cd
* atuin shell history
* fzf integration
* autosuggestions
* syntax highlighting

---

## Terminal Workflow

* tmux popup workflow
* persistent Claude Code session
* lazygit popup
* yazi file manager
* modern CLI UX

---

## Modern CLI Tools

* eza
* bat
* ripgrep
* fd
* btop
* jq
* lazygit
* yazi
* watchman

---

## Dev Environment

* fnm
* corepack
* pnpm
* Go
* Zig
* Kubernetes tooling

---

# 📦 Bootstrap

## 1. Install

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_NAME/dotfiles/main/install.sh | bash
```

---

## 2. Restart terminal

```bash
exec zsh
```

---

# 🧠 Tmux Workflow

## Claude popup

```text
Prefix + y
```

Open persistent Claude Code popup session.

---

## Lazygit popup

```text
Prefix + g
```

Open lazygit in popup window.

---

# ⚡ Useful Aliases

```bash
ll    # eza -la --icons --git
v     # nvim
lg    # lazygit
y     # yazi
k     # kubectl
```

---

# 📁 Structure

```text
.
├── Brewfile
├── install.sh
├── dot_zshrc
├── dot_tmux.conf
├── dot_aliases
└── dot_config/
```

---

# 🔄 Sync Changes

## Update dotfiles

```bash
chezmoi add ~/.zshrc
chezmoi add ~/.tmux.conf
```

## Apply changes

```bash
chezmoi apply
```

## Update Brewfile

```bash
brew bundle dump --force
```

---

# 🛠 Restore Environment

```bash
brew bundle
```

---

# 📚 Philosophy

This setup focuses on:

* terminal-first workflow
* keyboard-driven development
* reproducible environments
* AI-native engineering
* cloud-native tooling

---

# 🔥 Inspired By

* modern unix tooling
* terminal-native developers
* cloud-native workflows
* AI-assisted development

