return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
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

              ["ac"] = { query = "@comment.outer", desc = "all comment" },
            },
            selection_modes = {
              ["@class.outer"] = "V", -- Line-wise selection
              ["@class.inner"] = "V",

              ["@function.outer"] = "V",
              ["@function.inner"] = "V",

              ["@block.outer"] = "V",
              ["@block.inner"] = "V",

              ["@comment.inner"] = "V",
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
          },
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

