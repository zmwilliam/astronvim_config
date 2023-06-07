return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    local null_ls = require "null-ls"
    local f = null_ls.builtins.formatting
    local d = null_ls.builtins.diagnostics

    local has_root_file = function(file)
      return function(utils) return utils.root_has_file(file) end
    end

    local sources = {
      --lua
      f.stylua.with { condition = has_root_file { "stylua.toml", ".stylua.toml" } },
      d.selene.with { condition = has_root_file "selene.toml" },

      -- elixir
      f.mix.with { condition = has_root_file ".formatter.exs" },
      d.credo.with {
        timeout = 15000,
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        condition = has_root_file ".credo.exs",
      },
    }

    config.sources = sources
    -- config.debug = true
    return config
  end,
}
