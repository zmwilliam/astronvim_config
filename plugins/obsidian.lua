return {
  "epwalsh/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/workspace/obsidian/**.md" },
  cmd = {
    "ObsidianQuickSwitch",
    "ObsidianSearch",
    "ObsidianNew",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianOpen",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Obsidian/personal",
      },
      {
        name = "work",
        path = "~/Obsidian/work",
      },
    },
    notes_subdir = "notes",
    daily_notes = { folder = "notes/dailies" },
    completion = { nvim_cmp = true },
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
  },
  keys = function(_, keys)
    local u = require "astronvim.utils"

    --Create wichkey section
    u.set_mappings { n = {
      ["<leader>O"] = { desc = u.get_icon("DefaultFile", 1, true) .. "Obdisian Notes" },
    } }

    local mappings = {
      { "<leader>Oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
      { "<leader>Os", "<cmd>ObsidianSearch<CR>", desc = "Search" },
      { "<leader>On", "<cmd>ObsidianNew<CR>", desc = "New" },
      { "<leader>Ot", "<cmd>ObsidianToday<CR>", desc = "Note for TODAY (open or create)" },
      { "<leader>Oy", "<cmd>ObsidianYesterday<CR>", desc = "Note for YESTERDAY (open or create)" },
      { "<leader>Oo", "<cmd>ObsidianOpen<CR>", desc = "Open in the Obsidian App" },
      { "<leader>OT", "<cmd>ObsidianTemplate<CR>", desc = "List templates to insert" },
      { "<leader>Of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
    }

    return vim.list_extend(keys, mappings)
  end,
}
