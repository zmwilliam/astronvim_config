return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local utils = require("astronvim.utils")
    opts.event_handlers = utils.list_insert_unique(opts.event_handlers, {
      {
        --Auto Close on Open File
        event = "file_opened",
        handler = function(_)
          require("neo-tree").close_all()
        end
      }
    })
  end
}
