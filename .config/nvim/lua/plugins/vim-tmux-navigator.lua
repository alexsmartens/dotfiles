return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_save_on_switch = 2  -- Save all buffers when switching

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- QWERTY mappings
    keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
    keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
    keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
    keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
    keymap("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", opts)

    -- Colemak mappings
    keymap("n", "<C-n>", ":TmuxNavigateLeft<CR>", opts)
    keymap("n", "<C-e>", ":TmuxNavigateDown<CR>", opts)
    keymap("n", "<C-i>", ":TmuxNavigateUp<CR>", opts)
    keymap("n", "<C-o>", ":TmuxNavigateRight<CR>", opts)

    keymap("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", opts)
  end
}

