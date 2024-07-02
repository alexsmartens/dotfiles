return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local nvim_lsp = require("lspconfig")

    nvim_lsp.ruby_lsp.setup({
      cmd = { "bundle", "exec", "ruby-lsp" },
      filetypes = { "ruby", "eruby" },
      root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
      settings = {
        rubyLsp = {
          enabled = true,
        },
      },
    })
  end,

  keys = {
    {
      "<leader>rs",
      function() vim.lsp.buf.document_symbol() end,
      desc = "Document symbols",
    },
    {
      "<leader>rh",
      function() vim.lsp.buf.hover() end,
      desc = "Open hover pane",
    },
    {
      "<leader>rgd",
      function() vim.lsp.buf.definition() end,
      desc = "Go to definition",
    },
    {
      "<leader>rt",
      function() vim.lsp.buf.typehierarchy("supertypes") end,
      desc = "Show supertypes",
    },
    {
      "<leader>rd",
      "<cmd>ShowRubyDeps<CR>",
      desc = "Open dependencies tab",
    },
  }
}
