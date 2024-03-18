return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local u = require "astronvim.utils"

    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = u.list_insert_unique(opts.ensure_installed, {
      "bash",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "elm",
      "erlang",
      "fish",
      "go",
      "gomod",
      "heex",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "ruby",
      "scss",
      "sql",
      "surface",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
      "embedded_template",
    })

    opts.incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<c-s>",
        node_decremental = "<BS>",
      },
    }

    opts.highlight = u.extend_tbl(opts.highlight, {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    })
  end,
}
