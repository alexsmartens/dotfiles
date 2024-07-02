local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Native system copy
map("n", "cp", '"+y', { desc = "Copy to OS clipboard" })

-- Adding blank lines without moving the cursor
map("n", "<leader>o", ':call append(line("."), "")<CR>', { desc = "Add blank line below" })
map("n", "<leader>O", ':call append(line(".")-1, "")<CR>', { desc = "Add blank line above" })

-- Highlights
map("n", "hn", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/Decrement
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
map("n", "<leader>wd", "<C-w>v", { desc = "Window divide vertically" })
map("n", "<leader>wD", "<C-w>s", { desc = "Window divide horizontally" })
map("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

return {}

