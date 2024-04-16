if true then return {} end

return {
  filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtmltmpl", "gotexttmpl" },
  settings = {
    gopls = {
        ["build.templateExtensions"] = { "tmpl", "gohtml", "tpl" },
    }
  }
}
