return {
  "nvim-tree/nvim-tree.lua",
  requires = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({})
    local tree_api = require("nvim-tree.api")

    -- Add keymap to toggle NvimTree
    vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file explorer" })
    -- vim.keymap.set("n", "<leader>r", tree_api.fs.rename_full, { noremap = true, silent = true, desc = "nvim-tree: Rename: Full Path"})
  end,
}

