return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("ruby_lsp", {
      -- The rbenv shim resolves per-project via .ruby-version, so each project gets
      -- ruby-lsp on its own Ruby. Not `bundle exec` -- ruby-lsp finds a project's
      -- Gemfile itself, and the prefix breaks in directories without one.
      cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
      filetypes = { "ruby", "eruby" },
      root_markers = { "Gemfile", ".git" },
      capabilities = capabilities,
      settings = {
        rubyLsp = {
          enabled = true,
        },
      },
    })

    vim.lsp.enable("ruby_lsp")

    -- Spell checking for code. Attaches to every filetype; config in ~/.config/typos.toml
    vim.lsp.config("typos_lsp", {
      init_options = {
        diagnosticSeverity = "Error",
      },
    })

    vim.lsp.enable("typos_lsp")
  end,

  keys = {
    {
      "<leader>gd",
      function() vim.lsp.buf.definition() end,
      desc = "Go to definition",
    },
    {
      "<leader>gt",
      function() vim.lsp.buf.typehierarchy("supertypes") end,
      desc = "Go to type hierarchy",
    },
    {
      "<leader>lf",
      function() vim.lsp.buf.format() end,
      desc = "Format file",
    },
  }
}
