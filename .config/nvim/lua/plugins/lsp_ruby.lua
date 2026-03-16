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
      "<leader>d",
      function() vim.lsp.buf.definition() end,
      desc = "Go to definition",
    },
    {
      "<leader>ls",
      function() vim.lsp.buf.document_symbol() end,
      desc = "List classes, methods, and constants in file",
    },
    {
      "<leader>lh",
      function() vim.lsp.buf.hover() end,
      desc = "Show docs for symbol under cursor",
    },
    {
      "<leader>lr",
      function() vim.lsp.buf.references() end,
      desc = "Find all references",
    },
    {
      "<leader>lt",
      function() vim.lsp.buf.typehierarchy("supertypes") end,
      desc = "Show parent classes and included modules",
    },
    {
      "<leader>ln",
      function() vim.lsp.buf.rename() end,
      desc = "Rename variable/method/class across files",
    },
    {
      "<leader>la",
      function() vim.lsp.buf.code_action() end,
      desc = "Code actions (quickfix, refactor)",
    },
    {
      "<leader>lf",
      function() vim.lsp.buf.format() end,
      desc = "Format file",
    },
    {
      "<leader>lw",
      function() vim.diagnostic.open_float() end,
      desc = "Show warning/error details",
    },
    {
      "[w",
      function() vim.diagnostic.goto_prev() end,
      desc = "Previous warning/error",
    },
    {
      "]w",
      function() vim.diagnostic.goto_next() end,
      desc = "Next warning/error",
    },
  }
}
