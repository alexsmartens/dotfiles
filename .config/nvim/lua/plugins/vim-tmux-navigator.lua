return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_save_on_switch = 2  -- Save all buffers when switching

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Navigation mappings (normal + terminal mode)
    local modes = { "n", "t" }
    -- QWERTY
    vim.keymap.set(modes, "<C-h>", "<C-\\><C-n>:TmuxNavigateLeft<CR>", opts)
    vim.keymap.set(modes, "<C-j>", "<C-\\><C-n>:TmuxNavigateDown<CR>", opts)
    vim.keymap.set(modes, "<C-k>", "<C-\\><C-n>:TmuxNavigateUp<CR>", opts)
    vim.keymap.set(modes, "<C-l>", "<C-\\><C-n>:TmuxNavigateRight<CR>", opts)
    -- Colemak
    vim.keymap.set(modes, "<C-n>", "<C-\\><C-n>:TmuxNavigateLeft<CR>", opts)
    vim.keymap.set(modes, "<C-e>", "<C-\\><C-n>:TmuxNavigateDown<CR>", opts)
    vim.keymap.set(modes, "<C-i>", "<C-\\><C-n>:TmuxNavigateUp<CR>", opts)
    vim.keymap.set(modes, "<C-o>", "<C-\\><C-n>:TmuxNavigateRight<CR>", opts)
    -- Previous window
    vim.keymap.set(modes, "<C-\\>", "<C-\\><C-n>:TmuxNavigatePrevious<CR>", opts)
  end
}

