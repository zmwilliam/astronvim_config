return {
  "tpope/vim-fugitive", -- the premier Vim plugin for Git
  dependencies = {
    "tpope/vim-rhubarb", -- fugitive support for github
    "shumphrey/fugitive-gitlab.vim", -- fugitive support for gitlab
  },
  cmd = {
    "Git",
    "GBrowse",
  },
}
