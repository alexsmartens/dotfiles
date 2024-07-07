local set_keymap = require("utils.shared").set_keymap

return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    set_keymap("n", "]t", function()
      -- Might be used with specific keyword, e.g.:
      -- todo_comments.jump_next({keywords = { "ERROR", "WARNING" }})
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    set_keymap("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}

