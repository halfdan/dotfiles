require("luasnip/loaders/from_vscode").lazy_load()
-- Load ows snippets 
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
