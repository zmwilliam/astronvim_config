return {
  "folke/tokyonight.nvim",
  opts = {
    -- style = "moon",    -- `storm`, `moon`, a darker variant `night` and `day`
    -- transparent = false , -- Enable this to disable setting the background color
    -- dim_inactive = false,      -- dims inactive windows
    -- lualine_bold = false,      -- When `true`, section headers in the lualine theme will be bold
    on_colors = function(colors)
      colors.border = colors.bg_highlight
    end
  }
}
