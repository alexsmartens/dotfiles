return {
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  dependencies = {
    "kkharji/sqlite.lua",
    -- Only required if using match_algorithm fzf
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Optional. If installed, native fzy will be used when match_algorithm is fzy
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  after = "nvim-telescope/telescope.nvim",
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        smart_open = {
          cwd_only = true,
          match_algorithm = "fzf",
          show_scores = true,
          ignore_patterns = {"*.git/*", "*/tmp/*", "*node_modules/*"},
          prompt_title = "Smart Find Files (⎵ + fo - for Original Find Files)", -- Not implemented as an argument :-(
        }
      }
    })
    telescope.load_extension("smart_open")

    vim.keymap.set("n", "<leader>ff", function()
      telescope.extensions.smart_open.smart_open()
    end, { noremap = true, silent = true, desc = "Fuzzy find files in cwd"  })
  end,
}

