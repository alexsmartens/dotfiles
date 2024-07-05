return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require "treesitter-context".setup {
        -- Top context window
        enable = true,
        max_lines = 0, -- values <= 0 mean no limit
        min_window_height = 0, -- minimum editor window height to enable context, values <= 0 mean no limit
        line_numbers = true,
        multiline_threshold = 10, -- maximum number of lines to show for a single context
        trim_scope = "outer", -- which context lines to discard if `max_lines` is exceeded
        mode = "cursor", -- line used to calculate context, values: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline
        separator = nil,
        zindex = 20,
      }
    end,
  },
}

