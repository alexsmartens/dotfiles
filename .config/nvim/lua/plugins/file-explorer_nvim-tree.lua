local set_keymap = require("utils.shared").set_keymap

local function on_attach_custom(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Include the default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  set_keymap("n", "R", api.fs.rename_full, opts("Rename: Full Path"))
  set_keymap("n", "u", api.tree.reload, opts("Update"))
  set_keymap("n", "<Esc>", api.tree.close, opts("Close Explorer"))

  -- preview keymaps  (feel free to change keys)
  local preview = require("nvim-tree-preview")
  set_keymap("n", "p",       preview.node_under_cursor, opts("Preview Node"))
  set_keymap("n", "P",       preview.watch,             opts("Live Preview"))
  set_keymap("n", "<C-e>",   function() preview.scroll(4)  end, opts("Scroll Down↓"))
  set_keymap("n", "<C-i>",   function() preview.scroll(-4) end, opts("Scroll Up↑"))
  -- Qwerty layout duplicates of Up and Down
  set_keymap("n", "<C-d>",   function() preview.scroll(4)  end, opts("Scroll Down↓"))
  set_keymap("n", "<C-u>",   function() preview.scroll(-4) end, opts("Scroll Up↑"))
  set_keymap("n", "q",       preview.unwatch,            opts("Close Preview"))
end


return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    { "b0o/nvim-tree-preview.lua", dependencies = "nvim-lua/plenary.nvim" },
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
      -- A floating popup window instead of a sidebar
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = false,
          open_win_config = (function()
            local ui      = vim.api.nvim_list_uis()[1]              -- actual grid
            local w_ratio = 0.80
            local h_ratio = 0.89
            local w       = math.floor(ui.width  * w_ratio)
            local h       = math.floor(ui.height * h_ratio)

            return {
              relative = "editor",
              border   = "rounded",
              width    = w,
              height   = h,
              row      = math.floor((ui.height - h) / 2),
              col      = math.floor((ui.width  - w) / 2),
            }
          end)(),
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    }
    local tree_api = require("nvim-tree.api")

    -- Add keymap to toggle NvimTree
    set_keymap("n", "<leader>b", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer and highlight current buffer" })
  end,
}

