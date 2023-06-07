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
    dir = "~/workspace/obsidian",
    notes_subdir = "notes",
    daily_notes = { folder = "notes/dailies" },
    completion = { nvim_cmp = true },
  }
}
