local set_keymap = require("utils.shared").set_keymap

-- Native system copy
set_keymap("n", "cp", '"+y', { desc = "Copy to OS clipboard" })

-- Adding blank lines without moving the cursor
set_keymap("n", "<leader>o", ':call append(line("."), "")<CR>', { desc = "Add blank line below" })
set_keymap("n", "<leader>O", ':call append(line(".")-1, "")<CR>', { desc = "Add blank line above" })

-- Highlights
set_keymap("n", "hn", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement
set_keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
set_keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
set_keymap("n", "<leader>wd", "<C-w>v", { desc = "Window divide vertically" })
set_keymap("n", "<leader>wD", "<C-w>s", { desc = "Window divide horizontally" })
set_keymap("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
set_keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
set_keymap("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

return {}

