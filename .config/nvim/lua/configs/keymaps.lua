local set_keymap = require("utils.shared").set_keymap

-- Native system copy
set_keymap("n", "cp", '"+y', { desc = "Copy to OS clipboard" })

-- Adding blank lines without moving the cursor
set_keymap("n", "<leader>o", ':call append(line("."), "")<CR>', { desc = "Add blank line below" })
set_keymap("n", "<leader>O", ':call append(line(".")-1, "")<CR>', { desc = "Add blank line above" })

-- Highlights
set_keymap("n", "hn", ":nohl<CR>", { desc = "Clear search highlights" })


-- Exit terminal mode with double Escape (single Esc is captured by the terminal)
set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window management
set_keymap("n", "<leader>wd", "<C-w>v", { desc = "Window divide vertically" })
set_keymap("n", "<leader>wD", "<C-w>s", { desc = "Window divide horizontally" })
set_keymap("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close current split" })
set_keymap("n", "<leader>w]", function() vim.cmd("vertical resize +" .. math.floor(vim.o.columns * 0.05)) end, { desc = "Widen window" })
set_keymap("n", "<leader>w[", function() vim.cmd("vertical resize -" .. math.floor(vim.o.columns * 0.05)) end, { desc = "Narrow window" })

-- Tab management
set_keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
set_keymap("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Case management
local function to_snake_case_helper(word)
  -- Convert camelCase or PascalCase to snake_case
  local modified_word = word:gsub("(%l)(%u)", "%1_%2"):gsub("(%u)(%u%l)", "%1_%2"):lower()
  -- Convert spaces and hyphens to underscores
  modified_word = modified_word:gsub("%s+", "_"):gsub("-", "_")

  return modified_word
end
local function capitalize_first_character()
  local word = vim.fn.expand("<cword>")
  local modified_word = word:sub(1,1):upper() .. word:sub(2)
  vim.cmd("normal! ciw" .. modified_word)
end
local function uppercase()
  local word = vim.fn.expand("<cword>")
  local modified_word = to_snake_case_helper(word)
  modified_word = modified_word:upper()
  vim.cmd("normal! ciw" .. modified_word)
end
local function downcase()
  local word = vim.fn.expand("<cword>")
  local modified_word = to_snake_case_helper(word)
  modified_word = modified_word:lower()
  vim.cmd("normal! ciw" .. modified_word)
end
local function snakecase()
  local word = vim.fn.expand("<cword>")
  modified_word = to_snake_case_helper(word)
  vim.cmd(string.format("normal! ciw%s", modified_word))
end
local function camelcase()
  local word = vim.fn.expand("<cword>")
  local modified_word = word:lower():gsub("_(.)", function(c) return c:upper() end):gsub("^%l", string.upper)
  vim.cmd(string.format("normal! ciw%s", modified_word))
end

set_keymap("n", "<leader>wff", capitalize_first_character, { desc = "Word format: capitalize First character" })
set_keymap("n", "<leader>wfu", uppercase, { desc = "Word format: UPPERCASE" })
set_keymap("n", "<leader>wfd", downcase, { desc = "Word format: downcase" })
set_keymap("n", "<leader>wfs", snakecase, { desc = "Word format: snake_case" })
set_keymap("n", "<leader>wfc", camelcase, { desc = "Word format: CamelCase" })

-- Increment/Decrement
set_keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
set_keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Prettify JSON via jq
-- <leader>j  followed by any motion →
vim.keymap.set("n", "<leader>j", function()
  vim.go.operatorfunc = "v:lua.__jq_format_op"
  return "g@"     -- enter operator‑pending mode; next motion triggers func
end, { expr = true, desc = "jq‑format operator" })

function _G.__jq_format_op(type)        -- type = 'char', 'line', or 'block'
  -- marks set by operatorfunc:  [  ]  (start / end of operated text)
  local start_row = vim.api.nvim_buf_get_mark(0, "[")[1]
  local end_row   = vim.api.nvim_buf_get_mark(0, "]")[1]
  vim.cmd(string.format("%d,%d!jq .", start_row, end_row))
end

return {}

