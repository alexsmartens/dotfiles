return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      -- Auto-closing tags
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require "nvim-treesitter.configs".setup {
        ensure_installed = {
          "bash",
          "css",
          "csv",
          "dockerfile",
          "gitignore",
          "html",
          "javascript",
          "json",
          "jq",
          "lua",
          "markdown",
          "markdown_inline",
          "ninja",
          "python",
          "query",
          "regex",
          "ruby",
          "sql",
          "ssh_config",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",  -- otherwise :help comes up with an error (https://www.reddit.com/r/neovim/comments/1do7p36/vimdoc_parser_error_after_update/)
          "yaml",
        },

        highlight = {
          enable = true,
          -- Vim's native regular expression-based highlighting
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
              ["bi"] = "@block.inner",
              ["bo"] = "@block.outer",
              ["ci"] = "@class.inner",
              ["co"] = "@class.outer",
              ["fi"] = "@function.inner",
              ["fo"] = "@function.outer",
              ["di"] = "@function.inner",
              ["do"] = "@function.outer",
              ["pi"] = "@parameter.inner",
              ["po"] = "@parametre.outer",
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
      }

      vim.keymap.set("n", "<leader>it", ":InspectTree<CR>", { desc = "Inspect tree" })
      vim.keymap.set("n", "<leader>in", ":Inspect<CR>", { desc = "Inspect node" })
    end,
  },
}

