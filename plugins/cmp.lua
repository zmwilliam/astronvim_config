return {
  "hrsh7th/nvim-cmp",
  keys = { ":", "/", "?" },
  dependencies = { "hrsh7th/cmp-cmdline" },
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
