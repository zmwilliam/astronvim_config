return {
  {
    "tpope/vim-fugitive", -- the premier Vim plugin for Git
    enabled = false,
    dependencies = {
      "tpope/vim-rhubarb", -- fugitive support for github
      "shumphrey/fugitive-gitlab.vim", -- fugitive support for gitlab
    },
    cmd = { "Git", "GBrowse" },
  },

  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },
  },

  {
    "NeogitOrg/neogit",
    event = "User AstroGitFile",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = true,
  },
}
