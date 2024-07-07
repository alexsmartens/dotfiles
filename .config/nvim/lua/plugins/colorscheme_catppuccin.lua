return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      -- Dim inactive window background
      dim_inactive = {
          enabled = true,
          shade = "light",
          percentage = 0.99, -- percentage of the shade to be applied
      },

      flavour = "mocha", -- mocha is the darkest flavour
      background = { -- set all background to black
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
      },
    }

    vim.cmd("colorscheme catppuccin")

    -- Set line numbers color
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#CCCCCC", bg = "NONE" })
    -- Set current line number color
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#debaba", bg = "NONE" })
  end,
}

