return {
  -- other plugins
  {
    "vim-scripts/ingo-library",
    lazy = true, -- load only when needed
  },
  {
    "vim-scripts/ReplaceWithSameIndentRegister",
    lazy = true, -- load only when needed
  },
  {
    "vim-scripts/ReplaceWithRegister",
    config = function()
      -- Mappings
      vim.api.nvim_set_keymap("n", "<leader>gr", '"*gr', { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>gR", '"*gR', { noremap = true, silent = true })
    end,
  },
}

