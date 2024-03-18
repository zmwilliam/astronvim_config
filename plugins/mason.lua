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
        "solargraph",
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

      local null_ls = require "null-ls"
      local f = null_ls.builtins.formatting
      local d = null_ls.builtins.diagnostics

      opts.handlers = u.extend_tbl(opts.handlers, {
        prettierd = function()
          null_ls.register(f.prettierd.with {
            disabled_filetypes = { "markdown" },
          })
        end,

        selene = function()
          null_ls.register(d.selene.with {
            condition = function(utils) utils.root_has_file { "selene.toml" } end,
          })
        end,

        stylua = function()
          null_ls.register(f.stylua.with {
            condition = function(utils) utils.root_has_file { "stylua.toml", ".stylua.toml" } end,
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
