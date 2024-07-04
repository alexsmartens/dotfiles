return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
         path_display = { "truncate" }, -- default is "smart"
        -- prompt_prefix = " ",
        selection_caret = " ",
        -- sorting_strategy = "descending", -- seems to be a default strategy
        file_ignore_patterns = {
          "node_modules/",
          "vendor/",
          "target/",
          "build/",
          ".git/",
        },
        mappings = {
          -- Insert mode
          i = {
            -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            -- ["C-v"] - a default mapping for a vertical split
            ["<C-h>"] = actions.select_horizontal,
          },
          -- Normal mode
          n = {
            -- ["C-v"] - a default mapping for a vertical split
            ["<C-h>"] = actions.select_horizontal,
          }
        }
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--exclude", "node_modules" },
          prompt_title = "Original Find Files",
        },
        oldfiles = {
          cwd_only = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          -- case_mode = "smart_case", -- default
        },
      },
    })
    -- Needed to get fzf loaded and working with telescope
    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set("n", "<leader>fo", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd (original)" })
    -- keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Fuzzy find resume" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find sting under cursor in cwd" })
  end,
}


