local g = vim.g

-- Set the global leader key to space
g.mapleader = " "
-- Set the local leader key to backslash
g.maplocalleader = "\\"

-- Disable the default netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


local opt = vim.opt

-- Search
-- Show changes preview
vim.o.inccommand = "nosplit"  -- not needed because this is Neovim's default value
-- NOTE: Search and replace example
--
--   :%s/search/replace/gc
--
-- :% - specify substitution range as `all line in the file`, alternatively :6,10s
-- s - substitute
-- / - delimiter: `@`, `#`, `|` - are also allowed
-- search
-- replace
-- g - global
-- c - ask for confirmation before making each substitution

-- Ensuring N lines above and below the cursor are always visible when scrolling
opt.scrolloff = 7

-- Number of spaces that a Tab character represents
opt.tabstop = 2
-- Number of spaces to use for each indent or outdent command
opt.shiftwidth = 2
-- Auto match the indentation of the previous line when starting a new line
opt.autoindent = true
-- Converts Tab characters to spaces when inserting tabs
opt.expandtab = true
-- Make Tab and Backspace to behave more intelligently. When inserting a Tab at the beginning of a line, it uses the value of shiftwidth. When removing a Tab at the beginning of a line, it also considers shiftwidth
opt.smarttab = true
-- Smart indentation for specific programming languages. This setting automatically inserts appropriate levels of indentation in code based on syntax and structure
opt.smartindent = true
-- Display whitespace characters
opt.list = true
opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }

-- Search: ignore case by default
opt.ignorecase = true
-- Search: make case-sensitive when a capital character is typed
opt.smartcase = true

-- Allow backspace deletion of auto-indents, end-of-line characters and characters before the current insert session
opt.backspace = "indent,eol,start"

-- Enable spellcheck
opt.spell = true
opt.spelllang = { "en_us" }
opt.spelloptions:append "camel"
opt.spellcapcheck = "" -- disable checking for capital letters at the start of sentences
-- NOTE: zg - adds a spelling to a global dictionary

-- Always show sign column to avoid jittering effect caused by lsp-config when
-- switching between Normal and Insert modes
opt.signcolumn = "yes"

-- Highlight trailing whitespaces
-- Set the highlight for trailing whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "darkred", bg = "darkred" })
-- Autocommand to highlight trailing whitespace in all buffers
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end,
})

return {}

