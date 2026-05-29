# Neovim Setup

How to install or update this Neovim config on a new machine from this repo.

## Requirements

- Neovim 0.12+ (the config uses APIs added in 0.12, including the new `vim.lsp.config` interface)
- `git`
- A C compiler in `$PATH` (treesitter compiles parsers on first run)
- A [Nerd Font](https://www.nerdfonts.com/) set as your terminal font (icons in `nvim-tree`, `lualine`, `bufferline`)

Optional but recommended:

- `ripgrep` and `fd` — used by Telescope for fast file/content search (`search_telescope.lua` calls `fd` directly)
- `node` and `npm` — used by `markdown-preview.nvim` (`build = "cd app && npm install"`) and any LSP server installed through Mason
- `bundle` / `ruby-lsp` gem — only if you want the Ruby LSP wired up by `lsp_ruby.lua`

On macOS:

```sh
brew install neovim ripgrep fd node
```

## Fresh install

The config lives at `.config/nvim/` in this repo and is meant to be dropped into `~/.config/nvim/`.

1. Back up anything that's already there:

   ```sh
   [ -e ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
   [ -e ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
   [ -e ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
   ```

2. Clone this repo somewhere you keep projects:

   ```sh
   git clone git@github.com:alexsmartens/dotfiles.git ~/projects/dotfiles
   ```

3. Symlink the nvim directory into `~/.config/`:

   ```sh
   mkdir -p ~/.config
   ln -s ~/projects/dotfiles/.config/nvim ~/.config/nvim
   ```

   A symlink (rather than a copy) is the point — edits made to the live config are also edits to the repo, so syncing back is just `git diff`.

4. Launch `nvim`. On first start, `init.lua` bootstraps `lazy.nvim` into `~/.local/share/nvim/lazy/lazy.nvim` and installs every plugin under `lua/plugins/`. Treesitter parsers compile in the background; let it finish before quitting.

5. Verify:

   ```vim
   :checkhealth
   :Lazy
   ```

## Updating an existing setup

If `~/.config/nvim` is already a symlink into this repo, just pull:

```sh
cd ~/projects/dotfiles && git pull
```

Then in nvim:

```vim
:Lazy sync     " update plugins to versions in lazy-lock.json
:TSUpdate      " update treesitter parsers
```

If `~/.config/nvim` is a real directory (not a symlink), you have two options:

- **Switch to the symlink approach** — follow the "Fresh install" steps above; your old config is preserved as `~/.config/nvim.bak`.
- **Cherry-pick changes** — `diff -r ~/.config/nvim ~/projects/dotfiles/.config/nvim` and copy across what you want.

## Layout

```
.config/nvim/
├── init.lua                  # bootstraps lazy.nvim, loads everything under lua/configs and lua/plugins
├── lua/
│   ├── configs/              # editor settings (basics, keymaps, visual)
│   ├── plugins/              # one file per plugin, auto-loaded by init.lua
│   └── utils/                # shared helpers
├── queries/                  # custom treesitter queries (e.g. ruby)
├── spell/                    # personal spellfile (en.utf-8.add)
└── lazy-lock.json            # pinned plugin versions — commit this
```

Adding a plugin: drop a new file in `lua/plugins/` returning a lazy.nvim spec table, then `:Lazy sync`. No registration anywhere else.

## Pinning and lockfile

`lazy-lock.json` is committed. After `:Lazy sync` updates plugins on one machine, commit the resulting lock change so other machines get the same versions on their next pull.

## Troubleshooting

- **Icons render as boxes** — terminal font isn't a Nerd Font.
- **Telescope file search is empty or slow** — install `fd` and `ripgrep`.
- **`MarkdownPreview` errors on first use** — the `npm install` build step needs `node`/`npm` on `$PATH`.
- **LSP not attaching for Ruby** — `bundle exec ruby-lsp` has to work from the project root; the config shells out to `bundle` directly.
- **Plugins look broken after pulling** — run `:Lazy sync` (and `:TSUpdate` if treesitter highlighting is off).
