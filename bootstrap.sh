#!/usr/bin/env bash
# Set up this machine from the repo. Idempotent: re-running it is a no-op.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
warn() { printf '\033[1;33mwarning:\033[0m %s\n' "$1" >&2; }

log "Installing Homebrew packages"
if command -v brew >/dev/null 2>&1; then
  brew bundle --file="$REPO/Brewfile"
else
  warn "Homebrew not found, skipping packages. Install it from https://brew.sh"
fi

log "Linking ~/.config/nvim"
mkdir -p "$HOME/.config"
nvim_target="$REPO/.config/nvim"
nvim_link="$HOME/.config/nvim"
if [ -L "$nvim_link" ] && [ "$(readlink "$nvim_link")" = "$nvim_target" ]; then
  echo "    already linked"
elif [ -e "$nvim_link" ]; then
  backup="$nvim_link.bak.$(date +%Y%m%d%H%M%S)"
  warn "$nvim_link already exists, moving it to $backup"
  mv "$nvim_link" "$backup"
  ln -s "$nvim_target" "$nvim_link"
else
  ln -s "$nvim_target" "$nvim_link"
fi

# Overrides each repo's own .git/hooks, so anything relying on husky or
# lefthook stops running while this is set.
log "Pointing git at the repo's hooks"
git config --global core.hooksPath "$REPO/.config/git/hooks"

log "Checking ruby-lsp"
if command -v rbenv >/dev/null 2>&1; then
  ruby_version="$(rbenv version-name)"
  if gem list -i ruby-lsp >/dev/null 2>&1; then
    echo "    present for Ruby $ruby_version"
  else
    warn "ruby-lsp is missing for Ruby $ruby_version (the active rbenv version)."
    warn "Install it with 'gem install ruby-lsp' under a Ruby >= 3.0, and put a"
    warn ".ruby-version in any project where you want the LSP to attach."
  fi
else
  warn "rbenv not found, skipping the ruby-lsp check"
fi

log "Done. Start nvim; lazy.nvim installs plugins and treesitter parsers on first launch."
