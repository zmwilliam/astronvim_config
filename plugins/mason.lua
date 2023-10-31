return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "elixirls",
        "lua_ls",
        "vimls",
        "gopls",
        "sqlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      local u = require "astronvim.utils"

      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = u.list_insert_unique(opts.ensure_installed, {
        "prettierd",
        --lua
        "stylua",
        "selene",
        --golang
        "gofumpt",
        "goimports-reviser",
        "golines",
        "gomodifytags",
      })

      opts.handlers = u.extend_tbl(opts.handlers, {
        prettierd = function()
          local null_ls = require "null-ls"

          null_ls.register(null_ls.builtins.formatting.prettierd.with {
            disabled_filetypes = { "markdown" },
          })
        end,

        selene = function()
          local null_ls = require "null-ls"

          null_ls.register(null_ls.builtins.diagnostics.selene.with {
            condition = function(utils) utils.root_has_file { "selene.toml" } end,
          })
        end,
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "delve",
      })
    end,
  },
}
