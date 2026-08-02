# Install everything with: brew bundle
# Run by bootstrap.sh; safe to run repeatedly.

brew "neovim"        # 0.12+ required: the config uses vim.lsp.config and vim.lsp.enable

brew "ripgrep"       # telescope live_grep
brew "fd"            # telescope find_files (hardcoded in search_telescope.lua)
brew "node"          # markdown-preview.nvim build step

brew "tree-sitter-cli" # required by nvim-treesitter's main branch to build parsers

brew "typos-lsp"     # spell checking in the editor, via LSP
brew "typos-cli"     # same engine as a CLI, used by the commit-msg hook

brew "rbenv"         # per-project Ruby versions; ruby_lsp resolves through its shims
