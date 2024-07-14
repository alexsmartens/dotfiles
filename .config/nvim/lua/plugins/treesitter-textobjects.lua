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
              ["ac"] = { query = "@class.outer", desc = "outer class" },
              ["ic"] = { query = "@class.inner", desc = "inner class" },

              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },

              ["ab"] = { query = "@block.outer", desc = "outer block" },
              ["ib"] = { query = "@block.inner", desc = "inner block" },

              ["ap"] = { query = "@parameter.outer", desc = "outer parameter" },
              ["ip"] = { query = "@parameter.inner", desc = "inner parameter" },
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
    }
  },
}

