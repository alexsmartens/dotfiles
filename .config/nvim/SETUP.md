# Neovim Setup

How to install or update this Neovim config on a new machine from this repo.

## Fresh install

From the repo root:

```sh
git clone git@github.com:alexsmartens/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./bootstrap.sh
```

`bootstrap.sh` installs the `Brewfile` packages, symlinks `~/.config/nvim` into the
repo, and points `git config --global core.hooksPath` at the repo's hooks. It is
idempotent, so re-run it any time. It backs up an existing `~/.config/nvim` rather
than overwriting it.

The symlink (rather than a copy) is the point — edits made to the live config are
also edits to the repo, so syncing back is just `git diff`.

Then launch `nvim`. On first start `init.lua` bootstraps `lazy.nvim` into
`~/.local/share/nvim/lazy/`, installs every plugin under `lua/plugins/`, and
compiles treesitter parsers. Let it finish before quitting, then verify with
`:checkhealth` and `:Lazy`.

## Requirements

`bootstrap.sh` handles all of these via the `Brewfile`:

| Package | Why |
| --- | --- |
| `neovim` 0.12+ | the config uses `vim.lsp.config` / `vim.lsp.enable` |
| `tree-sitter-cli` 0.26.1+ | nvim-treesitter's `main` branch builds parsers with it |
| `ripgrep`, `fd` | telescope; `search_telescope.lua` hardcodes `fd` as `find_command` |
| `node` | `markdown-preview.nvim` build step |
| `typos-lsp`, `typos-cli` | spell checking in the editor and in the commit-msg hook |
| `rbenv` | per-project Ruby versions for `ruby_lsp` |

Not installable via Homebrew:

- a C compiler in `$PATH` (Xcode command line tools on macOS)
- a [Nerd Font](https://www.nerdfonts.com/) set as your terminal font, for icons in
  `nvim-tree`, `lualine`, and `bufferline`

## Ruby LSP

`lsp_ruby.lua` runs `~/.rbenv/shims/ruby-lsp`, so rbenv resolves the Ruby version
per project from `.ruby-version`. Two consequences:

- `ruby-lsp` must be installed (`gem install ruby-lsp`) in **each** Ruby version you
  work in. It requires Ruby >= 3.0.
- A directory with no `.ruby-version` falls back to your rbenv global. If that
  version lacks the gem, the server exits and nvim reports it on every Ruby file.
  Fix it by adding a `.ruby-version` to the project.

The config deliberately does not use `bundle exec` — `ruby-lsp` locates a project's
Gemfile itself, and the prefix fails in directories without one.

## Spell checking

Two independent layers:

- **Built-in speller** — `opt.spell` in `lua/configs/basics.lua`, with
  `queries/ruby/highlights.scm` adding `((_) @spell)` so it covers code and not just
  comments. Catches any word absent from the dictionary; `zg` adds a word to
  `spell/en.utf-8.add`.
- **`typos-lsp`** — flags only known misspellings (`recieve` -> `receive`) and
  suggests the fix, at `Error` severity so it renders like `SpellBad`. It will not
  flag invented words.

The `commit-msg` hook in `.config/git/hooks/` runs the same engine over commit
messages, including `git commit -m`. It warns and always exits 0, so it never
blocks a commit.

Note `core.hooksPath` overrides each repo's own `.git/hooks`, so a project relying
on husky or lefthook will silently stop running its hooks while this is set.

## Layout

```
.config/nvim/
├── init.lua                  # bootstraps lazy.nvim, loads everything under lua/configs and lua/plugins
├── lua/
│   ├── configs/              # editor settings (basics, keymaps, visual)
│   ├── plugins/              # one file per plugin, auto-loaded by init.lua
│   └── utils/                # shared helpers
├── queries/                  # custom treesitter queries, appended with `; extends`
├── spell/                    # personal spellfile (en.utf-8.add)
└── lazy-lock.json            # untracked; see below
```

Adding a plugin: drop a new file in `lua/plugins/` returning a lazy.nvim spec table,
then `:Lazy sync`. No registration anywhere else.

Because `init.lua` merges every file by repo, two spec files for the same plugin
would leave only one `config` function — add to the existing file instead.

## Treesitter

Pinned to `branch = "main"` in `lua/plugins/treesitter.lua`. That branch is a full
rewrite: parsers are installed with `require("nvim-treesitter").install {}` rather
than `ensure_installed`, highlighting must be enabled by a `FileType` autocmd
calling `vim.treesitter.start()`, and it does not support lazy-loading. A
`master`-era config loads without error but does nothing.

Custom queries use a `; extends` first line so they append to upstream instead of
replacing it. Without it, a user query file overrides the whole upstream file and
silently freezes it at whatever was copied.

## Plugin versions

`lazy-lock.json` is currently **not** tracked. A fresh install ignores the lockfile
anyway — lazy only applies it on an explicit `:Lazy restore` — so committing it buys
rollback, not reproducibility. What actually pins a plugin is its spec: `branch`,
`tag`, `commit`, or `pin = true`.

## Updating an existing setup

```sh
cd ~/Projects/dotfiles && git pull && ./bootstrap.sh
```

Then in nvim: `:Lazy sync` and `:TSUpdate`.

## Troubleshooting

- **Icons render as boxes** — terminal font isn't a Nerd Font.
- **Telescope find_files errors** — `fd` is missing; run `./bootstrap.sh`.
- **`MarkdownPreview` errors on first use** — the `npm install` build step needs
  `node` on `$PATH`.
- **Ruby LSP exits immediately** — `ruby-lsp` isn't installed for the Ruby version
  rbenv resolves in that directory. See [Ruby LSP](#ruby-lsp).
- **No syntax highlighting, or spell check only works in comments** — treesitter
  isn't running. Check with `:Inspect`: if the output has no Treesitter section,
  the parser is missing or the config didn't start it. `:checkhealth nvim-treesitter`.
- **Plugins look broken after pulling** — `:Lazy sync`, then `:TSUpdate`.
