return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      -- Auto-closing tags
      -- "windwp/nvim-ts-autotag"
      "nvim-treesitter/nvim-treesitter-textobjects",
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
      }

      vim.keymap.set("n", "<leader>it", ":InspectTree<CR>", { desc = "Inspect tree" })
      vim.keymap.set("n", "<leader>in", ":Inspect<CR>", { desc = "Inspect node" })
    end,
  },
}

