return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter-textobjects").setup {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ac"] = { query = "@class.outer", desc = "all class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },
            ["af"] = { query = "@function.outer", desc = "all function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ab"] = { query = "@block.outer", desc = "all block" },
            ["ib"] = { query = "@block.inner", desc = "inner block" },
            ["aa"] = { query = "@parameter.outer", desc = "all arguments" },
            ["ia"] = { query = "@parameter.inner", desc = "inner arguments" },
          },
          selection_modes = {
            ["@class.outer"] = "V",
            ["@class.inner"] = "V",
            ["@function.outer"] = "V",
            ["@function.inner"] = "V",
            ["@block.outer"] = "V",
            ["@block.inner"] = "V",
          },
          include_surrounding_whitespace = true,
        },
      }
    end,
  },
  {
    -- not actually treesitter but so similar it goes here
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    config = function()
      require("various-textobjs").setup({
        useDefaultKeymaps = false,
      })
    end,
    keys = {
      {
        "ae",
        function() require("various-textobjs").entireBuffer() end,
        mode = { "x", "o" },
        desc = "entire buffer",
      },
      {
        "il",
        function() require("various-textobjs").lineCharacterwise("inner") end,
        mode = { "x", "o" },
        desc = "inner line",
      },
      {
        "al",
        function() require("various-textobjs").lineCharacterwise("outer") end,
        mode = { "x", "o" },
        desc = "a line",
      },
      {
        "ai",
        function() require("various-textobjs").indentation(false, false, false) end, -- arguments: startBorder, endBorder, blankLines)
        mode = { "x", "o" },
        desc = "all indentation with lines below/above",
      },
      {
        "ii",
        function() require("various-textobjs").indentation(true, true, true) end, -- arguments: startBorder, endBorder, blankLines)
        mode = { "x", "o" },
        desc = "inner indentation w/o blank lines",
      },
      {
        "iI",
        function() require("various-textobjs").indentation(true, true, false) end, -- arguments: startBorder, endBorder, blankLines)
        mode = { "x", "o" },
        desc = "inner indentation w blank lines",
      },
    }
  },
}

