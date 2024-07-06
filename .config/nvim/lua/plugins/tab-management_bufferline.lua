-- Tab management

return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    local colors = {
      gray = "#808080",
      light_gray = "#A5A5A5",
      lighter_gray = "#C0C0C0",
      dark_gray = "#484848",
      carrot_orange = "#EA8539",
      light_salmon = "#FFAF82",
      olive_green = "#B9BB47",
    }

    require("bufferline").setup({
      options = {
        mode = "buffers",                 -- Display buffers as tabs
        separator_style = "none",         -- Disable separators
        offsets = {                       -- Adjust bufferline when certain filetypes are open
          {
            filetype = "NvimTree",        -- When NvimTree is open...
            text = "File Explorer",       -- Display "File Explorer" in the offset
            highlight = "Directory",      -- Use Directory highlight group
            text_align = "left"           -- Align text to the left
          }
        },
        numbers = "ordinal",              -- Show buffer indices
        numbers = function(opts)          -- Custom index formatting
          local num = opts.ordinal
          if num == 10 then
            return "0"
          elseif num <= 10 then
            return tostring(num)
          else
            return ""
          end
        end,
        show_buffer_icons = true,         -- Show icons for each buffer
        show_buffer_close_icons = false,  -- Show close icons on each buffer
        show_close_icon = false,          -- Show a close icon on the tabline
        show_tab_indicators = true,       -- Show tab indicators (e.g., which tab is active)
        persist_buffer_sort = true,       -- Keep the buffer order even after closing buffers
        always_show_bufferline = true,    -- Always show the bufferline, even with a single buffer
        enforce_regular_tabs = false,     -- Allow buffers to resize flexibly
        tab_size = nil,
        truncate_names = true, -- Ensure names are truncated when space is limited
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and "" or ""
          -- Count errors and warnings separately
          local error_count = diagnostics_dict["error"] or 0
          local warning_count = diagnostics_dict["warning"] or 0
          local count_ = error_count + warning_count
          if count_ > 0 then
            return " " .. icon .. " " .. count_
          else
            return ""
          end
        end,
      },
      -- -- Changing highlight without catppuccin integration
      -- highlights = {
      --   buffer_selected = {
      --     fg = "white",
      --     bg = "black",
      --   },
      --   },
      -- },
      highlights = require("catppuccin.groups.integrations.bufferline").get {
        custom = {
          all = {
            -- Selected buffers
            buffer_selected = {
              fg = colors.light_salmon,
              bold = false,
              italic = false,
            },
            numbers_selected = {
              fg = colors.light_salmon,
            },
            indicator_selected = {
              fg = colors.light_salmon,
            },
          },
        },
      };
    })

    local function map(mode, lhs, rhs, opts)
      local options = { noremap = true, silent = true }
      if opts then
        options = vim.tbl_extend("force", options, opts)
      end
      vim.keymap.set(mode, lhs, rhs, options)
    end
    -- Tab navigations <Opt+1>, <Opt+2>, ..., <Opt+0>
    map("n", "¡", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
    map("n", "™", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
    map("n", "£", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
    map("n", "¢", ":BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
    map("n", "∞", ":BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })

    map("n", "§", ":BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
    map("n", "¶", ":BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
    map("n", "•", ":BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
    map("n", "ª", ":BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })
    map("n", "º", ":BufferLineGoToBuffer 10<CR>", { desc = "Go to buffer 10" })

    -- Colemak: n and o
    map("n", "·", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer" })
    map("n", "‚", ":BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })

    -- <Opt + c> close current buffer and switch to the previously open one
    map("n", "ç", ":b#<bar>bd#<CR>", { desc = "Close current buffer" })
  end,
}

