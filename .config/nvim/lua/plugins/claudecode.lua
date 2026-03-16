return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  init = function()
    vim.api.nvim_create_autocmd("TermOpen", {
      desc = "Restore line numbers for Claude terminal (Neovim defaults disable them)",
      callback = function(args)
        if vim.bo[args.buf].filetype == "snacks_terminal" then
          vim.schedule(function()
            local win = vim.fn.bufwinid(args.buf)
            if win ~= -1 then
              vim.wo[win].number = true
              vim.wo[win].relativenumber = true
            end
          end)
        end
      end,
    })
  end,
  opts = {
    terminal = {
      split_width_percentage = 0.30,
      snacks_win_opts = {
        width = 100,
        wo = {
          winfixwidth = true,
          number = true,
          relativenumber = true,
          wrap = true,
        },
      },
    },
    diff_opts = {
      keep_terminal_focus = true,
      open_in_new_tab = true,
    },
  },
  keys = {
    { "<leader>cc", nil, desc = "Claude Code" },
    { "<leader>cct", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude terminal" },
    { "<leader>ccf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ccr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>ccC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>ccm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>ccs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>ccs",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    { "<leader>cca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ccd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
