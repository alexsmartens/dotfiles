return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("ruby_lsp", {
      cmd = { "bundle", "exec", "ruby-lsp" },
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
