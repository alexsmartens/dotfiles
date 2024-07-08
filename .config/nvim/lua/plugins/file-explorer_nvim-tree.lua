local set_keymap = require("utils.shared").set_keymap

local function on_attach_custom(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Include the default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set("n", "R", api.fs.rename_full, opts("Rename: Full Path"))
  vim.keymap.set("n", "u", api.tree.reload, opts("Update"))
end


return {
  "nvim-tree/nvim-tree.lua",
  requires = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = on_attach_custom,
      filters = {
        -- Hide these directories
        custom = { ".git", ".github" },
      },
      renderer = {
        -- Only show project name at the top and not full path
        root_folder_modifier = ":t",
        indent_markers = {
          enable = true,
        },
      },
    }
    local tree_api = require("nvim-tree.api")

    -- Add keymap to toggle NvimTree
    set_keymap("n", "<leader>b", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer and highlight current buffer" })
  end,
}

