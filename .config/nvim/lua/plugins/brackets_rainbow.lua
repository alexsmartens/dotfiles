-- lua/config/rainbow.lua
return {
  "p00f/nvim-ts-rainbow",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup {
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters like brackets, braces, etc.
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      }
    }
  end
}

