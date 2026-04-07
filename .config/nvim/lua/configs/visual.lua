local opt = vim.opt

-- Set maximum text width to 80 characters
opt.textwidth = 80
-- Highlight the column after 80 characters
opt.colorcolumn = "+1"

-- Configure the ruler with relative line numbers
opt.relativenumber = true
opt.cursorline = true
opt.number = true
-- opt.numberwidth = 5

-- Open new split panes to the right and bottom
opt.splitbelow = true
opt.splitright = true

-- Auto resize split windows to be equal size when the window size is changed or a window is opened/closed
local resize_group = vim.api.nvim_create_augroup("ResizeSplits", { clear = true })
for _, event in ipairs({ "VimResized", "WinNew", "WinClosed" }) do
  vim.api.nvim_create_autocmd(event, {
    group = resize_group,
    command = "wincmd =",
  })
end

-- Remove any special highlighting for vertical splits
vim.cmd("highlight VertSplit cterm=NONE")
-- Set vertical split character to a prettier symbol
opt.fillchars:append("vert:▏")

return {}

