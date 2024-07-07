local set_keymap = require("utils.shared").set_keymap

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        -- Navigation
        set_keymap("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next Hunk" })

        set_keymap("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Previous Hunk" })

        -- Actions
        set_keymap("n", "hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
        set_keymap("n", "hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
        set_keymap("v", "hs", function() gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Stage Hunk (Visual)" })
        set_keymap("v", "hr", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Reset Hunk (Visual)" })
        set_keymap("n", "hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
        set_keymap("n", "hu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        set_keymap("n", "hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
        set_keymap("n", "hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
        set_keymap("n", "hb", function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
        set_keymap("n", "hB", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
        set_keymap("n", "hd", gitsigns.diffthis, { desc = "Diff This" })
        set_keymap("n", "hD", function() gitsigns.diffthis("~") end, { desc = "Diff This ~" })
        set_keymap("n", "td", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })

        -- Text object
        set_keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
      end
    }
  end
}

