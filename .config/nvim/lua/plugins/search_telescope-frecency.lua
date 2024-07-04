return {
  -- Super slow with "fuzzy" matcher


  -- "nvim-telescope/telescope-frecency.nvim",
  -- after = "telescope",
  -- config = function()
  --   require("telescope").setup {
  --     extensions = {
  --       frecency = {
  --         show_scores = false,
  --         show_unindexed = true,
  --         hide_current_buffer = false,
  --         -- matcher = "fuzzy", -- super show
  --         ignore_patterns = {"*.git/*", "*/tmp/*", "*node_modules/*"},
  --       }
  --     },
  --   }
  --   require("telescope").load_extension("frecency")
  --   vim.keymap.set("n", "<leader>ff", "<cmd>Telescope frecency workspace=CWD<cr>", { desc = "Fuzzy find files in cwd" })
  -- end,
}

