local function map(mode, lhs, rhs, desc)
  local options = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, options)
end

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        -- Navigation
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Previous Hunk")

        -- Actions
        map("n", "hs", gitsigns.stage_hunk, "Stage Hunk")
        map("n", "hr", gitsigns.reset_hunk, "Reset Hunk")
        map("v", "hs", function() gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage Hunk (Visual)")
        map("v", "hr", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset Hunk (Visual)")
        map("n", "hS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "hR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "hp", gitsigns.preview_hunk, "Preview Hunk")
        map("n", "hb", function() gitsigns.blame_line { full = true } end, "Blame Line")
        map("n", "hB", gitsigns.toggle_current_line_blame, "Toggle Current Line Blame")
        map("n", "hd", gitsigns.diffthis, "Diff This")
        map("n", "hD", function() gitsigns.diffthis("~") end, "Diff This ~")
        map("n", "td", gitsigns.toggle_deleted, "Toggle Deleted")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
      end
    }
  end
}

