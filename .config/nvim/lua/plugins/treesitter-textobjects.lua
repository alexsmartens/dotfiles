return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
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

