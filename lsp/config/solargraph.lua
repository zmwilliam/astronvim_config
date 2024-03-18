return {
  cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", "stdio" },
  root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
  settings = {
    autoformat = true,
    diagnostics = true
  },
}
