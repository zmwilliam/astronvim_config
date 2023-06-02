return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    local with_root_file = function(builtin, file)
      return builtin.with {
        condition = function(utils)
          return utils.root_has_file(file)
        end,
      }
    end

    local b = require("null-ls").builtins

    local sources = {
      -- elixir
      with_root_file(b.diagnostics.credo, ".credo.exs"),
      with_root_file(b.formatting.mix, ".formatter.exs"),
    }

    config.sources = sources
    config.default_timeout = 8000
    config.debug = true

    return config
  end,
}
